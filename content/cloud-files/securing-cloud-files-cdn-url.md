---
permalink: securing-cloud-files-cdn-url
audit_date:
title: Securing Cloud Files CDN URL
created_date: '2019-02-11'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

Every Cloud Files object (file) can be accessed through HTTP or HTTPS.

In the Cloud Control Panel, click on Storage > Files, and then click the gear icon for the container and select View All Links. Following is an example of the CDN links that display:

HTTP: http://cdc4c16471588d4846bf-cc339a649709710bbecd3db1e126ec2b.r3.cf1.rackcdn.com

HTTPS: https://ac3c779acb946eaf4819-cc339a649709710bbecd3db1e126ec2b.ssl.cf1.rackcdn.com

Streaming: http://b0c42c537095921be66c-cc339a649709710bbecd3db1e126ec2b.r3.stream.cf1.rackcdn.com

iOS Streaming: http://09ac235af93af07922d6-cc339a649709710bbecd3db1e126ec2b.iosr.cf1.rackcd

If you find that the HTTP URL is too long, you may then shorten it with a CNAME pointing to that, though if you would like to use HTTPS, this will not work. 

In such a case you may then consider setting up Rackspace CDN with one of those secure delivery options provided in the article that you linked to. Though you would most likely want to self-host the content then.

Well the HTTPS link is a shared certificate. It can be used to encrypt the connection between the client requesting the object and the Akamai edge-node the client is connecting to. 

This is useful if the data transmitted has sensitive information in it.
CORS is also supported, but it solves an entirely different problem, namely an access problem when it comes to asynchronous requests by a browser that browses a website with a domain that is different from the Cloud Files link - You may find more information on this at this page: http://enable-cors.org/ or our API documentation: https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#cors

If what you seek is access control on CDN enabled objects, it will not be supported by Cloud Files. 

In that case your best bet is to self-host the files on a server and configure Rackspace CDN which allows for restrictions based on IP ranges.

I tried this so I know that it works (but it is never recommended to daisy chain CDN services): you may even set up a Rackspace CDN configuration that has an origin as a Cloud Files container thus allowing you to keep your files in a container and utilize Rackspace CDN's restriction feature.
