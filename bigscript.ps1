###################
###################
###################
###################
###################
# * * * * * * * * #
  #BEFORE RESTART#
# * * * * * * * * #
###################
###################
###################
###################
# * * * * * * * * #
 # A U T H O R S #
# * * * * * * * * #
####Blake Wolf#####
##Henry Willaeur###

#appends a newline to the start.xml file containing the the input given and pathing it to chrome
#$User = Read-Host "Enter the new hire username: "

#$fileContent = Get-Content "C:\start.xml"
#$fileContent[11-1] += '<taskbar:DesktopApp DesktopApplicationLinkPath="C:\Program Files\Google\Chrome\Application\chrome.exe" />'
#$fileContent | Set-Content "C:\start.xml"

#uninstall adobe
#$MyApp = Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Adobe Acrobat DC"}
#$MyApp.Uninstall()

#sleep 30 seconds to verify uninstall
#Start-Sleep -s 30

#install new adobe
#Start-Process -FilePath "C:\Users\Blake\Downloads\Acrobat_DC_Set-Up.exe" -Wait

#set default apps 
dism /online /Import-DefaultAppAssociations:"%UserProfile%\Desktop\DefaultAppAssociations.xml"

#set pinned apps
Import-StartLayout -LayoutPath "C:\StartMenuLayout.xml" -MountPath "C:\"

#enable Remote Desktop (works while firewall is enabled? the following command disables it)
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

#disable firewall (verify what needs to be disbaled [Domain, Public, & Private])
Set-NetFirewallProfile -Profile Domain, Public, Private -Enabled False

#install microsoft teams
Start-Process -FilePath "C:\Users\Blake\Downloads\Teams_windows_x64.exe"

Start-Sleep -s 30

#Restart-Computer -Confirm

#open outlook to start updating
#Start-Process -FilePath "C:\Program Files\Microsoft Office\root\Office16\OUTLOOK.EXE"