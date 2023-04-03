$sites = .\Get-SiteLogPath.ps1
foreach ($site in $sites) {
    1..30 | ForEach-Object {
        $fileName = $($site.LogPath) + "{0:u_exyyMMdd}" -f (Get-Date).AddDays(-$_) + '.log'
        fsutil file createnew $filename $(Get-Random -Minimum 104857600 -Maximum 157286400)
        (Get-Item $filename).CreationTime = (Get-Date -Hour 0 -Minute 0 -Second 0).AddDays(-$_)
        (Get-Item $filename).LastWriteTime = (Get-Date -Hour 23 -Minute 59 -Second 59).AddDays(-$_)        
    }
}
