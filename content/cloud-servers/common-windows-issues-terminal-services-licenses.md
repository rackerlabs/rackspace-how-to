---
permalink: common-windows-issues-terminal-services-licenses
audit_date:
title: Install licensing services to Cloud Servers for Windows 2008 and Windows 2008 R2
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
**Problem**: A licensing error is preventing you from accessing your Cloud Server via a Remote Desktop Connection.

**Cause**: By default, Rackspace Cloud Servers come with a Remote Desktop license that allows 2 concurrent users to access your server. If you need more than 2 users to be able to access the Cloud Server at the same time, you will need to purchase and install a Terminal Services license. You may have already installed a trial version of the Terminal Services license, and the grace period has recently expired, causing the recent appearance of licensing errors.

---

**Note:** In Microsoft Windows &reg; Server 2008 this feature is named Terminal Services. In Windows Server 2008 R2 this feature is named Remote Desktop Services.

---

**Solution**: Add Terminal Services or Remote Desktop licenses to your Cloud Server.

### Remove the Terminal Services role on Windows 2008
1. Open Server Manager and click **Roles** in the left side of the **Server Manager** window.
2. Click **Remove Roles** on the right side of the **Server Manager** window.
3. Locate and deselect **Terminal Services**, click **Next**, then click **Remove**.

#### Remove the Remote Desktop Service role on Windows 2008 R2
1. Open Server Manager and click **Roles** in the left side of the **Server Manager** window.
2. Click **Remove Roles** on the right side of the **Server Manager** window.
3. Locate and deselect **Remote Desktop Services**, click **Next**, then click **Remove**.

### Install Licensing for Remote Desktop Services (or Terminal Services) on Windows 2008 R2 and Windows 2008
1. Open Server Manager and click **Roles** in the left side of the **Server Manager** window.
2. Click **Add Roles** on the right side of the **Server Manager** window.
3. Place a check in the box next to Remote Desktop Services (Terminal Services for Windows 2008), click **Next**, and click **Next** again.
4. In the **Role Services** window, select **Remote Desktop Licensing** (**Terminal Server Licensing** for Windows 2008), and click **Next**.
5. In the **Configure Discovery Scope** window, select the discovery option that best fits your environment. In most situations, accept the default configuration and click **Next**.
6. Click **Install** to install the Remote Desktop Licensing (Terminal Services Licensing for Windows 2008) role service.
7. After the installation is complete, exit out of the wizard.
8. Click the Start Menu, and select **Administrative Tools > Remote Desktop Services (or Terminal Services) > Remote Desktop Licensing Manager (or Terminal Services Licensing Manager)**.
9. On the **Remote Desktop Licensing Manager** (**Terminal Services Licensing Manager** for Windows 2008) window, right-click the server name and select **Activate**.
10. Click **Next** and choose an Activation method. In most situations use the **Automatic** connection method.
11. Complete the information in the fields provided and click **Next**.
12. Complete the next set of fields and click **Next**.
13. After the server activates against a Microsoft licensing server, click **Next** twice, and then click **Next** again to launch the **Install Licenses Wizard**.
14. Choose the **License Program** through which you purchased your licenses and click **Next**. In most situations select a License Pak.
15. Enter the product code for your Terminal Services license, click **Add**, and then click **Next**.
16. Click **Finish** to exit out of the wizard.

Your server is now ready to function as a terminal services licensing server.
