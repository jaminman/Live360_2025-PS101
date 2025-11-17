# Full-Day PowerShell Demo Script
# Write-Host commands removed, lab sections marked with comments

#region 01 - Command Discovery
# Get help, commands, members
Get-Help Get-Service
Get-Help Get-Service -Examples
Get-Command
Get-Command *service*
Get-Command -Verb Get
Get-Service | Get-Member
Get-Process | Get-Member

# String notation:
# Double quotes allow escape chars and Variables. Variables uses $($varName.Property) to show value of the property.
# Single quotes is a literal.

# Lab 1 goes here
Get-Variable 
Get-Variable Error | select-object -property *

# | clip; will copy to the clipboard whatever is executed.
<#

Name        : Error
Description : 
Value       : {The term 'so' is not recognized as a name of a cmdlet, function, script file, or executable program.
              Check the spelling of the name, or if a path was included, verify that the path is correct and try again., The term 'Get' is not recognized as a name of a cmdlet, function, script file, or executable program.
              Check the spelling of the name, or if a path was included, verify that the path is correct and try again., Failed to update Help for the module(s) 'Dism, Get-NetView, Kds, NetQos, Pester, PKI, Whea, WindowsUpdate' with UI culture(s) {en-US} : One or more errors occurred. (Response status code does not indicate success: 404 (The requested content does not exist.).).
              English-US help content is available and can be installed using: Update-Help -UICulture en-US., Failed to update Help for the module(s) 'Send-MailKitMessage' with UI culture(s) {en-US} : The value of the HelpInfoUri key in the module manifest must resolve to a container or root URL on a website where the help files are stored. The HelpInfoUri 'https://github.com/austineric/Send-MailKitMessage#usage' does not resolve to a container..
              English-US help content is available and can be installed using: Update-Help -UICulture en-US.ΓÇª}
Visibility  : Public
Module      : 
ModuleName  : 
Options     : Constant
Attributes  : {}

#>


#endregion

#region 02 - Services and Processes
Get-Service -Name Spooler
Get-Service -Name Spooler | Select-Object *
Get-Service -Name Spooler | Get-Member
Get-Service -Name Spooler | Stop-Service
Stop-Service -Name Spooler
$service = Get-Service -Name Spooler
# Lab 2 goes here
#endregion

#region 03 - Variables and Data Types
$dime = 10
$dime = "ten"
$dime = "10"

5 + 5
5 + "five"
"five" + 5
$dime + 1
1 + $dime
"10" + 1
1 + "10"

#new math
"5" + 5 # = 55

# Tee-Object ==> send to screen and to a file.

<# NOTES:
Copy commands and output:
Start-Transcript .\Filename.txt 
  Commands here...
Stop-Transcript 

1..10 is a short way of representing an array of ints 0-9
Escape character in PowerShell is back-tick ` and not \ like in C#.
Commands do NOT need to end in a semi-colon ;






#>


# Lab 2 goes here
#endregion

#region 04 - File System Operations
Get-ChildItem
Get-ChildItem | Sort-Object -Property Name | Format-Table
New-Item -Path C:\Scripts\SQLSATBR-2024\ -Name files -ItemType Directory
1..10 | ForEach-Object { New-Item -ItemType File -Name "$_.md" }
$files = Get-ChildItem -Path C:\Scripts\SQLSATBR-2024 | Select-Object Name
ForEach ($f in $files) { $f }
# Lab 3 goes here
#endregion

#region 05 - Loops and Object Manipulation
$service = Get-Service Spooler, BITS
foreach ($s in $service) { Stop-Service -Name $s.Name }

$service = Get-Service Spooler, BITS
foreach ($s in $service) {
    if ($s.Status -eq "Stopped") { Start-Service $s.Name }
}
# Lab 3 goes here
#endregion

#region 06 - Date and Strings
Get-Date
Get-Date | Get-Member
Get-Date | Select-Object Hour
Get-Date -Format "MM-dd-yyyy hh:mm"
(Get-Date).AddDays(-4)
$dog = "Daisy"
"My dog's name is $dog"
'My dogs name is $dog'

# Lab 2 goes here
#endregion

#region 07 - Remoting
$cred = Get-Credential
Enter-PSSession -ComputerName srv01 -Credential $cred
Invoke-Command -ComputerName srv01,srv02 -ScriptBlock {$env:COMPUTERNAME} -Credential 714tech\bob
Invoke-Command -ComputerName (Get-Content c:\scripts\computers.txt) -ScriptBlock {$env:COMPUTERNAME}
Invoke-Command -ComputerName (Import-Csv c:\scripts\computers.Import-Csv) -ScriptBlock {$env:COMPUTERNAME}
Invoke-Command -ComputerName (Get-ADComputer -Filter "OU=printers,dc=test,dc=lab") -ScriptBlock {$env:COMPUTERNAME}
# Lab 4 goes here
#endregion

#region 08 - Registry and Environment
Get-Item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -Value "3399"
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface" -Value "yes"
Remove-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface"
# Lab 4 goes here
#endregion
