---
permalink: getting-started-with-cloud-files-and-cdn/
audit_date:
title: Getting started with Cloud Files and CDN
type: article
created_date: '2016-01-14'
created_by: Stephanie Fillmon
last_modified_date: '2017-05-31'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This article provides an overview of Rackspace Cloud Files and its
features to help you get started quickly and serve content over Akamai's
content delivery network (CDN) service.

### What is Cloud Files?

Cloud Files is a cloud storage system, not a traditional file system. You use it to store data in the Rackspace infrastructure. You can perform most data management tasks from the [Cloud Control Panel](https://mycloud.rackspace.com/), but the [Cloud Files API Developer Guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/)
and some third-party tools are also available.

Cloud Files has the following characteristics:

-   You create *containers* in the storage system to store data.
-   You cannot create containers within other containers.
-   You can have any number of top level containers.
-   Your data is stored in *objects* within those containers.
-   You can have any number of objects within each container.
-   Objects can vary in size from a few bytes to several gigabyes.

For more details, see the [Cloud Files Key Concepts](/how-to/cloud-files-key-concepts).

### What is the CDN?

When you use the Cloud Files service, you automatically get access to the Akamai CDN. The CDN works by distributing the content that you upload to Cloud Files across a global network of edge servers. When someone views content from your site, the CDN-enabled content is served from the edge server that is geographically closet to the viewer's location.

Using the CDN dramatically increases the speed at which websites can load, no matter where the viewer is located. This can be a great advantage when you are hosting content for an international audience.

### Using Akamai's CDN with Cloud Files

When a Cloud Files user marks containers for publishing to the CDN, they are instantly accessible through the Akamai CDN. The propagation of content to the edge locations is done automatically.

In the Cloud Control Panel, you use the CDN by creating a Cloud Files container (the storage compartment for data), uploading objects (the files to serve over CDN) to it, and marking the container as **public**. The container is then assigned a unique URL that can be combined with object names to embed in web pages, email messages, blog posts, and so on.

For example, a user could upload a photo to a container called **images**. When this Container is published, it is assigned a unique URL such as **http://c0000532.cdn.cloudfiles.rackspace.com**. The user could then share a link to the photo, such as **http://c0000532.cdn.cloudfiles.rackspace.com/IMG_3432.jpg**. When that link is accessed, the photo is served from the CDN.

### Create a container and make it public

1.  Log in to the [Cloud Control Panel](http://mycloud.rackspace.com).
2.  In the top navigation bar, select **Storage > Files**.
3.  Click **Create Container**.
4.  Specify a name for the container, and then click **Create Container**.
5.  Click the gear icon next to the container and select **Make Public (Enable CDN)**.
6.  Click **Publish to CDN**.

You can now share the files within the container.

### Upload files to a container

1.  Click the name of the container to which you want to upload files.
2.  Click **Upload Files** and select the files to upload.
3.  Click **Open**.
4.  After the files are uploaded, click **Close Window**.

    The files appear in the list of available files within the container.

5.  Click the gear icon next to a file and select **View All Links**.

    Options for sharing your file are displayed.

To learn more about how to operate with Cloud Files through the API, see [Connecting to Cloud Files](/how-to/connecting-to-cloudfiles) and the [Cloud Files API Developer Guide](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/).
