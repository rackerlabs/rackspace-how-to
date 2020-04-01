---
permalink: alert-logic-and-diffie-hellman/
title: 'Alert Logic and Diffie-Hellman'
type: article
audit_date: '2020-02-03'
created_date: '2020-02-03'
created_by: RMS Network Defense
last_modified_date: '2020-02-03'
last_modified_by: Stephanie Fillmon
product: Alert Logic Security Solutions
product_url: rms-alert-logic
---

The Alert Logic&reg; network intrusion detection system (IDS) does not support utilization of Diffie-Hellman key exchange in web/HTTPS traffic. To explain why we do not use Diffie-Hellman, it is necessary to discuss the elements involved and describe how Diffie-Hellman secures communication between two parties. This article also details the math supporting Diffie-Hellman.

### Network intrusion detection

The network IDS has the capability to decrypt and inspect HTTPS/TLS traffic for connection endpoints (servers) within the customer's environment. The inspection capability does not inspect traffic from clients inside the environment to endpoints outside the customer's environment, such as when desktop users connect to external secure websites. This type of traffic inspection is outside the scope of an IDS solution and is often done by HTTPS/TLS inspection solutions that insert themselves as an inline middleman (proxy) between clients and servers.

### SSL/TLS session key

In the context of SSL/TLS, a session key is an ephemeral key used to encrypt and decrypt traffic that is sent over an SSL/TLS connection.

Key agreement protocols, like the RSA protocol, work by sharing the session key by sending it from one party to the other over the network. The session key is encrypted with the public key of the server and can only be decrypted with the server private key. Anything that has the private key can decrypt the session key and use it to decrypt the rest of the traffic that is part of the session. Therefore, having the certificate and private key for a server allows the network IDS and web application IDS to inspect SSL/TLS traffic.

#### Why the network IDS doesn't support Diffie-Hellman

The Diffie-Hellman key agreement protocol, however, does not share the session key nor does it share all the values needed to compute the session key. Instead, it relies on a special mathematical relationship among several shared values and some secret (unshared) values that allows each party to independently compute the session key. This is what allows Diffie-Hellman to provide perfect forward secrecy and prevent man-in-the-middle attacks. So even if a third-party has the private key and inspects all the values shared between the client and server, it will not have all the values needed to compute the session key, and therefore will not be able to decrypt the traffic sent during the session.

Due to the in-abilitiy to decrpyt the traffic, Diffie-Hellman is not supported as a key exchange protocol for the network IDS and web application IDS or any other solution that needs to passively inspect encrypted traffic. For a solution to be able to decrypt traffic that is using Diffie-Hellman, the solution would need to intercept and terminate the connection handshake and act as a middleman or proxy. As the network IDS is not an inline solution, it does not intercept connections.

Diffie-Hellman is the most secure key exchanged protocol and as such, it will generally be enabled by default. It may seem a bit ironic that Alert Logic solutions require the use of less robust protocols so that they can perform their function of detecting threats, but the trade-off is considered justified. The benefit of being able to inspect and detect threats in encrypted traffic outweighs any possible downsides to not using Diffie-Hellman.

If a customer would like to still utilize Diffie-Hellman key exchange between their clients and their environment it is recommend that the customer terminate their HTTPS connections on a load balancer or similiar device before the traffic reaches the server. In doing the termination, it will allow the IDS to inspect HTTP traffic between the load balancer and the server and still allow Diffie-Hellman key exchange to be utilize as traffic leaves the environment. In some cases redeployment of the network IDS in on-premise environments may be required for the network IDS to be able to inspect the traffic from the load balanacer to the server. If no such option is avaiable, then Rackspace recommends utilization of a web application firewall with HTTPS termination, in addition to a network IDS, for inspection of web traffic. 

#### How to find out if a server supports Diffie-Hellman

One way to see if a server or endpoint supports Diffie-Hellman is to use the nmap tool with the option for the ssl-enum-ciphers script, as shown in the example below, to list all supported cipher suites. All cipher suites that list DH, DHE, or ECDHE use Diffie-Hellman.

    nmap --script ssl-enum-ciphers -p <port> <IP address/hostname>

For example:

    $ nmap --script ssl-enum-ciphers -p 443 10.54.42.11

    Starting Nmap 7.31 ( https://nmap.org ) at 2017-01-19 14:53 CST
    Nmap scan report for 10.54.42.11
    Host is up (0.00058s latency).
    PORT STATE SERVICE
    443/tcp open https
    | ssl-enum-ciphers:
    | TLSv1.0:
    | ciphers:
    | TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (secp256r1) - A
    | TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (secp256r1) - A
    | TLS_DHE_RSA_WITH_AES_256_CBC_SHA (dh 1024) - A
    | TLS_DHE_RSA_WITH_AES_128_CBC_SHA (dh 1024) - A
    | TLS_RSA_WITH_AES_256_CBC_SHA (rsa 2048) - A
    | TLS_RSA_WITH_AES_128_CBC_SHA (rsa 2048) - A
    | TLS_RSA_WITH_3DES_EDE_CBC_SHA (rsa 2048) - C
    | TLS_RSA_WITH_RC4_128_SHA (rsa 2048) - C
    | TLS_RSA_WITH_RC4_128_MD5 (rsa 2048) - C
    | compressors:
    | NULL
    | cipher preference: server
    | warnings:
    | 64-bit block cipher 3DES vulnerable to SWEET32 attack
    | Broken cipher RC4 is deprecated by RFC 7465
    | Ciphersuite uses MD5 for message integrity
    | Key exchange (dh 1024) of lower strength than certificate key
    |_ least strength: C
    MAC Address: 12:34:56:78:9A:BC (Unknown)
    Nmap done: 1 IP address (1 host up) scanned in 0.45 seconds

### The math behind Diffie-Hellman

The following is the math that is used by the Diffie-Hellman key exchange protocol to calculate a key. This shows that the two values needed (c and d) to calculate the key are never shared; therefore, the protocol is not susceptible to a man-in-the-middle intercepting the key or all the values needed to calculate it.

Alice picks two prime numbers g and p and shares them with Bob. Alice then picks a secret number c and calculates A = gc mod p. And Alice shares the number A with Bob. Bob then picks his own secret number d and calculates B = gd mod p. And Bob shares the number B with Alice. Alice takes B and calculates kA = Bc mod p. And Bob takes A and calculates kB = Ad mod p.

```
A = gc mod p
B = gd mod p
kA = Bc mod p
kB = Ad mod p
Since B = gd mod p
Bc mod p = gdc mod p
Since A = gc mod p
Ad mod p = gcd mod p
Therefore, kA = kB
```

Any third party observer will be unable to derive the shared key.
