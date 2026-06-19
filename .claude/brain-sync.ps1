# Chief brain auto-sync — keeps the darus-cos repo current across machines.
# pull  = run at session start (get latest brain from GitHub)
# push  = run at session end   (back up any changes to GitHub)
# Machine-agnostic: operates on its own repo via $PSScriptRoot, so the clone
# can live at any path on any machine (laptop, desktop) and this still works.

param([Parameter(Mandatory = $true)][ValidateSet('pull', 'push')]$Mode)

$ErrorActionPreference = 'SilentlyContinue'
$repo = Split-Path $PSScriptRoot -Parent
Set-Location $repo

# Bootstrap git identity if this machine has never committed to the repo.
if (-not (git config user.email)) {
    git config user.email "darus@rentor.com"
    git config user.name  "darustrutna"
}

if ($Mode -eq 'pull') {
    git pull --rebase --autostash 2>&1 | Out-Null
}
elseif ($Mode -eq 'push') {
    git add -A 2>&1 | Out-Null
    $changes = git status --porcelain
    if ($changes) {
        $stamp = Get-Date -Format "yyyy-MM-dd HH:mm"
        git commit -m "Auto-sync brain $stamp [Chief session]" 2>&1 | Out-Null
        git push origin HEAD 2>&1 | Out-Null
    }
}
