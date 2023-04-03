# Get IIS Site Log Files Path
Import-Module WebAdministration
Get-Website | ForEach-Object {
    New-Object psobject -Property $(
        [ordered]@{
            Site    = $_.Name;
            LogPath = $(($_.LogFile.Directory).ToString().Replace('%SystemDrive%', $env:SystemDrive)) + "\W3SVC$($_.id)\"
        }
    )
}