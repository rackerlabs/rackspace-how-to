---
permalink: introduction-to-firewalls/
audit_date: '2019-01-23'
title: Introduction to firewalls
type: article
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: '2019-01-24'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article provides an overview of firewalls. To understand what a firewall
is, you first need to understand what the Internet is.

The Internet is a web-like network of computers. Some computers (like your
laptop) specialize primarily in client-side tasks. Others (like a Rackspace
cloud server) specialize primarily in server-side tasks. Some highly
specialized computers only route communications between other computers.
These computers are called _routers and switches_.

### Packets

Computers communicate by sending data in _packets_. These packets come in a
variety of sizes and "shapes", depending on the protocols that they follow.
A packet might contain all of the following information:

* **Source IP address**: The Internet Protocol (IP) address of the sender.
* **Destination IP address**: The Internet Protocol (IP) address of the
  recipient.
* **Source port number**: The port of the sending service. This number
  ranges from 1 to 65535.
* **Destination port number**: The port of the receiving service.
  This number ranges from 1 to 65535.
* **Protocol**: The protocol or model that the packet follows.
* **Sequence number**: The sequence number for the packet. The receiver uses
  these numbers to reassemble packets in the correct order.
* **Packet size**: The size of the packet.
* **Data**: The message itself.
* **Checksum**: A check that ensures that the packet is not corrupted.

The purpose of a firewall is to block unwanted and possibly malicious packets.
A typical firewall performs this task by looking at the first six pieces of
information in the preceding list, while more sophisticated firewalls and
traffic analyzers employ more advanced techniques.

### Firewall best practices

When you set up a firewall on your cloud server, you need to poke a few holes
in it so that you can receive communications from essential services.

#### Identify the ports for which you want to create firewall rules

First, you need to identify which communications are coming from and
going to those services. You can find this information by looking at the
following common port numbers:

| **Port (IP protocols)** | **Service/Protocol** |
|-----------------------------------------------|-----------------------------------------------------------|
| 21 (Transfer Control Protocol (TCP)) | File Transfer Protocol (FTP) |
| 22 (TCP and User Datagram Protocol (TCP/UDP)) | Secure Shell and Secure File Transfer Protocol (SSH/SFTP) |
| 25 and 587 | Simple Mail Transfer Protocol (SMTP) |
| 53 (TCP/UDP) | Domain Name System (DNS) |
| 80 (TCP/UDP) | Hypertext Transfer Protocol (HTTP) |
| 110 (TCP) | Post Office Protocol (POP3) |
| 143 (TCP/UDP) | Internet Message Access Protocol (IMAP) |
| 389 (TCP/UDP) | Lightweight Directory Access Protocol (LDAP) |
| 443 (TCP/UDP) | Secure HTTP (HTTPS) |
| 465 (TCP) | Simple Mail Transfer Protocol Secure (SMTPS) |
| 636 (TCP/UDP) |  Secure LDAP (LDAPS) |
| 694 (UDP) | Heartbeat |
| 873 (TCP) | rsync |
| 3306 (TCP/UDP) | MySQL |
| 5900 (TCP/UDP) | Virtual Network Computing (VNC) |
| 6660-6669 (TCP) | Internet Relay Chat (IRC) |
| 8080 (TCP) | Apache&reg; Tomcat&reg; |


Port numbers enable you to poke holes in your firewall for the services that
you want to open to the world. There are many additional port numbers.

#### Use whitelists

It is important to use _whitelists_, which are list of services that you allow
while denying everything else.

For example, if you want to open up access to your web server and nothing
else, your rule list might look like the following example:

* `ALLOW: DestPort=80`
* `DENY: ALL`

If you also want to allow Secure Shell (SSH) access, but only from one
specific IP address, your list might look like the following example:

* `ALLOW: DestPort=22 && SrcIP=1.2.3.4`
* `ALLOW: DestPort=80`
* `DENY: ALL`

The line that says `DENY: ALL` is perhaps the most important line in your
firewall rules because it blocks everything that you do not specifically
allow. You should usually place this line at the bottom.

### Additional resources

You might also find the following resources helpful:

- [Best practices for firewall rules configuration](https://support.rackspace.com/how-to/best-practices-for-firewall-rules-configuration/)

- [Introduction to iptables](/how-to/introduction-to-iptables/)
