param(
  [string]$RepoRoot,
  [switch]$Json,
  [switch]$Strict
)

$ErrorActionPreference = 'Stop'

function Resolve-DoctrineRepoRoot {
  param([string]$Start)
  if ($Start) { return (Resolve-Path $Start).Path }
  $dir = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
  while ($dir) {
    if ((Test-Path (Join-Path $dir 'doctrine')) -and (Test-Path (Join-Path $dir 'skills'))) {
      return $dir
    }
    $parent = Split-Path $dir -Parent
    if ($parent -eq $dir) { break }
    $dir = $parent
  }
  throw 'Could not resolve repository root.'
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

$root = Resolve-DoctrineRepoRoot $RepoRoot

# Common mojibake starts with these characters after UTF-8 punctuation has
# been decoded as Windows-1252 and then re-encoded. Keep this script ASCII-only.
$charC3 = [char]0x00C3
$charC2 = [char]0x00C2
$charE2 = [char]0x00E2
$charEuro = [char]0x20AC
$patterns = @(
  [string]$charC3,
  [string]$charC2,
  [string]$charE2,
  [string]::Concat($charE2, $charEuro)
)

$extensions = @('.md', '.ps1', '.json', '.yaml', '.yml', '.txt', '.sql', '.php', '.js', '.jsx', '.ts', '.tsx', '.css', '.html')
$excludeDirs = @('\.git\', '\node_modules\', '\vendor\', '\.venv\', '\dist\', '\build\')
$findings = New-Object System.Collections.ArrayList
$filesScanned = 0
$matches = 0

Get-ChildItem -Path $root -Recurse -File | Where-Object {
  $path = $_.FullName
  ($extensions -contains $_.Extension.ToLowerInvariant()) -and -not ($excludeDirs | Where-Object { $path -like "*$_*" })
} | ForEach-Object {
  $file = $_
  $filesScanned++
  $relative = $file.FullName.Substring($root.Length + 1)
  $lineNumber = 0
  foreach ($line in Get-Content -LiteralPath $file.FullName -Encoding UTF8) {
    $lineNumber++
    foreach ($pattern in $patterns) {
      if ($line.Contains($pattern)) {
        $matches++
        if ($findings.Count -lt 200) {
          $severity = 'medium'
          if ($Strict) { $severity = 'high' }
          [void]$findings.Add((New-Finding $severity 'MOJIBAKE-001' "Possible mojibake signature found." $relative $lineNumber))
        }
        break
      }
    }
  }
}

if ($matches -gt $findings.Count) {
  [void]$findings.Add((New-Finding 'caveat' 'MOJIBAKE-002' "Additional mojibake matches suppressed: $($matches - $findings.Count)." '' 0))
}

$state = Get-ValidationState @($findings)
$result = [pscustomobject]@{
  check = 'mojibake'
  state = $state
  summary = [pscustomobject]@{
    files_scanned = $filesScanned
    mojibake_matches = $matches
    strict = [bool]$Strict
  }
  findings = @($findings)
}

if ($Json) {
  $result | ConvertTo-Json -Depth 6
} else {
  Write-Host "check: mojibake"
  Write-Host "state: $state"
  Write-Host "files_scanned: $filesScanned"
  Write-Host "mojibake_matches: $matches"
  foreach ($finding in $findings) {
    $location = $finding.path
    if ($finding.line -gt 0) { $location = "${location}:$($finding.line)" }
    Write-Host ("[{0}] {1} {2} {3}" -f $finding.severity, $finding.code, $location, $finding.message)
  }
}

if ($state -eq 'fail') { exit 1 }
exit 0
