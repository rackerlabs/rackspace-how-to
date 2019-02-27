---
permalink: use-iptables-with-centos-7/
audit_date: '2019-01-16'
title: Use iptables with CentOS 7
type: article
created_date: '2019-01-16'
created_by: Shaun Crumpler
last_modified_date: '2019-01-16'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Beginning with Red Hat&reg; Enterprise Linux&reg; (RHEL) 7 and CentOS&reg; 7, firewalld is available for managing iptables. 
As a result, you either need to use `firewall-cmd` commands, or disable firewalld and enable iptables. 
This article shows you how to use the classic iptables setup.

### Stop and mask the firewalld service

Run the following commands to stop and mask the firewalld service that you don't want to use:

    $ systemctl stop firewalld
    $ systemctl mask firewalld

### Install and configure iptables

Use the following steps to install and configure iptables:

1. Install the `iptables-services` package (if it is not already installed) by running the following command:

       $ yum install iptables-services

2. Enable the service to start at boot time by running the following commands:

       $ systemctl enable iptables
       $ systemctl enable ip6tables

3. Next, add iptables rules. You can do this in either of the following ways:

   - From the command-line interface (CLI), by running commands similar to `iptables -I INPUT ...`
   - By creating or editing your `/etc/sysconfig/iptables` file to look similar to the following basic example, 
     which leaves ports 22 and 80 open:

         $ cat /etc/sysconfig/iptables
         *filter
         :INPUT ACCEPT [0:0]
         :FORWARD ACCEPT [0:0]
         :OUTPUT ACCEPT [214:43782]
         -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
         -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
         -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
         -A INPUT -i lo -j ACCEPT
         -A INPUT -j REJECT --reject-with icmp-port-unreachable
         COMMIT

         $cat /etc/sysconfig/ip6tables

         *filter
         :INPUT ACCEPT [0:0]
         :FORWARD ACCEPT [0:0]
         :OUTPUT ACCEPT [214:43782]
         -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
         -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
         -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
         -A INPUT -i lo -j ACCEPT
         -A INPUT -j REJECT --reject-with icmp6-adm-prohibited
         COMMIT

4. (*Optional*) If you are saving your rules in the `/etc/sysconfig/ip{,6}tables` files, you must also run the following 
   commands:

       $ systemctl restart iptables
       $ systemctl restart ip6tables

5. Next, check that the iptables service is active by running the following commands:

       $ systemctl status iptables
       $ systemctl status ip6tables

6. Check your iptables rules by running the following commands:

       $ iptables -L
       $ ip6tables -L

7. Verify that your server is listening on the ports that you opened (22 and 80 in the above example) by running the following 
   command:

       $ netstat -plant

8. Query the `systemd` journal for a log of the changes that you made to the iptables service by running the following 
   commands:

       $ journalctl -f -u iptables.service
       $ journalctl -f -u ip6tables.service

9. Reboot the server. The iptables rules should be saved and automatically reloaded. 
