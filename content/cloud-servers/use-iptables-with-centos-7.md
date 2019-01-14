---
permalink: use-iptables-with-centos-7
audit_date:
title: Use iptables with CentOS 7
created_date: '2019-01-14'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Use iptables with CentOS 7

Starting with RHEL 7 / CentOS 7, firewalld was introduced to manage iptables. As such, you will either need to use firewall-cmd commands or disable firewalld and enable iptables. If you prefer to use the classic iptables setup, then this article will show you how to do just that.
The first step is to stop and mask the firewalld service (i.e., the service you do not want to use):
$ systemctl stop firewalld
$ systemctl mask firewalld
Then, install the "iptables-services" package (if it is not already installed):
$ yum install iptables-services
Enable the service to start at boot-time:
$ systemctl enable iptables
$ systemctl enable ip6tables
You can now either add iptables rules from the CLI (e.g., `iptables -I INPUT ...`) or create/edit your /etc/sysconfig/iptables file to look something like the following (very basic with ports 22 and 80 open):
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
If you are saving your rules in the /etc/sysconfig/ip{,6}tables files, you will then need to run the following commands:
$ systemctl restart iptables
$ systemctl restart ip6tables
Next, check that the iptables service is **active** with:
$ systemctl status iptables
$ systemctl status ip6tables
Check your iptables rules with:
$ iptables -L
$ ip6tables -L
and that your server is listening on those ports you opened (22 and 80 in the above example):
$ netstat -plant
and you can query the systemd journal for a **log** of the changes you made to the iptables service with:
$ journalctl -f -u iptables.service
$ journalctl -f -u ip6tables.service
Reboot the server and the iptables rules should be saved and automatically re-loaded again 
