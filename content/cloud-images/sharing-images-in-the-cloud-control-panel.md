---
permalink: sharing-images-in-the-cloud-control-panel/
audit_date: '2018-02-06'
title: Sharing images in the Cloud Control Panel
type: article
created_date: '2015-01-29'
created_by: Rackspace Support
last_modified_date: '2018-02-06'
last_modified_by: Cat Lookabaugh
product: Cloud Images
product_url: cloud-images
---

This article provides general information about sharing server
images and provides details about how image sharing works in the Cloud
Control Panel.

### How are shared images useful?

Image sharing enables you to use custom images created by other
Rackspace cloud users and to create custom images to share with others.
Following are example scenarios in which image sharing would be helpful:

-   You are a hobbyist who has used **boot.rackspace.com** to create an
    image of an exotic operating system that Rackspace doesn't offer as
    a base image choice, and you'd like other members of your exotic OS
    users' group to be able to boot servers from your image.
-   You work in a company where each department has its own Rackspace
    cloud account, and department A has configured a server to run
    optimally. Instead of department B performing the same
    configuration work, department A can share an image of this optimal
    server with department B, and department B can boot a server
    directly from the image.
-   Your company wants to keep strict separation between its production
    servers and its test servers. To reduce the possibility that
    someone cleaning up the account could delete a production server by
    mistake, the production servers are in account P and the test
    servers are in account T. When a particular configuration has
    passed testing, you can create an image of that server in account T
    and share it with account P and then boot a server in the
    production account.

### Image sharing overview

Here's a quick overview of some aspects of image sharing. To keep
things clear, we'll refer to the person who's created an image to share
as the *producer*, and the person who wants to use that image as the
*consumer*. (Putting it another way, the *producer* is the share-er,
and the "consumer" is the share-ee.)

-   **Support for shared images:** Shared images are considered
    *nonstandard images* (for more information, see [Standard and Non-Standard Images](/how-to/rackspace-standard-and-non-standard-images)).

    **Note:** Regardless of the service level that you are subscribed to, we cannot
    guarantee supportability of these images. Your service level agreement (SLA)
    on cloud servers that use shared images extends only to the physical
    infrastructure on which the shared image resides.

-   **Visibility of shared images (anti-spam):** If someone shares an
    image with you, you can see it within your list of bootable images
    only if you want to. Only images that you have specifically
    *accepted* appear in your image list. If you don't want an image 
    shared with you to clutter up your image list, you always have the option 
    to *reject* it.

-   **Image sharing is account-to-account:** If you have an account in
    which you've created additional users, users who have been assigned
    the appropriate RBAC role can perform the following actions:

    -   Producer: The user can share *any* image in your account, not
        just those images that the user has specifically created
    -   Consumer: If the user accepts an image, that image displays with
        the bootable images for *all* users in the account.

-   **Image sharing is regional**: In the Rackspace Cloud, each image
    exists in a particular region. If a producer has an image in the
    IAD region and shares it with a consumer, the consumer can use that
    image in the IAD region.

-   **A shared image is *not* a copy**: If a producer shares an image
    with you, you are using the producer's actual image, not a copy.
    The benefit of this is that you don't have to pay for storage for
    that image. The disadvantage is that if the producer decides to
    stop sharing the image with you, you no longer have access to
    the image.

    **Tip**: If a particular shared image is useful to you, create
    your own image from a server that is booted from the
    shared image.

-   **Image sharing is also available in the Cloud Images API:** If you
    share an image with someone who doesn't use the Cloud Control Panel,
    you might want to notify them that the image is available.  Because
    of the anti-spam feature, the image won't display in their image list.

For more information, see the image sharing section of the [Cloud Images FAQ](/how-to/cloud-images-faq).

#### Permissions

The abilities to share and accept images are controlled by RBAC for Cloud Images. 
The roles are briefly described as follows:

-   In order to share an image (that is, in order to act as an image
    producer), a user must have the **cloudImages:creator** (or greater,
    or equivalent) role.
-   In order to accept an image (that is, in order to act as an image
    consumer), a user must have the **cloudImages:admin** (or greater,
    or equivalent role).

For more information about Cloud Images RBAC, see the How To article 
[Detailed Permission Matrix for Cloud Images](/how-to/detailed-permissions-matrix-for-cloud-images).

### Sharing an image in the Cloud Control Panel

Use the following considerations and steps to share server images.

#### Before you share an image

Before you share an image, consider the following questions:

-   Does the image contain any software whose license prohibits
    distribution?  

    By sharing an image, you are distributing the
    software on it. It is your responsibility to ensure that such
    distribution is allowed by each vendor's software license.

-   Does the image contain any of your sensitive information?

    Before sharing an image, boot a new server from it in your own account.
    Log in to the server and verify that the image doesn't contain any
    private encryption keys or other sensitive information.

