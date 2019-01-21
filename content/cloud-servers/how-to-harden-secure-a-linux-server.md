---
permalink: how-to-harden-secure-a-linux-server
audit_date:
title: How to Harden/Secure a Linux Server
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
Ideally you would never want to have to resolve a compromised server issue.  The best thing to do would be to harden the server from the beginning to minimize the possibility of a compromise.  We have a Knowledge Center article that goes over how to harden the server to prevent compromises, this article covers the basics of securing user(s), SSH login, and some basic firewall rules. This article is by no means an exhaustive list of how to secure a server, it is not meant to be - It is merely a starting point. 

To further harden a server you can get some good info from these links:

http://cloudfaqs.wordpress.com/2013/09/14/20-linux-server-hardening-security-tips/

http://www.gtcomm.net/blog/securing-a-linux-server-hardening-ssh-security/

http://security.stackexchange.com/questions/18480/building-a-secure-server-with-centos

Some examples of steps I take on my own servers are to:
1. Not run any unneeded services such as FTP
2. Do not allow root user to login direct via SSH
3. Only allow specified IPs to connect via SSH
4. Only allow SSH Key based authentication - no password auth allowed
There are some additional steps you might want to consider when looking into hardening your server:
1. use fail2ban ( http://www.fail2ban.org/wiki/index.php/Main_Page ) to automatically add malicious IPs to the firewall drop rules.
2. keep packages updated on regular basis
3. Regular on-going monitoring of server logs - More details on Linux logs can be found at the following 2 links:
http://www.rackspace.com/knowledge_center/article/logs-on-linux
