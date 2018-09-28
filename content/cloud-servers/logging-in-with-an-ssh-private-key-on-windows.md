---
permalink: logging-in-with-an-ssh-private-key-on-windows/
audit_date:
title: Log in with an SSH private key on Windows
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2018-09-28'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates how to load an SSH private key into PuTTY. You need
the following software to complete this task:

1.  **PuTTY**: A client for managing SSH sessions
2.  **PuTTYgen**: A tool for managing and creating SSH key pairs

To download both tools, see [Download PuTTY: latest
release](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

**Note**: These instructions apply to the Windows&reg; operating system.
For information about using SSH private keys on Linux&reg; and OS X&reg;
operating systems, see [Log in with an SSH Private Key on Linux and
Mac](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac).

### Save your private SSH key to a text file

As a part of your deployment, Rackspace might have provided you with an SSH
private key for you to use to authenticate against your newly deployed Windows
servers. You must save this private key to a text file. This type of file is
called a _key file_.

Open a text editor, paste your SSH private key, and save the file.

Your SSH private key should look similar to the key in the following image:

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows1.png %}" width="626" height="478" />

You need to include all of the text that appears in the image in your key file.

### Load your SSH private key in PuTTY Key Generator

Use the following steps to load your SSH private key in PuTTY Key Generator:

1. Launch PuTTY Key Generator.

2. In the **Actions** section, click **Load** to load an existing private key
   file. Change the file type to search for to **All Files**.

3. Select the key that you saved to a text file earlier and click **Open**.

    A confirmation displays after PuTTYgen successfully imports the private
    key. Click **OK** to dismiss the message.

4. Enter a unique key passphrase in the **Key passphrase** field, then enter
   the same passphrase again in the **Confirm passphrase** field. You are
   prompted for this passphrase whenever you log in to a server by using your
   SSH private key.

5. Click **Save private key**, then enter a file name in the **Save
   private key as** dialog box to save it for use with PuTTY.

    **Note**: We strongly recommend that you keep the default settings.

#### Log in to PuTTY by using your SSH private key

Use the following steps to log in to PuTTY by using your SSH private key:

1. Enter a name for the session and click **Save**.

    **Note**: You can use any name that you want. This example names the
    session based on the Internet Protocol (IP) address of the server to which
    the user is connecting.

   <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows9.png %}" width="635" height="604" />

2. Click **Connection > Data** in the left navigation pane and set the
   **Auto-login username** to root.

3. Click **Connection > SSH > Auth**  in the left navigation pane and
   configure the SSH private key to use by clicking **Browse** under **Private
   key file for authentication**.

4. Navigate to the location where you saved your SSH private key file, select
   the file, and click **Open**.

    The file path for the SSH private key file now displays in the **Private
    key file for authentication** field.

5. Click **Session** in the left navigation pane, then click **Save** in the
   **Load, save or delete a stored session** section.

6. Click **Open** to begin your session with the server.

    If you saved your SSH private key with a passphrase, you're prompted to
    enter that passphrase. An alert displays indicating that the server's host
    is not cached. Click **Yes** to continue the connection.
