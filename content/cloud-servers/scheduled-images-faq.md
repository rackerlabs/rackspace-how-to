---
permalink: scheduled-images-faq/
audit_date:
title: Scheduled Images FAQ
type: article
created_date: '2013-05-22'
created_by: Brian Rosmaita
last_modified_date: '2016-01-06'
last_modified_by: Kelly Holcomb
product: Cloud Servers
product_url: cloud-servers
---

### - Scheduled Images -

#### What are Scheduled Images?

Cloud Servers users can create two different kinds of images from their
running servers: *manual* or *scheduled*. A *manual image* is initiated
by the user, and runs only one time. A *scheduled image* is an
automatically captured image that is taken either daily or weekly, and
retains up to the number of images specified by the user.

#### Why would I use Scheduled Images?

By having images automatically captured, versus manually triggering them
each time, you create an image history. That history can be used to
recover your server to the point the image was taken in the case of
emergency or server failure.

Consider the following issues:

-   Images are useful for recovery in many scenarios, but should never
    be used as your sole source of recovery. We recommend Cloud Backup
    or your preferred backup method be used in conjunction with
    server images.
-   Some application servers are not good candidates for
    scheduled images. In particular, some database management systems
    need to be in a particular state when an image is taken if you want
    a working DBMS when you boot a server from the image. Consult your
    DBMS vendor for more information. If you have such a DBMS and you
    want to create an image of the server, read [Using task states with
    server
    imaging](/how-to/using-task-states-with-server-imaging).
-   As is the case with a manual image, a scheduled image is an image of
    the system disk only.

#### How do I use Scheduled Images?

Initiating Scheduled Images is easy, and available to both Control Panel
and API users:

-   Control Panel: Click the "cog" (gear wheel) next to your server
    name, and select **Schedule Image**. From the popup, select whether
    you want to create an image every **Day** or **Week**.  If you
    select **Week**, you can also specify on which **Day of Week** you'd
    like the image created.  Finally, specify the number of images you
    want to retain and then click **Create Schedule**.
