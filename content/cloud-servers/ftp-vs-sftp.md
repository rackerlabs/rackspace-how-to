---
permalink: ftp-vs-sftp
audit_date:
title: ftp vs sftp
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

A common support request from our customers is for instructions on installing and configuring vsftpd on our cloud servers. vsftpd is an open source FTP server that many people use to facilitate file transfers. Many people use vsftpd successfully with their servers, but not everyone needs to configure FTP on their server. In fact, many of our customers don’t know that every Rackspace Managed Cloud server comes configured and ready to transfer files with a much more secure method: SFTP – SSH File Transfer Protocol. Let’s discuss the pros and cons of using SFTP or FTP, and then provide some instructions for configuring each.
So what’s the difference? 

These are two separate protocols that work in very much the same way. Both offer file transfer and management on remote machines.  The primary difference is in the security offered by each method. FTP traffic is unencrypted. All transmissions are in clear text, including usernames, passwords, individual commands, and the actual files. This means they can potentially be read by anyone with access to the network. SFTP, on the other hand, is an extension of the Secure Shell Protocol (SSH), and provides end-to-end encryption through the SSH tunnel.
Setup and user management are also very different between SFTP and FTP. When using a Rackspace Managed Cloud Server, SFTP is already available for all Linux images. In fact, the only port open on a brand new image is port 22, so that the administrators can access the server via SSH or SFTP. Any system user with SSH access also has access via SFTP. The users’ groups and permissions also dictate their ability to manage files. FTP requires the installation of an FTP server (if you use FTP, we recommend vsftpd), opening port 21, and creating and maintaining separate users and permissions for accessing files and directories. 
FTP does have some additional advantages over SFTP. By default, each user is “jailed” to only have access to those files the administrator has given them access to. Since SFTP works with the Linux system user, additional considerations for jailing users are required. Additionally, some applications are limited to only handle file transfers via FTP, which prevents using SFTP for file transfer.
Recommendations and Instructions

If you ask a dozen Rackers, they will almost all recommend SFTP barring any mitigating circumstances. Many of our customers use both. If you are part of our Managed Operations service level our Linux Admins will gladly setup SFTP or vsftp for you.
