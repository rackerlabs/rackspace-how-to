---
permalink: introduction-to-firewalls
audit_date:
title: Introduction to Firewalls
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
--- 

To understand what exactly a firewall is, it is necessary to first understand what the Internet is. The Internet is, simply put, a web-like network of computers -- nothing more, nothing less. Some computers (like your laptop) specialize primarily in client-side tasks. Others (like your Cloud Server) specialize primarily in server-side tasks. Some highly specialized computers are meant to do nothing except route communications between other computers. These are known as routers and switches.
Computers communicate by sending data in what are called packets. These packets come in different sizes and "shapes" depending on the protocols after which they are modeled. In general, a packet may contain (but will not necessarily contain) all of the following information:
* Source IP address
* Destination IP address
* Source port number (used by sending service, may be 1-65535)
* Destination port number (used by receiving service, also 1-65535)
* Protocol (the "language" spoken by the packet)
* Sequence number (the receiver must "reassemble" packets in the correct order)
* Packet size
* Data (the message itself)
* Checksum (to ensure the packet wasn't mangled)
There are lots of other flags, of course, but we don't want to get into too many details; the interested reader may pick up a book on networking. A firewall's job is to block certain unwanted -- and possibly malicious -- packets. A typical firewall will do this by looking at the first six pieces of information listed above, while more sophisticated firewalls and traffic analyzers will employ more advanced techniques. Here we will offer not a step-by-step guide to setting up specific firewall software, but a more general guide on firewall best practices.
Client firewalls are easy. All we need to do is consider what types of in-bound connections we need (usually none, except for those we've already established), apply the principle of minimalism, and voila! We simply whip up a few rules to block all new in-bound transmissions.* However, you're here because you wanted to set up a firewall on your Cloud Server, not on Grandma's Windows ME machine -- and you probably wish to do more with it than browse the Web and play Solitaire. (At least, I hope so.) Thus, we will need to poke a few holes in your firewall for essential services. First, though, we need to know how to identify which communications are coming to and from this service. For this, we can look at some common port numbers:

Port (IP Protocols)
Service/Protocol
21 (TCP) 
FTP
22 (TCP/UDP) 
SSH/SFTP "Secure File Transfer Protocol (SFTP)") 
25 and 587 (TCP) 
SMTP 
53 (TCP/UDP) 
DNS
80 (TCP/UDP) 
HTTP 
110 (TCP) 
POP3 
143 (TCP/UDP) 
IMAP 
389 (TCP/UDP) 
LDAP 
443 (TCP/UDP) 
HTTPS 
465 (TCP) 
SMTPS 
636 (TCP/UDP) 
LDAPS 
694 (UDP) 
Heartbeat
873 (TCP) 
rsync
3306 (TCP/UDP) 
MySQL
5900 (TCP/UDP) 
VNC
6660-6669 (TCP) 
IRC 
8080 (TCP) 
Apache Tomcat

If you need to use a service that is not listed here, please take a look at the full list.
Port numbers allow us to easily "poke holes" in our firewall for the services we want to open to the world. Note that the term "poke holes" is significant, rather than something like "put up shields." In the security world, it's important to employ whitelists -- in other words, have a list of things that you allow while denying everything else. For example, let's say we want to open up access to our web server and nothing else. A typical rule list (not belonging to any specific software) might look like this:
* ALLOW: DestPort=80
* DENY: ALL

Now, let's say that we want to also allow SSH access, but only from one specific IP address:
* ALLOW: DestPort=22 && SrcIP=1.2.3.4
* ALLOW: DestPort=80
* DENY: ALL

Remember that the "DENY: ALL" line is perhaps the most important line of these rules (and it must usually be placed at the bottom). Without it, you don't have a firewall at all! By now, you should have an elementary understanding of firewalls, what they do, and how they do it.
Visit the links below to read the documentation for your firewall (we have some guides of our own for iptables) and customize it to your own needs.
* https://support.rackspace.com/how-to/introduction-to-iptables/
