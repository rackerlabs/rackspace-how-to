---
permalink: manually-enable-auto-updates-on-rhel-and-centos-public-cloud-servers/
audit_date: '2018-10-26'
title: Manually enable automatic updates on RHEL and CentOS Public Cloud Servers
type: article
created_date: '2018-10-26'
created_by: Rackspace Support
last_modified_date: '2018-10-26'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Keeping your servers up to date with security fixes can help you avoid server
compromises. While package updates can't prevent all security breaches,
keeping your servers up to date should be a key component of your security
procedures.

This article describes how to enable automatic updates on your Red Hat
Enterprise Linux (RHEL) and CentOS Rackspace Public Cloud Servers to ensure that
crucial updates are installed and current.

### RHEL 6 and CentOS 6

Use the following steps to enable automatic updates on your
RHEL 6 and CentOS 6 Rackspace Public Cloud Servers:

1. After connecting to your RHEL 6 or CentOS 6 server, run the following
   command:

       yum -y install yum-cron

2. To view the `yum-cron` configuration, use the following command:

       vi /etc/sysconfig/yum-cron

   You can also open the file in a text editor.

   By default, the configuration should be set to download and install the
   updates.

3. *(Optional)* To set up notifications for automatic package updates, such
   as time of installation, packages installed, and errors during
   installation, edit the line beginning with `MAILTO=` to add an email
   address to receive notifications. Then, save the file.

   
