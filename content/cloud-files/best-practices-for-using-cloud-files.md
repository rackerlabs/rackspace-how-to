---
permalink: best-practices-for-using-cloud-files/
audit_date:
title: Best Practices for Using Cloud Files
type: article
created_date: '2012-01-05'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Kyle Laffoon
product: Cloud Files
product_url: cloud-files
---

### What is Cloud Files used for?

There are many ways to utilize Cloud Files, but it is strongest when
functioning as **unlimited object storage** on the Cloud, or when used
as a **website accelerator** with the Content Delivery Network (CDN). Here we've compiled a few recommendations on ways to get the most out
of Cloud Files.

We'll follow a couple of use-case scenarios here: Cloud Files as an
object storage solution, and using Cloud Files for web site acceleration
through the CDN.

### Object Storage

At its core, Cloud Files is an object storage solution and is not designed for high IOPS (Input/output Operations Per Second). Instead, Cloud Files is designed for consistent reliability of data. The primary function of Cloud Files is to ensure that your data is available when you ask for it. This works best with relatively static files, as opposed to files that are frequently updated. As a result, it is impractical to run a database out of Cloud Files.  You can't expect to write to the same object 20 times per second, Cloud
Files is not designed for that. It was designed so that when you write
to an object in Cloud Files, that object will be there each and every
time you call for it.

### Organize Content for Web Acceleration

When using Cloud Files for web acceleration, a basic organizational
structure would separate your content into different containers based on
object type (for example): images, css, javascript, videos, uploaded
content, and so on. This structure enables quick location of objects when you
need them.

### Container Management

#### Using Multiple Containers

If you have an extremely large number of objects, we recommend storing
them in multiple containers (you can have up to 500,000 containers per
account in Cloud Files). When writing large numbers of objects to a
single container, the limit of 100 object write requests per second per
container may reduce overall performance.

#### How to Label Your Containers

When organizing your containers for an object storage solution, we
recommend labeling the container based on type of storage, perhaps based
on the segment of the application accessing it, and attaching an
incremental number to plan ahead in case the number of objects gets too
high, looking something like this (for example): personnel-00000.

A basic set up for web acceleration would be to organize your content in
separate containers (for example): images, css, javascript, videos,
uploaded content, and so on. This structure enables quick location of objects
when you need them.

#### Keep a Local Database of Your Container Structure

For users with a larger number of files, another recommendation is to
keep a local copy of the container structure and listing so that you are
not waiting on the container to list all the objects, 10,000 at a time.
You can do this in a local database, significantly reducing the chance
of a naming conflict and location of a specific object. That way if
there is an update to an object, it is known in which container the
object is located. This allows for a simple update to the object,
without the need to list all the containers, providing a significantly reduced time for updates. This tip is best employed by customers using Cloud Files for an object storage solution, since these are frequently accessed programmatically, and will also grow organically over time. This also applies to any site that allows for additional content, such as an uploads section, which may quickly grow beyond the webmaster's expectations.

We recommend considering future growth with regards object count and
usage. Any systems with both many millions of objects and very high
object churn (such as  creation and deletion) should have a
fragmentation or sharding system to minimize any performance impacts.
Keeping track of the object count can be done locally, and verified
against the object count in the container by performing a HEAD on the
container, and checking the Object Count.

### Pathing

Remember, containers in Cloud Files do not nest, and all objects in a
single container are subject to the same limitations. There are
applications which will fake a folder structure by adding the path to
the beginning of the object name, which works for pathing in the CDN
URLs as well. This allows for virtual pathing if needed. For object
storage, this allows for better subdivision of slow growth
closely-grouped data, meaning that you're unlikely to need to divide it
out again later. For website acceleration, this allows pathing that
displays in the browser, for example:

    http://c123456.r02.cf3.rackcdn.com/ducks/funny/duckling.jpg

where the name of the object is **ducks/funny/duckling.jpg**.

### Removing Containers and Container Data

All objects in a container must be deleted before the container itself
can be deleted. Multiple containers allow for better threading of the
deletion scripts. Content grows regardless of the use case, so it's
best to plan ahead for this.

### TTL

In addition to the performance benefit of reduced time in listings, you
also get the improvement of being able to set the TTL (Time To Live
value) for containers containing objects on the CDN. TTL can only be set
on the Cloud Files container, and all objects inherit the
container-level setting. A particular object in a container cannot have
a TTL that is different than the other objects in the same container.
This means that you could set longer TTL values on content that is
unlikely to change often.  

For website acceleration, you could use a longer TTL (at the container-level) for files that are updated infrequently, such as your CSS, javascript, and videos. At the same time, you can set a shorter TTL for rapidly changing objects, such as user uploads. Using an appropriate TTL for the object type in your container will improve performance since, the longer the TTL, the more
consistent the performance as it renews the CDN cache from your cloud
files store less frequently.
