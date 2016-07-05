---
permalink: logging-in-with-an-ssh-private-key-on-windows/
audit_date:
title: Log in with an SSH Private Key on Windows
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2016-07-05'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

In this example, we're going to demonstrate how to load a private key
into PuTTY. You'll need two pieces of software to complete this task:

1.  PuTTY - Client to for managing SSH sessions
2.  PuTTYgen - Tool for managing and creating SSH key pairs

Both tools can be downloaded here:

[http://www.chiark.greenend.org.uk/\~sgtatham/putty/download.html.](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html)

**Note**: These instructions apply to the Windows operating system.
For information about using SSH private keys on Linux and OS X operating
systems, see [Logging in with a SSH Private Key on Linux and OS X](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac).

### Load a private key in PuTTY Key Generator

As a part of a Rackspace Deployment, you may be provided a SSH Private
Key to be used for authentication against your newly deployed Linux
servers. The first thing to do is save this private key into a file.
Your SSH key should look similar to the following key:

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows1.png %}" width="626" height="478" />

You will need everything you see in the example above to be included in
your key file.

1. Launch PuTTY Key Generator.

2. In the Actions section, click **Load** to load an existing private key file, and change the file type to search for to **All Files**.

3. Select the key that you saved to a text file earlier and click **Open**.

   A confirmation is displayed after PuTTYgen successfully imports the private key. Click **OK** to dismiss the message.

4. Enter a unique key passphrase in the **Key passphrase** and **Confirm
passphrase** fields. You will be prompted for that passphrase whenever
you log in to a server with this key.

We strongly suggest keeping the default settings as they are, so when
you're prompted to "Enter a file in which to save the key", just press
**Enter** to continue.

#### Log in to PuTTY with the private key

1. Set up your session in PuTTy.

   You can name the session anything you like. In this example, we are naming the session based on the IP of the
server we are connecting to, and click **Save**.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows9.png %}" width="635" height="604" />

2. Click **Connection > Data** in the left-hand navigation pane and set the Auto-login username to root.

3. Click **Connection > SSH > Auth**  in the left-hand navigation pane and configure the private key to use by clicking **Browse** under Private key file for authentication.

4. Navigate to the location where you saved your private key earlier, select the file, and click **Open**.

  The private key path is now displayed in the **Private key file for authentication** field.

5. Click **Session** in the left-hand navigation pane and click **Save** in the Load, save or delete a stored session section.

6. Click **Open** to begin your session with the server.

   If you saved your key with a passphrase, you will be prompted to enter that passphrase. An alert displays that the server's host is not cached. Click **Yes** to continue the connection.

You are now logged in to your server.
