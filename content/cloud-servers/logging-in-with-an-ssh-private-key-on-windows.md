---
permalink: logging-in-with-an-ssh-private-key-on-windows/
audit_date: '2018-09-27'
title: Log in with an SSH private key on Windows
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2018-09-27'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates how to load a Secure Shell (SSH) private key into
PuTTY. You need the following software to complete this task:

1. **PuTTY**: A client to for managing SSH sessions
2. **PuTTYgen**: A tool for managing and creating SSH key pairs

To download both tools, see [Download PuTTY: latest
release](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).

**Note**: These instructions apply to the Microsoft&reg; Windows&reg;
operating system. For information about using SSH private keys on Linux&reg;
and OS X&reg; operating systems, see [Logging in with a SSH Private Key on
Linux and OS X](/how-to/logging-in-with-an-ssh-private-key-on-linuxmac).

### Step 1: Save your SSH private key to a text file

As part of your deployment, Rackspace might have given you an SSH private key
to use to authenticate against your newly-deployed Windows servers. You
must save this private key to a text file, which is also referred to as a _key
file_.

Open a text editor, paste your SSH private key into the editor, and save the
file.

Your SSH private key should look similar to the key in the following image:

<img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows1.png %}" width="626" height="478" />

You must include all of the text that appears in this image in your key
file.

### Step 2: Load your SSH private key into PuTTY Key Generator

Use the following steps to save your SSH private key:

1. Launch PuTTY Key Generator.

2. To load the existing private key file that you created in the previous
   section, click **Load** in the **Actions** section. Change the file type to
   search for to **All Files**.

3. Select the key that you saved to a text file in the previous section and
   click **Open**.

   A confirmation displays after PuTTYgen successfully imports the SSH private
   key. Click **OK** to dismiss the message.

4. Enter a unique passphrase in the **Key passphrase** field, then enter it
   again in the **Confirm passphrase** field to confirm it. You are prompted
   to enter this passphrase whenever you log in to a server by using your
   SSH private key.

5. To finish, click **Save private key**, then enter a file name in the Save
   private key as dialog box and click **Save**.

    **Note**: We strongly recommend that you keep the default settings.

#### Step 3: Log in to PuTTY by using your SSH private key

1. Set up your session in PuTTy.

   Create a name for the session and click **Save**.

    **Note**: You can use any name that you want. The following example names
    the session based on the Internet Protocol (IP) address of the server to
    which the user is connecting.

   <img src="{% asset_path cloud-servers/logging-in-with-an-ssh-private-key-on-windows/Windows9.png %}" width="635" height="604" />

2. Click **Connection > Data** in the left-hand navigation pane and set the
   **Auto-login username** to **root**.

3. To configure the SSH private key to use, click **Connection > SSH > Auth**  
   in the left-hand navigation pane, then click **Browse** under **Private key
   file for authentication**.

4. Navigate to the location where you saved your SSH private key file, select
   the file, and click **Open**.

    The file path for your private key file now displays in the **Private key
    file for authentication** field.

5. Click **Session** in the left-hand navigation pane, then click **Save** in
   the **Load, save or delete a stored session** section.

6. Click **Open** to begin your session with the server.

   If you saved your key with a passphrase, you are prompted to enter the
   passphrase. An alert indicating that the server's host is not cached
   displays. Click **Yes** to continue the connection.

You are now logged in to your Windows server.
