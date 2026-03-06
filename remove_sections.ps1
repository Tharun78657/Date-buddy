$file = 'index.html'
$lines = Get-Content $file -Encoding UTF8
# Keep lines 1-202 (index 0-201) and lines 379 onwards (index 378+)
$keep = $lines[0..201] + $lines[378..($lines.Length - 1)]
$result = $keep -join "`r`n"
[System.IO.File]::WriteAllText((Resolve-Path $file).Path, $result, [System.Text.Encoding]::UTF8)
Write-Host "Done. Total lines: $($keep.Length)"
