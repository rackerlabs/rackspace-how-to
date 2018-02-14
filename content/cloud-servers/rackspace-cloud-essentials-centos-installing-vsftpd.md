---
permalink: rackspace-cloud-essentials-centos-installing-vsftpd/
audit_date: '2017-11-16'
title: Rackspace Cloud Essentials - Install vsftpd for CentOS
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2017-11-16'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Create a Cloud Server](/how-to/create-a-cloud-server)

By following the previous articles in this series, you should now have an
active cloud server that is secured and has scheduled backups configured.
Next, you'll want to upload your web content to the server. When you think of
transferring files, you probably think of the File Transfer Protocol (FTP)
because it has been around for so long. Although simple to use, FTP has become
obsolete because it lacks the ability for secure file transfers.

Instead, we recommend installing and using a secure file transfer
mechanism. This article describes how to install vsftpd (very secure FTP
daemon) and the FTP client, and also walks you through some useful
administration and security steps.


### Install and run vsftpd

Use the group installation that is available in the YUM package manager.

1. Run the following command to install everything you need:

       sudo yum install vsftpd

2. To start vsftpd, run the following command:

       sudo service vsftpd start

### Configure vsftpd

Now that you have a working installation of vsftpd on the
server, you can make a few of configuration changes for security
and convenience. These change might include:

- starting vsftp on reboot
- configuring the firewall

#### Set the vsftp service to start on reboot

You can use the `chkconfig` tool to view which services start automatically
when the server starts, and on which run level they start. To get vsftpd
to start on the most common run levels (3,4,5), run the following command:

    sudo chkconfig vsftpd on

Verify the "on" status by checking the `chkconfig` output for vsftpd:

    chkconfig --list vsftpd

The standard vsftpd configuration file and all subsequent files for
CentOS reside in the **/etc/vsftpd/** directory. The most important file in
this directory is **vsftpd.conf**. You need to make two changes to this file
for security and convenience: disable anonymous users and restrict user access.
These are the changes described in the next two sections.

To get started, open the **/etc/vsftpd/vsftpd.conf** file in your favorite text
editor.

##### Disable anonymous users

We recommend disabling anonymous FTP, unless you have a specific requirement to
use it.

Change the value for `anonymous_eanble` to `No`, as follows:

    # Allow anonymous FTP? (Beware - allowed by default if you comment this out).
    anonymous_enable=NO

##### Restrict user access

Now configure vsftpd to be able to `chroot` (commonly referred to as
jailing) users to their home directories for security and privacy.

1. Change the value of `chroot_list_enable` to `No`, as follows:

        # You may specify an explicit list of local users to chroot() to their home
        # directory. If chroot_local_user is YES, then this list becomes a list of
        # users to NOT chroot().
        chroot_list_enable=NO
        # (default follows)
        chroot_list_file=/etc/vsftpd/chroot_list

2. Ensure that users are jailed in their home directory by adding the following
entry to the bottom of the file:

        chroot_local_user=YES

3. Save the **/etc/vsftpd/vsftpd.conf** file.

4. So that you do not get an error when restarting, create the `chroot_list`
file, as follows:

        sudo touch /etc/vsftpd/chroot_list

#### Configure the firewall

1. Open ports in your firewall by running the following command:

        sudo iptables -I INPUT 4 -m tcp -p tcp -m conntrack --ctstate NEW --dport 21 -j ACCEPT

2. Save your configuration:

        sudo service iptables save

3. Open the **/etc/sysconfig/iptables-config** file in your favorite editor.

4. Verify that the `IPTABLES_MODULES` variable is specified as `ip_conntrack_ftp`
(CentOS 5) or `nf_conntrack_ftp` (CentOS 6), as shown in the following examples:

     -  Centos 5 (ip_conntrack_ftp):

               IPTABLES_MODULES="ip_conntrack_ftp"

     -  Centos 6 (nf_conntrack_ftp):

                IPTABLES_MODULES="nf_conntrack_ftp"

5.  Save the **iptables-config** file and restart iptables:

        sudo service iptables restart


### Access your server through FTP

Use one of the following methods to access the server.

#### Using a browser

Enter the name of your FTP site into a browser address bar, as shown in the
following screenshot, and supply the login credentials when prompted.

<img src="{% asset_path cloud-servers/rackspace-cloud-essentials-centos-installing-vsftpd/ftp.png %}" width="538" height="73" />

#### Using an FTP client

Use one of the many low-cost or free FTP applications, such as
[CyberDuck](https://cyberduck.io/?l=en) and
[Fireuploader](http://www.fireuploader.com/), which are available for download.

#### Using the command line

Use the following syntax to open an FTP session from the command line, where
``example.com`` is your FTP site:

    ftp example.com

To close the FTP session, type **exit** in the session window.

**Next section:** [Rackspace Cloud Essentials - Configure a user in vsftpd](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd)
