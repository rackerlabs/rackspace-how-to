---
node_id: 1397
title: Content Caching for Cloud Load Balancers
type: article
created_date: '2012-05-21'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Mike Asthalter
product: Cloud Load Balancers
product_url: cloud-load-balancers
---

The Cloud Load Balancers product has a Content Caching feature that
stores recently-accessed files on the load balancer for easy retrieval
by web clients.

### How do I enable content caching?

Content caching can be enabled through our [Cloud Load Balancers
API](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/) or
the [Cloud Control Panel](https://mycloud.rackspace.com).

Content caching can be enabled or disabled for a load balancer in the
Cloud Control Panel by going to its details screen, scrolling down to
the Optional Features section, and clicking the pencil icon next to
Content Caching.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/lbcontentcache.png" width="360" />



### What are the benefits of content caching?

Content caching improves the performance of a web site by temporarily
storing data that was recently accessed. While it&rsquo;s cached, requests for
that data will be served by the load balancer instead of making another
query to a web server behind it.

The result is improved response times for those requests and less load
on the web server.



### What kind of files work well with content caching?

Content caching works well for files that don&rsquo;t change or that rarely
change. Most images and static content are good candidates for content
caching.

You don&rsquo;t want to cache files that would change regularly or would be
dynamically generated for different site visitors.

### Caching details



#### Is there a maximum file size that can be cached?

The maximum file size per cached item is 2 MB.



#### How long is content cached?

Up to 10 minutes, depending on the load and amount of traffic being
handled by the load balancer host.

If a cached file is requested shortly before it will expire, the load
balancer will retrieve a new copy of the file early to prevent the file
from being uncached during a period of heavy traffic.



#### Can I choose how long files will be cached?

No, not at this time. You cannot purge a file from the cache manually,
but it will be automatically removed when its cache time expires.



#### Do nodes share a cache?

No. Each node has its own cache, separate from other load-balanced
nodes.



#### Does cache carry over in a failover situation?

No. If a failover occurs the load balancer will retrieve a fresh copy of
a file from the failover host.

### File types

#### What file types are supported for content caching?

At this time the following file extensions are cached:

    .png
    .gif
    .jpg
    .jpeg
    .ico
    .wav
    .mp3
    .flv
    .mpeg
    .js
    .css
    .mp4
    .swf



#### Can I exclude specific file types?

Yes. Have your web server set the **Cache-Control** header to
**no-cache** for requests for the file types you don&rsquo;t want cached.

You can set this header in apache by adding a config block similar to
the following to your apache config:

    <FilesMatch "\.(ico|flv|jpg|jpeg)$">
        Header set Cache-Control "no-cache"
    </FilesMatch>

Replace the extensions in the &ldquo;ico|flv|jpg|jpeg&rdquo; section with the
extensions for which you want to bypass caching, making sure to put a
&ldquo;|&rdquo; character between each extension.
