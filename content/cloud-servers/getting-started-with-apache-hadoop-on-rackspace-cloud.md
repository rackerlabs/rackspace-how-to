---
permalink: getting-started-with-apache-hadoop-on-rackspace-cloud/
audit_date:
title: Get Started with Apache Hadoop on Rackspace Cloud
type: article
created_date: '2013-03-18'
created_by: Alyssa Hurtgen
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Disclaimer**: This document details a process intended for
educational purposes only. This will not deploy a production
environment.

### What is Apache Hadoop?

Hadoop is an open source project that provides a platform to store and
process massive amounts of data. Hadoop uses the Map Reduce paradigm to
split large tasks into many smaller chunks and executes them in
parallel. Each of these tasks are executed close to the data in the
Hadoop Distributed File System.

#### Hadoop Use Cases

In a very short time, Hadoop has revolutionized almost every business
sector. Actual use cases involving Hadoop include:

-   Analyzing medical data.
-   Analyzing transaction data to detect anomalies and suggest
    fraudulent behavior.
-   Processing high definition images from satellites and detecting
    patterns of geographical change.
-   Processing machine-generated data to identify malware and cyber
    attack patterns.

### Objective

This document is for educational purposes only and will provide you with
an example of how to get started with Apache Hadoop in the Cloud. You
will learn how to launch a Hadoop cluster starting with 2 nodes and
growing it up to 64 nodes. During this process you will learn how to:

1.  Create cloud servers through Cloud Control Panel.
2.  Create cloud servers using scripts.
3.  Install and configure Hadoop.
4.  Run Map Reduce applications.

### Prerequisites

The following prerequisites are expected for successful completion:

