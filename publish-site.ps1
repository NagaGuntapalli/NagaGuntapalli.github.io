[CmdletBinding()]
param(
    [string]$Message = "Update website $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
)

$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

function Invoke-Git {
    param([Parameter(Mandatory = $true)][string[]]$GitArguments)

    & git @GitArguments
    if ($LASTEXITCODE -ne 0) {
        throw "Git command failed: git $($GitArguments -join ' ')"
    }
}

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw 'Git is not installed or is not available on PATH.'
}

$insideRepository = & git rev-parse --is-inside-work-tree 2>$null
if ($LASTEXITCODE -ne 0 -or $insideRepository -ne 'true') {
    throw 'This script must be run from inside the website Git repository.'
}

$branch = (& git branch --show-current).Trim()
if ($branch -ne 'main') {
    throw "Publishing stopped: switch to the main branch first. Current branch: $branch"
}

& git remote get-url origin *> $null
if ($LASTEXITCODE -ne 0) {
    throw 'Publishing stopped: the origin remote is not configured.'
}

Invoke-Git -GitArguments @('diff', '--check')

$sitePaths = @(
    '.gitignore',
    '404.html',
    'README.md',
    'UPLOAD_INSTRUCTIONS.md',
    'index.html',
    'styles.css',
    'script.js',
    'assets',
    'publish-site.ps1'
)

$existingPaths = $sitePaths | Where-Object { Test-Path -LiteralPath $_ }
$addArguments = @('add', '--') + $existingPaths
Invoke-Git -GitArguments $addArguments

& git diff --cached --quiet
if ($LASTEXITCODE -eq 1) {
    Invoke-Git -GitArguments @('commit', '-m', $Message)
} elseif ($LASTEXITCODE -ne 0) {
    throw 'Unable to inspect the staged website changes.'
} else {
    Write-Host 'No new website changes to commit. Checking for commits that still need to be pushed.'
}

Invoke-Git -GitArguments @('push', 'origin', 'main')

Write-Host ''
Write-Host 'Website published successfully.' -ForegroundColor Green
Write-Host 'GitHub Pages URL: https://nagaguntapalli.github.io/'
Write-Host 'GitHub Pages may take a few minutes to finish deploying the new commit.'
