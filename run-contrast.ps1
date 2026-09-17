# Run contrast check using Node (requires Node.js installed)
# Usage: .\run-contrast.ps1

$here = Split-Path -Parent $MyInvocation.MyCommand.Definition
$node = "node"
$script = Join-Path $here "assets\js\contrast-check.js"
$css = Join-Path $here "css\style.css"

if (-not (Test-Path $script)){
  Write-Error "contrast-check script not found: $script"
  exit 1
}

Write-Host "Running contrast checker against: $css`n"
& $node $script $css

if($LASTEXITCODE -ne 0){
  Write-Warning "Contrast checker exited with code $LASTEXITCODE"
}
