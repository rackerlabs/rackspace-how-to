---
permalink: open-ports-in-the-linux-firewall-to-access-pop-and-imap-mail-servers/
audit_date: '2016-07-29'
title: Open ports in the Linux firewall to access POP and IMAP mail servers
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2016-07-29'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

To access services such as POP and IMAP mail servers, you must open certain ports to allow the services through the firewall. A few standard ports are used to access most services. For example, access for a website generally uses port 80 for normal (HTTP) web pages and port 443 for secure (HTTPS) pages.

The following table lists the ports used be each of the TCP/IP protocols for mail delivery.

| Server  | Port  |
|----------|-------|
| SMTP   | 587*  |
| POP     | 110   |
| POPS   | 995   |
| IMAP    | 143   |
| IMAP3  | 993   |

\* Although SMTP generally uses port 25 for connections, port 587 is the preferred port for outbound SMTP traffic because of the widespread abuse of port 25.

### Edit firewall rules

**For Centos 7 and later:**

1. Enter the following commands to open the preceding ports:

      firewall-cmd --zone=public --add-port=25/tcp --permanent

   Repeat this command, replacing the port number, for each of the preceding ports.**

2. List the rules on a given zone by running the following command:

      firewall-cmd --query-service=<service name>

**For Debian and CentOS 6 and earlier:**

Edit the `iptables.test.rules` file to allow access to those ports. Although the example uses port 25, you can change it to the recommended value.

1. Open the rules file with the following command: `sudo nano /etc/iptables.test.rules`
2. Just before the HTTP and HTTPS entries, add the following lines:

         # Allows SMTP access
         -A INPUT -p tcp --dport 25 -j ACCEPT

         # Allows pop and pops connections
         -A INPUT -p tcp --dport 110 -j ACCEPT
         -A INPUT -p tcp --dport 995 -j ACCEPT

         # Allows imap and imaps connections
         -A INPUT -p tcp --dport 143 -j ACCEPT
         -A INPUT -p tcp --dport 993 -j ACCEPT

3. Apply the new rules:

   For Debian:

         sudo iptables-restore < /etc/iptables.test.rules

   For CentOS 6 and earlier:

      Skip this step and proceed to the following step.

4. Check that the rules have been applied:

         sudo iptables -L

   The following information should be in the output from the command:

         ACCEPT all -- anywhere anywhere state RELATED,ESTABLISHED
         ACCEPT tcp -- anywhere anywhere tcp dpt:smtp
         ACCEPT tcp -- anywhere anywhere tcp dpt:pop3
         ACCEPT tcp -- anywhere anywhere tcp dpt:pop3s
         ACCEPT tcp -- anywhere anywhere tcp dpt:imap2
         ACCEPT tcp -- anywhere anywhere tcp dpt:imaps

5. Enter the root shell. You must have full root access to save the iptables rules.

         sudo -i

6. Save the iptables rules:
   For Debian:

         iptables-save > /etc/iptables.up.rules

   For CentOS 6 and earlier:

         iptables-save > sudo iptables-restore &lt;

7. Exit the root shell:

         exit
