---
permalink: use-swift-to-manage-large-files/
audit_date:
title: Use Swift to manage large files
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2016-04-19'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

If you want to upload large files but do not want to incorporate our
code into an application, you might find it easier to use the [Swift tool](https://swiftstack.com/docs/integration/python-swiftclient.html) for
your uploads and management.

**Note:** If you prefer to use the API to manage large files, see [Use the API to manage large files](/how-to/use-the-api-to-manage-large-files), and if you prefer Swiftly, see [Use Swiftly to upload an image](/how-to/use-swiftly-to-upload-an-image).

If you are using the tool, the process looks as follows:

The following code uploads **large_file** to **test_container** in 10
MB segments and then creates the manifest file so the segments can be
downloaded as one.

    swift upload test_container -S 10485760 large_file

You can change the size of the segments are by changing the value
following the `-S` option.

The following code downloads the large file as a single object:

    swift download test_container large_file

In the above example, Swift will upload all the segments into a second
container named **test_container_segments**. These segments will have
names using the format of
**<name>/<timestamp>/<size>/<segment>**. For
example:

    large_file/1290206778.25/21474836480/00000000
    large_file/1290206778.25/21474836480/00000001

The main benefit for using a separate container is so the main container
will not be polluted with all the segment names. The naming format is so
that an upload of a new file with the same name won't overwrite the
contents of the first until the last moment when the manifest file is
updated.

For more information on using the swift tool, see the [OpenStack Swift documentation](http://docs.openstack.org/developer/swift/).
