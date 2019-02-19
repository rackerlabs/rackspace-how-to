---
permalink: overview-of-ftp-and-sftp/
audit_date: '2019-01-18'
title: Overview of FTP and SFTP
type: article
created_date: '2019-02-19'
created_by: Rackspace Community
last_modified_date: '2019-02-19'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article discusses the advantages and disadvantages of using File Transfer
Protocol (FTP) and SSH File Transfer Protocol (SFTP).

### Differences between FTP and SFTP

FTP and SFTP are separate protocols that work in a similar way.
Both offer file transfer and management on remote machines. The primary
difference is in the level of security that they offer.

#### Security

FTP traffic is unencrypted. All FTP
transmissions are sent as regular text, including usernames, passwords,
commands, and the files themselves. As a result, anyone with
access to the network can potentially read them.

SFTP is an extension of the Secure Shell Protocol (SSH).
It is a more secure option that provides end-to-end encryption through
the SSH tunnel.

#### Setup and user management

By default, SFTP is already available on all Linux&reg; images for Rackspace
managed cloud servers. The only port that is open on a new image is port 22.
Opening this port enables administrators to access the server by using either
SSH or SFTP. Any user with SSH access can also access the server by using
SFTP. The groups and permissions that are associated with your users also
determine their ability to manage files.

FTP requires you to install an FTP server (such as very secure File Transfer
Protocol (FTP) daemon (vsftpd)), open port 21, and create and maintain
separate users and permissions for accessing files and directories.

However, FTP has the following advantages over SFTP:

- By default, each user is _jailed_ to only have access to those files to
  which the administrator has given them access. Because SFTP works with the
  Linux system user, SFTP requires you to take additional steps to jail users.
- Some applications can only handle file transfers by using FTP, which
  prevents you from using SFTP.

### Use vsftpd for FTP

If you plan to use FTP, we recommend that you review the following resources
that show you how to install and configure vsftpd on a cloud server.
Vsftpd is an open source FTP server that you can use to transfer files.

  - [Rackspace Cloud Essentials - Install vsftpd for
    CentOS](/how-to/rackspace-cloud-essentials-centos-installing-vsftpd/)
  - [Rackspace Cloud Essentials - Configure a user in vsftpd for
    CentOS](/how-to/rackspace-cloud-essentials-centos-configuring-a-user-in-vsftpd/)

### Recommendation

We recommend that you use SFTP instead of FTP to ensure that file
transmissions are secure. SFTP encrypts the data that it transfers to the
FTP server and prevents unauthorized access during the transmission.
