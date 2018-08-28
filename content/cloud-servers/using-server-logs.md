---
permalink: using-server-logs/
audit_date: '2018-08-28'
title: Using server logs
type: article
created_date: '2018-08-28'
created_by: Kate Dougherty
last_modified_date: '2018-08-28'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Checking your server logs can help you find out what error your website is
producing, why your site isn't loading as expected, and who is accessing your
site or server. This article discusses the most commonly used logs, where to
find them, and why you might want to review them.

You can find most server logs at **/var/log/SERVICE**. If you want to review a
server log, navigate to this directory and pull up a list of all of the logs
that are located there.

### Apache error logs

If you're running Apache&reg; as your web server and your website isn't loading
correctly, you might want to review the Apache error logs. You can find Apache
error logs at the following locations:

- CentOS: **/var/log/httpd/**
- Ubuntu&reg;: **/var/log/apache2/**

Apache server logs show you any errors that your site is experiencing.
To identify errors within the logs, look for the `Error` label. To identify
warnings, look for the `Warning` label.

### MySQL error logs

If your website isn't loading correctly and the Apache error logs don't reveal
a direct cause, you might be experiencing a MySQL issue. The Apache error logs
might allude to a MySQL issue if Apache is having difficulties connecting
to MySQL. To get more information, navigate to the **/var/log** directory and
review the MySQL error logs. You can find these logs at
**/var/log/mysqld.log** on most server operating systems.

### Server access logs

To see who is accessing your server or the Internet Protocol (IP) addresses
that are associated with failed logins, review the server access log. This log
shows you the IP addresses and users that are trying to access your server.

You can find this log at one of the following locations:

- **/var/log/auth.log**
- **/var/log/apache2/access.log**
- **/var/log/httpd/access.log**

This step is useful if you think that someone might be trying to force their
way into your server. If this is a concern, you can locate the IP address that
the user is coming from and then block it.

### Networking logs

Viewing networking logs is more complex because servers do not place this
information in a log format unless you specifically implement the
rules for this task.

As an alternative, you can use the [Rackspace
Intelligence](https://support.rackspace.com/how-to/rackspace-intelligence-faq/#top) monitoring tool. This tool enables you to set up a monitoring alert for
networking and view monitoring data in a graphical format.
