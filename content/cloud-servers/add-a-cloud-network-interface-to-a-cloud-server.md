---
permalink: add-a-cloud-network-interface-to-a-cloud-server/
audit_date:
title: Add a Cloud Networks interface to a Cloud Server
type: article
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

You can add a cloud network to a cloud server at any time. This article shows
you how to add a cloud network to a cloud server by using the API and the
rackspace-novaclient (nova). It walks you through installing nova and the
Cloud Networks extension in Mac&reg; OS X, then using nova to add a virtual
interface to a running cloud server that connects to your cloud network. Nova
is also available for Linux&reg; and Windows&reg;.

Use the following steps to install nova:

1. Run the following command:

       sudo easy_install pip

2. Install nova and the Cloud Networks virtual interface
   extension by running the following commands:

       sudo pip install rackspace-novaclient
       sudo pip install os_virtual_interfacesv2_python_novaclient_ext

3. Set up the following environment variables in your local **.profile** file,
   replacing the values inside brackets (< >) with your account information:

       export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
       export OS_AUTH_SYSTEM=rackspace
       export OS_REGION_NAME=DFW
       export OS_USERNAME=<account_username>
       export OS_TENANT_NAME=<account_#>
       export NOVA_RAX_AUTH=1
       export OS_PASSWORD=<api_key>
       export OS_PROJECT_ID=<account_#>
       export OS_NO_CACHE=1

 4. Next, load the environment variables by running the following command:

        source .profile

5. Now you can use your credentials to display information about your cloud
   network and cloud server and add the interface by running the following
   commands:

       nova credentials

       nova list
       #note the ID of the cloud server to which you want to add the interface.

       nova network-list
       #note the ID of your cloud network

       nova virtual-interface-create 30714e92-40d3-4259-bd73-2ed8b03abcf5 e74780b5-d180-4faa-bfc0-87802b20aaf4
       #nova virtual-interface-create networkID cloudserverID

It takes a couple of minutes to add the interface. You should now be able to
log in to the cloud server and check interfaces by running the command `ip a`.
You should see the interface that you added in the output from this command.

**Note**: You can also run `nova virtual-interface-list cloudserverID`.

If you need to add Cloud Networks to your account, submit a ticket from the
Cloud Control Panel.

### Additional resources

You might find the following additional resources helpful:

- [Install CLI client and Cloud Servers Virtual Interface
  extension](https://developer.rackspace.com/docs/cloud-servers/v2/getting-started/send-request-ovw/#id2)
- [Install python-novaclient on Windows](http://www.rackspace.com/knowledge_center/article/installing-python-novaclient-on-windows)