-   Rackspace Cloud account (<https://cart.rackspace.com/cloud/>).
-   SSH client (Windows users can download PUTTY:
    <http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>).
-   Basic knowledge of Linux.
-   Basic knowledge of Hadoop.

### Hadoop Installation Process

Manually installing and configuring Hadoop can be somewhat complicated
so we will use a few tools to make the installation easier. In
particular, we are going to use the following two projects:

-   Chef recipes for Hadoop
    (<https://github.rackspace.com/CloudBigData/cookbook-hadoop-conf>)
-   Knife plugin for Rackspace API
    (<https://github.com/opscode/knife-rackspace>)

Using the tools, we will create a Hadoop installation using the
following:

-   1 cloud server as workstation
-   1 cloud server as Hadoop Master node.
-   1 cloud server as Hadoop Worker node.
-   Gradually add up to 63 more Hadoop Worker nodes.

To do this, we will break up each part of the build into separate
sections and tasks that follow.

### Set Up the Server as Workstation

In this section, we will build the workstation to be our launching
ground to build the remainder of our Hadoop environment.

#### Create a Cloud Server

Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/)
and create a cloud server using a Linux image. Record the IP address
and password for the server.

Wait for your server to be in an Available state. We will be using this
server going forward to create other servers. To begin, SSH into it and
run the following commands:

    export RACKSPACE_API_USERNAME=<Your Rackspace Cloud account username>
    export RACKSPACE_API_KEY=<Your API Key>
    export RACKSPACE_VERSION=v2
    export RACKSPACE_ENDPOINT=https://dfw.servers.api.rackspacecloud.com/v2
    curl -L https://raw.github.com/sacharya/random-scripts/master/knife-rackspace-hadoop/chef-knife-install.sh | bash

Note: for information about how to find your API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).

This will install the Chef server, knife-rackspace plugin and upload the
chef hdp-cookbooks, and configure it to talk to Rackspace Cloud using
your account. We can now use the knife client to interact with Rackspace
Cloud and configure our Hadoop cluster.

#### Choosing the Image

You need a CentOS 6.2 image as the base image for the server to install
Hadoop.

    IMAGE_ID=`knife rackspace image list | grep 'CentOS 6.2' | awk '{print $1}'`
    echo $IMAGE_ID

#### Choosing the Flavor

We will use a flavor with 4096 MB of RAM for the server.

    FLAVOR_ID=`knife rackspace flavor list | grep '4096' | awk '{print $1}'`
    echo $FLAVOR_ID

#### Creating your Environment

In order not to conflict with other Hadoop clusters within the same
account, we will create a Chef environment called `YourName` to create our
Hadoop cluster on. We will save this name in an environment variable so
we can reference it later.

    ENV_NAME=<YourName>
    echo $ENV_NAME

Now run the following commands to setup the environment within Chef.

    cp /root/hdp-cookbooks/environments/example.json /root/hdp-cookbooks/environments/$ENV_NAME.json
    sed -i "s/example/$ENV_NAME/g" /root/hdp-cookbooks/environments/$ENV_NAME.json
    knife environment from file /root/hdp-cookbooks/environments/$ENV_NAME.json

#### Creating a Hadoop Master

This command will create a cloud server with the name,
YourName-hadoopmaster with CentOS 6.2 and 4 GB RAM.

It will create it in the example environment and give it a role of
hadoop-master. Chef will then install and configure all the components
required to make it a Hadoop Master node.

    knife rackspace server create --server-name $ENV_NAME-hadoopmaster --image $IMAGE_ID --flavor $FLAVOR_ID --environment $ENV_NAME --run-list 'role[hadoop-master]'

Now, copy the hadoopmaster's public IP and password from the output. We
will save the IP address in an environment variable to use later.

    HADOOP_M_IP=<Hadoop Master IP>
    echo $HADOOP_M_IP

Run the following commands:

**Note:** Ideally, you shouldn't have to run the code below, but there
is currently a bug in the hdp-cookbooks where the hostname is not
propagated properly. So you have to run this extra step.

    ssh root@$HADOOP_M_IP "chef-client && /etc/init.d/hadoop-namenode restart && /etc/init.d/hadoop-jobtracker restart"

Verify that the master is up by going to the jobtracker at:

    http://<Hadoop Master IP>:50030

#### Creating a Hadoop Worker

From your server workstation, execute the following command to create a
Hadoop worker node:

    knife rackspace server create --server-name $ENV_NAME-hadoopworker1 --image $IMAGE_ID --flavor $FLAVOR_ID --environment $ENV_NAME --run-list 'role[hadoop-worker]'

Similarly, copy the hadoopworker1's public IP and password at the end.
We will save the hadoop worker IP address in an environment variable to
use later.

    HADOOP_W1_IP=<Hadoop Worker 1 IP Address>
    echo $HADOOP_W1_IP

Run the following command:

    ssh root@$HADOOP_W1_IP "chef-client && /etc/init.d/hadoop-datanode restart && /etc/init.d/hadoop-tasktracker restart"

Verify that the worker is running by going to the jobtracker at:

    http://<Hadoop Master IP>:50030

#### Running a Map Reduce Application

Now, SSH to the HadoopMaster node you created above and run the
following examples:

    ssh root@$HADOOP_M_IP
    hadoop jar /usr/lib/hadoop/hadoop-examples-1.0.3.15.jar pi 10 1000000

This task runs a simulation to estimate the value of pi based on
sampling.

    curl -L "https://raw.github.com/sacharya/random-scripts/master/knife-rackspace-hadoop/wordcount.sh" | bash

This script will download all of Shakespeare's books from project,
Gutenberg, upload them to HDFS and run a Map Reduce operation run a word
count against the text.

#### Adding More Nodes

So far, you have created only **hadoopworker1**. Keep adding more
HadoopWorker nodes following the same process. Make sure to increment
the hadoopworker number each time. Run and benchmark your application
and see how it performs when the size of the cluster grows.

Once you feel comfortable, you can also play with different flavor sizes
and see what works best for your application.

#### Deleting the Cluster

If you are done with your computation, you may want to delete the
cluster and free up the resources. To do this, you need the server id of
the server you want to delete.

    knife rackspace server list
    knife rackspace server delete `knife rackspace server list | grep $HADOOP_M_IP | awk '{print $1}'`
    knife rackspace server delete `knife rackspace server list | grep $HADOOP_W1_IP | awk '{print $1}'`

Repeat the process for all the servers in the cluster by replacing
`$HADOOP_W1_IP` with the IP for the appropriate worker number.

### Summary

In this document, we showed you how to interact with the cloud using
tools and scripts. We also demonstrated how to get started with Apache
Hadoop on a couple of cloud servers and scale it up with your needs.
