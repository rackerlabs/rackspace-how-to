---
permalink: php-opencloud-sdk-errors-due-to-outdated-certificate-authority-list
audit_date:
title: SDK errors due to an outdated certificate authority list on Open Cloud
created_date: ‘2019-5-15'
created_by: Rackspace Community
last_modified_date:
last_modified_by: 
---

The Rackspace Cloud PHP software development kit (SDK), PHP-Opencloud, is built on Guzzle, which uses its own
certificate authority file, and the Rackspace Cloud, which recently rotated the Secure Socket Layer (SSL) certificate
for `identity.api.rackspacecloud.com`.

If the certificate authority file on your server is outdated, you might see an error similar to the following one:

    Fatal error: Uncaught exception 'Guzzle\Http\Exception\CurlException' with message '[curl] 60: [url]
    https://identity.api.rackspacecloud.com/v2.0/tokens'

To resolve this error, perform the following actions:

1. Find and replace Guzzle's certificate authority file. You might find the file
in **/var/www/www.website.com/site/library/apis/rollbarphp/vendor/guzzle/guzzle/src/Guzzle/Http/Resources/cacert.pem**.

2. Download the [updated certificate file](https://curl.haxx.se/ca/cacert.pem) and overwrite the Guzzle certificate.

If this does not resolve the issue, we recommend that you open an issue on this github repo: [https://github.com/rackspace/php-opencloud](https://github.com/rackspace/php-opencloud)
