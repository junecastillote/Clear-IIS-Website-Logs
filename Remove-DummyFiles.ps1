$sites = .\Get-SiteLogPath.ps1
foreach ($site in $sites) {
    Get-ChildItem -Path $site.LogPath | Sort-Object Name -Descending | Select-Object -Skip 1 | Remove-Item -Force -Verbose
}