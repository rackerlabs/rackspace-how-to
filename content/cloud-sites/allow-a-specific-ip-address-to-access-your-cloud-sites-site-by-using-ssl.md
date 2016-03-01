---
node_id: 585
title: Allow a specific IP address to access your Cloud Sites site by using SSL
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-07-23'
last_modified_by: Nate Archer
product: Cloud Sites
product_url: cloud-sites
---

Because of the unique hosting environment of Cloud Sites, an addition to
the code used for the **Allow only** feature via SSL is required.

In Cloud Sites, the requesting IP address coming into a server is the IP
address of our load balancing server instead of the visitor's IP
address. This means that limiting access by IP address through
**.htaccess** file becomes problematic. To solve this problem, we
provide an environment variable called **HTTP:X-Forwarded-For** that
includes the visitor's IP address.

In the **.htaccess** file that contains your rules, insert the following
code.

### Allow only a certain IP address

    RewriteEngine On
    RewriteCond %{HTTP:X-Forwarded-For} 000\.000\.000\.000
    RewriteRule .* - [F]

Replace **000\\.000\\.000\\.000** with your IP address. This allows only
your IP address to access your site, and is a great way to develop your
site without restrictions.

**Important:** Implementing this code might prevent images from loading
on your site. To address this issue, you can add the following code do
your **.htaccess** file:

    <FilesMatch "\.(gif|jpe?p|png)$">
    order deny,allow
    allow from env=allowclient
    </FilesMatch>
