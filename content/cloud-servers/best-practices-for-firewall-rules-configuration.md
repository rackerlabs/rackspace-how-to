---
permalink: best-practices-for-firewall-rules-configuration/
audit_date:
title: Best practices for firewall rules configuration
type: article
created_date: '2014-12-03'
created_by: Rose Contreras
last_modified_date: '2016-06-20'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

When you modify a firewall configuration, it is important to consider potential security risks to avoid future issues. Security is a complex topic and can vary from case to case, but this article describes best practices for configuring perimeter firewall rules.

### Block by default

Block all traffic by default and explicitly allow only specific traffic to known services. This strategy provides good control over the traffic and reduces the possibility of a breach because of service misconfiguration.

You achieve this behavior by configuring the last rule in an access control list to deny all traffic. You can do this explicitly or implicitly, depending on the platform.

### Allow specific traffic

The rules that you use to define network access should be as specific as possible. This strategy is referred to as the *principle of least privilege*, and it forces control over network traffic. Specify as many parameters as possible in the rules.

A layer 4 firewall uses the following parameters for an access rule:

- Source IP address (or range of IP addresses)
- Destination IP address (or range of IP addresses)
- Destination port (or range of ports)

As many parameters as possible should be specified in the rule used to define network access. There are limited scenarios where <code>any</code> is used in any of these fields.

### Specify source IP addresses

If the service should be accessible to everyone on the Internet, then *any* source IP address is the correct option. In all other cases, you should specify the source address.

It's acceptable to allow all source addresses to access your HTTP server. It's generally not acceptable to allow all source addresses to access your server management ports (22 for Linux SSH and 3389 for Windows RDP) or database (1433 for SQL Server, 1521 for Oracle, and 2206 for MySQL). Be as specific as practical about who can reach these ports. When it is impractical to define source IP addresses for network management, you might consider another solution like a remote access VPN as a compensating control to allow the access required and protect your network.

### Specify the destination IP address

The destination IP address is the IP address of the server that runs the service to which you want to allow access. Always specify which server (or group of servers) can be accessed. Configuring a destination value of `any` is discouraged, because doing so could create future issues, such as a security breach or server compromise for a protocol that you might not intend to use on a server that might be accessible by default.

### Specify the destination port

The destination port corresponds to the service that needs to be accessed. This value of this field should never be `any`. The service that runs on the server and needs to be accessed is defined, and only this port needs to be allowed. For example, allowing all ports will greatly impact the security of the server by allowing a malicious entity to perform a dictionary attack to guess the password, as well as execute exploits for any port and protocol that is configured on the server.

Avoid using too wide a range of ports. If dynamic ports are used, firewalls sometimes provide inspection policies to securely allow them through.

### Examples of bad configurations

This section describes bad examples of firewall rules, but also shows some alternative good rules to follow when configuring firewall rules.

`permit ip any any` - Allows all traffic from any source on any port to any destination. This is the worst type of access control rule. It contradicts both of the security concepts of denying traffic by default and the principal of least privilege. The destination port should be always specified, and the destination IP address should be specified when practical. The source IP address should be specified unless the application is built to receive clients from the Internet, such as a web server. A good rule would be `permit tcp any WEB-SERVER1 http`.

`permit ip any any WEB-SERVER1`  - Allows all traffic from any source to a web server. Only specific ports should be allowed; in the case of a web server, ports 80 (HTTP) and 443 (HTTPS). Otherwise, the management of the server is vulnerable. A good rule would be `permit ip any WEB-SERVER1 http`.

`permit tcp any WEB-SERVER1 3389` - Allows RDP access from any source to the web server. It is generally a bad practice to allow everyone access to your management ports. Be specific about who can access the server management. A good rule would be `permit tcp 12.34.56.78 3389 WEB-SERVER1` (where `12.34.56.78` is the IP address of the administrator's computer on the Internet).

`permit tcp any DB-SERVER1 3306` - Allows MySQL access from any source to the database. Database servers should never be exposed to the whole Internet. If you need database queries to run across the public Internet, specify the exact source IP address. A good rule would be `permit tcp 23.45.67.89 DB-SERVER1 3306` (where `23.45.67.89` is the IP address of the host on the Internet that needs access to the database). A best practice would be to allow database traffic over a VPN and not in clear text across the public Internet.

If you need help implementing these best practices, contact your Rackspace support team.
