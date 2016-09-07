---
permalink: installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit/
audit_date:
title: Install Active Directory Domain Services on Windows Server 2008 R2 Enterprise 64-bit
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-09-07'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This article provides prerequisites and steps for installing Active
Directory Domain Services (AD DS) on Microsoft Windows Server 2008 R2
Enterprise 64-bit (W2K8).

This article does *not* provide instructions for adding a Domain
Controller (DC) to an already existing Active Directory Forest
Infrastructure.

**Note**: For information on setting up the Active Directory Role
on a Windows Server 2012, see [Install Active Directory on Windows Server 2012](/how-to/installing-active-directory-on-windows-server-2012).

### Prepare for Active Directory

Before you install AD DS on a Rackspace Cloud Server running
Windows Server 2008 R2 Enterprise 64-bit (W2K8), you must perform the
following prerequisite tasks.

#### Select Domain Name and Password

Select your domain name and know the domain administrator password
that you want to use.

**Note**: Your domain name should be reliably unique.  Do not use the
same domain as your website, for example, and avoid extensions like
".local" unless you have registered that domain name in DNS. We suggest
a domain name that is not used for anything else, like
"internal.example.com".

#### Specify the Preferred DNS Server

Windows Server 2008 can properly install and configure DNS during
the AD DS installation if it knows that the DNS is local. You can
accomplish this by having the private network adapter's preferred DNS
server address point to the already assigned IP address of the same
private network adapter, as follows:

1.  From the Windows **Start** menu, open **Administrative
    Tools > Server Manager**.

2.  In the **Server Summary** section of the Server Manager
    window, click **View Network Connections**.

3.  In the Network Connections window, right-click the private
    adapter and select **Properties**.

4.  Select **Internet Protocol Version 4** from the list of connected items, and then
    click **Properties**.

5.  Copy the IP address that is displayed in the **IP address**
    box and paste it into the **Preferred DNS server** box. Then, click
    **OK**.

    <img src="{% asset_path cloud-servers/installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit/2K8_64R2_ADDS(2).jpg %}" alt="edit IPv4 properties" />

6.  Click **OK** in the Properties dialog box, and close the
    Network Connections window.

**Note**: The last step for prepping W2K8 for AD is adding the proper
Server Role. The "Active Directory Domain Services"" Role will be added.
This only installs the framework for W2K8 to become a DC and run AD. It
does not promote the server to DC or install AD.

#### Add the Active Directory Domain Services Role

Adding the Active Directory Domain Services role installs the
framework for Windows Server 2008 to become a DC and run AD DS. It does
*not* promote the server to a DC or install AD DS.

1.  In the Server Manager window, open the **Roles** directory and
    in the **Roles Summary** section, click **Add Roles**.

2.  On the Before You Begin page of the Add Roles Wizard, click
    **Next**.

3.  On the Select Server Roles page, select the **Active Directory
    Domain Services** check box from the list of roles, and then click **Next** on this page
    and on the Confirmation page.

4.  On the Installation Progress page, click **Install**.

5.  On the Results page, after the role is successfully added,
    click **Close**.

#### Enable Remote Management

1.  Open the Server Manager window if it is not already
    open.
2.  In the **Properties** area of the **Local Servers** page,
    click **Remote Management**.
3.  Select the **Enable remote management of this server from
    other computers** check box.

### Install Active Directory Domain Services (DCPROMO)

Now that you have prepared the server, you can install AD DS.

**Note**: As an alternative to performing steps 1
through 3, you can type `dcpromo.exe` at the
command prompt. Then, skip to step 4.

1.  If it is not already open, open the Server Manager
    window.

2.  Select **Roles > Active Directory Domain** Services.

3.  In the **Summary** section,click **Run the Active Directory
    Domain Services Installation Wizard (dcpromo.exe)**.

4.  On the Welcome page of the Active Directory Domain Services
    Installation Wizard, ensure that the **Use advanced mode
    installation** check box is cleared, and then click **Next**.

5.  On the Operating System Capability page, click
    **Next**.

6.  On the Choose a Deployment Configuration page, select **Create
    a new domain in a new forest** and then click **Next**.

7.  On the Name the Forest Root Domain page, enter the domain name
    that you choose during preparation steps. Then, click
    **Next**.

8.  After the installation verifies the NetBIOS name, on the Set
    Forest Functional Level page, select **Windows Server 2008 R2** in
    the **Forest function level** list. Then, click **Next**.

    The installation examines and verifies your DNS setting.

9.  On the Additional Domain Controller Options page, ensure that
    the **DNS server** check box is selected, and then click **Next**.

10. In the message dialog box that appears, click
    **Yes**.

11. On the Location for Database, Log Files, and SYSVOL page,
    accept the default values and then click **Next**.

12. On the Directory Services Restore Mode Administrator Password
    page, enter the domain administrator password that you chose during
    the preparation steps. This is not your admin password that was
    emailed to you during the creation of your server, although you can
    use that password if you want to. Then, click **Next**.

13. On the Summary page, review your selections and then click
    **Next**.

    The installation begins.

    **Note:** If you want the server to restart automatically after the
    installation is completed, select the **Reboot on completion** check
    box.

14. If you did not select the **Reboot on completion** check box,
    click **Finish**<span> in the wizard</span>. Then, restart the
    server.

15. After a few minutes, reconnect to your server by using the
    Console in your Control Panel or RDP.

16. To log in, perform the following steps:
        a. Click **Switch User**, and then click **Other User.**
        b. For the user, enter the full domain name that you chose, followed by a back slash and **Administrator** (for example, **Example.com\\Administrator**).
        c. Enter the password that was emailed to you when you first built the server. If you changed your password for the local admin account to this server before you began the installation of Active Directory Domain Services, use that password.
        d. Click the log in button.

The installation of Active Directory Domain Services on your server is
complete.
