---
permalink: use-tableau-desktop-with-hive-on-cloud-big-data/
audit_date:
title: Use Tableau Desktop with Hive on Cloud Big Data
type: article
created_date: '2015-07-29'
created_by: Scott Kruger
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Big Data
product_url: cloud-big-data
noindex: true
---

[Tableau Desktop](http://www.tableau.com/products/desktop) is data analytics software that helps deliver business insights from a variety of data sources.  One of the fastest-growing sources is "Big Data", which are data sets so large that they are difficult or impossible to make sense of without specialized tools.  Tableau Desktop, which is typically installed on your laptop or workstation, comes with the ability to access [Apache Hive](https://hive.apache.org), a relational database that provides access to extremely large data sets using a familiar SQL interface.  Rackspace offers a [Cloud Big Data](http://www.rackspace.com/en-us/cloud/big-data) service, which makes it quick and easy to create a cluster of servers that comes pre-installed and configured with many common Big Data software, including Hive.

Normally in Tableau Desktop, you would connect directly to a Hive server over your
local network or the internet. However, in order to secure your data, Cloud Big
Data servers use a firewall to make most services available only within the
cluster intranet, and not over the public internet. One way to get around this
is to set up a SSH tunnel, which is similar to a VPN, except that you make
services available individually instead of all at once
([additional information about SSH tunneling](https://en.wikipedia.org/wiki/Tunneling_protocol#Secure_Shell_tunneling)).

### Prerequisites

*   Tableau Desktop installed on your workstation
*   Cloud Big Data cluster provisioned with Hive
*   [Hortonworks Hive ODBC driver](http://hortonworks.com/products/releases/hdp-2-2/#add_ons)
*   Ability to set up an SSH tunnel to your cluster.
    * On Mac OS or Linux, use **ssh**.
    * On Windows, use [PuTTY](http://www.putty.org).


### Setting up an SSH tunnel

The first thing to do is to set up the SSH tunnel to the server in your Cloud Big Data cluster that contains the Hive server.  The instructions on how to do this depend on what operating system is running on your workstation.


#### Linux or Mac OS X

On Linux or Mac OS X, you have two choices:

1. Use the [Python client](https://github.com/rackerlabs/python-lavaclient), **lavaclient**, which greatly simplifies the process of setting up the tunnel.  However, if you are not familiar with installing Python packages or do not have the permissions to do so on your workstation, this method may not be appropriate for you.
2. Manually run commands in the terminal.  This typically requires no additional setup, as the requisite software should already be installed on your workstation, and you can get all of the information that you need from the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com).  However, manually running the commands is more time consuming if you have multiple clusters and is more error-prone.

#### Use `lavaclient`

[python-lavaclient](https://github.com/rackerlabs/python-lavaclient), the
Python client for the Cloud Big Data API, makes it simple to set up the SSH
tunnel to your Hive server.

First, open your terminal application (on Mac OS X, the app is located in **Utilities -> Terminal**)
and install the client using **pip**, the Python package manager.  Note that
you may have to first install **pip** using your system's package manager, e.g.
**apt** on Debian/Ubuntu or [Homebrew](http://brew.sh) on Mac OS X.

<pre>$ pip install lavaclient</pre>

Then, use the client to create an SSH tunnel to the Hive server on your cluster:

<pre>$ lavaclient --api-key &lt;API key&gt; --user &lt;username&gt; --tenant &lt;tenant ID&gt; \
      --region &lt;region&gt; clusters ssh_tunnel &lt;cluster ID&gt; 9999 10000 \
      --component HiveServer2

Starting SSH tunnel from 9999 via node gateway-1 (xxx.xx.xxx.xx)
Successfully created SSH tunnel to localhost:9999
Use Ctrl-C to stop tunnel</pre>

This forwards the port 10000 on the cluster node that contains the Hive server
to your local host on port 9999.  Note that if port 9999 is in use on your
system, you can use any open port that you desire; just replace the port after
the cluster ID with your desired port.

#### Set up the tunnel manually

You can also set up the SSH tunnel manually.  First, determine which node in
your cluster is running the Hive server; this is typically the **gateway-1** node
if you are using a pre-defined stack, e.g. **HADOOP_HDP2_2**.  Once you know
which node is running Hive, take note of its public IP address, which can be
found in the [Rackspace Cloud Control Panel](https://mycloud.rackspace.com).
Also be sure to confirm what port the Hive server is running on; by default,
this will be port 10000.

Now you can set up the SSH tunnel:

<pre>$ ssh -N -L 9999:localhost:&lt;hive port&gt; &lt;user&gt;@&lt;ip&gt;</pre>

You can log in with any valid SSH credentials, but it will probably be easiest
to use the credentials with which you created the cluster.


#### Windows

Open PuTTY and under the options on the left, select **Connection -> SSH -> Tunnels**.
Under **Add new forwarded port**, add the following information:

- **Source port**: `10000`
- **Destination**: `localhost:9999`

Click `Add`, then under the options on the left, click **Session** and enter in
the following information:

- **Host Name (or IP address)**: IP Address of node running the Hive server

If you have set up additional logins to your cluster, you may use that
information to log in.  Otherwise, you will have to attach the private key from
the SSH keypair you used to create the cluster. Click **Connection -> SSH -> Auth**,
then click the **Browse** button and select the private key file.

Now, return the the **Session** menu on the left and click **Open**.  When prompted
for a login, enter the username with which you created the cluster.


### Connect to Hive in Tableau Desktop

Assuming you've already installed the Hortonworks Hive ODBC driver, open
Tableau Desktop.  On the left, under **Connect -> To a server**, click
**More Servers... -> Hortonworks Hadoop Hive**.  Then, enter in the following information:

- **Server**: `localhost`
- **Port**: `9999`
- **Type**: `HiveServer2`
- **Authentication**: `User Name`
- **Username**: `hue`

Click **OK**, and you should now be connected to your Hive server.
