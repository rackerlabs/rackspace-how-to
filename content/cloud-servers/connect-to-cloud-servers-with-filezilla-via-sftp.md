---
permalink: connect-to-cloud-servers-with-filezilla-via-sftp
audit_date:
title: Connect to Cloud Servers with Filezilla via sFTP
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

###Introduction
Cloud servers running Linux come with the openssh package which includes/configures sFTP by default.

sFTP is recommended over standard FTP, for more information on why, check out this link.

Like ssh, sFTP runs on port 22 by default on cloud servers. If you have changed the port that ssh listens on then you will need to use that new port for sFTP as well.

You can connect to your server via sFTP with the root user but it is recommended to create a new system user for security purposes, here is an article on how to do that. If you need to give someone else access to your server, but you don't want them to have full access to the entire filesystem and they just need access to certain directories, follow this guide.

To install Filezilla, download it from https://filezilla-project.org/

###Gathering the Necessary Information
Hostname: The hostname will be the public ip address of your cloud server. You can get that by logging into your control panel at mycloud.rackspace.com, click on the Cloud Servers tab, and next to your server name you will see your servers public ip address.

User: As explained above, it is recommended to use a system user that you create rather than using root. However, the root user will work and we will be using root for this article.

Password: The password is just the password for the user you are logging in with. Passwords for server users are not stored or viewable from the control panel. If you are connecting with the root user, you can reset the root users password by following this guide. If you are connecting with any other user, you need to know the password or login to the server with the root user and change the users password with the command "passwd username".

Filezilla setup
Launch filezilla. 
  Host will be your servers public ip address
  Username will be root (or another username if you created one on the server)
  Password will be the password for the root user or any other user being used
  Port will be 22 by default (unless you changed the port for ssh, then use that port). 
  
Click QuickConnect.

If any issues are experienced, check the server logs to see if connections are hitting the server. 
  For CentOS/RHEL based distros, check /var/log/secure
  For Ubuntu/Debian based distros, check in /var/log/auth.log
