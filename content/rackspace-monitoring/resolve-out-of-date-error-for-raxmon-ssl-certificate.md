---
permalink: resolve-out-of-date-error-for-raxmon-ssl-certificate/
audit_date: '2019-02-19'
title: Resolve out-of-date error for Raxmon SSL certificate
type: article
created_date: '2019-02-19'
created_by: Rackspace Community
last_modified_date: '2019-02-19'
last_modified_by: Cat Lookabaugh
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

This article shows you how to update the **cacert.pem** file manually to avoid
Secure Socket Layer (SSL) verification errors that you might see when viewing
or accessing monitoring entities by using the Raxmon client.

For example, when running `raxmon-entities-list`, you might see the following
error:

    ssl.SSLError: [Errno 1] _ssl.c:510: error:14090086:SSL routines:SSL3_GET_SERVER_CERTIFICATE:certificate verify failed

### Replace cacert.pem

Find and replace the Raxmon **cacert.pem** file with the following updated file:

[https://curl.haxx.se/ca/cacert.pem](https://curl.haxx.se/ca/cacert.pem)

The location of **cacert.pem** might vary based on the operating system you are
running. Typically, on Linux&reg; systems, the location is
**/usr/local/lib/python2.7/dist-packages/raxmon_cli/data/cacert.pem**.

After you have updated **cacert.pem**, you should be able to run the raxmon
commands without issue.

### Upgrade the Raxmon client

If you're not running Raxmon version 0.7.3 or later, which includes the
Certificate Authority (CA) certificate, upgrade your client by running the
following command:

    sudo pip install -U rackspace-monitoring-cli