-   Is there any malicious software on the image?

    You are expected to follow the Rackspace [Acceptable Use Policy](http://www.rackspace.com/information/legal/aup) (AUP) with regard to the type of software included on images. Ensure that
    you're familiar with the AUP before you share an image.

#### Share an image

1.  When your image is ready to share, use one of the following methods
    in the Control Panel to share it:

    In the **Saved Images** list (**Servers > Saved Images**), click the
    gear icon to the left of the image name, and then select **Share
    Image**.

    -   A. On the **Image Detail** page, click the gear icon, and then
        select **Share Image**.
    -   B. Scroll to the bottom of the **Image Detail** page to the **Image
        Sharing** section, and click **Share Image**.

    When the sharing dialog box opens, the image sharing interface in
    the Cloud Control Panel is optimized for the following common
    sharing scenarios:

    -   **Sharing an image with another account to which you have
        legitimate access:**

        In other words, you have legitimate access
        to the username and password of a user on that account whose
        RBAC role is at least as powerful as **cloudImages:admin**. For
        example, you are in the IT department of a company, and you 
        set up accounts for some other departments. You prepared
        some images for these departments, and now you want to make the
        images available for people in these departments to use.
   
    -   **Sharing an image with another customer:**

        For example, you are the hobbyist described earlier. The members of your
        exotic OS users' group gave you their account numbers, but
        they aren't going to give you their usernames and passwords.

2.  Enter the appropriate information for your scenario, and
    click **Share Image**.

The Image Sharing table at the bottom of the **Image Detail** page is
populated with a row containing information about this sharing event.
You can see which users have accepted or rejected your sharing request,
and for which users the request is pending acceptance.

#### Image sharing courtesy

To keep the Rackspace Cloud a friendly place, observe the following
suggestions:

-   Don't share images with random customers. Share only with customers
    with whom you have a connection.
-   If a sharing request is in the Pending Acceptance status for a
    while, verify that you entered the correct account number before
    sending a reminder.
-   If a sharing request is rejected, don't take it personally.
-   If a potential image consumer rejects your image but then contacts
    you to request it again, remove the consumer from the image and then
    re-share the image with the consumer.  As an image producer, you
    cannot directly change their status.

### Accept or reject a shared image

As explained earlier, to prevent spam in your image list, you must
accept an image before it displays in your image list.  You can find out whether someone
has shared an image with you in the following places in the Cloud Control Panel:

-   **Your list of Saved Images:** When someone has shared an image with
    you, a notification appears at the top of your list of saved
    images.  Because an image exists in a particular region, this
    notification is visible only when the region selector at the top of
    the list is set to **All Regions (Global)** or to the region in
    which the image exists.
-   **On the Create Server page:** If you are creating a server in a
    region in which someone has shared an image with you, a notification
    appears at the top of the image selector.

If you accept an image, the notification disappears and the image
displays in your list of saved images.  On the **Saved Images** page, the
text **Shared Image** displays in the **Source** column.  In the image
selector on the **Create Server** page, select **Saved Images** and
then **Shared Images**.

If you reject the image, it does not display in your image list, and the
notification disappears.

If you don't want to boot from the image now and want to postpone the
decision to accept or reject the image, close the dialog box and
the notification remains.

#### Reject an image after accepting it

If you accept an image and then decide later that you don't want it, you
can reject it by using the following steps:

1.  Find the image in your list of saved images.
2.  Click the gear icon to the left of the image name, and
    select **Remove Image**.

#### Accept an image after rejecting it

If you reject an image and decide later that you want it, you
must notify the image producer and ask that the image be re-shared with
you.

### Use a shared image

After you accept a shared image, you can use it to boot a server by using
your normal workflow. However, we encourage you to consider the
following information before booting a server from a shared image:

-   **Shared images are nonstandard images.** For more information, see
    [Standard and Non-Standard Images](/how-to/rackspace-standard-and-non-standard-images).
    For servers booted from nonstandard images, you can expect that we
    ensure that host servers are functioning properly and that the API
    availability meets the SLA.

    However, we *cannot* promise to support
    servers booted from shared images in the same way that we support servers
    booted from Rackspace base images. We create the base images
    ourselves and know exactly what's on them, whereas the point of
    shared images is to empower our customers to use images that we haven't
    implemented. Although you can expect support, you can't
    expect our support staff to know the intricacies of exotic OS, for
    example, in the same way that they know CentOS.

-   Verify that there are no strange users with login privileges in
    /**etc/passwd** and that there aren't any strange SSH keys
    preinstalled on the server.
-   **Build critical infrastructure components only from images created
    by people that you trust.** If you suspect that an image
    shared with you contains malware or is behaving strangely, you can
    report such suspicious activities to Rackspace Support and
    to <cloudimageshelp@rackspace.com>.
