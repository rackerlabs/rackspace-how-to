---
permalink: installing-python-openstackclient-on-linux-and-mac-os/
audit_date:
title: Install python-openstackclient on Linux and Mac OS
type: article
created_date: '2012-07-23'
created_by: Jered Heeschen
last_modified_date: '2019-12-20'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Remote management

The [Cloud Control Panel](https://login.rackspace.com) isn't the only way to
manage Cloud Servers. If you're running a script or program, you can use the
[Cloud Servers API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/),
but that involves some coding effort.

If you want to manage your servers from the command line without dealing
directly with the API, you can use an open-source client application
called [`python-openstackclient`](http://pypi.python.org/pypi/python-openstackclient/).

**Note**: Rackspace does not maintain the `openstackclient`, and it is not
guaranteed to operate with Rackspace Cloud.

### Prerequisites

To run `python-openstackclient`, you need python 2.7 or later installed on
your system. You can run the client from either a desktop machine or
from a remote system, like a Cloud Server. You also need `pip`, which is a python package manager.

### Installing the package

To install the client, use `pip`:

    pip install python-openstackclient


### Environment variables

Now that you've installed the `openstackclient`, set up the environment variables that
allow it to connect to your Rackspace Cloud account.

#### Setting the environment variables

To set some environment variables, run the following command to open your
**.bash_profile** file for editing:

    nano ~/.bash_profile

Then add the lines in the following data center sections, changing values to
match your requirements. Pay particular attention to the username, password,
and tenant name or account number. You can find your account number
in the upper right of the [Cloud Control Panel](https://login.rackspace.com)
after you log in.

##### Example

Use the following format:

    OS_USERNAME=username
    OS_TENANT_NAME=accountnumber
    OS_AUTH_SYSTEM=rackspace
    OS_PASSWORD=password
    OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
    OS_REGION_NAME=DFW
    OS_NO_CACHE=1
    export OS_USERNAME OS_TENANT_NAME OS_AUTH_SYSTEM OS_PASSWORD OS_AUTH_URL OS_REGION_NAME OS_NO_CACHE


### Permissions

After you've set all of the environment variables, save the file. Because
there's a password included, run the following command to set permissions on
the file so other people can't read it:

    chmod 600 ~/.bash_profile

### Environment variable explanations

The following table lists explanations for each environment variable and
offers suggested values:

| Variable name    | Value type          | Description                                                                                                                                                                                                                                                                                                                                                                                     |
|------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| OS\_USERNAME     | username            | Set this value to your Rackspace Cloud account username.                                                                                                                                                                                                                                                                                                                                        |
| OS\_TENANT\_NAME | account number      | Set this value to your Rackspace Cloud account number, visible in the upper right of the Cloud Contol Panel when logged in.                                                                                                                                                                                                                                                                     |
| OS\_AUTH\_SYSTEM | rackspace           | Set this value to `rackspace` to connect to the Rackspace Cloud.                                                                                                                                                                                                                                                                                                                                |
| OS\_PASSWORD     | password | Set this value to your Rackspace Cloud account password.         |
| OS\_AUTH\_URL    | identity endpoint   | Set this value to the endpoint for the identity service the client uses to authenticate for API operations, which is `https://identity.api.rackspacecloud.com/v2.0`.                                                                             |
| OS\_REGION\_NAME | datacenter region   | The code for the data center region containing the servers you want to manipulate. You can check your server's datacenter by checking its details screen in the Cloud Control Panel. The datacenter code is just the first three letters of the datacenter's identifier; e.g. `DFW, IAD, ORD, HKG, SYD, or LON.` You can override the region setting with the `--os-region-name` command-line option. |
| OS\_NO\_CACHE    | 0 or 1              | On newer versions of the Ubuntu operating system the `openstackclient` tries to use a system keyring that's usually not set up on servers. Setting this value to "1" works around the issue. It shouldn't be necessary on other systems, but it shouldn't interfere with the client's operations either. You can override the no\_cache setting with the `--no-cache` command-line option.                             |

#### Loading the environment variables

To apply these environment variables to your current shell, run the following
command:

    source ~/.bash_profile

### Testing the client

Next, run a quick query to make sure the `openstackclient` is ready to go.
To see if you can talk to the API server, run the following command:

    openstack image list

If the command is successful, the system displays a list of the images available
to you when creating a server.

#### Keychain password message

If you're running the client on the Ubuntu&reg; operating system and it asks for a
keychain password, run the client with the  `--no-cache` option, as shown in
the following example:

    openstack --no-cache image-list

To save some typing, set the environment variable `OS_NO_CACHE=1` as shown in
the preceding configuration sample.

### Viewing the command list

You can get a full list of commands by using the following command:

    openstack help

**Note**: You won't be able to use every command listed. The
`openstackclient` is written for use with recent development versions of
OpenStack&reg;, so it includes support for some features that have not yet
been implemented in the Rackspace Cloud.

You can get more help for a subcommand by running the following command:

    openstack help network

### Troubleshooting

Use the `--debug` flag to output both the full request from `openstackclient` and any responses from the Rackspace Cloud APIs. This information can be helpful when you file a bug report or opening a support ticket.

A common problem is entering the username, tenant name, or password
incorrectly, so be sure to double-check those settings.

Remember that, if you change any environment variables, you need to
either log out and log back in, or tell your shell to read the
**.bash_profile** again by using the following command:

    source ~/.bash_profile

You can also use the options that are listed in the `openstack help` output
to override some environment variable settings. If you're unsure about
the region, for example, you can substitute it with the
`--os-region-name` option as shown in the following example:

    openstack --os-region-name ORD image list

### Advantages over Cloud Control Panel

The `openstackclient` supports features that are available in the Cloud Servers API, but not exposed in the Cloud Control Panel. For example, the following command creates a server with the OpenStack Config Drive and user data for cloud-init:

    openstack server create --image "Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM)" --flavor general1-1 --config-drive=True --user-data=rack-ubuntu.yml openstack-server
