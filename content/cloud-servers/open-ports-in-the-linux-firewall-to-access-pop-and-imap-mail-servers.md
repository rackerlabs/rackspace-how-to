---
node_id: 71
title: Open ports in the Linux firewall to access POP and IMAP mail servers
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2016-01-11'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

To access services such as POP and IMAP mail servers, you'll need to open certain ports to allow the services through the firewall. There are a few standard ports that are used to access most services. For example, accessing a website generally uses port 80 for normal (HTTP) web pages and port 443 for secure (HTTPS) pages.

| Server  | Port  |
|----------|-------|
| SMTP   | 587*  |
| POP     | 110   |
| POPS   | 995   |
| IMAP    | 143   |
| IMAP3  | 993   |

\* Though SMTP generally uses port 25 for connections, port 587 is actually the preferred port for outbound SMTP traffic due to the widespread abuse of port 25.

### Edit iptables rules

Following from the Cloud Server setup, we need to edit the **iptables.test.rules** files to allow access to those ports. We will use port 25 for SMTP at the moment. You can change it as you see fit.

1. Open the test rules file using the following command:

       sudo nano /etc/iptables.test.rules

2. Just before the HTTP and HTTPS entries, add the following details:

       # Allows SMTP access
       -A INPUT -p tcp --dport 25 -j ACCEPT

       # Allows pop and pops connections
       -A INPUT -p tcp --dport 110 -j ACCEPT
       -A INPUT -p tcp --dport 995 -j ACCEPT

       # Allows imap and imaps connections
       -A INPUT -p tcp --dport 143 -j ACCEPT
       -A INPUT -p tcp --dport 993 -j ACCEPT

3. Apply the new rules using the following command:

       sudo iptables-restore < /etc/iptables.test.rules

4. Now check that the rules have been applied using the following command:

       sudo iptables -L

  This information should be in the output from the command:

       ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
       ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
       ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
       ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3s
       ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap2
       ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imaps

5. Now we have tested the rules, we need to have them applied on a permanent basis. You will need to have full root access for the next command so use this command in order to enter the root shell:

       sudo -i

6. Now use the following command:

       iptables-save > /etc/iptables.up.rules

7. Now that you have saved the new iptables rules, you can exit the root shell by typing the following command:

       exit
