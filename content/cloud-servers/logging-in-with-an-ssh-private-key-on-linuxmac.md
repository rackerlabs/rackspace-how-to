---
node_id: 3706
title: Logging in with an SSH Private Key on Linux/Mac
type: article
created_date: '2013-09-25'
created_by: Brint Ohearn
last_modified_date: '2016-01-05'
last_modified_by: Mike Asthalter
product: Cloud Servers
product_url: cloud-servers
---

This example demonstrates how to use a private key to log in to a Linux
server with a private key by using a Terminal session on OS X. However,
you can follow the same process to use a private key when using any
terminal software on Linux.

You need two software applications to complete this process:

1.  ssh - SSH client software is installed on your Linux or OS X
    operating system by default
2.  Your favorite text editor

In this example, we use the vim text editor.

**Note:** These instructions apply to the Linux and OS X operating
systems. For information about using SSH private keys on Windows
operating systems, see [Logging in with an SSH Private Key on Windows](/how-to/logging-in-with-an-ssh-private-key-on-windows).

### Logging in with a private key

1. Using your favorite text editor, create a file to store your private
key. In this example, we use the **file deployment_key.txt**.

2. To edit the file in vim, type the following command

          vim deployment_key.txt

  After the editor starts, press 'i' to turn on insert mode. Then, paste
the private key into the file.

  **Note**: You need to include the **BEGIN** and **END** lines to use the
private key.

  <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Linux2.png" width="764" height="660" />

3. To save your changes, press Escape. Then, type "":wq"to write the file
and return to the command line.

4. After saving the file, run the following command to change the file
permissions to 600 to secure the key. You can also set them to 400.
**This step is required**:

          chmod 600 deployment_key.txt

5. After saving the key, use it to login to the SSH client as shown in this
example that loads the key in file **deployment\_key.txt**, and logs in
as user **demo**,to IP **192.237.248.66**:

          ssh -i deployment_key.txt demo@192.237.248.66

6. When the prompt displays to confirm the connection request, type
**yes**. Then, hit enter. If your SSH key requires a password, you will
be prompted to enter it to complete the connection.
