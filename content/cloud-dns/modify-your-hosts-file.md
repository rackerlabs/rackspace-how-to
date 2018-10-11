---
permalink: modify-your-hosts-file/
audit_date: '2018-08-24'
title: Modify your hosts file
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-10-11'
last_modified_by: Renee Rendon
product: Cloud DNS
product_url: cloud-dns
---

Modifying your hosts file enables you to override the domain name system
(DNS) for a domain on a specific machine. [DNS management](https://www.rackspace.com/cloud/dns) is useful when you
want to perform test your site without the test link prior to going live with SSL, 
verify that an alias site works prior to DNS changes, and for other DNS-related reasons.

Modifying your hosts file causes your local machine to look directly at
the Internet Protocol (IP) address that you specify. Rackspace offers 
[managed hosting solutions](https://www.rackspace.com/managed-hosting) to assist the handling of these resources.

Modifying the hosts file involves adding two entries to it. Each entry
contains the IP address to which you want the site to resolve and a version of
the Internet address. For example, add the following two entries points,
**www.domain.com** and **domain.com**, to Rackspace's current refreshed PHP5
(PHP5-ITK) cluster:

    64.49.219.194 www.domain.com
    64.49.219.194 domain.com

This article provides instructions for locating and editing the hosts file
on the following operating systems:

-   Microsoft&reg; Windows&reg; 10, Windows 8, Windows 7, and
    Windows Vista&trade;
-   Microsoft Windows NT&trade;, Windows 2000, and Windows XP
-   Linux&reg;
-   MacOS&reg; X versions 10.0 through 10.1.5
-   MacOS X versions 10.6 through 10.12

After you add the domain information and save the file, your system begins to
resolve to the IP address that you specified. When testing is complete, remove
these entries.

### Windows

If you are using a [Microsoft operating system](https://www.rackspace.com/microsoft) like Windows 10, Windows 8, 
Windows 7, and Windows Vista use User Account Control (UAC). As a result, 
you must run Microsoft Notepad as an administrator.

#### Windows 10 and Windows 8

Use the following instructions if you're running Windows 10 or Windows 8:

1.  Press the **Windows** key.
2.  Type **Notepad** in the search field.
3.  In the search results, right-click **Notepad** and select **Run as
    administrator**.
4.  From Notepad, open the following file:

     **c:\Windows\System32\Drivers\etc\hosts**
5.  Make the necessary changes to the file.
6.  Select **File > Save** to save your changes.

#### Windows 7 and Windows Vista

Use the following instructions if you're running Windows 7 or Windows Vista:

1.  Select **Start > All Programs > Accessories**.
2.  Right-click **Notepad** and select **Run as administrator**.

     The **Windows needs your permission** UAC window appears.
3.  Click **Continue** to grant permission.

     Notepad opens.
4.  In Notepad, select **File > Open**.
5.  In the **File name** field, enter the following path:

    **C:\Windows\System32\Drivers\etc\hosts**
6.  Select **Open**.
7.  Make the necessary changes to the file.
8.  Select **File > Save** to save your changes.

#### Windows NT, Windows 2000, and Windows XP

Use the following instructions if you're running Windows NT, Windows 2000, or
Windows XP:

1.  Select **Start > All Programs > Accessories > Notepad**.
2.  Select **File > Open**.
3.  In the **File name** field, enter
    **C:\Windows\System32\Drivers\etc\hosts**.
4.  Select **Open**.
5.  Make the necessary changes to the file.
6.  Select **File > Save** to save your changes.

### Linux

Use the following instructions if you're running Linux:

1.  Open a Terminal window.
2.  Enter the following command to open the hosts file in a text editor:

        sudo nano /etc/hosts

3.  Enter your domain user password.
4.  Make the necessary changes to the file.
5.  Press **Control-X**.
6.  When you are asked if you want to save your changes, enter **y**.

### MacOS X versions 10.0 through 10.12

This section provides instructions for modifying your hosts file if you are
running MacOS X 10.0 through 10.12.

#### MacOS X 10.0 through 10.1.5

Use the following instructions if you're running MacOS X 10.0 through 10.1.5:

1.  Open **/Applications/Utilities/NetInfo Manager**.
2.  To enable editing of the Network Information database (NetInfo), click the
    padlock icon in the lower-left corner of the window.
3.  Enter your domain user password and select **OK**.
4.  In the second column of the browser view, select the node named
    **machines**.

5.  In the third column, select the entry named `localhost`.
6.  From the **Edit** menu, select **Duplicate**.

     A confirmation alert appears.

7.  Click **Duplicate**.

     A new entry named `localhost copy` appears and its properties are
     displayed below the browser view.

8.  Double-click the value of the `ip_address` property and enter the IP
    address of the other computer.
9.  Double-click the value of the `name` property and enter the host name that
    you want use for the other computer.
10. Click the `serves` property and select **Delete** from the **Edit** menu.
11. From the **File** menu, select **Save**.

     A confirmation alert appears.

12.  Click **Update this copy**.
13.  Repeat steps 6 through 12 for each additional host entry that you want to
     add.
14.  From the **NetInfo Manager** menu, select **Quit**.

      You do not need to restart the computer.

#### MacOS X 10.6 through 10.12

Use the following instructions if you're running MacOS X 10.6 through 10.12:

1.  On your computer, select **Applications > Utilities > Terminal** to open a
    Terminal window.
2.  Enter the following command in the Terminal window to open the **hosts**
    file:

        sudo nano /private/etc/hosts

3.  When you are prompted, enter your domain user password.
4.  Edit the **hosts** file.

     The file contains comments (lines that begin with the `#` symbol) and some
     default host name mappings (for example, `127.0.0.1 – local host`). Add
     your new mappings after the default mappings.

5. To save the hosts file, press **Control+X**.
6. When you are asked if you want to save your changes, enter **y**.
7. To force your changes to take effect, flush the DNS cache by entering the
   following command:

        dscacheutil -flushcache
