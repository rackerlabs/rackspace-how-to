---
permalink: install-licensing-services-to-cloud-servers-for-windows-2008-to-prevent-licensing-error/
audit_date: '2019-01-18'
title: Install licensing services to Cloud Servers for Windows 2008 and Windows 2008 R2 to prevent a licensing error
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-02-19'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---
This article shows you how to install licensing services for Cloud Servers for Microsoft® Windows® 2008 and Windows 2008 R2 to prevent a licensing error that keeps you from accessing your Cloud Server by using a Remote Desktop Connection (RDC).

By default, Rackspace Cloud Servers come with an RDC license that allows two concurrent users to access your server. If you need more than two users to be able to access the Cloud Server at the same time, you need to purchase and install a Terminal Services license. You may have already installed a trial version of the Terminal Services license, and the grace period has recently expired, causing the recent appearance of licensing errors.

---

**Note:** In Microsoft Windows 2008, this feature is named Terminal Services. In Windows 2008 R2, this feature is named Remote Desktop Services (RDS).

---

### Remove Terminal Services on Windows 2008 or RDS on Windows 2008 R2

Complete the following steps to remove the default RDS or Terminal Services role from your Windows server:

1. Open **Server Manager** and click **Roles** in the left side of the **Server Manager** window.
2. Click **Remove Roles** on the right side of the **Server Manager** window.
3. Locate and deselect **Terminal Services** for Windows 2008 or **Remote Desktop Services** for Windows 2008 R2, click **Next**, then click **Remove**.

### Install licensing for Terminal Services for Windows 2008 or RDS on Windows 2008 R2

Complete the following steps to install licensing on Windows Server 2008 or Windows Server 2008 R2:

1. Open **Server Manager** and click **Roles** in the left side of the **Server Manager** window.
2. Click **Add Roles** on the right side of the **Server Manager** window.
3. Place a check in the box next to **Remote Desktop Services** (**Terminal Services** for Windows 2008), click **Next**, and click **Next** again.
4. In the **Role Services** window, select **Remote Desktop Licensing** (**Terminal Server Licensing** for Windows 2008), and click **Next**.
5. In the **Configure Discovery Scope** window, select the discovery option that best fits your environment. In most situations, accept the default configuration and click **Next**.
6. Click **Install** to install the Remote Desktop Licensing (Terminal Services Licensing for Windows 2008) role service.
7. After the installation is complete, exit the wizard.
8. Click the **Start Menu**, and select **Administrative Tools > Remote Desktop Services (or Terminal Services) > Remote Desktop Licensing Manager (or Terminal Services Licensing Manager)**.
9. On the **Remote Desktop Licensing Manager** (**Terminal Services Licensing Manager** for Windows 2008) window, right-click the server name and select **Activate**.
10. Click **Next** and choose an **Activation** method. In most situations use the **Automatic** connection method.
11. Complete the information in the fields provided and click **Next**.
12. Complete the next set of fields and click **Next**.
13. After the server activates against a Microsoft licensing server, click **Next** twice, and then click **Next** again to launch the **Install Licenses Wizard**.
14. Choose the **License Program** through which you purchased your licenses and click **Next**. In most situations select a License Pak.
15. Enter the product code for your Terminal Services license, click **Add**, and then click **Next**.
16. Click **Finish** to exit out of the wizard.

Your server is now ready to function as a Terminal Services licensing server.
