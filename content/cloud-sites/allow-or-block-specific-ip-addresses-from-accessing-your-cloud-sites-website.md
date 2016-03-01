---
node_id: 4153
title: Allow or block specific IP addresses from accessing your Cloud Sites website
type: article
created_date: '2014-07-22'
created_by: Rackspace Support
last_modified_date: '2015-10-28'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

Because of the unique hosting environment of Cloud Sites, a slight
addition to the code used for the **Allow/Deny** feature is required.

In Cloud Sites, the requesting IP address coming into a server is the IP
address of our load balancing server instead of the visitor's IP
address. This means that limiting access by IP address through the
**.htaccess** file becomes problematic. To solve this problem, we
provide an environment variable called **X-Cluster-Client-Ip** that
includes the visitor's IP address.

In the **.htaccess** file that contains your rules, insert the following
code.

### Allow only a certain IP addresses

    Require all denied
    allow from env=allowclient
    SetEnvIf X-Cluster-Client-Ip 000.000.000.000 allowclient

**Note**: The preceding example is formatted for Apache 2.4. If using
2.2, replace **Require all denied** with **order deny,allow | deny from
all**.

### Allow only a certain IP address when your site is using SSL

    Require all denied
    allow from env=allowclient
    SetEnvIf X-FORWARDED-FOR ^000.000.000.000$ allowclient

**Note**: The preceding example is formatted for Apache 2.4. If using
2.2, replace **Require all denied** with **order deny,allow | deny from
all**.

You can also use the environmental variable **HTTP:X-Forwarded-For **for
the **Allow Only **feature via SSL.

### Allow only a certain IP address with **HTTP:X-Forwarded-For**

    RewriteEngine On
    RewriteCond %{HTTP:X-Forwarded-For} 000\.000\.000\.000
    RewriteRule .* - [F]

Replace **000.000.000.000** with your IP address, which allows only your
IP address to access your site. You can then develop your site without
restrictions. **You can repeat line 1 to allow multiple IP addresses.**

### Deny one or more IP addresses

    Require all granted
    Deny from env=DenyAccess
    SetEnvIf X-Cluster-Client-Ip "^000\.000\.000\.000" DenyAccess

**Note**: The preceding example is formatted for Apache 2.4. If using
2.2, replace **Require all granted | Deny from env=DenyAccess** ****
with **Order Allow,Deny | Deny from env=DenyAccess | Allow from all**.

### Deny one or more IP addresses when your site is using SSL

    Require all granted
    Deny from env=DenyAccess
    SetEnvIf X-FORWARDED-FOR "^000\.000\.000\.000" DenyAccess

Replace **000\\.000\\.000\\.000** with the IP address that you want to
deny. This denies the IP address or addresses access to your site. **You
can repeat line 1 to deny multiple IP addresses.**

**Note**: The preceding example is formatted for Apache 2.4. If using
2.2, replace **Require all granted | Deny from env=DenyAccess** with
**Order Allow,Deny | Deny from env=DenyAccess | Allow from all**.

**Important:** Implementing this code might prevent images from loading
on your website. To address this issue, you can add the following code
do your **.htaccess** file:

    <FilesMatch "\.(gif|jpe?p|png)$">
    Require all denied
    allow from env=allowclient
    </FilesMatch>

**Note**: The preceding example is formatted for Apache 2.4. If using
2.2, replace **Require all denied** with **order deny,allow | deny from
all**.
