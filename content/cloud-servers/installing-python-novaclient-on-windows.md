---
permalink: installing-python-novaclient-on-windows/
audit_date:
title: Install python-novaclient on Windows
type: article
created_date: '2012-07-23'
created_by: Jered Heeschen
last_modified_date: '2018-10-26'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

In this article, we'll discuss remotely managing a Rackspace Cloud Server using the
python-novaclient package running on Windows.

### Remote management

The [Cloud Control Panel](https://login.rackspace.com) isn't the only way to
manage Cloud Servers. If you're running a script or program, you can use the
[Cloud Servers API](http://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/),
but that involves some coding effort.

If you want to manage your servers from the command line without dealing directly with the
API you can use an open-source client application called [python-novaclient](http://pypi.python.org/pypi/python-novaclient/).

**Note**: The nova client is not maintained by Rackspace and should be considered software
in development.

### Prerequisites

To run python-novaclient, you'll need python 2.6 or later installed on your system.  You can
run the client from either a desktop machine or from a remote system, like a Cloud Server.

The python installation needs to have the "setuptools" package installed as well. This
is installed with a python distribution like
[ActiveState ActivePython](http://www.activestate.com/activepython/downloads), which is
discussed in the next section.

To run the nova client, you need to have access to your Rackspace Cloud account username
and password.

### Install ActiveState ActivePython on Windows

If you don't already have a python installation on your Windows system, download
and install the community (free) version of ActiveState ActivePython.

You can download the installer from [their website](http://www.activestate.com/activepython/downloads).

After downloading, run the installer.

#### Install the python-novaclient package

After ActiveState Python is installed, use the python package installer `pip` to
automatically download and install the nova client.

Open a command window by going to the Start Menu and typing "cmd" into the Search box. In
the command window, enter the following command to install the `pbr` package to work around a
bug:

    pip install pbr==0.5.21

Next, enter the following command to install a metapackage that includes the latest version
of python-novaclient and the Rackspace extensions:

    pip install rackspace-novaclient python-novaclient==3.3.0

The "rackspace-novaclient" is a metapackage that causes pip to install the client and all
Rackspace extensions for the client. If you have any problems with the metapackage,
use pip to install the "python-novaclient" and "rackspace-auth-openstack" packages
individually.

When the installations finish, close the command window.

### Install with other python distributions

If you're using another python distribution (like the official python distribution), you
can install the [python setuptools package from pypi](http://pypi.python.org/pypi/setuptools)
(if it isn't included with the distribution), then use easy_install to install pip:

    easy_install pip

Then, follow the installation instructions in the preceding section.

### Environment variables

Now that the nova client is installed, set up the environment variables that
allow it to connect to your Rackspace Cloud account.

#### Find the environment variables editor

For most Windows versions, set your environment variables through the
**System** Control Panel.

1. From the Start menu, select **Control Panel**.
2. In the Control Panel, navigate to the **System and Security** section, and then select **System**.
3. In the System Properties window, click the **Advanced** tab in the top navigation.
4. In the Startup and Recovery section, click **Environment Variables**.

If you have any trouble finding the System Control Panel, type "environment"
into the **Start Menu's** search field. This action provides a link that lets you edit your environment
variables. If given a choice between editing values for your user account or the system,
choose the selection for your user account (unless you know other users on your machine will
need to be able to use the nova client).

#### Set the environment variables

Now set your environment variables. In the **User variables for Administrator** section,
click an environment variable and then click **New**.

Each variable set requires the following names and values.

<table cellpadding="4" cellspacing="0" summary="" id="reference_1bw_3xy_cg__properties_1bm_kxy_cg" border="1" class="simpletable properties"><tr class="sthead prophead">
<th valign="bottom" align="left" id="d26e245" class="stentry proptypehd">Variable name</th>
<th valign="bottom" align="left" id="d26e248" class="stentry propvaluehd">Value type</th>
<th valign="bottom" align="left" id="d26e251" class="stentry propdeschd">Description</th>
</tr><tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_USERNAME</td>
<td valign="top" headers="d26e248" class="stentry propvalue">username</td>
<td valign="top" headers="d26e251" class="stentry propdesc">Set this value to your Rackspace Cloud account username.</td>
</tr>
<tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_TENANT_NAME</td>
<td valign="top" headers="d26e248" class="stentry propvalue">account number</td>
<td valign="top" headers="d26e251" class="stentry propdesc">Set this value to your Rackspace Cloud account number, visible in the upper right when logged in to the <a href="https://login.rackspace.com">Cloud Control Panel</a>.</td>
</tr>
<tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_AUTH_SYSTEM</td>
<td valign="top" headers="d26e248" class="stentry propvalue">rackspace</td>
<td valign="top" headers="d26e251" class="stentry propdesc">Set this value to "rackspace" to connect to the Rackspace Cloud.</td>
</tr>
<tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_PASSWORD</td>
<td valign="top" headers="d26e248" class="stentry propvalue">password or API key</td>
<td valign="top" headers="d26e251" class="stentry propdesc">Set this value to your Rackspace Cloud API key. You can retrieve your API key in
          the Cloud Control Panel. For information about how to find your API key, see <a href="/how-to/view-and-reset-your-api-key">View and reset your API key</a>. With a non-Rackspace Openstack cloud, you will usually put the account password in this variable.</td>
</tr>
<tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_AUTH_URL</td>
<td valign="top" headers="d26e248" class="stentry propvalue">identity endpoint</td>
<td valign="top" headers="d26e251" class="stentry propdesc">Set this value to the endpoint for the identity service the client will use to
          authenticate for API operations. For the US and AUS Rackspace Cloud that should be
            <code>https://identity.api.rackspacecloud.com/v2.0/</code>, and for the UK Rackspace
          Cloud it should be <code>https://lon.identity.api.rackspacecloud.com/v2.0/</code>. </td>
</tr>
<tr class="strow property">
<td valign="top" headers="d26e245" class="stentry proptype">OS_REGION_NAME</td>
<td valign="top" headers="d26e248" class="stentry propvalue">data center region</td>
<td valign="top" headers="d26e251" class="stentry propdesc">The code for the data center region containing the servers you want to manipulate.
          You can check your server's data center by checking its details screen in the Cloud Control
          Panel. The data center code is just the first three letters of the data center's identifier;
          e.g. <code>DFW</code> or <code>ORD</code>. You can override the region setting
          with the <code>--os-region-name</code> command-line option.</td>
</tr>
</table>

After you've set all seven environment variables, "OK" your way back out of those
windows.  Note that any command windows you already have open won't reflect the
changes to your environment variables.

### Test the client

To make sure the nova client is ready to go, open a new command
window by going to the **Start Menu** and entering the following text in the search box.

    cmd

To see if you can talk to the API server, run the following command at the command prompt:

    nova image-list

If the command is successful, the system provides a list of the images available
to you for creating a server.

### View the command list

To get a full list of commands, enter the following command:

    nova help

**Note**: You won't be able to use every command listed.  The nova client was
written for use with recent development versions of OpenStack, so it includes support for
some features that have not yet been implemented in the Rackspace Cloud.

You can get more help for a command by running the following command:

    nova help create

We'll talk about some of the more commonly-used commands in a later article.

### Troubleshooting

The client doesn't provide detailed errors.  A common problem is entering the username,
tenant name, or password incorrectly, so be sure to double-check those settings.

Remember that if you change any environment variables, you need to close your command
window and open a new one to work with the new values.

You can also use the options that are listed at the end of the "nova help" output to override
some environment variable settings.  If you're unsure about the region, for example, you can
substitute it with the `--os-region-name` option as follows:

    nova --os-region-name ORD image-list

### Next steps

By following the instructions in this article, you should have the nova client
set up so that you can access it and it can talk to your Rackspace Cloud account.
To look at some common operations you can perform with the client, like creating
servers and taking snapshots, see
[Useful python-novaclient commands](/how-to/useful-python-novaclient-commands).
