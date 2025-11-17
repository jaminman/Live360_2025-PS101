# Intro to PowerShell – Full-Day Demo Script

#region 01 - Core Discovery Commands
Get-Help Get-Service
Get-Help Get-Service -Examples
Get-Command
Get-Command *service*
Get-Command -Verb Get
Get-Service | Get-Member
Get-Process | Get-Member
#endregion

#region 02 - Exploring the System
Get-Process
Get-Service
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
#endregion

#region 03 - File System Navigation
Get-Location
Get-ChildItem
Set-Location C:\Windows
Get-ChildItem
Set-Location ..
Get-ChildItem -Force
#endregion

#region 04 - Providers
Get-PSProvider
Set-Location HKCU:\Software
Get-ChildItem
Set-Location C:\
#endregion

#region 05 - Object Inspection
Get-Service | Select-Object -First 1 | Get-Member
Get-Process | Select-Object -First 1 | Get-Member
#endregion

#region 06 - Command Discovery Fun
Get-Verb
Get-Command -Noun *disk*
Get-Command -Noun *computer*
Get-Command -Noun *network*
#endregion
