---
permalink: getting-started-with-cloud-files-and-cdn/
audit_date:
title: Getting started with Cloud Files and CDN
type: article
created_date: '2016-01-14'
created_by: Stephanie Fillmon
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This article provides an overview of Rackspace Cloud Files and its
features to help you get started quickly and serve content over Akamai's
CDN service.

Cloud Files allows you to store data on the Rackspace infrastructure.
The [Cloud Control Panel](https://mycloud.rackspace.com/) enables
customers to accomplish most tasks for managing data, but the [Cloud Files API Developer Guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/)
and some third-party tools are also available.

The basics of Cloud Files include:

-   Cloud Files is a cloud storage system and not a traditional file
    system
-   You must create **containers** in the storage system to store data
-   You cannot create containers within other containers
-   You can have any number of top level containers
-   Your data is stored in **objects** within those containers
-   You can have any number of objects within each container
-   Objects can vary in size from a few bytes to very large
-   You can interact with Cloud Files through the Rackspace Cloud
    Control Panel or language-specific programming interfaces

For more details, see the [Cloud Files Key Concepts](https://support.rackspace.com/how-to/cloud-files-key-concepts/).

### What is the CDN?

Using the Akamai content delivery network (CDN) service, Cloud Files
brings you a powerful and easy way to publish content over a world-class
industry leading CDN. Customers automatically get access to this network
as part of using the Cloud Files service. The way it works is by
distributing the content that you upload to Cloud Files across a global
network of edge servers. What this means is that when someone is viewing
content from your site, your CDN-enabled content will be served to them
from the closest geographic edge server to their location. This feature
dramatically increases the speed at which websites can load, no matter
where your viewer is located.

This can be a great advantage when hosting content for an international
audience. Though you can also use the API to upload content to Cloud
Files, another way is to use the File Manager interface in the Cloud
Control Panel. To store content on Cloud Files, you start by creating a
container for your content. The container name should have no breaks,
spaces, or special characters. Unlike a folder or directory, a container
cannot have subdirectories. All your content will be at one level below
the container name.

### Use Akamai's CDN with Cloud Files

Rackspace Cloud Files uses [Akamai Technologies, Inc](http://www.akamai.com/ "http://www.akamai.com/"). a leading, tier
one, global Content Delivery Network (CDN) provider to offer the
benefits to all Cloud Files users. Today Akamai handles tens of billions
of daily Web interactions for their customers such as Audi, NBC,
Fujitsu, U.S. Department of Defense, and NASDAQ.

The Rackspace Cloud Files/Akamai relationship brings full-fledged, robust
CDN capabilities and unlimited file storage to developers and corporate
IT departments alike. The CDN capability will greatly enhance the
quality of the end user experience by speeding the delivery of
bandwidth-heavy rich content, including audio and video. For literally
pennies per gigabyte of bandwidth and storage and no upfront
commitments, the CDN advantage is now available to all not just to the
giants of the internet. This partnership brings unlimited online
storage, scalable content delivery, and application acceleration
services, thereby allowing businesses to more easily and affordably
distribute content to millions of end users around the world. Together
with Akamai, Rackspace has democratized content delivery.

With Akamai's service, Cloud Files brings a powerful and easy way to
publish content over a world-class, industry leading CDN. A Cloud Files
user automatically gets access to this network. Users have to mark
containers for publishing to CDN, and then they are instantly accessible
through Akamai CDN. The propagation of content to the edge locations is
done automatically behind the scenes. The Rackspace Cloud Files/Akamai
offering is not a one-off solution; content published through it is
distributed across their entire infrastructure just as it is for other
customers.

In the Rackspace Cloud control panel, it is a matter of creating a
Container (the storage compartment for data), uploading Objects (the
files to serve over CDN), and marking the Container as "public". The
Container is then assigned a unique URL which can be combined with
Object names to embed in web pages, email messages, blog posts, etc. For
example, a user could upload a photo to a Container called "images".
When this Container is published, it will be assigned a unique URL like
http://c0000532.cdn.cloudfiles.rackspace.com. The user could then share
a link to the photo with link like
http://c0000532.cdn.cloudfiles.rackspace.com/IMG_3432.jpg. When that
link is accessed, the photo is served from the CDN.

### Create a container

1.  Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).
2.  In the top navigation bar, select **Storage > Files**.
3.  Click **Create Container**.
4.  Name the container, and then click **Create Container**.
5.  Click the gear icon next to the container to be made public and
    select **Make Public (Enable CDN)**.
6.  Click **Publish to CDN**.

You can now share the files within the container.

### Upload files to the container

1.  Click on the name of the container to which you want to
    upload files.
2.  Click **Upload Files** and select the files to upload.
3.  Click **Open**.
4.  After the file is uploaded, click **Close Window**.

    The file appears the list of available files within the container.

5.  Click the gear icon next to your file and select **View All Links**.

    Options for sharing your file are displayed.

To learn more about how to operate with Cloud Files through the API,
see [Connecting to Cloud Files](/how-to/connecting-to-cloudfiles)
and the [Cloud Files API Developer Guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/).
