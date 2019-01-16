---
permalink: configuring-apache-for-ssl-termination-on-a-cloud-load-balancer
audit_date:
title: Configuring Apache for SSL Termination on a Cloud Load Balancer
created_date: '2019-01-15'
created_by: Shaun Crumpler
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Implementing SSL termination on a load balancer allows multiple servers to receive both encrypted and unencrypted traffic.
For Apache web server nodes, distinguishing between the two requires filtering the X-Forwarded-Proto HTTP header using the RequestHeader directive in the protocol’s respective VirtualHost block:
<VirtualHost *:80>
    RequestHeader set X-Forwarded-Proto "http"
    …
</VirtualHost>

<VirtualHost *:443>
    RequestHeader set X-Forwarded-Proto "https"
    …
</VirtualHost>

Encrypting all traffic requires a rewrite rule within the HTTP VirtualHost block:
<VirtualHost *:80>
    RequestHeader set X-Forwarded-Proto "http"

    RewriteEngine On
    RewriteCond %{HTTP:X-Forwarded-Proto} !https
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R,L]
    …
</VirtualHost>
