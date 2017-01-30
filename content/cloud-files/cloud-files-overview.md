---
permalink: cloud-files-overview/
audit_date:
title: Cloud Files overview
type: article
created_date: '2012-07-23'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Cloud Files is an affordable, redundant, scalable, and dynamic storage
service offering. The core storage system is designed to provide a safe,
secure, automatically resizing, and network accessible way to store
data.

You can store an unlimited quantity of files ranging in size from a few
bytes to extremely large. You can store as much as you want, and you pay
only for the storage space that you actually use.

Cloud Files makes it easy to serve content through the Akamai content
delivery network (CDN), which enables you to take advantage of a proven,
world-class CDN that is affordable and easy to use.

Cloud Files also enables you to store and retrieve files and CDN-enable
content with a simple web service (REST) interface. There are also
language-specific APIs that use the REST API but make it easier for
developers to integrate Cloud Files into their applications.

### Ideal uses for Cloud Files

The Cloud Files service is an excellent storage solution for a number of
scenarios and is well suited for a number of applications. Following are
some of the ideal uses for Cloud Files:

-   Backing up or archiving data
-   Serving images and videos (streaming data to users' browsers)
-   Serving content with a world-class CDN (Akamai)
-   Storing secondary or tertiary, static, web-accessible data
-   Developing new applications with data storage integration
-   Storing data when predicting storage capacity is difficult
-   Storing data for applications affordably

#### Benefits for using Cloud Files for backups

Using Cloud Files to back up your data provides the following benefits:

-   Mission-critical data is backed up safely in a
    secure, offsite location.
-   Disaster recovery is possible with the backed up data.

### Key concepts

Cloud Files is not a file system in the traditional sense. You can't map
or mount virtual disk drives like you can with other forms of storage
such as a SAN or NAS. Because Cloud Files is a different kind of storage
solution, take a few moments to [review some key concepts](/how-to/cloud-files-key-concepts).

### Using Cloud Files

You can access Cloud Files by using the following interfaces:

-   Graphical user interfaces, such as the Rackspace Cloud Control
    Panel and Cyberduck
-   Programming interfaces via REST, Python, PHP, Ruby, Java, and C#
    .NET

#### Cloud Control Panel interface

The [Cloud Control Panel](https://mycloud.rackspace.com) provides a browser-based, intuitive, easy-to-use
graphical user interface (GUI). The control panel enables you to manage
your Cloud Files containers and objects without any programming
knowledge. From the control panel, you can CDN-enable a container by
marking it **public**. Any objects stored in a public, CDN-enabled
container are directly accessible over the CDN.

#### Programming interfaces

There are several programming interfaces for Cloud Files that enable you
to integrate the storage solution into your applications, or provide
automated ways of accessing the system. Currently, we support a REST web
services API and several programming language APIs (Python, PHP, Java,
Ruby, and C# .NET).

For details about using these interfaces, see the [Cloud Files Developer Guide](http://developer.rackspace.com/docs/cloud-files/v1/developer-guide/).
