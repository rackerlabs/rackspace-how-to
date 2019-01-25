---
permalink: connect-to-cloud-servers-with-filezilla-by-using-sftp
audit_date: '2019-01-25'
title: Connect to a cloud server with Filezilla by using SFTP
type: article
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: '2019-01-25'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to connect to a cloud server with Filezilla by using
SSH File Transfer Protocol (SFTP).

**Note:** We recommend using SFTP instead of FTP to ensure that the file transmission is secure. SFTP
encrypts the data transferred to the FTP server and prevents unauthorized access
during the transmission.

Cloud servers running Linux come with the `openssh` package which includes and configures 
SFTP by default.

Like Secure Shell (SSH), SFTP runs on port 22 by default on cloud servers. If you have changed
the port that SSH listens on, then you must use that new port for SFTP as well.

You can connect to your server via SFTP with the root user but we recommended creating a new
system user for security purposes. For more information, see
[Basic Cloud Server security](/how-to/basic-cloud-server-security).

If you need to give someone else access to your server, but you don't want them to have
full access to the entire file system and they just need access to certain directories, follow this guide.

To install Filezilla, download it from https://filezilla-project.org/

### Configure Filezilla

Download Filezilla from https://filezilla-project.org/ and then install it. You need the
following information during the configuration process:

- Hostname: The public Internet Protocol (IP) address of your cloud server.
- User: We recommend using a new system userrather than using root, however, the root user will work and we are using root for this article.
- Password: The password for the user you are logging in with.

Use the following steps to configure Filezilla to use SFTP:

1. Launch Filezilla and input the following information:
   
   - Host: Your servers public ip address
   - Username: root (or another username if you created one on the server)
   - Password: The password for the root user or any other user being used
   - Port: 22 by default (unless you changed the port for SSH, and then use that port) 
  
2. Click **QuickConnect**.

If you experience any issues, check the server logs to see if connections are reaching the
server by using the following command:

**Red Hat&reg; Enterprise Linux&reg; and CentOS&reg;**

    check /var/log/secure

**Ubuntu&reg; and Debian&reg;**

    check in /var/log/auth.log
