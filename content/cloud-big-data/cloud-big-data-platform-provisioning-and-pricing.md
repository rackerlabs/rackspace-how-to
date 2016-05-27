---
permalink: cloud-big-data-platform-provisioning-and-pricing/
audit_date:
title: Cloud Big Data Platform provisioning and pricing
type: article
created_date: '2014-05-07'
created_by: David Grier
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Big Data
product_url: cloud-big-data
---

Rackspace Cloud Big Data Platform is a new public cloud offering
leveraging the Hortonworks Data Platform (HDP) and OpenStack. Users can
quickly deploy a full HDP stack and scale the solution simply by adding
new nodes on the configuration. The provisioning of resources in Cloud
Big Data Platform can be done easily via the Rackspace Cloud Control
Panel or API. For more information about how to get started using Cloud
Big Data Platform, see the [Getting
Started](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/#getting-started)
Guide.

Although Cloud Big Data Platform uses a standard and common Apache
Hadoop &trade; distribution, it differs from running Hadoop on dedicated
servers or plain cloud servers. The back-end infrastructure of Cloud Big
Data Platform has been optimized for running Hadoop at scale and
includes gigabit Ethernet, optimized local storage, and easy API access.

The following sections provide information that will help you understand
the pricing and provisioning of this service.

### Data node instances

Cloud Big Data Platform offers four datanode sizes:

<table>
<colgroup>
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
<col width="20%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><h4 id="flavor-id"><strong>Flavor ID</strong></h4></td>
<td align="left"><h4 id="name"><strong>Name</strong></h4></td>
<td align="left"><h4 id="vcpu"><strong>vCPU</strong></h4></td>
<td align="left"><h4 id="ram"><strong>RAM</strong></h4></td>
<td align="left"><h4 id="disk"><strong>Disk</strong></h4></td>
</tr>
<tr class="even">
<td align="left"><p>hadoop1-7</p></td>
<td align="left"><p>Small Hadoop Instance</p></td>
<td align="left"><p>2</p></td>
<td align="left"><p>7.5G</p></td>
<td align="left"><p>1.25T</p></td>
</tr>
<tr class="odd">
<td align="left"><p>hadoop1-15</p></td>
<td align="left"><p>Medium Hadoop Instance</p></td>
<td align="left"><p>4</p></td>
<td align="left"><p>15G</p></td>
<td align="left"><p>2.5T</p></td>
</tr>
<tr class="even">
<td align="left"><p>hadoop1-30</p></td>
<td align="left"><p>Large Hadoop Instance</p></td>
<td align="left"><p>8</p></td>
<td align="left"><p>30G</p></td>
<td align="left"><p>5T</p></td>
</tr>
<tr class="odd">
<td align="left"><p>hadoop1-60</p></td>
<td align="left"><p>XLarge Hadoop Instance</p></td>
<td align="left"><p>16</p></td>
<td align="left"><p>60G</p></td>
<td align="left"><p>10T</p></td>
</tr>
<tr class="even">
<td align="left"><p>onmetal-io1</p></td>
<td align="left">OnMetal Hadoop instance</td>
<td align="left">40</td>
<td align="left">128G</td>
<td align="left">3.2T</td>
</tr>
</tbody>
</table>

When provisioning, you need to know how much data node (disk) space is
needed to process your query or job. HDFS has a configurable level of
replication which we set based on the size of the provisioned cluster.

-   <span>Replication Factor 1: 1-2 Datanodes</span>
-   <span>Replication Factor 2: 3-4 Datanodes</span>
-   <span>Replication Factor 3: &gt;4 Datanodes</span>

Considering a Cloud Big Data deployment with 3x replication, you must
first take your raw data set and multiply that volume by 3. This value
indicates how much Cloud Big Data Platform resources you need.

One additional thing to note is that a 10 TB instance actually occupies
an entire physical machine, so users do not have to worry about sharing
resources.

### Gateway node

The Gateway node is provisioned automatically when you create a cluster.
It is designed to give you access directly into the data nodes residing
in the cluster.

### Name node

The Name node is provisioned at the time of cluster creation. The Name
node handles the master services of the Hadoop cluster including the map
operation and logical location of the data copies.

### Bandwidth

All incoming bandwidth is provided at no charge, which means that you
are not metered or billed for bandwidth usage during import. Only
outgoing bandwidth is metered, which means that anything exported from
or distributed from the Hadoop cluster is charged. Bandwidth between
data nodes and the Name node or Gateway node, or between sets of data
nodes, is not metered or billed.

### Scaling

Hadoop is a distributed technology that allows for seamless horizontal
scaling. This means that you can easily expand the capacity of your
Hadoop cluster by simply adding a node to the cluster via the Coud
Control Panel or API. You can also scale down the resources by removing
data node instances from the cluster.

### Cloud Files integration

One of the main features of Cloud Big Data Platform is its ability to
process data that lives in Cloud Files. For detailed information about
how to do this, see [Transfer data into your Big Data Cluster guide](/how-to/getting-data-into-your-big-data-cluster).
It is important to note that any usage of Cloud Files is billed at the
storage rate for Cloud Files as outlined on the [Cloud Files pricing
page](http://www.rackspace.com/cloud/files/pricing/). Bandwidth and
transfer of Cloud Files data to Cloud Big Data is at no charge; however,
customers might incur bandwidth when exporting results back into Cloud
Files if the Cloud Files container is not in the same region (data
center) as the Hadoop cluster.

We hope that these additional points help you successfully understand
and deploy your Cloud Big Data solution. If you need help, reach out to
our data specialist support team by creating a ticket in the Rackspace
Cloud Control Panel.
