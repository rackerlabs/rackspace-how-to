---
node_id: 307
title: Connecting to CloudFiles
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

Rackspace Cloud Servers can connect to Cloud Files without
bandwidth charges when the server and the Cloud Files account are in the
same data center. This connection is made by using the internal IP
address that your server comes with on the internal Rackspace network,
ServiceNet.

If you are not familiar with Cloud Files, see the product
information at
[www.rackspace.com/cloud/cloud\_hosting\_products/files/](http://www.rackspace.com/cloud/cloud_hosting_products/files/).

To view or download the Cloud Files API documentation, go to the
[Cloud Files Developer
Guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide).
You can also access the documentation and some code samples from the
[Cloud Files Quick
Start](https://developer.rackspace.com/docs/cloud-files/getting-started/).
Code samples are available for PHP, Python, and Java.

To connect, you must use the internal network host name. The host
name is the Cloud Files storage URL with **snet-** prepended to it. Be
aware that even though you are not chared for bandwidth when you use
ServiceNet to connect, you are still charged for requests and
storage.

You can locate your Cloud Server data center in the following
ways:

-   [Cloud Control Panel](https://mycloud.rackspace.com/) <span>&mdash;On the
    main Cloud Files page in the Control Panel, locate your Cloud Files
    data center in the **Region** column.
-   Through the API &mdash; Your Cloud Files data center is located in
    the storage URL that is returned when you authenticate to
    Cloud Files. For more information, see [<span>Retrieving the
    Authentication
    Token](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#document-getting-started/authenticate).
