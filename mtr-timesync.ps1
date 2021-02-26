<# Teams Meeting Room Time fix - rob 3/2/2021 v1.1 Powershell edition
Provides reliable time for Teams Meeting Rooms that are Azure AD joined by doing the following
1) Update the service trigger for W32Time to be the presence of a network connection (the default is 'on domain join')
2) Update the service to use time.windows.com as time source.
3) Restart the w32Time service and force a time sync

n.b. if you're testing this on a VM, disable your VM tools/additions/integrations native time sync first... *sigh*
#>
 
sc.exe triggerinfo w32time start/networkon stop/networkoff
w32tm /config /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org",0x8 /syncfromflags:MANUAL
restart-service w32time
w32tm /resync
