---
permalink: force-ssl-on-your-php-site/
audit_date:
title: Force SSL on your PHP site
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-06-23'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

To force SSL on your PHP site, you can use the following code in a
**.htaccess** file:

    #Force SSL on entire site
    RewriteEngine On
    RewriteBase /
    RewriteCond %{ENV:HTTPS} !on [NC]
    RewriteRule ^(.*)$ https://(YOURDOMAIN)/$1 [R,L]

    #Force SSL on a specific directory
    RewriteEngine On
    RewriteBase /
    RewriteCond %{ENV:HTTPS} !on [NC]
    RewriteRule ^DIRNAME/(.*)$ https://YOURDOMAIN/DIRNAME/$1 [R,L]

