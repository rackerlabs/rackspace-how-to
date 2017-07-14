---
permalink: modify-your-hosts-file/
audit_date: '2106-06-08'
title: Modify your hosts file
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-08'
last_modified_by: Nate Archer
product: Cloud DNS
product_url: cloud-dns
---

Modifying your **hosts** file enables you to override the DNS for a domain, on that particular machine. This is useful when you want to test your site without the test link, prior to going live with SSL; verify that an alias site works, prior to DNS changes; and for other DNS-related reasons. Modifying your **hosts** file causes your local machine to look directly at the IP address specified.

To modify the hosts file, you add two entries to the file that contains the IP address that you want the site to resolve to and the address. Adding the following two lines, for example, point **www.domain.com** and **domain.com** to our current PHP5-ITK ("Refreshed" PHP5) cluster:

    64.49.219.194 www.domain.com
    64.49.219.194 domain.com

The sections in this article provide instructions for locating and editing the hosts file on the following operating systems:

-   Windows 10, Windows 8, Windows 7, and Windows Vista
-   Windows NT, Windows 2000, and Windows XP
-   Linux
-   Mac OS X 10.0 through 10.1.5
-   Mac OS X 10.6 through 10.12

After you add the domain information and save the file, your system begins resolving to the specified IP address. After testing is finished, remove these entries.

### Windows

Windows 10, Windows 8, Windows 7, and Windows Vista use User Account Control (UAC), so Notepad must be run as Administrator.

**For Windows 10 and 8**

1.  Press the Windows key.
2.  Type **Notepad** in the search field.
3.  In the search results, right-click **Notepad** and select **Run as administrator**.
4.  From Notepad, open the following file: **c:\Windows\System32\Drivers\etc\hosts**
5.  Make the necessary changes to the file.
6.  Click **File > Save** to save your changes.

**For Windows 7 and Vista**

1.  Click **Start > All Programs > Accessories**.
2.  Right-click **Notepad** and select **Run as administrator**.
3.  Click **Continue** on the Windows needs your permission UAC window.
4.  When **Notepad** opens, click **File > Open**.
5.  In the **File name** field, type **C:\Windows\System32\Drivers\etc\hosts**.
6.  Click **Open**.
7.  Make the necessary changes to the file.
8.  Click **File > Save** to save your changes.

**Windows NT, Windows 2000, and Windows XP**

1.  Click **Start > All Programs > Accessories > Notepad**.
2.  Click **File > Open**.
3.  In the **File name** field, type **C:\Windows\System32\Drivers\etc\hosts**.
4.  Click **Open**.
5.  Make the necessary changes to the file.
6.  Click **File > Save** to save your changes.

### Linux

1.  Open a terminal window.
2.  Open the hosts file in a text editor (you can use any text editor) by typing the following line:

        sudo nano /etc/hosts

3.  Enter your domain user password.
4.  Make the necessary changes to the file.
5.  Press **Control-x**.
6.  When asked if you want to save your changes, answer **y**.

### Mac OS X 10.0 through 10.12

**Mac OS X 10.0 through 10.1.5**

1.  Open **/Applications/Utilities/NetInfo Manager**.
2.  To allow editing of the NetInfo database, click the padlock in the lower-left corner of the window.
3.  Enter your domain user password and click **OK**.
4.  In the second column of the browser view, select the node named machines.

    The third column contains entries for `-DHCP-`, `broadcasthost`, and `localhost`.

5.  In the third column, select `localhost`.
6.  From the **Edit** menu, select **Duplicate**. (The quickest way to create a new entry is to duplicate an existing one.)

    A confirmation alert appears.

7.  Click **Duplicate**.

    A new entry called localhost copy appears, and its properties are shown below the browser view.

8.  Double-click the value of the `ip_address` property and enter the IP address of the other computer.
9.  Double-click the value of the `name` property and enter the hostname you want for the other computer.
10.  Click the `serves` property and select **Delete** from the **Edit** menu.
11.  From the **File** menu, select **Save**.

     A confirmation alert appears.

12.  Click **Update this copy**.
13.  Repeat steps 6 through 12 for each additional host entry that you want to add.
14.  From the NetInfo Manager menu, select **Quit**.

     You do not need to restart the computer.

**Mac OS X 10.6 through 10.12**

1.  Open **Applications > Utilities > Terminal**.
2.  Open the **hosts** file by typing the following line in the terminal window:

        sudo nano /private/etc/hosts

3.  Type your domain user password when prompted.
4.  Edit the **hosts** file.

    The file contains some comments (lines starting with the # symbol), and some default hostname mappings (for example, 127.0.0.1 – local host). Add your new mappings after the default mappings.

5.  Save the hosts file by pressing **Control+x** and answering **y**.
6.  Make your changes take effect by flushing the DNS cache with the following command:

        dscacheutil -flushcache

  The new mappings should now take effect.
