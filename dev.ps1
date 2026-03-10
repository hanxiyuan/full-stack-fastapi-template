$rootDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$backendScript = Join-Path $rootDir "backend\dev.ps1"
$frontendScript = Join-Path $rootDir "frontend\dev.ps1"

if (-not (Test-Path $backendScript)) {
    Write-Error "Missing script: $backendScript"
    exit 1
}

if (-not (Test-Path $frontendScript)) {
    Write-Error "Missing script: $frontendScript"
    exit 1
}

Start-Process powershell -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", "`"$backendScript`""
Start-Process powershell -ArgumentList "-NoExit", "-ExecutionPolicy", "Bypass", "-File", "`"$frontendScript`""

Write-Output "Backend and frontend started in separate PowerShell windows."
