---
permalink: common-windows-issues-terminal-services-licenses
audit_date:
title: Common Windows Issues: Terminal Services Licenses
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
Problem:  You are unable to access your Cloud Server via a Remote Desktop Connection due to a licensing Error
Cause:  By default, Rackspace Cloud Servers come with a Remote Desktop license that allows for 2 concurrent users to access your server.  If you need more than 2 people to be able to access the Cloud Server at the same time, you will need to purchase and install a Terminal Services license.  You may have already installed a trial version of the Terminal Services license, and the grace period has recently expired, causing the recent appearance of licensing errors. 
Note:  In Windows Server 2003 R2 and 2008 this feature is named Terminal Services.  In Windows Server 2008 R2 and 2012 R2 this feature is named Remote Desktop Services. 
Resolution:   You will need to add Terminal Services and/or Remote Desktop licenses to your Cloud Server.
Windows 2008
1. Open Server Manager and highlight Roles in the left side of the Server Manager window
2. Click Remove Roles on the right side of the Server Manager window
3. Locate and uncheck Terminal Services, then hit Next, then hit Remove
Windows 2008 R2
1. Open Server Manager and highlight Roles in the left side of the Server Manager window
2. Click Remove Roles on the right side of the Server Manager window
3. Locate and uncheck Remote Desktop Services, then hit Next, then hit Remove
Windows 2012 and 2012 R2
See the Set up Remote Desktop Services in Windows 2012 article.
 
* Install Licensing for Terminal Services/Remote Desktop Services
Windows 2008
1. Open Server Manager and highlight Roles in the left side of the Server Manager window
2. Click Add Roles on the right side of the Server Manager window
3. Place a check in the box next to Terminal Services and select Next, and hit Next again
4. In the Role Services window, select Terminal Server Licensing and select Next
5. In the Configure Discovery Scope window, you would choose the discovery option which best fits your environment (most situations would leave the default configuration) and select Next
6. Click Install to load the Terminal Services Licensing role service.
7. After the installation is complete, close out of the wizard and open the Start Menu, select Administrative Tools, Terminal Services, Terminal Services Licensing Manager
8. Within the Terminal Services Licensing Manager window, right-click on the server name and select Activate.
9. Select Next, then choose your Activation method (most situations would use the Automatic connection method)
10. Fill out the appropriate information in the fields provided and select Next, then fill out the next set of fields and select Next
11. The server will attempt to activate against a Microsoft licensing server, and once it’s finished, please select Next twice, then select Next again to launch the Install Licenses Wizard
12. Choose the License Program you purchased your licenses through (most situations would use a License Pak) and select Next
13. Enter the product code for your Terminal Services license and click Add, then hit Next.
14. Click Finish to exit out of the wizard and at this point your server is ready to function as a terminal services licensing server.
 
Windows 2008 R2
1. Open Server Manager and highlight Roles in the left side of the Server Manager window
2. Click Add Roles on the right side of the Server Manager window
3. Place a check in the box next to Remote Desktop Services and select Next, and hit Next again
4. In the Role Services window, select Remote Desktop Licensing and select Next
5. In the Configure Discovery Scope window, you would choose the discovery option which best fits your environment (most situations would leave the default configuration) and select Next
6. Click Install to load the Remote Desktop Licensing role service.
7. After the installation is complete, close out of the wizard and open the Start Menu, select Administrative Tools, Remote Desktop Services, Remote Desktop Licensing Manager
8. Within the Remote Desktop Licensing Manager window, right-click on the server name and select Activate.
9. Select Next, then choose your Activation method (most situations would use the Automatic connection method)
10. Fill out the appropriate information in the fields provided and select Next, then fill out the next set of fields and select Next
11. The server will attempt to activate against a Microsoft licensing server, and once it’s finished, please select Next twice, then select Next again to launch the Install Licenses Wizard
12. Choose the License Program you purchased your licenses through (most situations would use a License Pak) and select Next
13. Enter the product code for your Remote Desktop Services license and click Add, then hit Next.
14. Click Finish to exit out of the wizard and at this point your server is ready to function as a Remote Desktop licensing server.
 
Note:  Rackspace no longer offers Cloud Servers with Windows 2003, but these instructions are here for legacy support purposes.

* Remove the Terminal Services/Remote Desktop Services Role
Windows 2003 R2 
1. Open the Control Panel and click on Add/Remove Programs
2. In the window that pops up, click Add/Remove Windows Components
3. Scroll to the bottom of the window that pops up and uncheck Terminal Services (and also Terminal Services Licensing if that is also installed)
4. If you are prompted for installation media, please browse to C:\Factory for the appropriate content
 
* Install Licensing for Terminal Services/Remote Desktop Services
Windows 2003 R2
1. Open the Control Panel and click on Add/Remove Programs
2. In the window that pops up, click Add/Remove Windows Components
3. Scroll to the bottom of the window that pops up and check Terminal Services Licensing, then click Next
4. Choose whether your Terminal Services Licensing will be for the entire enterprise or for a single domain/workgroup (most situations would be for the single domain/workgroup)
5. Choose the location for the licensing database (the default location is fine) and hit Next
6. When you are prompted for installation media, please browse to C:\Factory for the appropriate content, then hit Next, and Finish
7. When the installation is complete, open the Start Menu, select Administrative Tools, then Terminal Services Licensing
8. Locate and right-click your server in the right side of the Terminal Server Licensing window, then select Activate Server
9. Select Next, then choose your Activation method (most situations would use the Automatic connection method)
10. Fill out the appropriate information in the fields provided and select Next, then fill out the next set of fields and select Next
11. The server will attempt to activate against a Microsoft licensing server, and once it’s finished, please select Next twice, then select Next again to launch the Terminal Server CAL Installation Wizard
12. Choose the License Program you purchased your licenses through (most situations would use a License Pak) and select Next
13. Enter the product code for your Terminal Services license and click Add, then hit Next.
14. Click Finish to exit out of the wizard and at this point your server is ready to function as a terminal services licensing server.
