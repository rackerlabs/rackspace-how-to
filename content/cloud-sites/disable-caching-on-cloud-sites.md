---
permalink: disable-caching-on-cloud-sites/
audit_date:
title: Disable caching on Cloud Sites
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2015-05-06'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

This article provides methods for bypassing the cache when delivering
content from your website. You might want to bypass the cache if you
don't want your image delivery to be accelerated or if you want to force
a freshness check on every request.

**WARNING:** Use these methods with care. Each one will result in slower
performance on your site for end users and, in some cases, will increase
your bandwidth fees. Use them only if you need them, and only for the
files you need them for.

### Disable caching by using .htaccess (Linux technology only)

    <IfModule mod_php5.c>
              <IfModule mod_headers.c>
                   <FilesMatch "\.(ico|flv|jpg|jpeg|png|gif|swf|mpeg|wav|mp3|wma|mpg|css|js)$">
                       Header set Cache-Control "no-cache"
                   </FilesMatch>
              </IfModule>
    </IfModule>


### Disable caching by using web.config (Windows technology only

    <configuration>
              <system.webServer>
                   <httpProtocol>
                        <customHeaders>
                             <add name="Cache-Control" value="no-cache" />
                        </customHeaders>
                  </httpProtocol>
              </system.webServer>
    </configuration>
