---
permalink: rackspace-cloud-sites-essentials-cloud-sites-technologies/
audit_date:
title: 'Rackspace Cloud Sites Essentials: Cloud Sites Technologies'
type: article
created_date: '2011-11-11'
created_by: Rackspace Support
last_modified_date: '2016-06-22'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

By now, we've learned that Cloud Sites is and easy to use, load-and-go
web hosting platform that uses the computing power of the cloud to keep
your websites online. In this article, we're going to take a look at the
different technologies behind this computing power running your
website(s).

### Run Linux or Windows

Behind Cloud Sites, cabinets full of both Linux servers and Windows
servers power the over 100,000 sites and applications we host for our
customers. Every Windows-based page is served from clusters built and
optimized especially for Windows, and every Linux-based page is served
from clusters built and optimized especially for Linux. We use advanced
Load-Balancing technologies to automatically detect the type of
technology you are running and route each request to the proper pool of
servers.

This is a great example of the power of cloud computing, since you no
longer have to make a hosting choice between Linux and Windows. Both
LAMP and .NET are included, allowing you to choose the technology you
need site by site.

Let's take a look in the [Cloud Sites Control Panel](http://manage.rackspacecloud.com) to see where you can specify which technology you would like your website(s) to operate with and how
to change this technology.

### Choose technologies for your site

1.  After you've logged into the Cloud Sites Control Panel, navigate to
**Hosting > Cloud Sites**.

2.  Click the domain name to which you would like to make technology changes.

3.  Click the **Features** tab.

4.  Click **Change Technology** in the **Technologies** section.

5.  Choose the **Site Technology** you would like your website to use.

6.  Click **Change Technology** to complete your change.

  **Note:** Please note that when changing your site's default
technology, this changes the IP for the site. If we are managing your
DNS, the changes will update automatically, but can take up to two hours
to take effect. If you are managing your own DNS, please update the IP
for you site. You can get the new IP on the **Domain** Tab.

### View your website features

There is a great method in the Control Panel to take a look at the
current Website features for your website. You can get to this after you
have logged in to the Cloud Sites Cloud Control Panel fairly quickly for
each of your domains.

1.  Navigate to **Hosting > Cloud Sites**

2.  Click on the **domain name** for which you would like to review its website features.

  After it opens, you will be on  the **General Settings tab** by default.

3.  Scroll down to **Website Features**.

Displayed under **Website Features** is a breakdown of your website's current
features including its currently enabled technologies, its number of
databases, and whether the Raw Logs are enabled or disabled. (Raw Logs
are disabled by default).

This concludes this article regarding Cloud Sites Web Technologies.
This article covered how to change your websites default technology and how to
view a summary of your websites features quickly. The next article will
discuss two of the most commonly talked about features on the Rackspace
Cloud Sites, managing your website through .htaccess (Linux) and/or
web.config (IIS, ASP/.NET).

### Next section

[Tips and Tricks for .htaccess and web.config](/how-to/rackspace-cloud-essentials-tips-and-tricks-for-htaccess-and-webconfig)
