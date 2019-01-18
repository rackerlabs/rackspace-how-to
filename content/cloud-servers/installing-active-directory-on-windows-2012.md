---
permalink: installing-active-directory-on-windows-2012
audit_date:
title: Installing Active Directory on Windows 2012
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

### Setting up Services

1. From the Start Menu, click Server Manager
2. From there click Tools and select Services.
3. The services screen appears. They are sorted alphabetically so scroll down to Remote Registry. Right click it and select start. If the Startup Type is set to disabled, click properties and change it to Automatic. Then start the service. Close the services window after the Remote Registry has been started.

### Installing Active Directory

1. From the Server Manager screen, select Manager and choose Add Roles and Features.
2. A screen should show up with a Before you begin screen. Click next.
3. For the Installation Type, just click next to move to the next screen.
4. On the Server Selection screen, click next as the local server is enabled by default.
5. From the Server Roles screen, check the box Active Directory Domain Services.
6. A pre-requisites screen will appear. Select Add Features.
7. You will be back to the Add Roles screen, click next to move to the next screen and then click next again to go past features.
8. Next, the Things to Note screen will appear. Simply click next to move on to the confirmation screen.
9. Check the box, ‘Restart the destination server automatically if required and then click Install.
10. Once the installation is complete, the server will reboot automatically. 

### Setting up Active Directory.

1. From the Start Menu, click Server Manager
2. Select AD DS and the More field under the Configuration required for Active Directory Domain Services.
3. A new window will appear. Click the Promote this server to a domain-controller to start dcpromo.exe (This can also be done by starting command line and type dcpromo.exe)
4. Select Add a new forest and type in your domain. Then click next.
5. Choose your forest functional level. If this is a completely new domain, it is recommended to use the highest functional level possible. Afterwards, choose your Restore mode password. Then click next.
6. On the DNS options, select your DNS zone or choose Create DNS delegation (Mine’s greyed out because its already set up).
7. On the Additional Options screen, it will automatically populate your domain name.
8. On the paths screen, chooses where you’d like to save the various files. These are the defaults.
9. A Prerequisites Check will run. You can ignore warnings, but must address errors. Click install if it all goes through.
10. The installation will run through and the server will log you out when it is completed.
11. From there, you’ll be able to sign in with your new domain.
