<#
push-script.ps1
Helper to prepare and push the current project to a remote Git repository.
This script is safe to run: it will not overwrite remote branches by default.
Parameters:
  -RemoteUrl: remote repository URL (optional)
  -Branch: branch to push (default: main)
  -SetRemote: if provided, will (re)configure origin to RemoteUrl

Usage:
  .\push-script.ps1 -RemoteUrl "https://github.com/username/repo.git" -Branch "main" -SetRemote
#>
param(
  [string]$RemoteUrl = '',
  [string]$Branch = 'main',
  [switch]$SetRemote
)
function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Err($m){ Write-Host "[ERROR] $m" -ForegroundColor Red }

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ScriptDir
Info "Working directory: $ScriptDir"

if (-not (Get-Command git -ErrorAction SilentlyContinue)){
  Err 'Git não encontrado. Instale Git (https://git-scm.com/) e execute novamente este script.'; exit 1
}

if (-not (Test-Path '.git')){
  Info 'Inicializando repositório git local...'
  git init
} else { Info 'Repositório git detectado.' }

Info 'Adicionando arquivos ao índice...'
git add --all

$staged = git diff --cached --name-only
if (-not [string]::IsNullOrEmpty($staged)){
  try{ git commit -m "Initial site: professional build and assets`n`nCo-authored-by: Copilot <223556219+Copilot@users.noreply.github.com>" } catch { Warn "Commit falhou: $($_.Exception.Message)" }
} else { Info 'Nenhuma mudança a commitar.' }

# Set branch
try{ git branch -M $Branch } catch { Warn "Não foi possível renomear branch: $($_.Exception.Message)" }

if ($SetRemote -and $RemoteUrl){
  try{
    Info "Configurando remote origin -> $RemoteUrl"
    git remote remove origin -ErrorAction SilentlyContinue
    git remote add origin $RemoteUrl
  } catch { Warn "Falha ao configurar remote: $($_.Exception.Message)" }
} elseif ($SetRemote -and -not $RemoteUrl){ Warn 'SetRemote foi solicitado mas RemoteUrl está vazio.' }

# Push
Info "Tentando push para origin/$Branch"
try{
  git push -u origin $Branch
  Info 'Push concluído com sucesso.'
} catch {
  Err "Push falhou: $($_.Exception.Message)"
  Err 'Possíveis causas: autenticação necessária, URL incorreta, permissões insuficientes.'
  Err 'Use: .\push-script.ps1 -RemoteUrl "https://github.com/usuario/repo.git" -SetRemote'
  exit 1
}
Info 'Operação concluída.'
