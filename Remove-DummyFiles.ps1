$sites = .\Get-SiteLogPath.ps1
foreach ($site in $sites) {
    Get-ChildItem -Path $site.LogPath | Select-Object -SkipLast 1 | Remove-Item -Force -Verbose
}