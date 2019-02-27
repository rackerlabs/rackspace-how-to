---
permalink: configure-apache-for-ssl-termination-on-a-cloud-load-balancer/
audit_date:
title: Configure Apache for SSL termination on a Cloud Load Balancer
type: article
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-01-17'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Implementing SSL termination on a load balancer enables multiple servers to receive both encrypted and unencrypted traffic.
For Apache&reg; web server nodes, distinguishing between the two requires you to filter the `X-Forwarded-Proto` HTTP header 
by using the `RequestHeader` directive in the protocol’s respective `VirtualHost` block, as shown in the following example:

    <VirtualHost *:80>
        RequestHeader set X-Forwarded-Proto "http"
        …
    </VirtualHost>

    <VirtualHost *:443>
        RequestHeader set X-Forwarded-Proto "https"
        …
    </VirtualHost>

To encrypt all traffic, you must add a rewrite rule within the HTTP `VirtualHost` block, as shown in the following example:

    <VirtualHost *:80>
        RequestHeader set X-Forwarded-Proto "http"
        
        RewriteEngine On
        RewriteCond %{HTTP:X-Forwarded-Proto} !https
        RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI} [R,L]
        …
    </VirtualHost>
