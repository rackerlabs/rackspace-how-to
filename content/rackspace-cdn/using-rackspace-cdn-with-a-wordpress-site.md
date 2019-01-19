---
permalink: using-rackspace-cdn-with-a-wordpress-site
audit_date:
title: Using Rackspace CDN with a Wordpress Site
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Rackspace CDN
product_url: rackspace-cdn
---

We have three major characters on the board:
1. Wordpress
2. Rackspace Cloud Files
3. Akamai CDN

Wordpress is a PHP based blog-centric application that runs on a variety of web servers, most often Apache or nginx. Depending on server and application configuration, wordpress has a history of being a significant memory usage on servers. 
Rackspace Cloud Files are an independent, redundant cloud based solution for file storage. Containers are limited to 5GB per container, but you have an unlimited number of containers available to you. These files are not accessible directly from any server by default, however you can use CloudFuse to 'mount' the files to a server. Cloud files are fully accessible and manageable from our cloud API. Utilities like cloudfuse, cyberduck, and fireuploader have been developed to utilize our API to access the files. Each container can be published to Akamai's content distrobution network (CDN) on a per-container basis.
Akamai's CDN is a series of edge nodes (servers across the globe) that cache content from your server as it is requested on a geographical basis. The cached content is also paired with a time to live (TTL) that the edge node will automatically remove from its cache. Should the content need to be removed before the TTL, akamai has provided us with a PURGE operation, limited to 25 objects per day. This operation wipes all edge nodes of the file that have cached it. Due to being a global deployment, purging operations can take some time to propagate. 
Just to picture what is actually going on here, let's discuss the process from start to finish. 

1. You have content you want to publish to your wordpress, which we have connected to cloud files using W3 cache for wordpress. http://wp.tutsplus.com/articles/quick-tip-how-to-utilize-akamai-cdn-with-your-wordpress-site/
2. We upload to the container we are going to publish to the CDN using the Rackspace Cloud Control Panel and select cloud files->Select container
3. Upload the files, then make sure to publish the files to the CDN.
4. The rest is handled by your wordpress deployment.
5. Sit back and watch your bandwidth usage drop and your end user load speed improve by as much as 30%.
