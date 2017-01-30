---
permalink: cloud-sites-php-op-code-cache/
audit_date:
title: Cloud Sites PHP Op-code Cache
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2011-09-07'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

We will be introducing an op-code cache on our PHP based web nodes.
Normally, PHP files have to be read and parsed for each request before
they are executed. This processing time gets longer the more complex
your site is. The cache temporarily stores the result of this step so it
may be used for further requests eliminating processing overhead and the
associated resource usage.

Our cache is based on XCache, however we will be using just the
code-caching portion. If your application has native support for XCache,
it will not be able to take advantage of it. Direct user access will not
be supported.

We have tested and ensured compatibility with a very wide variety of
common applications and code. Some applications may still exhibit
behaviors like a blank white page or reporting errors. If the cache is
suspected for the cause of the errors, it can be disabled in the
.htaccess file with the following:

    php_flag xcache.cacher 0

If the cache ends up not being the problem, please remove the entry to
ensure you are getting the benefits of the cache.

