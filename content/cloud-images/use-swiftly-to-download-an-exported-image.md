---
permalink: use-swiftly-to-download-an-exported-image/
audit_date: '2018-03-19'
title: Use Swiftly to download an exported image
type: article
created_date: '2015-11-30'
created_by: Cloud Images
last_modified_date: '2018-03-19'
last_modified_by: Kate Dougherty
product: Cloud Images
product_url: cloud-images
---

This article describes two ways that you can use the Swiftly client to
download from Cloud Files an image that you have exported from Cloud
Images. It presumes that you have already used a Cloud Images export
task to export one of your images from the Rackspace open cloud, that
you understand how exported images are stored in Cloud Files as Dynamic
Large Objects, and that you have installed the Swiftly client for Cloud
Files. If you need help on any of these topics, see the following
sources:

-   Cloud Images API Documentation: [Task to Export Image](https://developer.rackspace.com/docs/cloud-images/v2/api-reference/image-task-operations/#task-to-export-image)
-   [Install the Swiftly client for Cloud Files](https://support.rackspace.com/how-to/install-the-swiftly-client-for-cloud-files/)

### Download your entire image at once

Perform the following tasks to download your entire image at once.

#### Set the environment variables

In a bash shell, set the following environment variables:

    CF_USERNAME=      # your Rackspace cloud username
    CF_API_KEY=       # your Rackspace cloud API key
    CF_REGION=        # 3-char region code for where your exported image is located (for example, ORD)
    LOCALFILENAME=    # what you want to name the downloaded image file
    CONTAINER=        # the container in Cloud Files containing your exported image
    IMAGEFILENAME=    # the name of your exported image in Cloud Files

For information about viewing your Rackspace API key, see [View and reset your API key.](https://support.rackspace.com/how-to/view-and-reset-your-api-key/)

#### Invoke Swiftly

After you set the environment variables, invoke Swiftly from the command
line to perform the download, as follows.

**Note:** Consider using a screen session to perform this task. If
you're not familiar with the GNU Screen program, you can find an
introduction in [Installing the Swiftly Cloud Files Client](/how-to/install-the-swiftly-client-for-cloud-files).

    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      get
        --output=${LOCALFILENAME}
      ${CONTAINER}/${IMAGEFILENAME}

If you're downloading to a cloud server that's already in the Rackspace
open cloud, add the **--snet** option to the command so that the file
will be transferred over the internal cloud network. Additionally, if
you want Swiftly to notify you about what it's doing as it downloads
your image file, you can add the **--verbose** option. If you add these
options, your invocation will be similar to the following example:

    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      --snet
      --verbose
      get
        --output=${LOCALFILENAME}
      ${CONTAINER}/${IMAGEFILENAME}

The following code block shows the verbose response for the preceding call. (This image is a little over 2 GB.)

    VERBOSE 0.00 1 Attempting auth v2 RAX-KSKEY:apiKeyCredentials with https://identity.api.rackspacecloud.com/v2.0
    VERBOSE 0.00 1 Establishing HTTPS connection to identity.api.rackspacecloud.com
    VERBOSE 0.00 1 > POST /v2.0/tokens
    VERBOSE 0.00 1 > {"auth": {"RAX-KSKEY:apiKeyCredentials": {"username": "joeuser", "apiKey": "968f8053a6f34677b70a3787cd3bd18a"}}}
    VERBOSE 0.55 1 < 200 OK
    VERBOSE 0.55 1 Establishing HTTPS connection to snet-storage101.iad3.clouddrive.com
    VERBOSE 0.57 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 0.93 1 < 200 OK

#### Check the download

The time that it takes for Swiftly to complete your download depends on
the speed of your network connection and general network congestion. In
some cases, the download might complete prematurely. To verify that this
hasn't happened, you can compare the size in bytes of the file you
receive with the size of the file that exists in Cloud Files. If they're
not the same size, you've experienced a problem.

Determine how big the file you received is by looking at your local file
system:

    $ ls -l
    total 2524008
    -rw-rw-r-- 1 joeuser joeuser 2584576512 Apr 28 19:52 downloaded-image.vhd

You can use Swiftly to determine the size of the file as it exists in
Cloud Files:

    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      head
      ${CONTAINER}/${IMAGEFILENAME}

Your response will look something like the following one. The file size is the value in the **Content-Length** header.

    Content-Length:    2584576512
    Content-Type:      application/octet-stream
    Etag:              "83dce2d37b7046228f72c1e5c688d8c8"
    Last-Modified:     Fri, 28 Feb 2014 21:37:36 GMT
    X-Object-Manifest: exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-
    X-Timestamp:       1393623455.54221
    X-Trans-Id:        txe67683c4407d4e8aa01b8-00535eac8aiad3

In the preceding examples, the size of the local file in bytes matches
the **Content-Length** of the Dynamic Large Object in Cloud Files. Therefore,
the download did not end prematurely. However, this information only
tells you that the correct number of bytes was received. It doesn't tell
you that the value of every byte is correct.

If you suspect that your download was corrupted, or if you're trying to
download an image from one side of the world to the other, you might want
to try an alternative method, as explained in the next section.

### Alternative download method for very large images or if you have network interruptions

If your image is very large or you experience network interruptions, the
download method outlined in the preceding section might fail repeatedly.
This section describes an alternative method. Instead of downloading the
entire object at once, you download the individual segments that make it
up. This method has the following advantages:

- You have smaller, more manageable pieces to work with.
- You can verify the checksum for each of the pieces to ensure that no
part is corrupted.
- If a segment is faulty, you can download only that faulty segment
again.
- After you have all of the pieces, you can stream them locally into a
single VHD file.

This section assumes that you have set all of the environment variables
described in the preceding section.

#### Get the Dynamic Large Object manifest

Use the following command to get the Dynamic Large Object manifest:

    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      head
      ${CONTAINER}/${IMAGEFILENAME}

The response will look something like the following one:

    Content-Length:    2584576512
    Content-Type:      application/octet-stream
    Etag:              "83dce2d37b7046228f72c1e5c688d8c8"
    Last-Modified:     Fri, 28 Feb 2014 21:37:36 GMT
    X-Object-Manifest: exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-
    X-Timestamp:       1393623455.54221
    X-Trans-Id:        tx020fee01f492491abc2ac-00535d40f7iad3

The **X-Object-Manifest** header indicates that this is a Dynamic Large
Object. The value of this header specifies the container in which the
segments are contained (in this example, **exports**) and the pattern
that's used to find the segments in that container (in this example,
**9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-**). When you request a
download of this manifest object, Cloud Files accesses the container in
your account that is named **exports**, finds all the objects in it whose names
match the pattern **9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-**, and
streams them out to you in alphabetical order.

#### Get the detailed list of segments

**Note**: Before reading this section, you might want to review [How Exported Images are Stored as Dynamic Large Objects](/how-to/cloud-images-faq) for
a reminder of the naming conventions that the Cloud Images export
task uses.

Now that you know the container and pattern that will be used to locate
the segments for the Dynamic Large Object you want to download, you can
use Swiftly to get a detailed list of the segments:

    CONTAINER="exports"
    PATTERN="9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-"
    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      get
        --prefix=${PATTERN}
        --full
      ${CONTAINER}

Following is a sample response:

       1048576000 2014-02-28 21:33:46.41 699580384e28b7c2b3b8d916169c11ca  application/octet-stream 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
       1048576000 2014-02-28 21:35:43.81 b513404695fc1117c42ee6dc7de91ef1  application/octet-stream 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
        487424512 2014-02-28 21:36:55.05 372d9904e2048dc84dea82fdb0ead10e  application/octet-stream 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

The output provides the following information:

       number-of-bytes   creation-date-time   MD5-checksum   output-type   segment-name

In this example, the Dynamic Large Object has three segments. The first
two are the same size and the final segment is smaller.

#### Download the segments

You can use Swiftly to download the individual segments to a local
directory. Ensure that this directory already exists in your
file system before attempting the download.

    LOCAL_DIR="my-images"
    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      --verbose
      get
        --prefix=${PATTERN}
        --all-objects
        --output=${LOCAL_DIR}/
      ${CONTAINER}

Following is some sample output with the Swiftly verbose option enabled:

    VERBOSE 0.00 1 Attempting auth v2 RAX-KSKEY:apiKeyCredentials with https://identity.api.rackspacecloud.com/v2.0
    VERBOSE 0.00 1 Establishing HTTPS connection to identity.api.rackspacecloud.com
    VERBOSE 0.00 1 > POST /v2.0/tokens
    VERBOSE 0.00 1 > {"auth": {"RAX-KSKEY:apiKeyCredentials": {"username": "joeuser", "apiKey": "968f8053a6f34677b70a3787cd3bd18a"}}}
    VERBOSE 0.34 1 < 200 OK
    VERBOSE 0.34 1 Establishing HTTPS connection to storage101.iad3.clouddrive.com
    VERBOSE 0.36 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports?format=json&prefix=9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd- User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 0.37 1 < 200 OK
    VERBOSE 0.38 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001 User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 0.48 1 < 200 OK
    VERBOSE 14.53 1 Establishing HTTPS connection to storage101.iad3.clouddrive.com
    VERBOSE 14.54 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002 User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 14.61 1 < 200 OK
    VERBOSE 207.58 1 Establishing HTTPS connection to storage101.iad3.clouddrive.com
    VERBOSE 207.59 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003 User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 207.76 1 < 200 OK
    VERBOSE 218.22 1 Establishing HTTPS connection to storage101.iad3.clouddrive.com
    VERBOSE 218.23 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports?format=json&marker=9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003&prefix=9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd- User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 218.24 1 < 200 OK

In this example, the following segments were downloaded:

    $ ls -l my-images/
    total 1853964
    -rw-rw-r-- 1 joeuser joeuser 1048576000 Feb 28 21:33 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
    -rw-rw-r-- 1 joeuser joeuser  362443328 Feb 28 21:35 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
    -rw-rw-r-- 1 joeuser joeuser  487424512 Feb 28 21:36 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

Do you see a problem? Recall from [How Exported Images are Stored as Dynamic Large Objects](/how-to/cloud-images-faq) that each segment should be the same size except for the final segment, which can be smaller. Therefore, segment-00002 should be the same size as segment-00001, and it is not. This information indicates that segment-00002 is corrupted.

How do you know that the final segment is the correct size? Recall that
earlier you invoked Swiftly with the **--full** option to get the full
details on all of the segments in the **exports** container that match the
pattern **9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-**. From that sample
output, you can see that the final segment should be 487424512 bytes, and
segment-00003 matches that value.

#### Download a segment (if necessary)

Use the following commands to get a fresh copy of the bad segment:

    SEGMENT_NAME="9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002"
    swiftly
      --auth-url=https://identity.api.rackspacecloud.com/v2.0
      --auth-user=$CF_USERNAME
      --auth-key=$CF_API_KEY
      --region=$CF_REGION
      --verbose
      get
        --output=${LOCAL_DIR}/${SEGMENT_NAME}
      ${CONTAINER}/${SEGMENT_NAME}

The verbose output will be similar to the following sample output:

    VERBOSE 0.01 1 Attempting auth v2 RAX-KSKEY:apiKeyCredentials with https://identity.api.rackspacecloud.com/v2.0
    VERBOSE 0.01 1 Establishing HTTPS connection to identity.api.rackspacecloud.com
    VERBOSE 0.01 1 > POST /v2.0/tokens
    VERBOSE 0.01 1 > {"auth": {"RAX-KSKEY:apiKeyCredentials": {"username": "joeuser", "apiKey": "968f8053a6f34677b70a3787cd3bd18a"}}}
    VERBOSE 0.38 1 < 200 OK
    VERBOSE 0.38 1 Establishing HTTPS connection to storage101.iad3.clouddrive.com
    VERBOSE 0.39 1 > GET /v1/MossoCloudFS_d4fef4ad-71f1-4ec4-b5fa-f15bf3317d0d/exports/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002 User-Agent: Swiftly v2.02  X-Auth-Token: 5c2ddf4d5031452fb2bae430560aa592
    VERBOSE 0.47 1 < 200 OK

Now, view the segments that have been downloaded:

    $ ls -l my-images
    total 2524016
    -rw-rw-r-- 1 joeuser joeuser 1048576000 Feb 28 21:33 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
    -rw-rw-r-- 1 joeuser joeuser 1048576000 Apr 29 02:59 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
    -rw-rw-r-- 1 joeuser joeuser  487424512 Feb 28 21:36 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

The second segment has the correct size.

#### Verify the MD5 checksums

All of the segments have the correct size, but is the content of each
segment correct? To verify that it is, you can get the MD5 checksum of
each segment and compare it to the MD5 checksum of the corresponding
segment in Cloud Files. (You already have the list of MD5 checksums of
the segments in Cloud Files. They were displayed when you invoked
Swiftly with the **--full** option above to get the detailed list of
segments.)

    $ cd my-images

    $ for i in $(ls -1 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-*); do md5sum $i ; done
    699580384e28b7c2b3b8d916169c11ca  9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
    b513404695fc1117c42ee6dc7de91ef1  9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
    372d9904e2048dc84dea82fdb0ead10e  9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

In the output from the md5sum command, the checksum is on the left and
the file name is on the right. If you compare the checksums displayed
here to the ones you got from Cloud Files earlier,
you can see that they match. You have successfully downloaded the
segments.

### Reconstitute the VHD file

After all the segments have been downloaded correctly, you can create a
single VHD file, as follows:

    # still in the "my-images" directory
    $ cat 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-0000* > 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd

    # let's see what we've got now
    $ ls -l
    total 5048020
    -rw-rw-r-- 1 joeuser joeuser 2584576512 Apr 29 03:20 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd
    -rw-rw-r-- 1 joeuser joeuser 1048576000 Feb 28 21:33 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
    -rw-rw-r-- 1 joeuser joeuser 1048576000 Apr 29 02:59 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
    -rw-rw-r-- 1 joeuser joeuser  487424512 Feb 28 21:36 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

Earlier in the article,
you used swiftly to perform a HEAD request on the Dynamic Large Object
in Cloud Files. There you determined that the **Content-Length** for a
request of the Dynamic Large Object would be 2584576512 bytes. That is
the size of the reconstituted VHD file.

Should you compute an MD5 checksum of the VHD file? You could, but you
have nothing to compare it to. Because a Dynamic Large Object isn't a
"real" object in Cloud Files (but is a series of segment objects whose
content is streamed out in a particular order), Cloud Files doesn't
store an MD5 checksum for the object. Further, you don't need the
checksum because the VHD file is made up of three segments, each one of
has the correct content, and they've been put together in the correct
order. So the VHD file must be identical to the file that was exported
from Cloud Images into Cloud Files.

#### Clean up

Look at your local file system again:

    ls -lh my-images
    total 4.9G
    -rw-rw-r-- 1 joeuser joeuser  2.5G Apr 29 03:20 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd
    -rw-rw-r-- 1 joeuser joeuser 1000M Feb 28 21:33 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00001
    -rw-rw-r-- 1 joeuser joeuser 1000M Apr 29 02:59 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00002
    -rw-rw-r-- 1 joeuser joeuser  465M Feb 28 21:36 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-00003

Unlike in Cloud Files, where the segments contain data and the DLO is
just a manifest telling Cloud Files what the content of the DLO is,
these are all *real files*. You can see this by asking the operating
system to tell you how much space these files are taking up:

    $ du -chs my-images
    4.9G    my-images
    4.9G    total

You can see that twice as much space as the size of the VHD file is
being used. So locally, now that you've used the segments to
reconstitute the VHD file, you no longer need the segments. You can
delete them without affecting your VHD, as follows:

    $ rm my-images/9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd-0000*

    $ ls -lh my-images
    total 2.5G
    -rw-rw-r-- 1 joeuser joeuser 2.5G Apr 29 03:20 9af8acc8-8189-48b9-b3d6-8152c60074d8.vhd

    $ du -chs my-images
    2.5G    my-images
    2.5G    total

The 2.5 GB VHD file remains.

**Note**: Remember that in Cloud Files, Dynamic Large Objects have a
different relationship with their segments . If you delete segments in
Cloud Files, you'll corrupt your Dynamic Large Object (and hence, your
VHD file).

### Conclusion

This article discussed two ways for you to use Swiftly to download from
Cloud Files an image that you've exported from Cloud Images. If you'd
like to use Swiftly to upload a VHD to Cloud Files so that you can
import it into the Rackspace open cloud, see [Using Swiftly to upload an image to be imported](/how-to/use-swiftly-to-upload-an-image).
