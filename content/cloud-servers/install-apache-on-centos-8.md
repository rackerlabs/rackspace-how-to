---
permalink: install-apache-on-centos-8/
audit_date: '2020-07-28'
title: 'Install Apache on CentOS 8'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-28'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

The Apache&reg; HTTP Server, colloquially called Apache, is a free and open-source cross-platform web server software.
Apache is an extremely popular web service that operates a large portion of the websites on the internet. This article
describes how to install Apache and open your server’s firewall to allow web traffic through.

### Prerequisites

You need a Linux&reg;-based server running CentOS&reg; 8.

### Install Apache

Perform the following steps to install Apache:

1. Run the following command to install the Apache web service, which serves as a base for your application:

       dnf -y install @httpd

2. Run the following commands to configure Apache to start on boot and update the software firewall:

       systemctl enable --now httpd
       firewall-cmd --add-service={http,https} --permanent
       firewall-cmd --reload

You should now be able to navigate your server's IP address in a browser and see the Apache test page to
confirm you’ve configured the server correctly. This page also displays useful information to configure Apache to
serve your custom website or application.
