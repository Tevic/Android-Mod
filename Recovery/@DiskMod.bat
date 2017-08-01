@ECHO OFF
TITLE
echo Use MiFlash To Recovery aboot Partition!
echo Please Make Backup!
echo Enter Fastboot Mod ( Power & Vol+ )
PAUSE
fastboot erase aboot
fastboot reboot
echo Do Not Disconnect Your Phone From PC! You Can Make Partition Now Using DiskGenuis!
PAUSE>nul