param(
  [string]$RepoRoot,
  [switch]$Json,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

function Resolve-DoctrineRepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  return (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
}

function New-Finding {
  param([string]$Severity, [string]$Code, [string]$Message, [string]$Path, [int]$Line = 0)
  [pscustomobject]@{
    severity = $Severity
    code = $Code
    message = $Message
    path = $Path
    line = $Line
  }
}

function Get-ValidationState {
  param([object[]]$Findings)
  if ($Findings | Where-Object { $_.severity -in @('blocker', 'high') }) { return 'fail' }
  if ($Findings | Where-Object { $_.severity -in @('medium', 'low', 'caveat') }) { return 'pass-with-caveats' }
  return 'pass'
}

function Get-ManifestStates {
  param([string]$ManifestPath)
  $states = @{}
  if (-not (Test-Path $ManifestPath)) { return $states }
  foreach ($line in Get-Content -LiteralPath $ManifestPath -Encoding UTF8) {
    if ($line -match '^\|\s*`?([^`|]+?)`?\s*\|\s*(present|planned|external|deprecated)\s*\|') {
      $key = $matches[1].Trim().Replace('/', '\')
      $states[$key] = $matches[2].Trim()
    }
  }
  return $states
}

function Test-ExternalLink {
  param([string]$Target)
  return ($Target -match '^(https?|mailto|tel|app|file)[:]')
}

$root = Resolve-DoctrineRepoRoot $RepoRoot
$manifest = Get-ManifestStates (Join-Path $root 'docs\reference-manifest.md')
$findings = New-Object System.Collections.ArrayList
$linksChecked = 0
$externalLinks = 0
$brokenLinks = 0

Get-ChildItem -Path $root -Recurse -File -Filter *.md | Where-Object {
  $_.FullName -notlike "*\.git\*"
} | ForEach-Object {
  $file = $_
  $relativeFile = $file.FullName.Substring($root.Length + 1)
  $lineNumber = 0
  foreach ($line in Get-Content -LiteralPath $file.FullName -Encoding UTF8) {
    $lineNumber++
    $scanLine = [regex]::Replace($line, '`[^`]*`', '')
    $matches = [regex]::Matches($scanLine, '!?\[[^\]]*\]\(([^)]+)\)')
    foreach ($match in $matches) {
      $target = $match.Groups[1].Value.Trim()
      if ($target.Length -eq 0) { continue }
      if ($target.StartsWith('#')) { continue }
      if ($target.StartsWith('<') -and $target.EndsWith('>')) {
        $target = $target.Substring(1, $target.Length - 2)
      }
      if (Test-ExternalLink $target) {
        $externalLinks++
        continue
      }
      $linksChecked++
      $pathPart = ($target -split '#')[0]
      if ($pathPart.Length -eq 0) { continue }
      $pathPart = [Uri]::UnescapeDataString($pathPart).Trim('"').Trim("'")
      if ($pathPart -match '^[A-Za-z]:\\') { continue }
      if ($pathPart.IndexOfAny([System.IO.Path]::GetInvalidPathChars()) -ge 0) {
        [void]$findings.Add((New-Finding 'medium' 'LINK-002' "Local Markdown link contains invalid path characters: $target" $relativeFile $lineNumber))
        continue
      }
      $candidate = Join-Path (Split-Path $file.FullName -Parent) ($pathPart -replace '/', '\')
      if (-not (Test-Path $candidate)) {
        $brokenLinks++
        $manifestKey = $pathPart.Replace('/', '\')
        $rootRelativeCandidate = (Join-Path (Split-Path $relativeFile -Parent) $manifestKey).TrimStart('.\')
        $manifestState = $null
        if ($manifest.ContainsKey($manifestKey)) { $manifestState = $manifest[$manifestKey] }
        if (-not $manifestState -and $manifest.ContainsKey($rootRelativeCandidate)) { $manifestState = $manifest[$rootRelativeCandidate] }

        if ($manifestState -in @('planned', 'external', 'deprecated')) {
          [void]$findings.Add((New-Finding 'caveat' 'LINK-PLANNED' "Unresolved link is declared in reference manifest as ${manifestState}: $target" $relativeFile $lineNumber))
        } else {
          $severity = 'high'
          if (-not $Strict) { $severity = 'medium' }
          [void]$findings.Add((New-Finding $severity 'LINK-001' "Local Markdown link does not resolve: $target" $relativeFile $lineNumber))
        }
      }
    }
  }
}

$state = Get-ValidationState @($findings)
$result = [pscustomobject]@{
  check = 'links'
  state = $state
  summary = [pscustomobject]@{
    local_links_checked = $linksChecked
    external_links_seen = $externalLinks
    broken_local_links = $brokenLinks
    strict = [bool]$Strict
  }
  findings = @($findings)
}

if ($Json) {
  $result | ConvertTo-Json -Depth 6
} else {
  Write-Host "check: links"
  Write-Host "state: $state"
  Write-Host "local_links_checked: $linksChecked"
  Write-Host "external_links_seen: $externalLinks"
  Write-Host "broken_local_links: $brokenLinks"
  foreach ($finding in $findings) {
    $location = $finding.path
    if ($finding.line -gt 0) { $location = "${location}:$($finding.line)" }
    Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $location, $finding.message)
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
