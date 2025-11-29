@echo off
powershell -Command "Start-Job -ScriptBlock { while ($true) { if (Test-Path 'dist/router.ts') { (Get-Content -Path 'dist/router.ts' -Raw) -replace '\\\\', '/' | Set-Content -Path 'dist/router.ts'; Write-Host 'Fixed router.ts paths' }; Start-Sleep -Milliseconds 100 } } | Out-Null"
npx motia build
powershell -Command "Get-Job | Stop-Job; Get-Job | Remove-Job"
echo Build completed