---
permalink: getting-started-with-cloud-sites-creating-sub-domains-andor-domain-aliases/
audit_date:
title: Getting Started With Cloud Sites - Creating Sub-domains and/or Domain Aliases
type: article
created_date: '2011-03-23'
created_by: Rackspace Support
last_modified_date: '2016-06-16'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

We've already discuss how to create a new domain, but what about
creating a subdomain? Better yet, how do I create an alias? Let's
discuss how this can be done through your Cloud Control Panel.

### What is a Subdomain?

In the DNS hierarchy a subdomain is any part of the URL that precedes
the second-level domain name and the top-level domain name. When
looking at the domain **example.com**, ".com" is the top-level domain and
"example" is the second-level domain.

A subdomain is anything beyond that second-level domain. That means
**www.example.com** describes the "www" subdomain of **example.com** (making
"www" the third-level domain in the example).

Subdomains aren't limited to just one level.  You can have a "photos"
subdomain, making **photos.example.com**.

Note that Cloud Sites only automatically adds "www" when a site is
created with a second-level domain name (**example.com**). Unfortunately,
Cloud Sites does not support "www" as a fourth-level domain; for
example: www.photos.example.com.

### How Do I Create a Subdomain?

-   Log into the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com)
-   Navigate to **Hosting > Cloud Sites**
-   Enter the subdomain and domain name into the **Domain Name** text
    box (i.e. subdomain.yourdomain.com)
-   Click **Add New Site**
-   Choose the length of time for which you want to purchase the domain
    name (only if you haven't already registered the domain). Click
    **Next Step**
-   Select a Hosting Plan and click **Next Step**
-   Choose any Additional Options and click **Next Step**
-   Review your selections and then click **Next Step** to finalize the
    creation of the subdomain

And that's it! You've added your first subdomain. You may have already
notices, but adding a subdomain follows the same exact steps you would
take if you were adding a regular domain name. The process is the same
with the only difference being that you entered a subdomain in the
Domain Name text box to be created. Next, let's take a look at how you
can create a domain alias.

### How to Create a Domain Alias

Pointing a domain or a subdomain to an existing website is made very
easy on Cloud Sites when you follow these simple directions:

-   Log into the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com)
-   Navigate to **Hosting > Cloud Sites**
-   Under **Add a New Website** select the Site Owner from the
    pull-down menu. The Site Owner needs to be the same client account
    as the domain to which you are going to alias
-   Type the domain or subdomain in the **Domain Name** text box and
    click **Add New Site**
-   On the next page choose to either register the domain, or if you
    already own it, simply indicate that you would like to "Set up the
    website without registering the domain." Click **Next Step**
-   Scroll down until you see the **Other Options** tab. Once there,
    select **Point to another website (alias)** and click **Next Step**
-   Select the website you want to point to from the list, and click
    **Next Step**


You've now added a domain alias. The domain
alias will now direct traffic to the domain you selected.

For additional information on Rackspace Cloud DNS, see [Rackspace Cloud DNS overview](/how-to/rackspace-cloud-dns-overview).

### Next section

[Managing Cloud Sites Databases - MySQL Databases](/how-to/rackspace-cloud-sites-essentials-mysql-databases)
