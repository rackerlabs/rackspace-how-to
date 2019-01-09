---
permalink: best-practices-for-using-cloud-files/
audit_date: '2018-01-09'
title: Best practices for using Cloud Files
type: article
created_date: '2012-01-05'
created_by: Rackspace Support
last_modified_date: '2018-01-09'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

### What is Cloud Files used for?

You can use Cloud Files in many ways. It is strongest when
it is functioning as **unlimited object storage** on the cloud, or when
you use it as a **website accelerator** with a Content Delivery Network
(CDN). This article presents these use-case scenarios and provides some
recommendations for getting the most out of Cloud Files.

### Object storage

At its core, Cloud Files is an object storage solution and is not designed for
high input/output operations per second (IOPS). Instead, Cloud Files is
designed for consistent reliability of data. The primary function of Cloud
Files is to ensure that your data is available when you ask for it. This works
best with relatively static files, as opposed to files that are frequently
updated. As a result, it is impractical to run a database out of Cloud Files.
You can't expect to write to the same object 20 times per second. Cloud Files
was designed so that when you write to an object in Cloud Files, that object
is there each and every time you call for it.

### Organize content for web acceleration

When you use Cloud Files for web acceleration, a basic organizational
structure separates your content into different containers based on
object type, such as images, Cascading Style Sheets (CSS), JavaScript,
videos, uploaded content, and so on. This structure enables you to quickly
locate objects when you need them.

### Container management

This section describes how to use containers to group your data in Cloud
Files.

#### Use multiple containers

If you have an extremely large number of objects, we recommend storing
them in multiple containers. You can have up to 500,000 containers per
account in Cloud Files.

**Note**: When you write large numbers of objects to a single container,
the limit of 100 object write requests per second per container might reduce
overall performance.

#### How to label your containers

When you organize your containers for Cloud Files, we recommend that you label
the container based on the type of storage (perhaps based on the segment of
the application accessing it). We also recommend that you attach an
incremental number to the label name to plan ahead in case the number of
objects becomes too high. For example, a container name might look something
like **personnel-00000**.

A basic setup for web acceleration organizes content in separate containers
such as images, CSS, JavaScript, videos, uploaded content, and so on. This
structure enables you to quickly locate objects when you need them.

#### Keep a local database of your container structure

If you have a large number of files, we also recommend that you
keep a local copy of the container structure and listing so that you don't
have to wait on the container to list all of the objects, 10,000 at a time.

You can do this in a local database, which significantly reduces the chance
of a naming conflict. With this approach, if there is an update to an object,
you know in which container the object is located. This enables a simple
update to the object without having to list all of the containers, which
significantly reduces the time required to complete updates.

This tip is most appropriate for customers who are using Cloud Files for an
object storage solution because these solutions are frequently accessed
programmatically, and also grow organically over time. This tip also applies
to any site that allows for additional content, such as an uploads section,
that might quickly grow beyond the webmaster's expectations.

Consider future growth in object count and usage. Any system that has
many millions of objects and very high object churn (such as creation and
deletion) should have a fragmentation or sharing system to minimize any
performance impacts.

You can keep track of the object count locally, and verify it against the
object count in the container by performing a `HEAD` operation on the
container and checking the **Object Count**.

### Pathing

Containers in Cloud Files do not nest, and all objects in a
single container are subject to the same limitations. Some
applications fake a folder structure by adding the path to
the beginning of the object name, which works for pathing in the CDN
URLs as well. This structure enables virtual pathing if needed.
For object storage, this enables better subdivision of slow-growth,
closely-grouped data. As a result, you're unlikely to need to divide it
again later. For website acceleration, this enables pathing that
displays in the browser, as shown in the following example:

    http://c123456.r02.cf3.rackcdn.com/ducks/funny/duckling.jpg

In this example, the name of the object is **ducks/funny/duckling.jpg**.

### Remove containers and container data

You must delete all of the objects in a container before you can delete the
container itself. Multiple containers allow for better threading of the
deletion scripts. Because content grows regardless of the use case, it's
best to plan ahead for this situation.

### Set the Time to Live

In addition to the performance benefit of quicker listings, you're also able
to set the Time to Live (TTL) value for containers that contain objects on the
CDN. You set the TTL on the Cloud Files container, and all of the objects
inherit the container-level setting. A particular object in a container cannot
have a TTL that is different than the other objects in the same container.
As a result, you might want to set longer TTL values on content that is
unlikely to change often.

For website acceleration, you might use a longer TTL (at the container level)
for files that are updated infrequently, such as your CSS, JavaScript, and
videos. At the same time, you can set a shorter TTL for rapidly changing
objects such as user uploads. Using an appropriate TTL for the object type in
your container improves performance. The longer the TTL, the more
consistent the performance because it renews the CDN cache from your Cloud
Files less frequently.
