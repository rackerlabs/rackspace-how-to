---
permalink: create-a-clone-of-a-cloud-block-storage-volume/
audit_date:
title: Create a clone of a Cloud Block Storage volume
type: article
created_date: '2014-03-18'
created_by: David Hendler
last_modified_date: '2016-06-06'
last_modified_by: Nate Archer
product: Cloud Block Storage
product_url: cloud-block-storage
---

A clone of a Cloud Block Storage volume is a copy made of an existing
volume at a specific moment in time. At a high-level, the volume cloning
process does the following:

-   Creates a Logical Volume Management (LVM) copy on the
    *write* segment of your existing volume.
-   Creates a new blank volume on a separate storage node.
-   Directly transfers the volume data from the existing volume to the
    new volume.

The end result is an identical Cloud Block Storage volume that you can
immediately attach and use. You have the option to change the volume
type prior to beginning the volume clone process. Additionally, volume
cloning also allows you to increase the size of the new volume. The
cloned volume must be the same size or larger than original volume, the
new volume cannot be smaller. Keep in mind if you do use cloning to
increase the size of your volume, be sure to resize your file system (if
supported) in order to take advantage of the new larger clone.

Prior to the availability of the volume cloning feature, customers were
encouraged to utilize volume snapshots when a copy of a volume was
needed. The advantage to using volume cloning instead of snapshotting is
that volume cloning transfers your data directly between volumes,
without the need to use a Cloud Files snapshot as an intermediate step.

Volume cloning shares many similarities with volume snapshots. Namely,
they both utilize LVM as the primary copy and locking mechanism, and
therefore, detaching prior to cloning is recommended. Click
[here](/white-paper/allowing-snapshots-without-detaching-the-volumes)
for additional information on allowing snapshots (now clones) without
detaching the volumes.

### Create a volume clone

It is a good idea to detach your volume from your server before you take
a volume clone. This is the safest method to prevent your server from
writing information while you are backing it up. That could get your
data out of sync and could create a problem. To detach your volume, see
the instructions on "Detach and delete volumes". You can always
re-attach the volume by following the "Attach volume to a server" steps
on the [Create and attach a Cloud Block Storage volume](/how-to/create-and-attach-a-cloud-block-storage-volume)
article.

More advanced users may sync the filesystem in order ensure the
integrity of the data on your snapshots. Performing a sync will flush
file system buffers and write the data out to disk. If you are
unfamiliar with how to sync your filesystem, consider detaching your
volume prior to snapshotting.

Steps to create a volume clone:

1.  Navigate to the **Clone Volume** popup by either clicking the **Actions** button on the **Volume Details** screen.

2.  Click the **Clone Volume** link.

3.  Give the new volume a name. The default is the volume's name followed by the `-clone` suffix.

4.  Specify the volume type and size.

5.  Click the **Clone Volume** button.

6.  After you click the **Clone Volume** button and are redirected to the
    new volume details page, you can safely reattach your volume.


###  Delete a volume clone

1. Once created, a cloned volume can be treated like any other existing volume.

2. A CBS volume can be deleted by clicking **Delete Volume** from the actions button on the **Volume Details** screen.


### Frequently asked questions about volume cloning

-   **How is cloning different from using a snapshot?** A snapshot cannot be
    directly used as a volume. You need to create a volume from the
    snapshot before you can attach it to your server. Snapshots are
    stored redundantly in Cloud Files, however creating volumes from
    snapshots is a slower process compared to creating a volume from
    a clone. If your application is time sensitive, please consider
    using volume cloning instead. A volume Clone is usable copy of the
    source volume and can be attached and used immediately.

-   **Do I need to detach my volume prior to cloning?** While not
    required, it is a good idea to detach your volume from your server
    before you create a clone. This is the safest method to prevent your
    server from writing data to the volume as a clone is being created
    and to avoid a situation where you could end up with inconsistent
    data between a cloned volume and its source volume. If you choose to
    leave your source volume attached prior to creating a clone, you
    need to both sync current buffers and prevent future writes during
    the actual clone call. More advanced users may choose to freeze or
    sync their file system prior to creating a volume clone. Performing
    a sync will flush file system buffers and write the data out
    to disk. If you are unfamiliar with how to sync your file system,
    consider detaching your volume prior to snapshotting.The volume
    cloning process works similar to creating a volume snapshot via
    the API. Please note that as soon as the initial clone call returns
    a 200 response, a local point in time snapshot has been created of
    your volume, and you may continue using the original volume. The
    cloned volume will remain in creating status until the source volume
    data has been fully copied to the new clone.

-   **Can I create multiple clones from a single volume
    simultaneously?** No. Creating multiple clones simultaneously from
    the same volume will fail.

-   **Can I clone between regions?** No. Volumes can only be cloned
    within the same region.

-   **Can I simultaneously snapshot and clone the same volume?** No.
    Volume snapshots and cloning share the same locking mechanism, and
    therefor cannot happen simultaneously on the same volume.


### Volume cloning constraints

You cannot create more than one clone per volume at a time. Snapshots and cloning use the same locking mechanism, so a snapshot and clone of the same volume cannot be running concurrently.
