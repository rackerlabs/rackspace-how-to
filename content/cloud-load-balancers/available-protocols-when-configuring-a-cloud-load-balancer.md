---
permalink: available-protocols-when-configuring-a-cloud-load-balancer/
audit_date:
title: Available protocols when configuring a Cloud Load Balancer
type: article
created_date: '2012-07-31'
created_by: Jered Heeschen
last_modified_date: '2016-04-20'
last_modified_by: Stephanie Fillmon
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The following list provides information about the protocols you can
choose when configuring a Cloud Load Balancer:

- **DNS (TCP)** - This protocol works with IPv6 and allows your DNS server
to receive traffic using TCP port 53.

- **DNS (UDP)** - This protocol works with IPv6 and allows your DNS server
to receive traffic using UDP port 53.

- **FTP** - The File Transfer Protocol defines how files are transported
over the Internet. It's typically used when downloading or uploading
files to or from web servers.

- **HTTP** - The Hypertext Transfer Protocol defines how communications
occur on the Internet between clients and web servers. For example, if
you request a web page in your browser, HTTP defines how the web server
fetches the page and returns it your browser.

- **HTTPS** - The Hypertext Transfer Protocol over Secure Socket Layer
(SSL) provides encrypted communication over the Internet. It securely
verifies the authenticity of the web server you're communicating with.

- **IMAPS** - The Internet Message Application Protocol over Secure
Socket Layer (SSL) defines how an email client, such as Microsoft
Outlook, retrieves and transfers email messages with a mail server.

- **IMAPv2** - Version 2 of IMAPS.

- **IMAPv3** - Version 3 of IMAPS.

- **IMAPv4** - Version 4, and the current version of IMAP.

- **LDAP** - The Lightweight Directory Access Protocol provides access to
distributed directory information services over the Internet. This
protocol is typically used to access a large set of hierarchical
records, such as corporate email or a telephone directory.

- **LDAPS** - The Lightweight Directory Access Protocol over Secure Socket
Layer (SSL). See LDAP above.

- **MYSQL** - This protocol allows communication with MySQL, an open
source database management system.

- **POP3** - The Post Office Protocol is one of the two most common
protocols for communication between email clients and email servers.
Version 3 is the current standard of POP.

- **POP3S** - Post Office Protocol over Secure Socket Layer. See POP3
above.

- **SFTP** - The SSH File Transfer Protocol is a secure file transfer and
management protocol. This protocol assumes the files are using a secure
channel, such as SSH, and that the identity of the client is available
to the protocol.

- **SMTP** - The Simple Mail Transfer Protocol is used by electronic mail
servers to send and receive email messages. Email clients use this
protocol to relay messages to another computer or web server, but use
IMAP or POP to send and receive messages.

- **TCP** - The Transmission Control Protocol is a part of the
Transport Layer protocol and is one of the core protocols of the
Internet Protocol Suite. It provides a reliable, ordered delivery of a
stream of bytes from one program on a computer to another program on
another computer. Applications that require an ordered and reliable
delivery of packets use this protocol. See UDP.

- **TCP (Client First)** - This protocol is similar to TCP, but is more
efficient when a client is required to write the data to the server
before receiving the server's response.

  **Note:** TCP_CLIENT_FIRST cannot be placed on a VIP that already dispatches HTTP.

- **TCP (Stream)** - TCP Streaming allows either the client or server to
send the first message when a connection is established. This option is
for protocols where there is no request-response semantic. Either side
of the connection can write the first message, with no response being
necessarily required or expected.

- **UDP** - The User Datagram Protocol provides a datagram service
that emphasizes speed over reliability, It works well with applications
that provide security through other measures.

- **UDP (Stream)** - This protocol is designed to stream media over
networks and is built on top of UDP.

#### Limitations for UDP Protocols

UDP-Based protocols (DNS over UDP, UDP, and streaming UDP) are not
capable of using the Health Monitor features. Also, SSL Termination is
unavailable when using UDP-based ports.
