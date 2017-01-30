---
permalink: rackspace-cdn-object-is-not-being-cached/
audit_date:
title: Object is not being cached
type: article
created_date: '2016-01-19'
created_by: Rackspace Support
last_modified_date: '2016-01-25'
last_modified_by: Catherine Richardson
product: Rackspace CDN
product_url: rackspace-cdn
---

When an object that is defined in the origin and in the appropriate path
is not cached by Akamai, you should contact Rackspace Support for
assistance.

However, the following information, which is extracted from several
articles from Akamai, provides some insight into why this situation
might occur.

### Most common reason why cacheable objects are not cached on Akamai

The most common reason that cacheable objects are not cached is the
presence of a **Vary** header in the origin server response.

The **Vary** header informs Akamai servers that the content of the
object might differ based on some characteristic, such as the client's
specified user-agent or language, and is therefore not cacheable. This
behavior is valid based on RFC HTTP/1.1.

However, if the **Vary** header has a single value of **Vary:
Accept-Encoding**, and the response is accompanied by
**Content-Encoding: gzip**, then Akamai caches the content. If the
**Vary** header contains any values other than **Accept-Encoding**,
Akamai does not cache the object.

This restriction is necessary to prevent different versions of content
from being cached and then later served to end users for whom the
content is not intended. For example, this prevents pages in one
language from being cached and served to users of another language, or
pages designed specifically for a certain browser from being cached and
then served to users on another browser.

An **Accept-Encoding** value to the **Vary** header is the exception to
this restriction only when it relates to serving the object compressed.
Because compression does not change the content of the object (only its
size for transfer), an object that varies only by its compression can be
safely cached.



### Other common reasons why objects are not cached

In addition to the presence of a **Vary** header in the response,
following are the most prevalent reasons why objects that are specified
to be cached are not cached on an edge server:

-   Another configuration setting overrides the cache setting.
-   Query strings are making your objects unique.
-   The request is a **POST** request.
-   The origin server returns a 302 redirect.
-   The origin server sends no-store **Cache-Control** and **Expires**
    headers and the configuration is setup to honor **Cache-Control**
    and **Expires** headers.
-   The origin server is sending an **Edge-Control** header
    specifying no-store.
-   The **Content Length** header from the origin does not match the
    actual content length.
-   The **Date** header from the origin does not represent meaningful
    time because the origin clock is not synchronized.
-   The **Age** header from the origin is inconsistent.
-   Authentication or revalidation settings require all objects to check
    freshness with the origin every time.
-   The object is Edge Side Included (ESI)-processed or is a fragment
    from an ESI include.
-   The ETag is mismatched from the origin.
-   ESSL is used, and even though a request goes to the same virtual
    IP (VIP) address, it resolves to a different physical IP address
    behind the VIP. As a result, it appears that the VIP doesn't have it
    in cache.