-   API users: See the Cloud Servers [API documentation for the
    Scheduled Images
    extension](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#enable-scheduled-images).

Images are stored in Cloud Images.  You're charged for them, however, as
if they were stored in your Cloud Files account.  Thus, you'll be
charged your normal Cloud Files rate (including any applicable tiering
or volume discounts).

### - Scheduling -

#### How can I tell scheduled images from snapshots I took myself when I look at my image list?

Scheduled images will originally be created with a name based on this
scheme:

-   **daily-{server-name}-{10-digit-number}** (for daily
    scheduled images)
-   **weekly-{server-name}-{10-digit-number}** (for weekly
    scheduled images)
-   an image name is limited to 255 characters, so if you have a server
    name longer than 238 characters, it will be truncated to fit

The best way to tell is to look at the image metadata - though
unfortunately, you can't see it in the Cloud Control Panel yet. Using
the API or the novaclient command line tool, you will see that an image
created by the scheduled images service has the following metadatum on
it:

    org.openstack__1__created_by: scheduled_images_service

For information about using the novaclient tool for scheduled images,
see [Using python-novaclient to manage scheduled
images](/how-to/using-python-novaclient-to-manage-scheduled-images).

#### Is there a minimum or maximum time between scheduled images?

No (see next answer), but daily scheduled images will be roughly 24
hours apart and occur on different dates UTC.

For weekly images, you specify the day of the week (determined by UTC)
when you'd like your server image created. As some days of the week are
much more popular than others for scheduling images, in rare
circumstances we may create your weekly scheduled image in a window
beginning 12:00 UTC the day before the day of the week you specify and
ending at 12:00 UTC the day after the day of the week you specify.

#### Will they occur on the same time each day?

In order to operate the scheduled images service with minimal impact on
on-demand snapshots and other network-intensive data transfers, the time
a snapshot occurs may be changed at any time to optimize load.  We
reserve the right to modify the time your image is made so that we can
balance the the number of image creations in flight throughout the cloud
and throughout the day.

#### Will the image created\_at reflect the completion or start time?

The implementation uses the normal OpenStack snapshotting process, so
the created\_at timestamp will be the time the call was made, i.e., at
the start of the snapshot.  The time it will be available for you to use
(that is, when its status is ACTIVE) depends on factors such as the size
of the image and overall network congestion in the cloud.

#### Can I miss a day?

If you mean "Can I tell the service to skip a day?" the answer is no. We
do not recommend trying to do this manually by disabling scheduled
images on a server and then re-enabling them because of the dynamic
nature of the scheduling system. It is better just to delete any
scheduled images you don't want in your account.

If you mean "Is it possible that a scheduled image will not be made on a
particular day for a server," the answer is yes. There are several
reasons why this could happen; for example, at the time the snapshot is
attempted, your server is in a state that does not allow snapshots to be
made (for example, if you are doing a server resize at that time).
However, at the current time the service will attempt to create a
snapshot of your server three times, with the re-tries being
approximately one hour apart. (**Note**: We are constantly monitoring
the service faults, and may change the number or frequency depending
upon how the service is performing.)

If you notice two or more consecutively skipped days, contact Rackspace
support.

### Retention

#### What is the "retention" value?

The retention value is the maximum number of scheduled images for that
particular server that will be retained in your account.  Once the
number of scheduled images for this server reaches the retention value,
the oldest scheduled image(s) will be deleted so that the total number
of scheduled images for this server does not exceed the retention value.

The retention value is set on a per-server basis. Therefore, you may
specify a different retention value for each server.

#### What is the maximum retention value?

The maximum retention value in the Rackspace open cloud is 65535.
(That's about 179 years of daily images.)

#### When does automatic deletion occur?

When a scheduled image of a server has successfully completed, the
scheduled images service creates a list of all that server's scheduled
images and (if necessary) deletes the oldest image(s) until the
retention value for that server is reached.

#### What if I don't want certain images automatically deleted?

Let's suppose that we're talking about the scheduled images for server
'd615a437-aaa9-4a52-a1c0-5bcb0d33038c'. In order to determine how many
scheduled images are in your account for this server, the scheduled
images service looks only at images that meet the following two
constraints:

-   the metadatum 'org.openstack\_\_1\_\_created\_by' is on the image,
    and its value is 'scheduled\_images\_service'
-   the image property 'instance\_uuid' has the value
    'd615a437-aaa9-4a52-a1c0-5bcb0d33038c'

So, if you remove the metadatum 'org.openstack\_\_1\_\_created\_by' from
the scheduled image you wish to save, the snapshot will not be subject
to retention culling.

At the current time, you cannot modify image metadata via the cloud
control panel. If you don't want to make API calls directly, a
command-line tool called novaclient is available. For more information
about using the novaclient tool to manage your scheduled images, see
[Using python-novaclient to manage scheduled
images](/how-to/using-python-novaclient-to-manage-scheduled-images).

#### How can I change the retention value on my server?

You can change the retention value the same way you originally enabled
scheduled images on your server, by

-   Cloud Control Panel
-   API
-   novaclient command-line tool

Just specify the new value you wish to use for the retention.

#### What happens to the scheduled images in my account when I change the retention value?

Nothing at first, but when your next scheduled image is completed, the
scheduled images service will use the new retention value when it
calculates whether any images need to be deleted from your account.

#### What if I want to delete a scheduled image right away?

A scheduled image is just a normal snapshot. You can do what you like
with it just as you can with your other snapshots. You can delete a
scheduled image at any time using your normal workflow (control panel,
novaclient, direct API calls).

### Miscellaneous

#### You say this is a "best effort" service. What does that mean?

"Best effort" service means that you may not specify a particular time
at which your server snapshot will be taken, nor can we guarantee what
time your scheduled image will become active. We've placed these
restrictions because the scheduled times for snapshots are spread out so
as not to interfere with each other or with on-demand snapshots. The
time before an image becomes active will depend upon the current network
traffic load, among other things. We guarantee that all users will
receive the same best effort service.

In using scheduled images, please keep the following in mind:

-   smaller snapshots tend to finish more quickly
-   a very large snapshot may take so long to finish that it may block
    the next day's scheduled snapshot from occurring
-   if you have a large amount of data to save, you may wish to explore
    other backup options

#### A service similar to scheduled images exists in the Classic Rackspace Cloud. Will the Classic service stay the same, or will it change to work like scheduled images in the Rackspace Open Cloud?

There are no plans to change the Classic service; its configuration
options will remain the same as they are now.

#### Where can I get more information about Scheduled Images?

-   [Scheduled Images API Extension
    Documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#enable-scheduled-images)
-   [Using python-novaclient to manage scheduled
    images](/how-to/using-python-novaclient-to-manage-scheduled-images)
