---
permalink: installing-and-configuring-vsftpd/
audit_date: '2019-03-05'
title: Installing and configuring vsFTPD
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-12-20'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install and configure a vsFTPD server on CentOS&reg;, Red Hat&reg; Enterprise Linux&reg; (RHEL), and the Ubuntu&reg; operating system.

**Note:** You must be logged in through SSH as the root user to use the instructions in this article.

### Install vsFTPD

Use the following commands on the different Linux&reg; distributions to install a vsFTPD server:

**CentOS and RHEL**

    yum -y install vsftpd

**Ubuntu operating system**

    apt-get install vsftpd

The installation process generates a configuration file. For CentOS and RHEL, the file is named
**/etc/vsftpd/vsftpd.conf**, and for the Ubuntu operating system, the file is named **/etc/vsftpd.conf**. Use the instructions
in the following sections to configure the settings in the vsFTPD configuration file.

### Configure vsFTPD

Open the vsFTPD configuration file in a file editor or by using `vi`, and replace the contents of the file
with the following lines:

    anonymous_enable=NO
    local_enable=YES
    write_enable=YES
    local_umask=022
    dirmessage_enable=YES
    xferlog_enable=YES
    connect_from_port_20=YES
    xferlog_std_format=YES
    listen=YES
    pam_service_name=vsftpd
    userlist_enable=YES
    tcp_wrappers=YES
    pasv_min_port=60000
    pasv_max_port=65000

If you want to enable chroot jails, add the following lines at the bottom of the configuration file:

    chroot_local_user=YES
    chroot_list_enable=YES
    chroot_list_file=/etc/vsftpd/vsftpd.chroot_list

You must create a **vsftp.chroot_list** file and put any users in it who are *not* chrooted. All users are chrooted by default. You must create the file even if you don't have any users to put in it.

**Note:** For the Ubuntu operating system, the line for the chroot list file is `chroot_list_file=/etc/vsftpd.chroot_list`.

If you want to enable a user to use file access control lists (FACLs) or a set a group permission by default, add the following lines at the bottom of the configuration file:

    file_open_mode=XXXX
    local_umask=XXX

Here, you can change `file_open_mode` to 0775, 0664, and so on to meet your basic permission needs. You might not need to combine it with umask, depending on what you want to do.

Umask removes permissions from the files. For example, a file with 777 becomes 755 with a umask of 022 (the default). This restricts access for security purposes. Some people mistakenly set the umask to 000, thinking that the files will then show up as 777. This distinction is important. While `file_open_mode` tells vsFTPD the default permissions to use, umask only takes away permissions, it can never grant them.

#### Restart and enable vsFTPD

After you edit the configuation file, you must restart the vsFTPD service for the changes to take effect. Use
the following command to restart vsFTPD on CentOS, RHEL, and the Ubuntu operating system:

    systemctl restart vsftpd

After vsFTPD restarts, you should also configure it to start when the server boots. Use the following command to enable
vsFTPD to start at boot on CentOS, RHEL, and the Ubuntu operating system:

    systemctl enable vsftpd

#### Allow vsFTPD through the firewall

The final step is to allow vsFTPD through your server firewall by using the following commands on the different Linux distributions:

**CentOS and RHEL**

    iptables -I RH-Firewall-1-INPUT -p tcp --dport 21 -m comment --comment "FTP" -j ACCEPT
    iptables -I RH-Firewall-1-INPUT -p tcp -m multiport --dports 60000:65000 -m comment --comment "FTP passive mode ports" -j ACCEPT
    /etc/init.d/iptables save

**The Ubuntu operating system**

    ufw allow 21
    ufw allow proto tcp from any to any port 60000:65000
