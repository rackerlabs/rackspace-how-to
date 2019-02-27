---
permalink: next-steps-after-creating-a-lamp-server/
audit_date: '2019-01-18'
title: Next steps after creating a LAMP server
type: article
created_date: '2019-02-08'
created_by: Rackspace Community
last_modified_date: '2019-02-08'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---
You can use [Cloud
Orchestration](/how-to/quick-set-up-with-rackspace-cloud-orchestration/) to
set up a Linux&reg; Apache&reg; MySQL&reg; PHP&reg; (LAMP) server. The
resulting server has a baseline setup, but you can use it to host many 
PHP-based websites. The LAMP Cloud Orchestration template is built to host
multiple simple sites, but we strongly recommend that you use a 
multiple-server setup as you grow to a larger scale.

With other Cloud Orchestration templates, most of the configuration is already
complete, and you only need to import your content. This tutorial uses
Ubuntu&reg; 14.04 and focuses on securing the server, setting up multiple
virtual hosts to host multiple sites, and importing your content into the
appropriate directories.

**Note**: Basic knowledge of Linux operating systems is required to complete
this tutorial.

#### Log in to your server

When you create a server by using a Cloud Orchestration template, you receive
a set of credentials. For a LAMP server, you receive three credentials: a
Secure Shell (SSH) key, a phpMyAdmin password, and a MySQL root password. (You
should have already set your phpMyAdmin username during the setup process.)

You first need to log in to your server by using your SSH key. Using an SSH
key is much more secure than a using password.

On the command line, run the following command to create a text file that
will hold your SSH key:

    $ vim ~/.ssh/mykeyfile.txt

Paste the contents of the SSH key that you received into this file. When you
use the vim text editor, you first press the `i` key to select _Input Mode_,
then `cmd-v` to paste the key. After you paste the SSH key, press **escape**,
then type `:wq` to write your changes.

Next, change the file permissions to give read and write access to only the
owner, as shown in the following example:

    $ chmod 600 ~/.ssh/mykeyfile.txt

Now you can log in to the server by running the following command:

    $ ssh -i ~/.ssh/mykeyfile.txt -l root 123.45.6.789

The following output displays:

    The authenticity of host '123.45.6.789 (<no hostip for proxy command>)' can't be established.
    RSA key fingerprint is a1:b2:c3:d4:ab:cd:ef:gh:m5:1a:2b:c3:45.
    Are you sure you want to continue connecting (yes/no)? yes
    Warning: Permanently added '123.45.6.789' (RSA) to the list of known hosts.

    Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-37-generic x86_64)
    root@web:~#

### Basic cloud server security

Rackspace makes your default cloud server image as secure as possible, but the
first line of defense lies in your hands. At a minimum, we recommend that you
secure your server by performing the following steps:

1. Create an administrative user so that you do not have to perform actions
   as the root user.

   **Note**: Ensure that user is part of the Apache group, and has sudo
   privileges.

2. Disable root login. This prevents anyone who might end up with the root
   user's login credentials from using them to log in to the server.
3. Follow the directions for generating an SSH key pair for the new user that
   you create.
4. If you have additional users who might need access to the server (such as a
   developer who will be working for you on a contract basis), we recommend
   that you make user profiles for them at this time.
5. Open and close any necessary ports. Your new LAMP server already has ports
   80 and 443 open to accommodate HTTP traffic.
