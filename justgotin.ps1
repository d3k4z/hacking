Set-MpPreference -DisableRealtimeMonitoring $true 
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force 


# "Enabling file extensions..." 
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -PropertyType DWORD -Value "0" -Force 


# "Disabling 'Send Microsoft info about how I write to help us improving typing and writing in the future' functionality..." 
New-Item -Path 'HKCU:\SOFTWARE\Microsoft\Input' -Name 'TIPC' -Force 
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name "Enabled" -PropertyType DWORD -Value "0" -Force 


# "Adjusting feedback frequency. A value of 0 indicates that user is never prompted to provide feedback about Windows 10 functionality by Microsoft." 
New-Item -Path 'HKCU:\Software\Microsoft\Siuf' -Name 'Rules' -Force 
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "PeriodInNanoSeconds" -PropertyType DWORD -Value "0" -Force 
New-ItemProperty -Path "HKCU:\Software\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -PropertyType DWORD -Value "0" -Force 


# "Turning off OneDrive..." 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Name 'DisableFileSyncNGSC' -PropertyType DWORD -Value '1' -Force 
New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive' -Name 'PreventNetworkTrafficPreUserSignIn' -PropertyType DWORD -Value '1' -Force 
taskkill /f /im OneDrive.exe 
C:\Windows\SysWOW64\OneDriveSetup.exe /uninstall 


# "Disabling Microsoft Account Sign-in Assistant Service..." 
Set-Service wlidsvc -StartupType Disabled 

 
# "Disabling Windows Error Reporting Service..." 
Set-Service WerSvc -StartupType Disabled 


# "Disabling Xbox Live Auth Manager Service..." 
Set-Service XblAuthManager -StartupType Disabled 

 
# "Disabling Xbox Live Game Save Service..." 
# Set-Service XblGameSave -StartupType Disabled 

 
# "Disabling Xbox Live Networking Service Service..." 
Set-Service XboxNetApiSvc -StartupType Disabled 

 
# "Disabling Xbox Accessory Management Service..." 
Set-Service XboxGipSvc -StartupType Disabled 


# "Disabling Scheduled Tasks..." 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Application Experience\ProgramDataUpdater" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Application Experience\StartupAppTask" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Maps\MapsToastTask" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Maps\MapsUpdateTask" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Shell\FamilySafetyMonitor" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\WDI\ResolutionHost" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Windows Media Sharing\UpdateLibrary" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Autochk\Proxy" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Feedback\Siuf\DmClient" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Shell\FamilySafetyRefreshTask" 
Disable-ScheduledTask -TaskName "\Microsoft\Windows\Windows Error Reporting\QueueReporting" 
Disable-ScheduledTask -TaskName "\Microsoft\XblGameSave\XblGameSaveTask" 
