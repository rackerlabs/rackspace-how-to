---
permalink: transfer-files-to-or-from-a-linux-server-without-ftp/
audit_date: '2019-01-24'
title: Transfer files to or from a Linux server without FTP
type: article
created_date: '2019-01-24'
created_by: Rackspace Commmunity
last_modified_date: '2019-01-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

### Introduction

This article helps you connect to a Linux&reg; Server when you need to transfer
a file to or from that server. Most of the time, the File Transfer Protocol (FTP)
service is not needed because file transfers can be done over the same port as
the Secure Shell (SSH),  port 22, which is used to log in to a  server from the
command line.

If you are using a file transfer graphical user interface (GUI) tools, such as
FileZilla&reg;, Cyberduck&reg;, or WinSCP&reg;, this protocol might be listed as
SFTP (Secure FTP), which does *not* require an extra FTP service. You can use
any of the following GUI tools to perform a filetransfer over SFTP:

- [FileZilla](/how-to/connect-to-cloud-servers-with-filezilla-via-sftp)

- [Cyberduck](https://cyberduck.io/?l=en)

- [WINSCP](https://winscp.net/eng/download.php)

If you cannot connect after you have logged in by using SSH, you should verify
that FTP has been used in the past. If you need assistance getting logged in
with SSH, then please review the following article for your platform:

- [Windows](https://support.rackspace.com/how-to/connecting-to-linux-from-windows-by-using-putty/)

- [Mac OSX](https://support.rackspace.com/how-to/connecting-to-linux-from-mac-os-x-by-using-terminal/)

### Log into a Linux server

To log in to a Linux server, you need the following information:

- **IP**: Available in the Cloud Control Panel
- **User name**: root
- **Password**: If you don't know your password, reset it from the Cloud Control
  Panel.

#### CentOS, RHEL, or Fedora

To confirm whether SFTP has been installed on CentOS&reg;, RHEL&reg;, or Fedora&reg;,
run the following command:

    # rpm -qa | grep -E "vsftp|proftp"

If SFTP has been installed, the following output displays:

    Vsftpd-2.2.2-14.el6.x86_64

If SFTP has not been installed successfully, the following output displays:

    # rpm -qa | grep -E "vsftp|proftp"

#### Ubuntu

To confirm whether SFTP has been installed on Ubuntu&reg;, run the following
command:

    # dpkg-1 | grep -E "vsftp|proftp"

If SFTP has been installed, the FTP version displays.

### Confirm whether FTP is running

To check whether FTP is running, enter the following command:

    # netstat -ntlp | grep :21

If FTP is running, the following output displays:

    tcp   0      0 0.0.0.0:21        0.0.0.0:*        LISTEN      21209/vsftpd

If FTP is not running, the following output displays:

    # netstat -ntlp | grep :21

### User Configuration

If FTP is installed and running, check the users users. By default, FTP users
also can log in over SSH. If more advanced FTP configuration has been done,
this might not be true.

To check the list of users where the user home directory is /home (Linux default),
run the following command:

    # cat /etc/passwd | grep "/home" |cut -d: -f1
    tom
    sandy

Run the following command to update the passwords for the preceding list of users:

    # passwd tom
    Changing password for user tom.
    New password: <enter password here> - you will NOT see anything as you type
    Retype new password: <enter password here> - you will NOT see anything as you type
    passwd: all authentication tokens updated successfully.

Run the following command to determine whether FTP is being blocked on the
firewall even though the service is running:

    # iptables -nL INPUT

If the last line of the output from the preceding command is a `DROP` or `REJECT`,
then FTP is blocked unless it has been explicitly allowed. You can check for
this explicit permission by using the following command:

    # iptables -nL INPUT | grep :21

If there is an `ACCEPT` line in the output, then FTP is allowed from that IP or
range of IPs (otherwise it is not allowed).

If you need to add a firewall rule for FTP, you can run the following commands:

    # iptables -I INPUT 4 -m tcp -p tcp -m conntrack --ctstate NEW --dport 21 -j ACCEPT
    # service iptables save
    # service iptables restart

The first line adds the rule to the firewall that is currently running. The
second line saves the rule to the static configuration file so that it is
invoked when the service restarts. The third line restarts the service.

Confirm that the firewall explicitly allows FTP by rerunning the following
command:

    # iptables -nL INPUT | grep :21
