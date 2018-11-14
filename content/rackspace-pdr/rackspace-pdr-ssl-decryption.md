---
permalink: rackspace-pdr-ssl-decryption/
title: Rackspace PDR SSL decryption
type: article
audit_date: '2018-11-12'
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-11-12'
last_modified_by: Nick Shobe
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Many appliactions terminate Secure Socket Layer (SSL) and Transport Layer Security (TLS) at the network edge
with a load-balancer or web application firewall. If your application uses end-to-end encryption, then we
need a copy of the SSL keys and certifications to decrypt traffic on your Network-based Intrusion
Detection (NIDS) appliances. In cases where end-to-end encryption is in use and decrpytion is not
working, our Security Operations Center (SOC) will not be able to detect network threats
embeded in the SSL and TLS traffic. To enable decrytion the following information is required:

1. Provide our Rackspace PDR teams the SSL and TLS private keys and public certifications (used by the NIDS appliances for decrypting traffic).
2. Disable Diffie-Hellman (DH) key exchange on all applications with end-to-end encryption.
3. Configure the SSL and TLS cypher suits with those compatable with the NIDS decryption (see the "Supported cyphers" section).
4. Provide our Rackspace PDR teams a list of domains and fully qualified domain names (FQDNs) for endpoints with end-to-end encryption.

### Disable Diffie Hellman key exchange

Because the Alert Logic&reg; Threat Managers&trade; that we use to provide our NIDS solution do not
support Diffie-Hellman for decryption, you must disable DH for your applications. For more
information, see [Alert Logic and Diffie-Hellman](https://support.alertlogic.com/hc/en-us/articles/115005953783-Alert-Logic-and-Diffie-Hellman).

### Supported cyphers

The following cyphers are supported with NIDS decryption:

- AES256-GCM-SHA384
- AES256-SHA256
- AES256-SHA
- AES128-GCM-SHA256
- AES128-SHA256
- AES128-SHA

For more information, see [Alert Logic Supported Cyphers](https://support.alertlogic.com/hc/en-us/articles/115003425427-What-ciphers-does-Alert-Logic-accept-).
