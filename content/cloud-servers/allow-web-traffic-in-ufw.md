---
permalink: allow-web-traffic-in-ufw/
audit_date: '2020-03-11'
title: 'Allow web traffic in ufw software firewall'
type: article
created_date: '2020-03-17'
created_by: Chris Silva
last_modified_date: '2020-03-17'
last_modified_by: Chris Silva
product: Cloud Servers
product_url: cloud-servers
---
This article describes how to configure your Uncomplicated Firewall (`ufw`) software firewall to allow web traffic on port 80 (HTTP) and port 443 (HTTPS). `ufw` is the default software firewall for Debian based distributions. 
### Prerequisites
You need to have the following prerequisites:
- Basic understanding of Secure Shell (SSH)
- Sudo or administrative access to your server
- A Cloud Server with Debian or Ubuntu running `ufw`
**IMPORTANT**: These steps are only for non-RackConnected Cloud servers. If you are utilizing RackConnect these changes will likely be made on your dedicated firewall. 

Log in to your server by using SSH and then complete the steps in the following sections for
your preferred setup method.

**NOTE**: While `ufw` is the default software firewall solution for most Debian based distributions, it's important to note that it acts as a wrapper for iptables and can be disabled. Before proceeding with the following steps, ensure that `ufw` is running on your server. You can check by running the following command:
        systemctl status ufw

#### One-line command method
Use the following steps for the one-line command method:
1. Use the following one-line command for an expedient set up of your LAMP stack on your server:
        sudo sh -c "ufw allow http && ufw allow https"
        
#### Individual commands method
If you prefer to configure the software firewall using discrete steps instead of by using the
one-line command, perform the following steps:
1.  Run the following command to allow traffic on port 80:
        sudo ufw allow http
2.  Run the following command to allow traffic on port 443:
        sudo ufw allow https

If you've followed the steps above, you've now configured your server to allow HTTP and HTTPS web traffic through your `ufw` software firewall. If you've configured your website to accept traffic on 80/443, you should be able to visit both the http and https version of your website. 
