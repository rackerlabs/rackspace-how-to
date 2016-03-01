---
node_id: 4560
title: Rackspace CDN edge rules
type: article
created_date: '2015-02-11'
created_by: Megan Meza
last_modified_date: '2016-01-21'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

Rackspace CDN \[[product
page](http://www.rackspace.com/cloud/cdn-content-delivery-network)\]
enables you to create rules for content served over the content delivery
network (or CDN). You create the rules after you [create the Rackspace
CDN
service](/how-to/create-a-rackspace-cdn-service).
Edge rules are a set of policies that tell the CDN how to handle your
traffic. They are called "edge rules" because these policies are applied
at the edge, meaning that you don't need logic on your web server to
enforce this behavior. Rackspace currently supports three types of edge
rules:  caching rules, origin rules, and restrictions. Each of these
rule types is covered in more detail below.

### Caching rules

Caching rules control the TTL for your site's content. Setting the TTL
for content tells the edge servers how long to cache content before
checking the origin (the web server) for a fresh copy of the content. We
recommend using low TTL for content that changes frequently and a higher
TTL (for example, 24 hours) for more static content, like images.

For example: a user sets a TTL of three hours for some content that she
updates every hour. The edge server serves the content from a cache for
the three hour period without communicating with the origin server. When
the user updates the content, the updates are not seen by her website
visitors until the end of the three-hour period.

**Warning:** If your site has dynamic content or uses cookies to alter
the experience per visitor, set that content's TTL to 0 (zero) seconds.
You can still give your static content the higher TTL while setting the
rest of your content's TTL to 0. For sites with dynamic content, your
rules might be set up as follows:

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CachingRulesExample_2_0.png" width="683" height="192" />

**Note:**  If no TTL is set, Rackspace CDN sets default TTL values for
your content as follows:

-   Error responses are cached for 10 seconds.
-   Cache redirect responses are not cached.
-   If you do not set up any caching rules, all content is cached for
    1 day.

### Origin rules

Origin rules are used when you need to pull content from two or more
origins (web servers, load balancers, etc) for the same CDN service.
 For example, all your images may be stored in a Cloud Block Storage
volume attached to one server, while your web code lives on another
server.  You must create an origin rule in order to add an origin to an
existing CDN Service.  In other words, you cannot create an additional
origin for a service without telling the CDN when to route to that
origin.

Default caching rules listed above apply to all origins.

To setup a new origin, begin by clicking on the **Add Origin** link on
the Details page for your CDN service.  Get started with your origin
rule for your new origin by giving an IP or domain for that origin.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%201.43.49%20PM.png" width="435" height="181" />

**Tip**:  Rackspace recommends that customers use domains to identify
their origins when possible, as IP addresses can change over time.  When
entering your IP address or origin domain, you do NOT need to enter
**http://**.

Once you have identified your new origin, you must tell the service when
you want to fetch content from that origin.  This can be done by
specifying a content path.  For example, if you want all of your images
requested from the new origin, you will set the path to **/images/\***.
 With this rule, any time your your domain gets a request that contains
"/images/" in the path, the CDN will fetch that content from your new
origin if it can't be found on the edge.

**Tip**: When using a path to set rules, a wildcard is necessary.  For
example, **/images/** is not a valid path, but **/images/\*** is a valid
path.

**Warning**:  When adding origins to a service, you should always check
that your origin can accept traffic from the domain listed in your CDN
Service. For example, if your CDN service has a domain of
cdn.customer1.com, you may need to alter your server's .htaccess file to
allow traffic for that domain.

**Note:** Requests are passed to the origin using the original hostname
in the header. If your CDN domain is
[cdn.mysite.com](http://cdn.mysite.com) and the origin is
[mysite.com](http://mysite.com), you might expect that the CDN would
change the hostname to [mysite.com](http://mysite.com) when fetching
from the origin. However, that is not the case.

### Restrictions

Rackspace CDN enables you to specify restrictions based the following:

-   Referrer: specifies the HTTP host from which requests must come.
-   Geography: specifies the geography to which requests are allowed or
    from requests are restricted.
-   Client IP address: specifies a single IPv4 or IPv6 address to which
    the restriction applies.  Note: Classless Inter-Domain
    Routing (CIDR) or network ranges are currently not supported.

Use the **Add Rule** button in the Restrictions area to create a
restriction.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%202.23.56%20PM.png" width="740" height="193" />

Choose the **Type** of restriction that you want to define. Use
**Access** to indicate whether you want to **Allow** or **Block**
requests.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%202.24.57%20PM.png" width="446" height="269" />

#### Referrer restrictions

Referrer restrictions allow customers to limit access to their site&rsquo;s
content by checking the *referrer header* of the incoming request. Users
typically implement this type of access control to prevent their images,
videos, and other content from being linked to from other sites. For
example, a malicious user can check the source code for your site
**www.yoursite.com** and see that one of your car images has the source
**/images/cars/smartcar.png**. That user could then create a URL from
your domain, **www.yoursite.com/images/cars/smartcar.png**, and
reference that URL in their own website code. As a result, you get
charged for usage from another website, and in some cases, those charges
can really add up.

To protect your images or other files, you can implement *referrer
restrictions*. To set this up, Rackspace needs two basic pieces of
information:

-   The *referrer* tells the CDN what it should expect in the referrer
    header in the request.
-   The *path* tells the CDN which content should enforce the
    restriction.

To implement multiple Referrer domains to a single path, you can use a
space to separate the list of domains that you want to have access in
the **Referrer** field. Following is an example:

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Screen%20Shot%202015-10-02%20at%201.46.58%20PM.png" width="407" height="247" />

**Note**: Rackspace does not recommend implementing referrer
restrictions for an entire domain.

For the referrer information, most browsers insert the referrer header
automatically for every request. For example, if an image is requested
from your site, the browser automatically inserts the header
as **www.yoursite.com**. If your images are being requested from another
site, the browser inserts the referrer header of that site (for example,
**www.malicioussite.com**) into the request. The CDN verifies that this
referrer header does not match the restriction that you set up and
denies the request. In this case, you would have put www.yoursite.com
into the **Referrer** field.

**Note:** When implementing referrer restrictions, you specify which
referrer headers to *allow*. Requests with all other referrer headers
are denied access.

**WARNING**: Some browsers might not insert a header automatically. When
referrer restrictions are enabled, requests without a referrer header
are denied by the CDN. Rackspace recommends using a test domain (for
example, **test.yoursite.com**) to test all rules before implementing
them on your production domain.


#### Geography restrictions

Rackspace CDN allows you to restrict content based on geographical
regions. See [Rackspace CDN geography
mapping](/how-to/rackspace-cdn-geography-mapping)
for a list of the Rackspace CDN geographical regions and the countries
and territories within them.

#### IP address restrictions

Rackspace CDN allows you to restrict content by specifying the IP
address to which the retrictions applies.

### Rule set up

No matter what type of edge rule you create, the concepts in the
following sections apply.

#### Path information

Each type of edge rule is enforced based on a path. This path tells the
network which portion of content should enforce a rule. This path
directly relates to the structure of your files on your origin server
(or web server). If you have content stored in the **/logos** directory
on your server, you can apply a rule to that content by setting the path
to **/logos/\***.

NOTE:  If you want rules to apply to all content with a directory
(including subdirectories), you must include a wildcard (\*) after the
path. Using the path **/logos/\*** tells the network to apply your rule
to anything with **/logos** in the path. If your path is set to
**/logos/\***, the rule applies to all files in that directory,
including files in different subdirectories, such as
**/logos/partnerA/image.jpg** and **/logos/partnerB/image.png**.

#### Rule Ordering

Users commonly create multiple rules with the same rule type. For
example, when setting up caching rules, you may want one TTL for static
content, and another TTL for dynamic content. When creating multiple
rules within the same rule &ldquo;type&rdquo;, the order of your rules matters.

To properly enforce your rules, they must be ordered from least specific
to most specific. For example, your least specific caching rule is the
**Catch All TTL**, which applies a TTL of 0 seconds to your entire site,
identified by the  **/** **** path. Your most specific rule is the
**.png** rule, which applies a TTL of 3 days to all files that have the
**.png** extension, and which are identified by the path **.png**.

Your least specific rules must appear first in the list of rules in your
control panel, and the most specific rules must appear last in this
list. If your rules are not ordered correctly, you can address this by
deleting your existing rules and recreating them in the proper order.

Use these examples to help you plan your list of rules. These rules are
in order from least specific to most specific.

-   whole-site wildcard, such as \`/\*\`
-   URL path, such as \`/images/\*\`
-   detailed URL path, such as \`/images/logos/partnerA/\*\`
-   file extension, such as \`/\*.png\`


