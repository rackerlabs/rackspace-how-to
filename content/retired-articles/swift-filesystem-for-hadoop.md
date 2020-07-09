---
permalink: swift-filesystem-for-hadoop/
audit_date:
title: Swift Filesystem for Hadoop
type: article
created_date: '2013-12-13'
created_by: David Dobbins
last_modified_date: '2015-09-01'
last_modified_by: Stephanie Fillmon
---

<!--we don't offer big data solutions in public cloud anymore, so retiring
per Dan Versons advice-->

The Swift filesystem for Hadoop (swiftfs, for short) is a Hadoop file
system implementation that allows applications such as MapReduce, Pig,
and Hive to read and write directly to containers in an OpenStack Swift
object store such as Rackspace Cloud Files. A collaborative effort
between Rackspace, Hortonworks, and Mirantis, this work was done as a
part of [HADOOP-8545](https://issues.apache.org/jira/browse/HADOOP-8545)
and merged into Hadoop as a part of version 2.3.0.

### Why is swiftfs important?

swiftfs separates the compute resources of the cluster from a storage
resources, allowing each to have different life spans. This separation
is beneficial if you need long-term data storage but only periodically
need compute resources to process that data.

Also, if you are already using Rackspace Cloud Files to store your data,
you can process it in place without copying it into your cluster's
Hadoop Distributed File System (HDFS).

### How do I use swiftfs?

File system URLs for Swift take the following form:

    swift://acontainer.aservice/path/to/files

The different parts of the URL are explained in the following table:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>swift://</p></td>
<td align="left"><p>UThe prefix that passes file system requests to the Swift file system.</p></td>
</tr>
<tr class="even">
<td align="left"><p>acontainer</p></td>
<td align="left"><p>The name of the container in Swift that contain the objects to be accessed.</p>
<p>Container names must conform to <a href="http://tools.ietf.org/html/rfc952">RFC952</a> restrictions for hostnames, that is, the characters A-Z, numbers 0-9, and the hyphen (-).</p>
<p>Nonconforming container names are inaccessible by swiftfs.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>aservice</p></td>
<td align="left"><p>A user-friendly &quot;service&quot; name. A service name maps to a collection of configuration entries in the Hadoop core-site.xml file that specify where the container is located (for example, rackspace-dfw).</p></td>
</tr>
<tr class="even">
<td align="left"><p>/path/to/files</p></td>
<td align="left"><p>The name of the object or objects in Swift to be referenced. Although Swift doesn't support paths, swiftfs attempts to interpret names that look like paths and behave appropriately. For example, an input path named <code>/path/to/*</code> would qualify all objects with names prefixed by <code>/path/to/</code>. Similarly, an output path of <code>/path/to/</code> would prefix the names of all newly created objects with <code>/path/to/</code>.</p></td>
</tr>
</tbody>
</table>

**Example 1**

Using Pig to read data from Swift:

    A = LOAD 'swift://logdata.rack-dfw/2013/10/logfile-2013-10-01.txt' AS (a, b, c);
    B = FOREACH A GENERATE a, null;

**Example 2**

Copying from HDFS to a Swift container named `myfiles` in the Chicago
(ORD) region:

    hadoop fs -cp /user/joesmith/files/* swift://myfiles.rack-ord/

If your cluster is in a different region than your container, Hadoop
generates traffic over the public (billable) network. To minimize cost
and maximize performance, keep your Hadoop cluster and Cloud Files
containers in the same region.

### How do I configure swiftfs?

By default, Cloud Big Data clusters are preconfigured with service names
for all of the Cloud Files regions. Currently these service names are as
follows:

-   rack-dfw
-   rack-ord
-   rack-iad
-   rack-lon
-   rack-syd
-   rack-hkg

Each of these services is seeded with the cloud credentials (Rackspace
user name and API key) from your Cloud Big Data profile, if you supplied
them. (For information about viewing your Rackspace API key, see [View
and reset your API
key](/how-to/view-and-reset-your-api-key).
Also, each service is configured appropriately to use the public or
private network, depending on the Swift region and the location of your
cluster.

### How do I add services?

You might find that you need additional service names, perhaps to use
different credentials or a different Swift endpoint. If so, you need to
add the following entries for your new service to the Hadoop
`/etc/hadoop/conf/core-site.xml` file on each node in your cluster. You
also need to restart your cluster services after updating the
configuration.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Setting</strong></p></td>
<td align="left"><p><strong>Meaning</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p>fs.swift.service.aservice.auth.url</p></td>
<td align="left"><p>The keystone endpoint to authenticate against.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>fs.swift.service.aservice.tenant</p></td>
<td align="left"><p>The tenant ID to use during authentication.</p></td>
</tr>
<tr class="even">
<td align="left"><p>fs.swift.service.aservice.username</p></td>
<td align="left"><p>The username to authenticate with.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>fs.swift.service.aservice.password</p></td>
<td align="left"><p>The password to authenticate with. Alternatively, you can use an API key for authentication.</p></td>
</tr>
<tr class="even">
<td align="left"><p>fs.swift.service.aservice.apikey</p></td>
<td align="left"><p>The API key to authenticate with. Using an API key is an alternative to using a password; you must supply one or the other.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>fs.swift.service.aservice.useApikey</p></td>
<td align="left"><p>True or false value that indicates whether  to authenticate with the API key rather than the password.</p></td>
</tr>
<tr class="even">
<td align="left"><p>fs.swift.service.aservice.region</p></td>
<td align="left"><p>The Swift region to use. This value is used to select the appropriate Swift endpoint from the service catalog.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>fs.swift.service.aservice.public</p></td>
<td align="left"><p>True or false value that indicates whether traffic goes over the public or private (ServiceNet) network. ServiceNet access works only for Swift containers in the same region as the cluster.</p>
<p>Traffic over the public network is subject to bandwidth charge.</p></td>
</tr>
<tr class="even">
<td align="left"><p>fs.swift.service.aservice.location-aware</p></td>
<td align="left"><p>True or false value that indicates whether to enable location awareness for data within Swift. This setting is not currently supported for Rackspace Cloud Files.</p></td>
</tr>
</tbody>
</table>

**Example**

        <property>
          <name>fs.swift.service.rack-dfw.auth.url</name>
          <value>https://auth.api.rackspacecloud.com/v2.0/tokens</value>
        </property>
        <property>
          <name>fs.swift.service.rack-dfw.username</name>
          <value>joesmith</value>
        </property>
        <property>
          <name>fs.swift.service.rack-dfw.region</name>
          <value>DFW</value>
        </property>
        <property>
          <name>fs.swift.service.rack-dfw.apikey</name>
          <value>74796C657264757264656E</value>
        </property>
        <property>
          <name>fs.swift.service.rack-dfw.public</name>
          <value>false</value>
        </property>

### Where can I find more information?

For additional information about Hortonworks Data Platform (HDP) in the
Rackspace Cloud environment, see the Hortonworks blog post, [OpenStack:
why it's so great to see HDP in Rackspace
cloud.](http://hortonworks.com/blog/openstack-why-its-so-great-to-see-hdp-in-rackspace-cloud/)
