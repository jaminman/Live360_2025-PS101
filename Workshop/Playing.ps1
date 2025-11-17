Get-Service Spooler | gm


#  https://github.com/mikefrobbins/ModuleTools/tree/main/MrModuleTools
# Save functions in a .ps1 file but naming it .psm1 
New-ModuleManifest .\ModuleName\ModuleName.psd1
# edit .psd1 to include functions ect.
# Move .psm1 to be in the same folder as .psd1


# https://seanonit.org/


# PowerShell Remoting should use SSH not WinRM
#   Enter-PSSession -HostName  --> Uses PS7 over SSH
#   Enter-PSSession -ComputerName --> Uses PS5.1 over WinRM



