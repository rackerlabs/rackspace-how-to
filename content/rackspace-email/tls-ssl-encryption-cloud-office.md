---
permalink: tls-ssl-encryption-cloud-office/
audit_date:
title: TLS and SSL encryption in Cloud Office
type: article
created_date: '2013-09-19'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

Transport Layer Security (TLS) and its predecessor, Secure Socket Layer
(SSL), are cryptographic protocols that provide security for
communications over networks. TLS and SSL encrypt the segments of
network connections at the application layer to ensure secure end-to-end
transit at the transport layer.  For our purposes, they create an
encrypted tunnel through which we send plain text emails.

Cloud Office servers by default will attempt a TLS connection for both
in and outbound email. For outgoing mail (any of our servers sending to
external MX servers), we will perform TLS if it is advertised by the
remote server. When performing outgoing TLS, our servers are permissive
with the certificate (in other words, if the site is using an untrusted
or self-signed certificate, as long as it is a working certificate, we
should still accept it).

**Our outgoing SMTP servers will use TLS in an opportunistic fashion.**
This means that our servers will attempt to open an SMTP transaction
with the recipient server using TLS. If TLS cannot be successfully
connected, the communication will default back to an unencrypted
transmission of the data, also referred to as PLAINTEXT.

Also our servers will respond to TLS and SSL requests to send mail to us encrypted.
