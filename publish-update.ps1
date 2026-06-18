# publish-update.ps1 — commit & push the dashboards repo (called by scheduled tasks after they
# write refreshed HTML into this folder). Safe to run anytime; no-ops if nothing changed.
param([string]$Msg = "Update dashboards")
$ErrorActionPreference = "Stop"
Set-Location "C:\Users\ks\research-dashboards"
git add -A
if (git status --porcelain) {
  git commit -m $Msg | Out-Null
  git push
  Write-Host "Published: $Msg"
} else {
  Write-Host "No changes to publish."
}