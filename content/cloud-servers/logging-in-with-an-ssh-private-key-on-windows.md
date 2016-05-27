---
permalink: logging-in-with-an-ssh-private-key-on-windows/
audit_date:
title: Log in with an SSH Private Key on Windows
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2016-01-05'
last_modified_by: Mike Asthalter
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

### PuTTYgen: Loading the Key

As a part of a Rackspace Deployment, you may be provided a SSH Private
Key to be used for authentication against your newly deployed Linux
servers. The first thing to do is save this private key into a file.
Here's an example key:

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows1.png %}" width="626" height="478" />

You will need everything you see in the example above to be included in
your key file.

1. Launch PuTTYgen.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows2.png %}" width="624" height="595" />

2. Click **load** and change the file type to search for to **All Files**.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows3.png %}" width="626" height="477" />

3. Select the key you saved to a text file earlier and click **Open**.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows4.png %}" width="626" height="477" />

4. Now PuTTYgen will confirm that your key has been loaded.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows5.png %}" width="628" height="599" />

5. Enter a unique key passphrase in the **Key passphrase** and **Confirm
passphrase** fields. You will be prompted for that passphrase whenever
you login to a server with this key.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows6.png %}" width="627" height="597" />

We strongly suggest keeping the default settings as they are, so when
you're prompted to "Enter a file in which to save the key", just press
**Enter** to continue.

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows8.png %}" width="624" height="478" />

#### PuTTY: Logging in with the Private Key

1. Setup your session in PuTTy. You can name the session anything you would
like. In this case, we are naming the session based on the IP of the
server we are connecting to, and click **Save**.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows9.png %}" width="635" height="604" />

2. Now click on **Connection &gt;Data** and set the Auto-login username to
root.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/win9.png %}" width="632" height="605" />

3. Click on **Auth** and configure the Private Key to use by clicking
Browse under Private key file for authentication.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows10.png %}" width="631" height="595" />

4. Navigate to the location where you saved your private key earlier,
select the file, and click **Open**.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows11.png %}" width="629" height="481" />

  Now you'll see the private key path listed:

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows12.png %}" width="631" height="603" />

5. Navigate back to **Session** and save this session information one more
time.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows13.png %}" width="629" height="596" />

6. Now click **Open** to begin your session with the server. If you saved
you key with a passphrase, you will be prompted to enter that
passphrase. You will be given an alert that the server's host is not
cached. Click **Yes** at this point to continue the connection.

  <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows14.png %}" width="629" height="388" />

Now you will be in logged into your server:

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows15.png %}" width="632" height="389" />
