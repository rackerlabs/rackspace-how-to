---
permalink: using-python-novaclient-to-manage-scheduled-images/
audit_date:
title: Manage scheduled images with the python-novaclient
type: article
created_date: '2013-05-16'
created_by: Brian Rosmaita
last_modified_date: '2014-10-29'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### Introduction

While enabling or disabling scheduled images can be done through the
Cloud Control Panel, the control panel does not yet give you the ability
to manage the images themselves. However, this can easily be done from
the command line by using python-novaclient.

In this article, we'll explain how to use the python-novaclient tool to
manage all aspects of scheduled images, both enabling/disabling
scheduled images on a server (which you can do in the control panel) and
managing the images (which you can't). Let's start by describing the
scheduled images feature so we can work from a common vocabulary.

### Scheduled images

The scheduled images feature of the Rackspace Open Cloud allows you to
have automatic weekly or daily snapshots taken of any of your servers.
Just pick a server and enable the feature.

The feature is very simple. The only options are: (1) the day of the
week you'd like a weekly image created, and (2) a "retention" value,
which is the maximum number of scheduled snapshot images of that
particular server you want to retain in your account. Once this number
is exceeded, the scheduled images service will delete the oldest
scheduled snapshot image of that server so that the number of scheduled
images doesn't exceed your retention setting. You can change the
retention value at any time. You won't see the effects of a change until
the next time a scheduled image is added to your account.

Once you've enabled scheduled images on some of your servers you'll
start accumulating them in your account. The retention setting allows
you to keep the number of daily images down to a reasonable level, but
there might be circumstances where you want more control over snapshot
retention. Suppose you want a retention value of 7, but would also like
to save the first scheduled image that was taken this month? For that
you'll need to use either the API or python-novaclient command-line
interface for the API.

Let's look at getting python-novaclient set up for that purpose.

### Setting up python-novaclient

First, if you haven't used python-novaclient before, take a look at one
of these How-To articles:

-   [Installing python-novaclient on Linux and Mac
    OS](/how-to/installing-python-novaclient-on-linux-and-mac-os)
-   [Installing python-novaclient on
    Windows](/how-to/installing-python-novaclient-on-windows)

These articles will provide you with an overview of python-novaclient
and complete instructions for installing it on your operating system of
choice. They also suggest that you install the special
"rackspace-novaclient" package which will install python-novaclient plus
all the extensions supported in the Rackspace Open Cloud. (In order to
get the scheduled images extension, you need to make sure you install
rackspace-novaclient version &gt;= 1.3) If you *already* have a
python-novaclient installed, you can use pip to install *only *the
scheduled images extension:

    sudo pip install rax_scheduled_images_python_novaclient_ext

If you previously used the python-novaclient with daily scheduled
images, and you want to take advantage of weekly scheduled images, you
can upgrade your installation to the latest version of the scheduled
images extension:

    sudo pip install --upgrade rax_scheduled_images_python_novaclient_ext

### Using the scheduled images feature

Once you have the Rackspace scheduled images extension installed for
python-novaclient, it's a snap to manage scheduled images on your
servers. Let's suppose your server ID is
"24ade2fe-60d9-4d3e-a02c-c9a6a1b588a6" and its name is "myserver".

#### Enable scheduled images for a server

To enable weekly scheduled images for a server, use this command:

    nova scheduled-images-enable --day-of-week {day}  {server}  {retention}

For `{server}`, you can use either the UUID or the name of your server.
For `{day}` use one of the
following:  `saturday, sunday, monday, tuesday, wednesday, thursday, friday. `For `{retention}`,
specify the number of scheduled images you want to retain in your
account for this server. The retention must be a positive integral
value.

For example, suppose you want to enable weekly scheduled images on our
example server, and you want to keep at least a month's worth around.
 You'd issue this command:

    nova scheduled-images-enable --day-of-week saturday  24ade2fe-60d9-4d3e-a02c-c9a6a1b588a6  4

To enable daily scheduled images for a server, use this command:

    nova scheduled-images-enable  {server}  {retention}

For `{server}`, you can use either the UUID or the name of your server.
For `{retention}`, specify the number of scheduled images you want to
retain in your account for this server. The retention must be a positive
integral value.

If you want to enable daily scheduled images on our example server, and
you want to keep at least a week's worth around, you'd issue this
command:

    nova scheduled-images-enable  24ade2fe-60d9-4d3e-a02c-c9a6a1b588a6  7

#### Disable scheduled images for a server

To turn off scheduled images for a server, use this command:

    nova scheduled-images-disable  {server}

For `{server}`, you can use either the UUID or the name of your server.
Any scheduled snapshots of this server currently in your account will
remain there; you can delete them using whatever technique you currently
use to delete images.

### Change the day of the week for weekly scheduled images

To change the day of the week your weekly scheduled images are being
created, just enable scheduled images on that server again, specifying
the new day of the week and the retention value you want to use.  For
example,

    nova scheduled-images-enable  --day-of-week sunday  myserver  4

will enable weekly scheduled images on "myserver" where the image will
be created on Sunday and the retention value is 4.

#### Change the retention value on a server

To update the retention value for a server, just enable scheduled images
on that server again, using whatever value you want to change the
retention to.  Note that if you're using weekly scheduled images, you
must specify the day of week when you issue the command.  (Otherwise,
the novaclient will think that you want to switch to a daily schedule.)
For example,

    nova scheduled-images-enable  --day-of-week saturday  myserver  8

will set a retention value of 8 on the example server, with scheduled
images continuing to be taken weekly on Saturday.

If you're using daily scheduled images and you want to change the
retention value, you'd use this command:

    nova scheduled-images-enable  myserver  31

It will set a retention value of 31 on the example server with images
being created daily (since no day of the week was specified).

#### Checking the image schedule on a server

If you are setting different retention values on several servers
according to how important they are, it's easy to lose track of their
retention values. If you want to see what the current retention value is
on a server, use this command:

    nova scheduled-images-show  {server}

For `{server}`, you can use either the UUID or the name of your server.
(You can use this command even if scheduled imaging is not enabled for
the server.)  The output for this command will tell you whether you have
weekly or daily images scheduled for this server and what your retention
value is:

    Schedule type: Weekly on: SATURDAY
    Retention: 8

If you currently have daily scheduled images set on the server, you
would see:

    Schedule type: Daily
    Retention: 31

If scheduled images aren't enabled on that server at all, you'll receive
an error message:

    ERROR (NotFound): Scheduled images not enabled for server 24ade2fe-60d9-4d3e-a02c-c9a6a1b588a6 (HTTP 404)

### Managing Scheduled Images

You now know how to turn scheduled images on and off for each of your
servers, and how to set or change the retention value for each. Now
let's take a look at how to manage your scheduled images.

Scheduled images are basically no different from "regular" snapshot
images, so if you want to remove some of them, you can use whatever
technique you currently use (control panel, novaclient, API requests) to
delete them.

### To Prevent a Scheduled Image from Being Deleted Automatically

Scheduled images do have some extra information attached to them as
metadata. In particular, they have a piece of metadata that indicates
they were created by the scheduled images service. The scheduled images
service looks at this metadatum when it computes how many scheduled
images of a particular server are currently in your account; it compares
this result to the retention value for that server and decides how many
scheduled images should be deleted, starting with the oldest images.

To prevent an image from being deleted or counted by the scheduled
images service, you can use the nova client to remove the
'org.openstack\_\_1\_\_created\_by' metadatum that flags it as a
scheduled image:

    nova  image-meta  {image}  delete  org.openstack__1__created_by

For `{image}`, you can use either the UUID or the name of the image.
There is no response if this call is successful.

#### To See if a Scheduled Image is Subject to Being Deleted Automatically

Once you start managing your images, you need a way to see which are
subject to automatic deletion and which aren't. You can determine this
by using the regular novaclient "image-show" command and looking for the
created-by metadatum:

    nova image-show {image}

For `{image}`, you can use either the UUID or the name of the image.
Here's an example (abbreviated) response:

    +---------------------------------------+--------------------------------------+
    | Property                              | Value                                |
    +---------------------------------------+--------------------------------------+
    | status                                | ACTIVE                               |
    | updated                               | 2013-05-10T17:39:08Z                 |
    | name                                  | Daily-myserver-1368176524            |
    | metadata instance_uuid                | 24ade2fe-60d9-4d3e-a02c-c9a6a1b588a6 |
    | metadata org.openstack__1__created_by | scheduled_images_service             |
    | progress                              | 100                                  |
    | id                                    | d615a437-aaa9-4a52-a1c0-5bcb0d33038c |
    +---------------------------------------+--------------------------------------+

If the image detail response contains a row with property 'metadata
org.openstack\_\_1\_\_created\_by' and value
'scheduled\_images\_service', then this image may be removed by the
scheduled images service. If such a row is missing, or the value of the
property is something other than 'scheduled\_images\_service', then the
scheduled images service will *not* delete the image. Note that you can
tell which server this image is a snapshot of by looking at the value in
the 'instance\_uuid' metadata field.

### Conclusion

In this article, we explained how to use python-novaclient (with the
Rackspace scheduled images extension) to manage scheduled images.  We
looked at enabling and disabling weekly and daily scheduled images on a
server, which can be done with the Cloud Control Panel as well as
python-novaclient.  We also discussed preventing a scheduled image from
being automatically deleted when the number of scheduled images in your
account exceeds the retention count for that server, which can only be
done through the API or python-novaclient.

### More Information

-   [Scheduled Images
    FAQ](/how-to/scheduled-images-faq "Scheduled Images FAQ")
-   [Scheduled Images API Extension
    Documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#document-extensions/ext-scheduled-images)
