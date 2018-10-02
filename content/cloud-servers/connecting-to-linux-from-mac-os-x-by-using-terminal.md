---
permalink: connecting-to-linux-from-mac-os-x-by-using-terminal/
audit_date: '2018-10-02'
title: Connect to Linux from Mac OS X by using Terminal
type: article
created_date: '2011-10-06'
created_by: Rose Contreras
last_modified_date: '2018-10-02'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If you use Mac OS&reg; X, you don't need to install a third-party Secure Shell
(SSH) client like PuTTY to connect to your cloud server. Terminal
is a terminal emulation program included with Mac OS X that you can use
to run SSH.

**Note**: For the corresponding steps for an OnMetal server, see [Create OnMetal Cloud Servers](/how-to/create-onmetal-cloud-servers).

### Connect to the server

These instructions are for users who are connecting to a new cloud
server for the first time. If you're connecting as a non-root user,
replace *root* in the instructions with your username.

1.  Go to **Applications > Utilities**, and then open **Terminal**.

     A Terminal window displays the following prompt:

         user00241 in ~MKD1JTF1G3->$

2.  Establish an SSH connection to the server by using the following
    syntax:

        ssh root@IPaddress

     The following code block uses an example value:

         MKD1JTF1G3->$ ssh root@166.76.69.51

     The first time that you connect to your server, a message asks you if you
     want to continue connecting. This message appears because your
     server has an RSA key that's not stored in your system registry.
     As a result, the identity of the key can't be verified.

         The authenticity of host '198.61.208.131 (198.61.208.131)' can't be established.
         RSA key fingerprint is 47:ff:76:b4:211:0f:11:15:21:bd:92:2f:44:0a:d9:0a.
         Are you sure you want to continue connecting (yes/no)?

3.  Type **yes** and press **Enter**. This action adds the RSA key to
    the list of known hosts so that you don't see this warning again when you
    make future connections.
4.  Enter the root password for the server. The password does not echo
    to the screen.

        MKD1JTF1G3-$ ssh root@198.61.208.131
        root@198.61.208.131's password:

     If you entered the correct password, a shell prompt is returned:

         [root@yourservername ~]#

### Change the root password

After your first login, change the root password by using the following steps:

1.  At the shell prompt, enter the following command:

        passwd

2.  Change your password by entering a new one at the following prompts:

        Enter new UNIX password:
        Retype new UNIX password:

     If the passwords that you enter match, you receive the following
     confirmation that the authentication tokens have updated successfully:

        Passwd: password updated successfully

     The password does not echo to the screen.

Use the new password with the root user when you connect to your server.

### Next steps

The next article shows you how to use [Rescue Mode](/how-to/rescue-mode)
to connect to your cloud server. Rescue Mode is useful when you're
troubleshooting and when your server becomes unresponsive.
