---
permalink: install-pyrax/
audit_date:
title: Install pyrax
type: article
created_date: '2014-06-02'
created_by: Chris Mendoza
last_modified_date: '2016-01-05'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Complete the following steps on a new Ubuntu or CentOS server to install
and configure pyrax.

### Install pyrax on an Ubuntu server

1.  Update the server:

        apt-get updateapt-get dist-upgrade

2.  Install Python setuptools:

        apt-get install python-setuptools

3.  Install the latest version of pip:

        easy_install pip
                    #make sure it is up to date
                    pip install pip --upgrade

4.  Ensure that pyrax dependencies are met:

        pip install six distribute --upgrade

5.  Install the latest version of pyrax:

        pip install pyrax

6.  Create the credential file. Use your Rackspace Cloud account
    username and API key. For information about how to find your API
    key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).

    **Note:** This file can be located anywhere on the server, but it is
    usually safest in the home directory of the user who is using
    the API.

        /root/.rackspace_cloud_credentials
                    [rackspace_cloud]
                    username = my_username
                    api_key = 01234567890abcdef

7.  Complete the test script to configure pyrax.

### Install pyrax on a CentOS server

1.  Update the server:

        yum -y update

2.  Install Python setuptools and dependencies:

        yum -y install python-setuptools python-devel vim sshpass gcc

3.  Install the latest version of pip:

        easy_install pip
                    #make sure it is up to date
                    pip install pip --upgrade

4.  Ensure that pyrax dependencies are met:

        pip install six distribute --upgrade

5.  Install the latest version of pyrax:

        pip install pyrax

6.  Create the credential file. Use your Rackspace Cloud account
    username and API key. For information about how to find your API
    key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).

    **Note:** This file can be located anywhere on the server, but it is
    usually safest in the home directory of the user who is using
    the API.

        /root/.rackspace_cloud_credentials
                    [rackspace_cloud]
                    username = my_username
                    api_key = 01234567890abcdef

7.  Complete the test script to configure pyrax.

### Run the test script

Run this test script to configure pyrax. This script works on both
Ubuntu and CentOS servers.

    #!/usr/bin/env python2
    #import the pyrax module
    import pyrax
    #set the identity type to Rackspace
    pyrax.set_setting("identity_type", "rackspace")
    #Show Pyrax where to find your credentials
    pyrax.set_credential_file("/root/.rackspace_cloud_credentials")
    #Quick example to list servers.
    cs_dfw = pyrax.connect_to_cloudservers(region="DFW")
    cs_ord = pyrax.connect_to_cloudservers(region="ORD")
    cs_iad = pyrax.connect_to_cloudservers(region="IAD")
    dfw_servers = cs_dfw.list()
    ord_servers = cs_ord.list()
    iad_servers = cs_iad.list()
    all_servers = dfw_servers + ord_servers + iad_servers
    print "DFW Servers"
    print dfw_servers
    print "ORD Servers"
    print ord_servers
    print "IAD Servers"
    print iad_servers
    print "All Servers"
    print all_servers
