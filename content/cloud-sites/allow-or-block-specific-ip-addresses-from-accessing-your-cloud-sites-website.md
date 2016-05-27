---
permalink: allow-or-block-specific-ip-addresses-from-accessing-your-cloud-sites-website/
audit_date:
title: Control website access by IP address
type: article
created_date: '2014-07-22'
created_by: Rackspace Support
last_modified_date: '2016-05-18'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

Cloud Sites uses Apache 2.4 for its PHP environment. The use of Apache 2.4 simplifies how you block or allow access by IP address to your website compared to earlier releases of Cloud Sites.

### Allow only specific IP addresses

To block all visitors except a specific IP address, with an optional message for blocked visitors, run the following code in the **.htaccess** file that contains your rules:

    Require ip <ip address>
    ErrorDocument 403 "Some message you want to show blocked users"

The following example allows access to the site only for IP addresses 50.157.7.24 and 125.13.4.112, and blocks access from any other IP address:

    Require ip 50.157.7.24
    Require ip 125.13.4.112
    ErrorDocument 403 "This site can only be accessed within the network"

### Block only specific IP addresses

To block only specific IP addresses but allow other traffic through, run the following code in the **.htaccess** file that contains your rules:

    <RequireAll>
        Require all granted
        Require not ip <ip address>
    </RequireAll>

The following example allows access to the site for all traffic except IP addresses 46.148.22.18 and 83.222.214.165:

    <RequireAll>
        Require all granted
        Require not ip 46.148.22.18
        Require not ip 83.222.214.165
    </RequireAll>

This would allow access to the site for all trafic except IP address 46.148.22.18 and 83.222.214.165.

For more information, see the [Apache documentation about access control](https://httpd.apache.org/docs/2.4/howto/access.html).
