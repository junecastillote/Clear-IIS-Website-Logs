# Register the scheduled task
$taskParams = @{
    TaskName    = 'Delete IIS Logs Older Than 7 Days'
    Action      = (New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File C:\scripts\Delete-IISLogs.ps1 -OlderThanXDays 7')
    Trigger     = (New-ScheduledTaskTrigger -Weekly -At 1AM -DaysOfWeek Sunday)
    Description = 'Delete IIS Logs Older Than 7 Days'
    User        = 'SYSTEM'
    RunLevel    = 'Highest'
    Settings    = (New-ScheduledTaskSettingsSet -Compatibility Win8)
}
Register-ScheduledTask @taskParams