---
permalink: process-php-on-html-pages-or-other-pages-on-cloud-sites/
audit_date:
title: Process PHP on HTML pages or other pages on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

You can cause PHP to be processed on HTM and HTML pages by setting those
extensions to be served by the PHP handler. You can enable PHP
processing on **.htm** and **.html** files in your **.htaccess** file
with the following directives:

    AddHandler application/x-httpd-php php htm html
    AddType text/html php

Following the preceding example, if you wanted to process PHP on files
with the **.test** extension, you would use the
following code:

    AddHandler application/x-httpd-php php test
    AddType text/html php

You can find more information about `AddHandler` and `AddType` on
[Apache's website](http://httpd.apache.org/docs/2.0/mod/mod_mime.html).

**Note**: We recommend using just the **.php** extension for PHP pages.
