---
permalink: useful-python-novaclient-commands/
audit_date:
title: Useful python-novaclient commands
type: article
created_date: '2012-07-23'
created_by: Jered Heeschen
last_modified_date: '2016-01-04'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article discusses several of the commands that can be run against
Cloud Servers using python-novaclient.

### Nova Client Operations

Now that you've installed the nova client on a
[Windows](/how-to/installing-python-novaclient-on-windows),
[Linux](/how-to/installing-python-novaclient-on-linux-and-mac-os),
or [Mac OS
X](/how-to/installing-python-novaclient-on-linux-and-mac-os)
machine, it's time to look at what you can do with it.

We'll assume you've run through the installation and the client is
working with your Cloud Servers account. If not, see the previous
articles in this series for installation instructions.

### The help command

The first, and possibly most important, command to know about is the
"help" command. Running "help" by itself will give a list of available
commands:

    nova help

You can get further help on each command by adding its name after "nova
help". For example, to see the syntax for the command that creates a
server, run:

    nova help boot

Note that not every command in the list will work with Cloud Servers.
The nova client is written for use with OpenStack, not for the Rackspace
Cloud specifically. Thus, some of the commands refer to operations that
haven't been implemented on Cloud Servers yet, while others are there to
manage a full OpenStack installation.

We'll walk through the more common operations that will work with
Rackspace Cloud Servers and how to use them.

### Note on spaces

If you want to refer to a server or image by name and the name has a
space in it, remember to put the name in quotes so the client knows it's
a single argument.

### More common commands

These are commands used for most day-to-day operations with Cloud
Servers.

#### list

The "list" command returns a list of the servers on your account. Just
"list" by itself will show you everything, while options are available
to limit the list by a range of IP addresses or to show you servers with
a particular status.

The output shows the server's unique ID in the first column, then the
server name, then the server status, and the final column shows the
network addresses associated with the server.

Example:

    nova list --status active

#### image-create

The "image-create" command will take a snapshot of a server. The first
argument the command takes is the name or ID of the server, and the
second argument is the name you want assigned to the new snapshot.

Example:

    nova image-create servername backupname

#### image-list

The "image-list" command displays a list of images available for use
when creating a server. You'll see both Rackspace-built images and
images you've created yourself with "image-create".

The format is similar to a server list command. The leftmost column
shows the image ID, the next column shows the image name, then the image
status, and finally the ID of the server that was used as the source of
the snapshot (for images you create yourself).

Example:

    nova image-list

#### flavor-list

The "flavor-list" command displays a list of available server flavors. A
"flavor" describes the memory, disk space, and CPUs that will be
allocated to the server.

The first column shows the flavor ID, the next column is the flavor
name, next is the memory allocation (in megabytes), next is the swap
allocation (if any, also in megabytes), then the disk space allocated to
the server (in gigabytes), then the number of virtual CPUs for the
instance, and then a network throughput cap factor associated with the
flavor.

Example:

    nova flavor-list

#### boot -image 100 -flavor 1 name

To create a new Cloud Server you use the "boot" command. At its
simplest, you tell the boot command what flavor to use with the
"-flavor" option, what image to use as the base with the "-image"
option, and then include the name of the server you're creating as an
argument for the command.

You can see a list of flavors with the "flavor-list" command and a list
of images with the "image-list" command. You refer to a flavor or image
using its ID.

The output of the boot command will list data about the new server,
including the root or administrator password.

Example:

    nova boot --flavor 1 --image 758d32fe-9f2c-470a-a082-ba6832a06431 servername

#### reboot

The "reboot" command will tell a server to reboot, taking the name or ID
of the target server as its argument. By default the server will perform
a "soft reboot", where the OS is told to gracefully reboot the server.
You can cause a "hard reboot" (like switching the power off then on
again) with the "-hard" option.

Example:

    nova reboot --hard servername

#### delete

