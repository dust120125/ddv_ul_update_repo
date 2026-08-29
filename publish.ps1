$commitMessage = Read-Host "Enter commit message"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Commit message cannot be empty." -ForegroundColor Red
    exit 1
}

git add .\manifest.json

git commit -m $commitMessage

if ($LASTEXITCODE -ne 0) {
    Write-Host "Git commit failed." -ForegroundColor Red
    exit $LASTEXITCODE
}

git push

if ($LASTEXITCODE -ne 0) {
    Write-Host "Git push failed." -ForegroundColor Red
    exit $LASTEXITCODE
}

Write-Host "Done." -ForegroundColor Green
