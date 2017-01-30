---
permalink: connecting-to-a-server-using-ssh-on-linux-or-mac-os/
audit_date:
title: Connect to a server by using SSH on Linux or Mac OS X
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-09-19'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article provides steps for connecting to a cloud server from
a computer running Linux or Mac OS X by using SSH. It also discusses
generating an SSH key and adding a public key to the server.

### Introduction

Secure Shell (SSH) is a protocol through which you can access your cloud
server and run shell commands. You can use SSH keys to identify trusted
computers without the need for passwords, and to interact with your
servers.

SSH is encrypted with SSL, which makes it difficult for these
communications to be intercepted and read.

**Note:** Many of the commands in this article must be run on your local
computer. The default commands listed are for the Linux command line or
Mac OS X Terminal. To make SSH connections from Windows, you can use a
free program called [PuTTY](/how-to/connecting-to-linux-from-windows-by-using-putty).
To generate keys, you can use a related program, [PuTTYGen](/how-to/generating-rsa-keys-with-ssh-puttygen).

### Log in

Using the IP address and password for your cloud server, log in by
running the `ssh` command with `username@ipaddress` as the argument.

    ssh root@123.45.67.890

You are prompted to enter the password for the account to which you're
connecting.

### Remote host identification

If you rebuilt your cloud server, you might get the following message:

    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!

One of the security features of SSH is that when you log in to a cloud
server, the remote host has its own key that identifies it. When you try
to connect, your SSH client checks the server's key against any keys
that it has saved from previous connections to that IP address. When you
rebuild a cloud server, that remote host key changes, so your computer
warns you of possibly suspicious activity.

To ensure the security of your server, you can [use the web console in the Cloud Control Panel to verify your server's new key](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console).
If you're confident that you aren't being spoofed, you can skip that
step and delete the record of the old SSH host key as follows:

On your *local* computer, edit the SSH `known_hosts` file and remove any
lines that start with your cloud server's IP address.

    nano ~/.ssh/known_hosts

If you are not using Linux or Mac OS X on your local computer, the
location of the `known_hosts` file might differ. Refer to your OS for
information about the file location. PuTTY on Windows gives you the
option of replacing the saved host key.

### Generate a new SSH key pair

You can secure SSH access to your cloud server against brute force
password attacks by using a public-private key pair. A public key is placed on the server and a matching private key is placed on your local computer. If you [configure SSH on your server to accept only connections using keys](/how-to/basic-cloud-server-security),
then no one else can log in by using just a password. Connecting clients
are required to use a private key that has a public key registered on
the server.

1.  Run the following command using your email address as a label.
    Substitute your email address for `your_email@example.com` in
    the command.

        ssh-keygen -t rsa -C "your_email@example.com"

    A message indicates that your public-private RSA key pair is
    being generated.

    You are prompted to enter a file in which to save the key. Press
    **Enter** to use the default location.

2.  If you want the additional security of a password for the key pair,
    enter a passphrase. If you don't want to use a password with the key
    pair, press **Enter** to continue without setting one.

    Your key pair is generated, and the output looks as follows:

        Your identification has been saved in /LocalFileLocation/id_rsa.
        Your public key has been saved in /LocalFileLocation/id_rsa.pub.
        The key fingerprint is: 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your_email@example.com

3.  Optionally, add your new key to the local `ssh-agent` file to enable
    SSH to find your key without the need to specify its location every
    time that you connect:

        ssh-add ~/.ssh/id_rsa

    You can use an SSH configuration shortcut instead of the `ssh-agent` file
    by following the instructions in the "Shortcut configuration" section
    later in this article.

### Add the public key to your cloud account

To make it easy to add your key to the new cloud servers you create,
upload the public key to your cloud account by following these steps:

1.  Log in to the [Cloud Control Panel](http://MyCloud.Rackspace.com).
2.  From the **Servers** menu, select **SSH Keys**.
3.  Click **Add Public Key**.
4.  Enter a key name to remind you which computer this key is for; for
    example, **Work Laptop**.
5.  Select the region for which you want to store the public key. To
    store your key in multiple regions, repeat these steps for
    each region. The key must reside in the same region as the server.
6.  Paste the contents of the `id_rsa.pub` file that you created into
    the **Public Key** field. You can get the file contents by either
    opening the file in a text editor or by running the following
    command:

        cat ~/.ssh/id_rsa.pub

7.  Click **Add Public Key**.

### Create a new server by using a stored key

When you create a new cloud server, you can add a stored key to the new
server.

1. On the Create Server page, expand the **Advanced Options** section.

2. From the **SSH Key** menu, select your key from the list.

3. If you don't see a stored key in the list, you can perform one of the following actions:

   - Switch the region for the new server to the region where you have stored the SSH key.
   - Repeat the steps in the preceding section, "Add the public key to your cloud account," to add the key to the region in which you want to create the new server.

### Add the key to an existing server

You can't use the Cloud Control Panel to add a public key to an
existing server. Follow these steps to add the key manually:

1.  On your cloud server, create a directory named `.ssh` in the home
    folder of the account to which you will connect via SSH.

        mkdir -p ~/.ssh

2.  Create or edit the `authorized_keys` file and add your public key to
    the list of authorized keys.

        nano ~/.ssh/authorized_keys

    A key is all on one line, so ensure that the key isn't broken by
    line breaks. You can have multiple keys in the `authorized_keys`
    file, with one key per line.

3.  Set the correct permissions on the key.

        chmod 700 ~/.ssh
        chmod 600 ~/.ssh/authorized_keys

After you have added the public key to the `authorized_keys`, you can make an SSH
connection by using your key pair instead of the account password.

### Shortcut configuration

You can set up a connection shortcut by creating a `~/.ssh/config` file
on your local computer and adding your server and key details to it.

1.  Using a text editor, add the following text to the `~/.ssh/config` file, changing the
    values to match your server information:

        Host shortcutName
        HostName serverAddressOrIPAddress
        User remoteUsername
        IdentityFile /path/to/appropriate/ssh/rsa/private/key

    Each entry describes a feature of the server:

    -   **Host:** A shortcut name that you will use to tell SSH to use this
        connection
    -   **HostName:** The address of the server to which you will connect
    -   **User:** The name of the user account to connect to on the
        server
    -   **IdentityFile:** The location of the private key file (id\_rsa)

2.  After you set up the `config` file, connect to the server by using
    your shortcut name with SSH, as follows:

        ssh shortcutName

### Troubleshooting

If you have trouble making a new connection after you restart the
server, use the following steps to help you resolve the issue:

-   If you get a `connection timeout` error, check the IP address that
    you used to ensure that it's correct. You might also check the
    server's iptables to ensure that it isn't blocking the port used by SSH.
-   If you get a `connection refused` error, you might be trying to use
    SSH with the wrong port. If you changed your server to listen to a
    port other than 22, use the `-p` option with SSH to specify
    the port.
-   If your login is rejected, then you might have an issue
    with your key. Change the sshd configuration to allow password
    connections by setting `PasswordAuthentication` to `yes`. Restart
    the server and try again. If you connect after these changes, then
    the issue is with the key and you must verify that the key is in the
    right place on the server.
-   If all else fails, review your changes and restart the SSH daemon on
    the server by running the following command:

        sudo service ssh restart

    If you get a message that the SSH service is unknown, run the
    command with `sshd` as the service name instead.
