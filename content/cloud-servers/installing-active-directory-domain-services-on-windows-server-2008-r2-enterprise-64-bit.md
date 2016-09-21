---
permalink: installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit/
audit_date: '2016-09-20'
title: Install Active Directory Domain Services on Windows Server 2008 R2 Enterprise 64-bit
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-09-20'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This article provides prerequisites and steps for installing Active
Directory Domain Services (AD DS) on Rackspace cloud servers running Microsoft Windows Server 2008 R2
Enterprise 64-bit.

This article does *not* provide instructions for adding a Domain
Controller (DC) to an already existing Active Directory Forest
infrastructure.

**Note**: For information about setting up the Active Directory Role
on a cloud server running Windows Server 2012, see [Install Active Directory on Windows Server 2012](/how-to/installing-active-directory-on-windows-server-2012).

### Prepare for AD DS

Before you install AD DS on a Rackspace cloud server running
Windows Server 2008 R2 Enterprise 64-bit, you must perform the
following prerequisite tasks.

#### Select domain name and password

Select your domain name and know the domain administrator password
that you want to use.

**Note**: Your domain name should be reliably unique.  Do not use the
same domain as your website, for example, and avoid extensions like
**.local** unless you have registered that domain name in DNS. We suggest
a domain name that is not used for anything else, like
**internal.example.com**.

#### Specify the preferred DNS server

Windows Server 2008 can properly install and configure DNS during
the AD DS installation if it knows that the DNS is local. To accomplish
this, assign the private network adapter to the preferred DNS
server address of the same private network adapter, as follows:

1.  From the Windows **Start** menu, open **Administrative
    Tools > Server Manager**.

2.  In the **Server Summary** section of the Server Manager
    window, click **View Network Connections**.

3.  In the Network Connections window, right-click the private
    adapter and select **Properties**.

4.  From the list of conected items, select **Internet Protocol Version 4**,
    and then click **Properties**.

5.  Copy the IP address that is displayed in the **IP address**
    box and paste it in the **Preferred DNS server** box. Then, click
    **OK**.

    <img src="{% asset_path cloud-servers/installing-active-directory-domain-services-on-windows-server-2008-r2-enterprise-64-bit/2K8_64R2_ADDS(2).jpg %}" alt="edit IPv4 properties" />

6.  Click **OK** in the Properties dialog box, and close the
    Network Connections window.


#### Add the Active Directory Domain Services role

Adding the Active Directory Domain Services role installs the
framework for Windows Server 2008 to become a DC and run AD DS. It does
*not* promote the server to a DC or install AD DS.

1.  In the Server Manager window, select the **Roles** directory.

2.  In the **Roles Summary** section, click **Add Roles**.

3.  On the Before You Begin page of the Add Roles Wizard, click
    **Next**.

4.  On the Select Server Roles page, select the **Active Directory
    Domain Services** check box, and then click **Next**.

5.  On the Confirmation page, click **Next**.

6.  On the Installation Progress page, click **Install**.

7.  On the Results page, after the role is successfully added,
    click **Close**.

#### Enable remote management

1.  Open the Server Manager window if it is not already
    open.
2.  In the **Properties** area of the **Local Servers** page,
    click **Remote Management**.
3.  Select the **Enable remote management of this server from
    other computers** check box.

### Install AD DS

Now that you have prepared the server, you can install AD DS (DCPROMO).

**Note**: As an alternative to performing steps 1
through 3, you can type `dcpromo.exe` at the
command prompt. Then, skip to step 4.

1.  If it is not already open, open the Server Manager
    window.

2.  Select **Roles > Active Directory Domain Services**.

3.  In the **Summary** section,click **Run the Active Directory
    Domain Services Installation Wizard (dcpromo.exe)**.

4.  On the Welcome page of the Active Directory Domain Services
    Installation Wizard, ensure that the **Use advanced mode
    installation** check box is cleared, and then click **Next**.

5.  On the Operating System Compatibility page, click
    **Next**.

6.  On the Choose a Deployment Configuration page, select **Create
    a new domain in a new forest** and then click **Next**.

7.  On the Name the Forest Root Domain page, enter the domain name
    that you choose during preparation steps. Then, click
    **Next**.

    The installation program verifies the NetBIOS name.

8.  On the Set Forest Functional Level page, select **Windows Server 2008
    R2** in the **Forest function level** list. Then, click **Next**.

    The installation program examines and verifies your DNS setting.

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

15. After a few minutes, reconnect to your server in the Console in the
    Cloud Control Panel or RDP.

16. To log in, perform the following steps:

        a. Click **Switch User**, and then click **Other User.**

        b. For the user, enter the full domain name that you chose, followed by a back slash and **Administrator** (for example, **internal.example.com\\Administrator**).

        c. Enter the password that was emailed to you when you first built the server. If you changed your password for the local admin account on this server before you began the installation of AD DS, use that password.

        d. Click the log in button.

The installation of Active Directory Domain Services on your server is
complete.
