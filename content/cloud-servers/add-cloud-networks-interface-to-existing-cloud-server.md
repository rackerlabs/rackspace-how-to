---
permalink: add-cloud-networks-interface-to-existing-cloud-server
audit_date:
title: Add Cloud Networks Interface to Existing Cloud Server
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

When first released you could only add Cloud Networks to a Cloud Server at build time, either a new build or building an existing server from an image. Recently we've added the ability to add Cloud Networks to Cloud Servers through the API at any time. One of the great things about the Open Cloud is the benefit of managing your infrastructure through an API and easy to use tools like the rackspace-novaclient. 
In this example I'll show how I installed rackspace-novaclient and the Cloud Networks extension in OS X, then we will use nova to add a virtual interface to our running Cloud Server that connects to our Cloud Network. rackspace-novaclient is also available for Linux and Windows.
sudo easy_install pip
Now we install the rackspace-novaclient and Cloud Networks virtual interface extension.
sudo pip install rackspace-novaclient
sudo pip install os_virtual_interfacesv2_python_novaclient_ext
To work with the API and novaclient we need to setup some environment variables. I put these in my local .profile file. Replace the < > values with your account information.
export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
export OS_AUTH_SYSTEM=rackspace
export OS_REGION_NAME=DFW
export OS_USERNAME=<account_username>
export OS_TENANT_NAME=<account_#>
export NOVA_RAX_AUTH=1
export OS_PASSWORD=<api_key>
export OS_PROJECT_ID=<account_#>
export OS_NO_CACHE=1

We need to load those variables then we will be able to interact with the API with novaclient.
source .profile
Now we can use our credentials, list some information on our Cloud Networks and Cloud Servers and add the interface.
nova credentials

nova list
#note the ID of the Cloud Server you want the interface added to

nova network-list
#note the ID of your Cloud Network

nova virtual-interface-create 30714e92-40d3-4259-bd73-2ed8b03abcf5 e74780b5-d180-4faa-bfc0-87802b20aaf4
#nova virtual-interface-create networkID cloudserverID

It will take a minute or two to add the interface. You should now be able to login into the Cloud Server and check interfaces with 'ip a' and see the added interface, or you can run 'nova virtual-interface-list cloudserverID'. If you need Cloud Networks added to your account, submit a ticket requesting it from your control panel and we'll get that added. Here are some additional links that might help out.
http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/section_gs_install_nova.html
http://www.rackspace.com/knowledge_center/article/installing-python-novaclient-on-windows
