# PowerShell script to deploy Raghul Loganathan's Portfolio to GitHub Pages

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   Deploy Raghul Loganathan's Portfolio to GitHub Pages   " -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

$repoUrl = Read-Host "Please enter your GitHub repository URL (e.g., https://github.com/username/portfolio.git)"

if ([string]::IsNullOrWhiteSpace($repoUrl)) {
    Write-Host "Error: No repository URL entered. Exiting." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Connecting to remote: $repoUrl ..." -ForegroundColor Green

# Remove origin if already present
git remote remove origin 2>$null

# Add origin
git remote add origin $repoUrl

# Push main branch
Write-Host "Pushing main branch to GitHub..." -ForegroundColor Cyan
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "SUCCESS! Code pushed to GitHub successfully." -ForegroundColor Green
    Write-Host "To enable GitHub Pages:" -ForegroundColor Yellow
    Write-Host "1. Go to your repo on GitHub -> Settings -> Pages" -ForegroundColor White
    Write-Host "2. Under 'Build and deployment', choose 'GitHub Actions' (or 'Deploy from a branch' -> main -> /root)" -ForegroundColor White
    Write-Host "3. Your site will be live in ~60 seconds!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Push failed. Please ensure you have access to the repository and are authenticated with GitHub." -ForegroundColor Red
}

pause

