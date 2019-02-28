---
permalink: modify-your-hosts-file/
audit_date: '2018-08-24'
title: Modify your hosts file
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-12-20'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

Modifying your hosts file enables you to override the domain name system
(DNS) for a domain on a specific machine. [DNS management](https://www.rackspace.com/cloud/dns)
is useful when you want to test your site without the test link prior to going live with SSL,
verify that an alias site works prior to DNS changes, and for other DNS-related reasons.

Modifying your hosts file causes your local machine to look directly at
the Internet Protocol (IP) address that you specify. Rackspace offers
[managed hosting solutions](https://www.rackspace.com/managed-hosting) to assist with
the handling of these resources.

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

If you are using a [Microsoft operating system](https://www.rackspace.com/microsoft)
like Windows 10, Windows 8, Windows 7, and Windows Vista you must run Microsoft Notepad
as an administrator.

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



<script type="application/ld+json">
{
  "@context": "http://schema.org",
  "@type": "HowTo",
  "text": "Modify your hosts file",
  "description": "This article provides instructions for locating and editing the hosts file on Microsoft Windows, Linux, and MacOS",
  "step": [{
	"@type": "HowToSection",
	"text": "Windows 10 and 8",
	"name": "Use the following instructions if you’re running Windows 10 or Windows 8:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "Press the Windows key."
		},{
		"@type": "HowToStep",
		"text": "Type Notepad in the search field."
		},{
		"@type": "HowToStep",
		"text": "In the search results, right-click Notepad and select Run as administrator."
		},{
		"@type": "HowToStep",
		"text": "From Notepad, open the following file: c:\\Windows\\System32\\Drivers\\etc\\hosts"
		},{
		"@type": "HowToStep",
		"text": "Make the necessary changes to the file."
		},{
		"@type": "HowToStep",
		"text": "Select File > Save to save your changes."
	}]},{
	"@type": "HowToSection",
	"text": "Windows 7 and Vista",
	"name": "Use the following instructions if you’re running Windows 7 or Windows Vista:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "Select Start > All Programs > Accessories."
		},{
		"@type": "HowToStep",
		"text": "Right-click Notepad and select Run as administrator.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "The Windows needs your permission UAC window appears."
		}]},{
		"@type": "HowToStep",
		"text": "Click Continue to grant permission.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "Notepad opens."
		}]},{
		"@type": "HowToStep",
		"text": "In Notepad, select File > Open."
		},{
		"@type": "HowToStep",
		"text": "In the File name field, enter the following path: c:\\Windows\\System32\\Drivers\\etc\\hosts"
		},{
		"@type": "HowToStep",
		"text": "Select Open."
		},{
		"@type": "HowToStep",
		"text": "Make the necessary changes to the file."
		},{
		"@type": "HowToStep",
		"text": "Select File > Save to save your changes."
		}]},{
	"@type": "HowToSection",
	"text": "Windows NT, Windows 2000, and Windows XP",
	"name": "Use the following instructions if you’re running Windows NT, Windows 2000, or Windows XP:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "Select Start > All Programs > Accessories > Notepad."
		},{
		"@type": "HowToStep",
		"text": "Select File > Open."
		},{
		"@type": "HowToStep",
		"text": "In the File name field, enter c:\\Windows\\System32\\Drivers\\etc\\hosts."
		},{
		"@type": "HowToStep",
		"text": "Select Open."
		},{
		"@type": "HowToStep",
		"text": "Make the necessary changes to the file."
		},{
		"@type": "HowToStep",
		"text": "Select File > Save to save your changes."
	}]},{
	"@type": "HowToSection",
	"text": "Linux",
	"name": "Use the following instructions if you’re running Linux:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "Open a Terminal window."
		},{
		"@type": "HowToStep",
		"text": "Enter the following command to open the hosts file in a text editor: sudo nano /etc/hosts"
		},{
		"@type": "HowToStep",
		"text": "Enter your domain user password."
		},{
		"@type": "HowToStep",
		"text": "Make the necessary changes to the file."
		},{
		"@type": "HowToStep",
		"text": "Press Control-X."
		},{
		"@type": "HowToStep",
		"text": "When you are asked if you want to save your changes, enter y."
	}]},{
	"@type": "HowToSection",
	"text": "MacOS X 10.0 through 10.1.5",
	"name": "Use the following instructions if you’re running MacOS X 10.0 through 10.1.5:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "Open /Applications/Utilities/NetInfo Manager."
		},{
		"@type": "HowToStep",
		"text": "To enable editing of the Network Information database (NetInfo), click the padlock icon in the lower-left corner of the window."
		},{
		"@type": "HowToStep",
		"text": "Enter your domain user password and select OK."
		},{
		"@type": "HowToStep",
		"text": "In the second column of the browser view, select the node named machines."
		},{
		"@type": "HowToStep",
		"text": "In the third column, select the entry named localhost."
		},{
		"@type": "HowToStep",
		"text": "From the Edit menu, select Duplicate.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "A confirmation alert appears."
		}]},{
		"@type": "HowToStep",
		"text": "Click Duplicate.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "A new entry named localhost copy appears and its properties are displayed below the browser view."
		}]},{
		"@type": "HowToStep",
		"text": "Double-click the value of the ip_address property and enter the IP address of the other computer."
		},{
		"@type": "HowToStep",
		"text": "Double-click the value of the name property and enter the host name that you want use for the other computer."
		},{
		"@type": "HowToStep",
		"text": "Click the serves property and select Delete from the Edit menu."
		},{
		"@type": "HowToStep",
		"text": "From the File menu, select Save.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "A confirmation alert appears."
		}]},{
		"@type": "HowToStep",
		"text": "Click Update this copy."
		},{
		"@type": "HowToStep",
		"text": "Repeat steps 6 through 12 for each additional host entry that you want to add."
		},{
		"@type": "HowToStep",
		"text": "From the NetInfo Manager menu, select Quit.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "You do not need to restart the computer"
		}]}]},{
	"@type": "HowToSection",
	"text": "MacOS X 10.6 through 10.12",
	"name": "Use the following instructions if you’re running MacOS X 10.6 through 10.12:",
	"itemListElement": [
		{
		"@type": "HowToStep",
		"text": "On your computer, select Applications > Utilities > Terminal to open a Terminal window."
		},{
		"@type": "HowToStep",
		"text": "Enter the following command in the Terminal window to open the hosts file: sudo nano /private/etc/hosts"
		},{
		"@type": "HowToStep",
		"text": "When you are prompted, enter your domain user password."
		},{
		"@type": "HowToStep",
		"text": "Edit the hosts file.",
		"itemListElement": [{
			"@type": "HowToDirection",
			"text": "The file contains comments (lines that begin with the # symbol) and some default host name mappings (for example, 127.0.0.1 – local host). Add your new mappings after the default mappings."
		}]},{
		"@type": "HowToStep",
		"text": "To save the hosts file, press Control+X."
		},{
		"@type": "HowToStep",
		"text": "When you are asked if you want to save your changes, enter y."
		},{
		"@type": "HowToStep",
		"text": "To force your changes to take effect, flush the DNS cache by entering the following command: dscacheutil -flushcache"
		}]}]}
