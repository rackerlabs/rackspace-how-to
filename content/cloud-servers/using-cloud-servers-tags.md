---
permalink: using-cloud-servers-tags/
audit_date:
title: Use Cloud Servers tags
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2016-07-08'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

In the [Cloud Control Panel](http://mycloud.rackspace.com), you can
attach descriptive tags to your cloud servers and other resources. Tags
help you organize your infrastructure as it grows. You can use them to
quickly find specific resources by using several different filtering
mechanisms.


### How to create a tag

1.  In the Cloud Servers list, click the gear icon next to the server
    name and select **Add Tag**.

2.  In the **Add or remove tags** popup box, type a tag label and then
    press **Enter**. You can enter as many tags as you want, pressing
    **Enter** after each one.
3.  When you are done adding tags, click **Save Tags** to commit
    your changes.

To find tagged instances, select the check boxes next to the tags in the
**Tag** on the left side of the server's list.

### Tips for creating tags

A few simple tags can help you identify a server's purpose at a glance.
You can also easily filter a long list of servers with several tags to
distinguish one server type from another. Following are some tips for
creating tags that can help you organize your cloud infrastructure.

#### Environment

A server environment is a collection of instances that are meant to
operate under similar conditions. An example of a server environment is
a collection of *development*, *staging*, and *production* servers.
Development servers are used when you are testing code that is still in
flux. Staging servers provide a stable testing ground for code deemed to
be complete. Production servers are where code goes when it's passed
testing and is ready to be used with real data or viewed by customers.

#### Function

If you have specialized server instances, it can be convenient to
quickly filter them by function, like *web server*, *proxy*, or
*database*.

#### Role

In a more complex environment, you might have *primary* and *backup*
systems, *master* and *slave* databases, or DNS servers. Tagging servers
according to their role in the environment can help when you plan
maintenance.

#### Operating system

Tags can let you quickly see which servers are running Linux or Windows,
or what Linux distributions are being used on each server (like Ubuntu
or CentOS).

### Summary

These are some basic ideas for organizing servers with tags, but because
tags are completely flexible, this is definitely not a comprehensive
list. For example, you could also use tags to divide responsibilities
among team members, to label servers that have only internal network
interfaces active, and to track any other qualities that distinguish
your servers from one another.

### Related information

[Learn more about Cloud
Servers](/how-to/learn-more-about-cloud-servers)
