---
permalink: deploying-rackspace-cloud-big-data/
audit_date:
title: Deploy Rackspace Cloud Big Data
type: article
created_date: '2014-05-07'
created_by: Kyle Laffoon
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Big Data
product_url: cloud-big-data
---

The Rackspace Cloud Big Data Platform provides a scalable, robust, and
complete Hadoop cluster within a few clicks. All Cloud Big Data
deployments are backed by [Hortonworks Data
Platform](http://hortonworks.com/) (HDP). Using HDP enables Cloud Big
Data to take advantage of Hadoop packages and patches provided by
Hortonworks, as well as any escalation path to some of the top
contributors of the core Hadoop projects.

We currently support two deployment options:

1.  HDP 2.3 including all the core Hadoop components, Spark, Hive, Pig,
    Oozie, Flume, Kafka, Zookeeper, Storm, Falcon, Hue and Ambari.
2.  Spark 1.5 with support for Spark Standalone, Tachyon, Zeppelin
    and Kafka.

### Build a cluster

There are multiple methods for deploying and scaling your Hadoop
cluster: the API, Cloud Control Panel, and Lava command line. API and
Lava client walkthroughs are provided under[Using the Python Lava
Client](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/#using-the-lava-client)
in the [Getting Started
Guide](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/#getting-started).

You can create a cluster through the Cloud Control Panel as follows:

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2.  In the menu bar at the top of the window, click **Databases &gt; Big
    Data**.
3.  Click **Create Cluster**.
4.  Provide values for the following fields, and then click **Create
    Cluster**:
    -   **Cluster Name:** Specify a name to identify and distinguish
        the cluster.
    -   **Region:** Specify the region in which to create the cluster.
    -   *(Optional)* **Post-Install Script:** Specify the URL of a
        custom script to download and run on each node after deployment
        of the node has completed.
    -   **Username:** Specify a user that will be created on all nodes
        for access to and administration of the cluster.
    -   **SSH Key Name:** Provide a ssh-key for accessing the
        cluster securely.
    -   Under Configuration &gt; Build from Predefined Stack choose a
        distribution and a corresponding stack to create the cluster.
    -   **The next step allows you to configure Node Groups, flavor and
        node size per node group.**
    -   *(Optional)* **Cloud Files Storage:** If you want the option of
        accessing and storing data in Cloud Files from your cluster, add
        credentials for Cloud Files.

5.  After the status changes to Active, use SSH to log in to your
    Gateway node's PublicNet IP address, using the username and ssh key
    that you provided at cluster creation.

###  Choosing a Stack

The various predefined stacks comprise of different services. It is best
to choose a stack that meets the requirement for all the services that
you need. If you are unsure and want to try out, we recommend using the
"HDP 2.3 with all services" stack.

### Choosing a data node size

Cloud Big Data offers four flavors: Small (1.25 TB), Medium (2.5T),
Large (5T), and XLarge (10 TB). In the IAD region we additionally offer
the OnMetal IO flavor. For complete specifications and pricing, see
<http://www.rackspace.com/cloud/big-data/pricing/>.
<img src="{% asset_path cloud-big-data/deploying-rackspace-cloud-big-data/CBDexampleBuilds.1.png %}" width="641" height="291" />

For maximum performance, choose extra-large data nodes, which take up an
entire physical server to provide consistent cluster performance, or for
bare metal performance choose the OnMetal IO flavor. If you prefer to
scale your environment more granularly or have lower storage and
processing needs, you can choose small data nodes.

### More information

Following are some great links for further reading about data processing
as well as a data ingest method supported by Rackspace:

**Apache Pig**:
<http://hortonworks.com/hadoop-tutorial/how-to-process-data-with-apache-pig/>

**Apache Hive**: <http://hive.apache.org>

**Apache Spark:**<http://http://spark.apache.org>

**Rackspace Swifts**:[/how-to/swift-filesystem-for-hadoop](/how-to/swift-filesystem-for-hadoop)

**Transfer Data Into Your Cluster**:
[/how-to/getting-data-into-your-big-data-cluster](/how-to/getting-data-into-your-big-data-cluster)
