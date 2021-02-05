# MTR-Time-Sync-tools
Tools to allow Microsoft Teams Rooms devices that are Azure-AD Joined to sync to NTP


Teams Meeting Room Time fix - rob 3/2/2021 v1.1 Powershell edition
Provides reliable time for Teams Meeting Rooms that are Azure AD joined by doing the following
1) Update the service trigger for W32Time to be the presence of a network connection (the default is 'on domain join')
2) Update the service to use time.windows.com as time source.
3) Restart the w32Time service and force a time sync
n.b. if you're testing this on a VM, disable your VM tools/additions/integrations native time sync first... *sigh*
