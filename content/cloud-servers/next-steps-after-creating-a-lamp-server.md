---
permalink: next-steps-after-creating-a-lamp-server
audit_date:
title: Next Steps After Creating a LAMP Server
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
This LAMP server is a baseline setup, but can be used to host many PHP based sites. This template is built to host multiple, simple sites, but we stronglyrecommend using a multiple server setup as you grow to a larger scale.
With other Orchestration Templates, most of the configuration is already completed, and you’ll just need to import your content. For this tutorial (based on Ubuntu 14.04 as of 2014–12–03) we will focus on securing the server, setting up multiple vhosts to host multiple sites, and importing your content into the appropriate directories.
A basic knowledge of Linux operating systems is required to complete this tutorial. For a basic primer see our https://community.rackspace.com/general/f/34/t/4628. There are several other resources to learn Linux, including https://nixsrv.com/llthw.
1st Login and Basic Security

Your Credentials

When you create a server via an Orchestrtaion Template you are given a set of credentials. For a LAMP server, you receive 3 credentials: Your SSH key, your phpMyAdmin password, and your mySQL root password. (You should have already set your phpMyAdmin username during the setup process.)
First we need to get into your server using the supplied SSH key. The Stack was not created with a root password, but you are provided with the SSH key. The SSH key is much more secure than a password alone. Below are http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-linuxmac. http://www.rackspace.com/knowledge_center/article/logging-in-with-a-ssh-private-key-on-windows are available in our Knowledge Center.
$ vim ~/.ssh/mykeyfile.txt
Paste the contents of the ssh key here. With vim, you first type the “i” key to select input mode, then cmd-v to paste the key. Once it’s pasted, press escape, followed by “:wq” to write your changes then quit editing.
$ chmod 600 ~/.ssh/mykeyfile.txt
Now it’s time to log into the server:
$ ssh -i ~/.ssh/mykeyfile.txt -l root 123.45.6.789

The authenticity of host '123.45.6.789 (<no hostip for proxy command>)' can't be established.  
RSA key fingerprint is a1:b2:c3:d4:ab:cd:ef:gh:m5:1a:2b:c3:45.  
Are you sure you want to continue connecting (yes/no)? yes  
Warning: Permanently added '123.45.6.789' (RSA) to the list of known hosts.

Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-37-generic x86_64)  
root@web:~#
And now we’ve logged into the server and are ready to add some basic security measures.
Basic Cloud Server Security

Although Rackspace Cloud has taken steps to make your default Cloud Server image as secure as possible, the first line of defense lies in the hands of you, our customer. Following our Knowledge Center article on http://www.rackspace.com/knowledge_center/article/basic-cloud-server-security can make your server much more secure.
At a minimum I recommend that you secure your sever by:
1. Creating an administration user so that you don’t have to perform actions as root. (Make sure that user is part of the Apache group, and has sudo privileges.)
2. Disable root login. This will prevent anyone who might end up with the root login credentials from using them to log into the server - an added layer of security.
3. Follow their directions for generating an SSH key pair for the new user you’ve created.
4. If you have additional users who might need access to the server, I recommend making user profiles for them at this time. (e.g. a developer who will be working for you on a contract basis.)
5. Open and close any necessary ports. Your new LAMP server already has ports 80 and 443 opened to accommodate HTTP traffic.
Additional steps you can take to further secure your server(s) include http://www.rackspace.com/knowledge_center/article/introduction-to-iptables#Allow_connections_to_SSH which will be allowed to access the server via ssh.
