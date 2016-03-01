---
node_id: 1315
title: Installing NGINX and PHP-FPM running on UNIX File Sockets
type: article
created_date: '2012-03-12'
created_by: Kevin Carter
last_modified_date: '2015-12-23'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

This is a guide on Installing NGINX and PHP-FPM, while running on UNIX
File Sockets for your Debian based system.

If this statement is making you wonder why you are here, you are either:

**A**- Intrigued

**B**- Google brought you to the wrong website.

If you happen to be in category B, I apologize. Please press back, and
try again. If you are in Category A then keep reading! I have some fun
things to share with you, and some suggestions for improving your NGINX
web server.

What is a snippet? A snippet is programming-speak for a small region of
code, and I will be referring to a few different snippets in this
article.

While this snippet below does not say a lot, it is what we are going
for. In this snippet you will see a much simplified process list for my
NGINX and PHP-FP
M processes.

```
root     17084  php-fpm: master process (/etc/php5/fpm/php-fpm.conf)
kevin    17100  \_ php-fpm: pool rackerua
```

### Next steps

[Installing NGINX and PHP-FPM - Preface](/how-to/installing-nginx-and-php-fpm-preface)
