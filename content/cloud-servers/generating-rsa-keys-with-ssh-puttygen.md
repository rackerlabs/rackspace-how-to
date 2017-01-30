---
permalink: generating-rsa-keys-with-ssh-puttygen/
audit_date: '2016-06-20'
title: Generate RSA keys with SSH by using PuTTYgen
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

One effective way of securing SSH access to your cloud server is to use
a public-private key pair. This means that a *public* key is placed on
the server and a *private* key is placed on your local workstation.
Using a key pair makes it impossible for someone to log in by using just
a password, as long as you set up SSH to deny password-based
authentication.

This article provides steps for generating RSA keys by using PuTTYgen on
Windows for secure SSH authentication with OpenSSH.

### Generate keys

In Windows, use PuTTYgen to generate your public and private keys.

1.  If needed, download PuTTYgen from the [PuTTY download page](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).
    (PuTTYgen might have been installed previously with PuTTY or WinSCP.)
2.  Launch the program, and then click the **Generate** button.
    The program generates the keys for you.
3.  Enter a unique key passphrase in the **Key passphrase** and
    **Confirm passphrase** fields.
    For additional information about using passphrases,
    see [Log in with a SSH Private Key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows).
4.  Save the public and private keys by clicking the **Save public key**
    and **Save private key** buttons.
5.  From the **Public key for pasting into OpenSSH authorized\_keys** file
    field at the top of the window, copy all the text (starting with **ssh-rsa**)
    to your clipboard by pressing **Ctrl-C**.
    You need this key available on your clipboard to paste either
    into the public key tool in the Control Panel or directly into the
    authorized keys on your cloud server.

### Use the key pair

You can use the RSA key pair in the following ways.

#### Specify your SSH key when creating a new cloud server

When you create a cloud server, you can assign a public key from the list of keys.
If your key is not already in the list, you may add it, and then assign it.

**Add a new public key to the list**

1.  Under Advanced Options on the Create Server page, click **Manage SSH
    Keys**.
2.  Select **public key** for the cloud server from the SSH Keys list
    and click **Add Public Key**.
3.  Enter the key name, select the region, and paste the entire public
    key into the **Public Key** field. Then click **Add Public Key**.
4.  Go back to the Create Server page, and confirm that your key is listed
    in the **SSH Key** list.

**Assign a public key**

1.  Under Advanced Options on the Create Server page, select the public
    key you want to use from the **SSH** key drop-down menu.
2.  When you are done specifying the all the other details for the server,
    click **Create Server**.

#### Assign your SSH Key to an existing cloud server

To make use of your newly generated RSA key pair, you must tell PuTTY to
use it when connecting to your cloud server.

1. To edit the file (or create it), run the following command on the cloud server:

       nano ~/.ssh/authorized_keys

2. Paste the text onto its own line in the file.

   You must have the key available in your clipboard to paste it. The key and its
   associated text (the ssh-rsa identified at the start and the comment at the end)
   must be on one line in the file.  If the text is word-wrapped onto multiple lines
   an error might occur when connecting.

3.  If you created the **authorized_keys** file, change its permissions
    after you're done editing it by running the following command:

        chmod 600 ~/.ssh/authorized_keys

4.  Open PuTTY, and go to the **SSH > Auth** section.

5.  Browse to the location of the key file, and load the private key.

    <img src="{% asset_path cloud-servers/generating-rsa-keys-with-ssh-puttygen/PuTTY_Configuration3.png %}" width="463" height="439" />

6.  Go to the Session page, and save the session. This saves the configuration
    so that PuTTY uses the key every time that you connect to your cloud
    server.

    <img src="{% asset_path cloud-servers/generating-rsa-keys-with-ssh-puttygen/PuTTY_Configuration4.png %}" width="463" height="439" />

After you save your session, your key is loaded automatically when you
connect to your server.

### Related article

-   [Connecting to a server using SSH on Linux or Mac OS](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os)
