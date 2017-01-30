---
permalink: getting-data-into-your-big-data-cluster/
audit_date:
title: Transfer data into your Big Data cluster
type: article
created_date: '2013-12-14'
created_by: David Dobbins
last_modified_date: '2016-03-22'
last_modified_by: Stephanie Fillmon
product: Cloud Big Data
product_url: cloud-big-data
---

After you have successfully created a new Cloud Big Data cluster, you
need to get your data into the cluster so that you can put Hadoop to
work. You can use many methods to accomplish this, but the method that
you choose will likely depend on where your data currently resides.

The following sections provide instructions based on the current
location of your data:

-   Data resides in Cloud Files
-   Data resides on an HTTP or FTP server
-   Data resides on a local computer
-   Data resides in another cluster

The examples in this article assume that your new Cloud Big Data cluster
is named speedy and your data is stored in a file named
importantdata.txt.

### Data resides in Cloud Files

A command line tool called swiftly is already installed on the gateway
node of your cluster. Use it to get the data from Cloud Files to the
cluster, as follows:

1.  Use SSH to access your gateway node. The easiest way to do this it
    to use the lava command-line tool:

        lava ssh speedy

2.  Set the following environment variables, giving your
    Cloud credentials. **Tip:** You can find these credentials on the
    Account Settings page of the Cloud Control Panel
    at mycloud.rackspace.com. To access the Account Settings page, click
    your username in the top-right corner of the panel.

        export SWIFTLY_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0
        export SWIFTLY_AUTH_USER=<myusername>
        export SWIFTLY_AUTH_KEY=<myapikey>

3.  Finally, run swiftly to copy the data to stdout and send it to
    Hadoop to put it in HDFS:

        swiftly get containername/importantdata.txt |hadoop fs -put - /user/<myusername>/some/file/path

Alternatively, your MapReduce jobs and Hadoop tools like Pig and Hive
can read and write directly to Cloud Files by using the [Swift for
Hadoop](/how-to/swift-filesystem-for-hadoop).

### Data resides on an HTTP or FTP server

Log in to your gateway node (see the preceding section) and use `wget`
to copy the data.

    wget http://server.mydomain.com/importantdata.txt -O - |hadoop fs -put - /user/<myusername>/some/file/path

### Data resides on a local computer

If you have an SCP or SFTP client, you can upload the data directly to
HDFS by using an hdfs-scp server running on the gateway node of your
cluster on port 9022. In Linux, the command line would be as follows:

    scp -P 9022 importantdata.txt myuser@<gatewayip>:/user/<myusername>/some/file/path

or you can use the lava CLI, as follows:

    lava scp -hdfs -dest-path /user/<myusername>/some/file/path importantdata.txt clustername

### Data resides in another cluster

If your data already resides in another Hadoop cluster, the distcp tool
bundled with Hadoop is your best option. For example:

    hadoop distcp hdfs://nn1:8020/path/to/importantdata.txt hdfs://nn2:8020/user/<myusername>/some/file/path

By default, your Cloud Big Data cluster has firewall (iptables) rules in
place that prevent network connections from outside the cluster. Ensure
that you adjust your firewall rules appropriately to allow your clusters
to communicate.

We are working to support additional data transfer tools, such as Flume
and Sqoop. If you have questions or need additional help, contact us.
