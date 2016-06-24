---
permalink: how-to-add-linux-user-with-document-root-permissions/
audit_date:
title: Add a Linux User With Document Root Permissions
type: article
created_date: '2011-11-23'
created_by: Rackspace Support
last_modified_date: '2016-06-24'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article will walk you through setting up a Linux user with read and write permissions
for your web document root, usually the **/var/www/** directory. Connecting with this user
via SFTP will let you upload your website content directly to the **/var/www/your/site/folder**.

For the purposes of this example we'll use an account named "demo". Be sure to replace "demo"
in the examples with your preferred name.

These commands require superuser privileges so they assume you are running them from an
account with sudo privileges.

### Getting the group and directory

We'll need to know the group the web server process is running under as well as the location
of your web server's document root. This information can usually be found in the web server's
config file (like **httpd.conf** or **apache2.conf** for apache).

We've listed the default values for the apache web server running on some Linux distributions below.

**CentOS, Fedora, and RHEL**

On Red Hat-based systems apache runs under the group "apache" with a document root of "/var/www/html".

**Ubuntu and Debian**

On Debian-based systems apache runs under the group "www-data" with a document root of "/var/www".

### Create or modify a user

Now we can either create a new user or modify an existing user for our purposes.

#### Create a new user

If we're creating a new user, we'll want it to be in the same group as the web server with
its home directory set to your document root.

Remember to change the values to match your web server's settings and the username you're using.

On CentOS, Fedora, or RHEL, the command to create the user would look like this:

    sudo useradd -d /var/www/html -G apache demo

On Ubuntu or Debian systems you would use different values:

    sudo useradd -d /var/www -G www-data demo

Once the user is created you'll need to set its password as well.

    sudo passwd demo

You can now skip to the section on changing the document root to be group-writable.

#### Modify an existing user

If you want to modify an existing user you'll need to add it to the group used by your web server.

On CentOS, Fedora, or RHEL, the command would look like this:

    sudo usermod -a -G apache demo

And on Ubuntu or Debian it might look like:

    sudo usermod -a -G www-data demo

If you want to change the account to use the document root as its home directory you can do that too.

On CentOS, Fedora, or RHEL you would run:

    sudo usermod -d /var/www/html demo

And on Ubuntu or Debian:

    sudo usermod -d /var/www demo

### Change the document root permissions

Now we'll change the document root so it and its contents are in the same group as the web server.

#### Set the group

On CentOS, Fedora, or RHEL run:

    sudo chgrp -R apache /var/www/html

And on Ubuntu or Debian:

    sudo chgrp -R www-data /var/www

#### Set the permissions

Next we make the document root group-writable, but we'll also want to set the "setgid"
permission on the document root directory itself. The setgid permission will ensure that new
files created in the document root will inherit the group ID from their parent directory.

On CentOS, Fedora, or RHEL you can set the right permissions with the commands:

    sudo chmod -R g+w /var/www/html
    sudo chmod g+s /var/www/html

The Ubuntu and Debian versions of the commands would be:

    sudo chmod -R g+w /var/www
    sudo chmod g+s /var/www

### Connect and test

Now you can connect to your server via sftp with the user account you created or modified.
Try uploading a file to make sure the permissions were set correctly. If you get a permission
denied error run an "ls -la" in the document root to check the directory permissions.
