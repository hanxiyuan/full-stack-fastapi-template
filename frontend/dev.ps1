$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Push-Location $scriptDir
try {
    npm run dev
}
finally {
    Pop-Location
}