The "delete" command will delete a server, taking the name or ID of the
server as its argument. Use this command with caution.

Example:

    nova delete servername

#### image-delete

The "image-delete" command will delete an image, taking the name or ID
of the image as its argument. Use this command with caution too.

Example:

    nova image-delete imagename

### Less common commands

These are commands that are also useful, but aren't necessarily used as
often as that first batch.

#### show

The "show" command will return data about a server - its flavor, the
image it was built from, its network addresses, and other details.

Example:

    nova show servername

#### image-show

The "image-show" command returns data about an image, which you can
refer to by name or by ID in the command. The data includes the date the
image was created and the minimum disk space required for a server built
from the image.

Example:

    nova image-show "CentOS 6.0"

#### resize

Use the "resize" command to switch a server to another flavor. When you
call the command the first argument is the server name or ID and the
second argument will be the flavor name or ID.

**Please note**: nova resize will not work for virtual cloud servers or
Standard servers with manual disk allocation enabled. For more
information on changing the size of a virtual cloud server, see
[Changing the Size of Your Performance Cloud
Server](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers).

A server cannot be resized to a smaller flavor if it has more disk space
allocated to it than would be allowed in the smaller flavor.

Example:

    nova resize servername "512MB instance"

#### resize-confirm

After a resize completes it has to be confirmed as successful before the
resize becomes permanent. Use the "resize-confirm" command with a server
name or ID as its argument to apply that confirmation.

Example:

    nova resize-confirm servername

#### resize-revert

After a resize completes you may discover a problem with the server that
indicates the resize introduced a problem. Rather than confirming the
resize, in this case you can send the "resize-revert" command to roll
the server back to its original flavor.

Example:

    nova resize-revert servername

#### rebuild

The "rebuild" command will take an existing server and rebuild it using
an image. The first argument to the command is the server name or ID and
the second argument is the name or ID of the image to be used.

You can optionally include the "-rebuild_password" option to set a root
password for the rebuilt server (instead of having one randomly
generated).

Example:

    nova rebuild --rebuild_password PASSWORD servername "Fedora 16"

#### rename

The "rename" command renames a server. The first argument is the
server's current name or its ID. The second argument is the new name.

Example:

    nova rename servername newname

#### rescue

The "rescue" command will put a server into rescue mode, allowing you to
access and modify the instance's file system while the server is
inactive. The output of the command is the root password used by the
rescue instance.

Example:

    nova rescue servername

#### unrescue

Use the "unrescue" command to take a server out of rescue mode and cause
it to boot normally.

Example:

    nova unrescue servername

#### root-password

Change the root password for an instance using the "root-password"
command. Use the server name as the command's argument, then you'll be
asked to enter the new password.

Example:

    nova root-password servername

#### meta

Use the "meta" command to set or delete metadata on a server. The
metadata is in "key=value" form. You can view the metadata set on a
server with the "show" command.

The first argument is the name or ID of the server, the second argument
specifies the action (either "set" or "delete"), and the third argument
is the keypair defining the metadata.

Example:

    nova meta servername set "role=development"

#### image-meta

Use the "image-meta" command to set or delete metadata on an image. The
metadata is in "key=value" form. You can view the metadata set on an
image with the "image-show" command.

The first argument is the name or ID of the image, the second argument
specifies the action (either "set" or "delete"), and the third argument
is the keypair defining the metadata.

Example:

    nova image-meta imagename set "role=development"

#### absolute-limits

The "absolute-limits" command will output limits set on your account.
The limits can include the maximum number of metadata pairs you can
associate with an image or server, the maximum number and size of
"personalities" (files) you can install to a server when it's created,
the maximum number of servers allowed on your account, and the maximum
amount of memory that can be allocated in total to all the servers on
your account.

Example:

    nova absolute-limits

### Summary

These commands should let you perform most of the basic operations,
however. Remember that you can see a full list, or get more details on a
command, by using "nova help".
