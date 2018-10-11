---
title: Rackspace PDR SSL Decryption
type: article
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-10-09'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-ssl-decryption/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Overview of SSL/TLS end-to-end decryption
Many appliactions terminate SSL/TLS at the network edge with load-balancer or web application firewall. However, if your application uses end-to-end encryption then we will need to obtain a copy of the SSL keys and certs to decrypt traffic on your Network-based Intrusion Detection(NIDS) appliances. In cases where end-to-end encryption is in use and decrpytion is not working, our SOC will not be able to detect network threats embeded in the SSL/TLS traffic. To enable decrytion the following information is required:

1. Provid our Rackspace PDR teams the SSL/TLS private keys and public certs (used by the NIDS appliances for decrypting traffic).
2. Disable Diffie-Hellman key exchange on all applications with end-to-end encryption.
3. Configure the SSL TLS cypher suits with those compatable with the NIDS decryption(see below).
4. Provide our Rackspace PDR teams a list of domains/FQDNs for endpoints with end-to-end encryption.

### Disable Diffie Hellman key exchange
Because the Alert Logic Threat Managers we use to provide our NIDS solution do not support Diffie-Hellman for decryption. You will need to disable DH for your applications as explained by [Alert Logic and Diffie-Hellman](https://support.alertlogic.com/hc/en-us/articles/115005953783-Alert-Logic-and-Diffie-Hellman)

### Supported cyphers

- AES256-GCM-SHA384
- AES256-SHA256
- AES256-SHA
- AES128-GCM-SHA256
- AES128-SHA256
- AES128-SHA

Further reading on [Alert Logic Supported Cyphers](https://support.alertlogic.com/hc/en-us/articles/115003425427-What-ciphers-does-Alert-Logic-accept-)
