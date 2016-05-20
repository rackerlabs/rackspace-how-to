---
permalink: installing-python-novaclient-on-linux-and-mac-os/
audit_date:
title: Install python-novaclient on Linux and Mac OS
type: article
created_date: '2012-07-23'
created_by: Jered Heeschen
last_modified_date: '2016-01-04'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

### Remote management

The Cloud Control Panel isn't the only way to manage Cloud Servers. If
you're running a script or program you can use the [Cloud Servers API](http://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/),
but that involves a modicum of coding effort.

If you want to manage your servers from the command line without dealing
directly with the API you can use an open-source client application
called [python-novaclient](http://pypi.python.org/pypi/python-novaclient/).

**Note**: The nova client is not maintained by Rackspace and should be
considered software in development. While we don't directly support the
nova client you can post in the comments below if you run into any
difficulties.

### Prerequisites

To run python-novaclient you'll need python 2.6 or later installed on
your system. You can run the client from either a desktop machine or
from a remote system, like a Cloud Server. For initial testing you might
create a fresh CentOS 6.3 or Ubuntu 11.04 server, but this is not
required.

The python installation will need to have the "setuptools" package
installed as well. This is installed by default on Mac OS X, and many
Linux distributions provide packages to make setuptools easy to install.

To run the nova client you'll need to have access to your Rackspace
Cloud account username and password.

### setuptools

The setuptools python package is required to run the installer for the
nova client. If you're running Mac OS X the setuptools package should
already be installed (if not, see "Other Distributions" below for
install instructions).

Depending on your Linux distribution you can install setuptools through
your package manager. Following are some install commands for various distributions:

-  Debian and Ubuntu

       sudo apt-get update
       sudo apt-get install python-setuptools

-  Fedora, CentOS, and RHEL

       sudo yum install python-setuptools

-  Arch

       sudo pacman -S python2-setuptools

  **Note:** Newer releases of Arch use python 3 by default, which isn't
compatible with the python-novaclient package at this time. Installing
the "python2-setuptools" package will ensure that you have a copy of
python 2.x installed without affecting your existing python 3
installation.

-  Gentoo

       sudo emerge setuptools

-  Other distributions

  If you're not using one of the above, try searching your distribution's
package manager for "setuptools" to find an installation package. If
there isn't one available you can [download the setuptools
package](http://pypi.python.org/pypi/setuptools) directly.

### pip

Now that setuptools is installed we can use one of its programs to
install the python package manager "pip".

    sudo easy_install pip

### Installing the package

And now we finally get to install the client. We'll use pip to download
and install a metapackage that includes the latest version of
python-novaclient and the Rackspace extensions all in one go:

    sudo pip install rackspace-novaclient

If you have trouble with pip you can also download an installation
package from the [python package repository](http://pypi.python.org/pypi/rackspace-novaclient/).

The "rackspace-novaclient" is a metapackage that causes pip to install
the client and all Rackspace extensions for the client.  If you have any
problems with the metapackage you can instead use pip to install the
"python-novaclient" and "rackspace-auth-openstack" packages individually
for basic operation.

### Environment variables

Now that the nova client is installed we just need to set up the
environment variables that will allow it to connect to your Rackspace
Cloud account.

#### Setting the environment variables

Now you'll need to set some environment variables. Open your
.bash_profile file for editing:

    nano ~/.bash_profile

Then add the following lines, changing values to match your
requirements.  Pay particular attention to the username, password/API
key, and tenant name/account number.  You can find your account number
displayed in the upper right of the [Cloud Control Panel](https://mycloud.rackspace.com) when you are logged in.

#### USA, HKG, and AUS Datacenters Example

For these regions (DFW, IAD, ORD, HKG, and SYD), use
the following format:

    OS_USERNAME=username
    OS_TENANT_NAME=accountnumber
    OS_AUTH_SYSTEM=rackspace
    OS_PASSWORD=apikey
    OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
    OS_REGION_NAME=DFW
    OS_NO_CACHE=1
    export OS_USERNAME OS_TENANT_NAME OS_AUTH_SYSTEM OS_PASSWORD OS_AUTH_URL OS_REGION_NAME OS_NO_CACHE

#### UK Datacenters Example

For the UK region (LON), use the following format:

    OS_USERNAME=username
    OS_TENANT_NAME=accountnumber
    OS_AUTH_SYSTEM=rackspace
    OS_PASSWORD=apikey
    OS_AUTH_URL=https://lon.identity.api.rackspacecloud.com/v2.0/
    OS_REGION_NAME=LON
    OS_NO_CACHE=1
    export OS_USERNAME OS_TENANT_NAME OS_AUTH_SYSTEM OS_PASSWORD OS_AUTH_URL OS_REGION_NAME OS_NO_CACHE

### Permissions

Once you've set all of the environment variables save the file. Since
there's a password in there we'll set permissions on the file so other
people can't read it:

    chmod 600 ~/.bash_profile

### Environment variable explanations

The following table lists explanations for each environment variable and
offers suggested values.

| Variable name    | Value type          | Description                                                                                                                                                                                                                                                                                                                                                                                     |
|------------------|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| OS\_USERNAME     | username            | Set this value to your Rackspace Cloud account username.                                                                                                                                                                                                                                                                                                                                        |
| OS\_TENANT\_NAME | account number      | Set this value to your Rackspace Cloud account number, visible in the upper right of the Cloud Contol Panel when logged in.                                                                                                                                                                                                                                                                     |
| OS\_AUTH\_SYSTEM | rackspace           | Set this value to "rackspace" to connect to the Rackspace Cloud.                                                                                                                                                                                                                                                                                                                                |
| OS\_PASSWORD     | password or API key | Set this value to your Rackspace Cloud account API key. You can retrieve your API key in the Cloud Control Panel. See [this article](/how-to/view-and-reset-your-api-key) for more information about generating your API key. With a non-Rackspace Openstack cloud, you will usually put the account password in this variable.                       |
| OS\_AUTH\_URL    | identity endpoint   | Set this value to the endpoint for the identity service the client will use to authenticate for API operations. For the US and AUS Rackspace Cloud that should be `https://identity.api.rackspacecloud.com/v2.0/`, and for the UK Rackspace Cloud it should be `https://lon.identity.api.rackspacecloud.com/v2.0/`.                                                                             |
| OS\_REGION\_NAME | datacenter region   | The code for the datacenter region containing the servers you want to manipulate. You can check your server's datacenter by checking its details screen in the Cloud Control Panel. The datacenter code is just the first three letters of the datacenter's identifier; e.g. `DFW, ORD, HKG, SYD, or LON.` You can override the region setting with the `--os-region-name` command-line option. |
| OS\_NO\_CACHE    | 0 or 1              | On newer versions of Ubuntu the nova client tries to use a system keyring that's usually not set up on servers. Setting this value to "1" will work around the issue. It shouldn't be necessary on other systems, but it shouldn't interfere with the client's operations either. You can override the no\_cache setting with the `--no-cache` command-line option.                             |

#### Loading the environment variables

To apply these environment variables to your current shell, run:

    source ~/.bash_profile

### Testing the client

Now we'll run a quick query to make sure the nova client is ready to go.
To see if you can talk to the API server, run:

    nova image-list

If all is well you'll get back a list of the images available to you
when creating a server.

#### Keychain password message

If you're running the client on an Ubuntu system and it asks for a
"keychain password" run the client with the  `--no-cache` option, as in:

    nova --no-cache image-list

To save some typing you can set the environment variable
"OS_NO_CACHE=1" as in our sample config above.

### Viewing the command list

You can get a full list of commands by typing:

    nova help

**Note**: You won't be able to use every command listed. The
nova client was written for use with recent development versions of
OpenStack, so it includes support for some features that have not yet
been implemented in the Rackspace Cloud.

You can get more help for a command this way too:

    nova help network

We'll talk about some of the more commonly-used commands in a later
article.

### Troubleshooting

The client's error reports aren't terribly comprehensive. Most
troubleshooting will involve checking settings and trying again.

A common problem is entering the username, tenant name, or API key
incorrectly, so be sure and double-check those settings.

Remember that if you change any environment variables you'll need to
either log out and log back in, or tell your shell to read the
.bash_profile again:

    source ~/.bash_profile

You can also use the options that are listed in the "nova help" output
to override some environment variable settings. If you're unsure about
the region, for example, you can substitute it with the
`--os-region-name` option like so:

    nova --os-region-name ORD image-list

### Where to go next

You should have the nova client set up where you can access it, and it
should be able to talk to your Rackspace Cloud account. To look at
some common operations you can perform with the client, like creating
servers and taking snapshots, see [Useful python-novaclient commands](/how-to/useful-python-novaclient-commands).
