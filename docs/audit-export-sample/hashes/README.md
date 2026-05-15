# Hashes README

Purpose: document how audit export files are hashed for release evidence.

## Required Method

Use SHA-256 for every file in the populated audit export bundle. Record relative paths and lowercase hexadecimal hashes in `sha256sums.txt`.

Recommended PowerShell command from the repository root:

```powershell
Get-ChildItem docs/audit-export-sample -Recurse -File |
  Where-Object { $_.FullName -notlike '*\hashes\sha256sums.txt' } |
  Sort-Object FullName |
  ForEach-Object {
    $hash = Get-FileHash -Algorithm SHA256 -LiteralPath $_.FullName
    "{0}  {1}" -f $hash.Hash.ToLowerInvariant(), ($_.FullName -replace [regex]::Escape((Get-Location).Path + '\'), '')
  }
```

Regenerate hashes after any content changes and before reviewer sign-off.
