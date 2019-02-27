---
permalink: secure-cloud-files-and-cdn-urls/
audit_date: '2019-02-20'
title: Secure Cloud Files and CDN URLs
type: article
created_date: '2019-02-11'
created_by: Rackspace Community
last_modified_date: '2019-02-20'
last_modified_by: Cat Lookabaugh
product: Cloud Files
product_url: cloud-files
---

This article covers information about Cloud Files and its access to a content delivery network (CDN).

### HTTP or HTTPS access to Cloud Files containers

You can access every Cloud Files container through HTTP or HTTPS.

In the Cloud Control Panel, select **Storage > Files**, click the gear icon for the container,
and select **View All Links**, which displays the following CDN links:

- HTTP: http://cdc4c16471588d4846bf-cc339a649709710bbecd3db1e126ec2b.r3.cf1.rackcdn.com

- HTTPS: https://ac3c779acb946eaf4819-cc339a649709710bbecd3db1e126ec2b.ssl.cf1.rackcdn.com

- Streaming: http://b0c42c537095921be66c-cc339a649709710bbecd3db1e126ec2b.r3.stream.cf1.rackcdn.com

- iOS Streaming: http://09ac235af93af07922d6-cc339a649709710bbecd3db1e126ec2b.iosr.cf1.rackcd

If you find that the HTTP URL is too long, you can shorten it with a CNAME pointing to that URL.

Because the CNAME technique does not work for HTTPS, you can set up Cloud Files with access to a CDN 
with a secure delivery option. Optionally, you might want to self-host the content.

The HTTPS link is a shared certificate that you can use to encrypt the connection between the client
requesting the object and the Akamai&reg; edge-node to which the client is connecting.

The HTTPS link is useful if the data transmitted has sensitive information in it.
The cross-origin resource sharing standard (CORS) is also supported, but it solves
an entirely different problem. Specifically, CORS solves the access problem of asynchronous requests
by a browser that browses a website with a domain that is different from the Cloud Files link.
For more information on this topic, see [the Enable CORS site](http://enable-cors.org) or
the Cloud Files [API documentation](https://developer.rackspace.com/docs/cloud-files/v1/use-cases/public-access-to-your-cloud-files-account/#cors).

### Access CDN-enabled objects

Cloud Files does not support access control on CDN-enabled objects.

To access those objects, you should self-host the files on a server and configure
[Rackspace CDN](https://developer.rackspace.com/docs/cdn/v1/getting-started/),
which allows you to restrict access based on Internet Protocol (IP) address ranges.

You should not daisy chain CDN services, but you can set up a Rackspace CDN configuration that has
an origin as a Cloud Files container. This allows you to keep your files in a container and utilize
Rackspace CDN's restriction feature.
