---
node_id: 426
title: Generating RSA Keys With SSH - PuTTYgen
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article provides steps for generating RSA keys by using PuTTYgen on
Windows for secure SSH authentication with OpenSSH.

### Introduction

One effective way of securing SSH access to your Cloud Server is to use
a public/private key pair. This means that a *public* key is placed on
the server and a *private* key is placed on your local workstation.
Using a key pair makes it impossible for someone to log in by using just
a password, as long as you set up SSH to deny password-based
authentication.

### Generate Keys

In Windows, use PuTTYgen to generate our public and private keys.

1.  If needed, download PuTTYgen from the [PuTTY download page](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html).(PuTTYgen
    might have been installed previously with PuTTY or WinSCP.)
2.  Launch the program, and then click the **Generate** button.
    The program generates the keys for you.
3.  Enter a unique key passphrase in the **Key passphrase** and
    **Confirm passphrase** fields.
    For additional information on using passphrases, see [Logging in with a SSH Private Key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows).
4.  Save the public and private keys by clicking the **Save public key**
    and **Save private key** buttons.
5.  From the **Public key for pasting into OpenSSH authorized\_keys file
    field** at the top of the window, copy all the text (starting with ssh-rsa) to your clipboard by pressing **Ctrl-C**.
    You need the this key available on your clipboard to paste either
    into the public key tool in the Control Panel or directly into the
    authorized keys on your cloud server.

### Use the Key Pair

You can use the RSA key pair in the following ways:

#### Specify Your SSH Key When Creating a New Cloud Server

When you create a cloud server, you can add a new public key or assign
an existing public key.

Add a new public key when creating a cloud server

1.  Under Advanced Options in the Create Server page, select a public
    key from the SSH key drop-down menu.
2.  Click **Create Server**.

Add an existing public key when creating a cloud server

1.  Under Advanced Options in the Create Server page, click **Manage SSH
    Keys**.
2.  Select a public key for your new cloud server from the SSH Keys list
    and click **Add Public Key**.
3.  Enter the key name, select the region, and paste your entire public
    key into the **Public Key** field and click **Add Public Key**.
4.  Confirm that your key is listed in the **SSH Key** list for your
    new server.

#### Assign Your SSH Key to Your Existing Cloud Server

To make use of your newly generated RSA key pair, you must tell PuTTY to
use it when connecting to your Cloud Server.

To edit the file (and if necessary, create it), run the following command:

    nano ~/.ssh/authorized_keys

The key and its associated text (the ssh-rsa identified at the start and
the comment at the end) should all be on one line in the file.  If the
text is word-wrapped onto multiple lines an error might occur when
connecting.

1.  Edit the **~/.ssh/authorized_keys** file on your Cloud Server and
    paste the text onto its own line in the file.

    **Note**: You must have the key available on your clipboard to
    paste it.
2.  If you created the **authorized_keys** file, change its permissions
    after you're done editing it by running the following command:

        chmod 600 ~/.ssh/authorized_keys

3.  Open PuTTY and go to the **SSH > Auth** section.
4.  Browse to the location of the key file and load the private key.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/PuTTY_Configuration3.png" width="463" height="439" />

5.  To make PuTTY use the key every time that you connect to your Cloud
    Server, save the configuration by going to the Session page and
    saving the session.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/PuTTY_Configuration4.png" width="463" height="439" />

After you save your session, your key is loaded automatically when you
connect to your Cloud Server.

### Summary

Opting for a key-based authentication to your SSH server is beneficial
in many ways. By eliminating the possibility of SSH brute-force attacks
targeted towards your Cloud Server, the chances of it being compromised
are decreased by an order of magnitude.

### Related Articles

-   [Connecting to a server using SSH on Linux or Mac OS](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os)
