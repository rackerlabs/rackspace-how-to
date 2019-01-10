---
permalink: connecting-to-linux-from-windows-by-using-putty/
audit_date: '2016-06-27'
title: Connect to Linux from Windows by using PuTTY
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2019-01-10'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

After you have [created a new Cloud Server](/how-to/create-a-cloud-server)
with the Cloud Control Panel, you need to make a secure remote
connection from your local computer to your Cloud Server. This article
describes how to use a client called PuTTY to form a Secure Shell (SSH)
connection from a computer running a Microsoft&reg; Windows&reg; operating
system (OS) to a Linux&reg; server.

**Note**: This procedure requires you to install PuTTY or another SSH client,
which you do at your own risk. PuTTY is not affiliated with
Rackspace in any way, but the software is simple to use, freely
available, and reputable.

If you are a MacOS&reg; X user, you can
[connect to a Linux server by using Terminal](/how-to/connecting-to-linux-from-mac-os-x-by-using-terminal),
a console program included with the operating system.

For an OnMetal server, see
[Create OnMetal Cloud Servers](/how-to/create-onmetal-cloud-servers)
for applicable OnMetal steps.

#### Windows version

The procedure and examples in this article use Windows XP, Service Pack 2.
Different versions of Windows might have slightly different interfaces.

### Download PuTTY

Use the following steps to download and open PuTTY:

1. Download PuTTY from the
   [PuTTY website](http://www.chiark.greenend.org.uk/~sgtatham/putty/ "http://www.chiark.greenend.org.uk/~sgtatham/putty/").

   Ensure that you comply with the license requirements.

2. Launch the client.

### Configure your connection

Use the following steps to configure your connection:

1. In the PuTTY Configuration window, enter the following values:

   - In the **Host Name** field, enter the Internet Protocol (IP) address of
     your Cloud Server.
   - Ensure that the connection type is set to **SSH**.
   - (*Optional*) In the **Saved Sessions** field, assign a name for
     this connection. Assigning a name saves time the next time that you use
     Putty. You can assign a different name for each of your Cloud Servers.

2. Click **Open**.

### Accept the key

If this is the first time that you have used PuTTY to log in to your
server with SSH, a warning similar to the following one displays:

    The server’s host key is not cached in the registry. You have no guarantee
    that the server is the computer you think it is. The server’s rsa2 key
    fingerprint is: <string>. If you trust this host, hit **Yes** to add the key to
    PuTTY’s cache and carry on connecting. If you want to carry on connecting just
    once, without adding the key to the cache, hit No. If you do not trust this
    host, hit Cancel to abandon the connection.

If you are sure that you have entered the correct information, click **Yes**.

Subsequent connections do not show this warning because the host key
is now cached in the registry of your local computer. You can expect to
see that warning, however, if you connect to your server from a
different computer.

### Enter your username and password

After you accept the warning, the terminal prompts you for your username
and password.

If this is the first time that you are logging in to the server, you
must log in as the root user.

When you are prompted for the password for the root user, enter the
current root password for this server. The password at is not echoed to the
screen. Then, press **Enter**.

If you have entered the correct root password, the prompt responds with
a shell prompt:

    [root@yourservername ~]#

Now you can work on your server with all permissions.

### Change your root passwords

We recommend that you change the root password to something personal.
You can easily do this by using the `passwd` command and the following steps:

1.  From the shell prompt, enter the `passwd` command.
2.  Enter the new password that you want to set for your server. The
    password does not echo to the screen.
3.  Reenter the new password and press **Enter**.

When you connect to your server, use this password with the root user.
