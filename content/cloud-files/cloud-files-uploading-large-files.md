---
permalink: cloud-files-uploading-large-files/
audit_date:
title: Cloud Files - Uploading Large Files
type: article
created_date: '2012-03-06'
created_by: Rackspace Support
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

For large files support, Cloud Files allows you to upload multiple file
segments and a manifest file to map the segments together.

Following are a few limitations:

-   Files larger than 5 GB must first be segmented into smaller files.
-   We recommend that you do not create file segments smaller than
    100-200 MB.
-   Files larger than 10GB cannot be served from the CDN.

There are two options for uploading large files.

### Automatically segment and upload

The Swift Tool will segment your large file for you, create a manifest
file, and upload them accordingly. After the file has been uploaded
this tool manages your file segments for you, deleting and updating
segments as needed. Following is a sample output:

    $ st -A https://auth.api.rackspacecloud.com/v1.0 -U glh -K 3a25c2dc74f24c3122407a26566093c8 upload -S 1048576 test_container largefile.iso
    largefile.iso segment 1
    largefile.iso segment 6
    largefile.iso segment 9
    largefile.iso segment 4
    largefile.iso segment 5
    largefile.iso segment 3
    largefile.iso segment 7
    largefile.iso segment 8
    largefile.iso segment 2
    largefile.iso segment 0
    largefile.iso

### Use the API with your application

You can use the Cloud Files API to incorporate large file support
directly into your application. Following is a simple cURL example of how you
can use the API:

    # First, upload the segments
    curl -X PUT -H 'X-Auth-Token: <token>' \     http://<storage_url>/container/myobject/1 --data-binary '1'
    curl -X PUT -H 'X-Auth-Token: <token>' \     http://<storage_url>/container/myobject/2 --data-binary '2'
    curl -X PUT -H 'X-Auth-Token: <token>' \     http://<storage_url>/container/myobject/3 --data-binary '3'

    # Next, create the manifest file
    curl -X PUT -H 'X-Auth-Token: <token>' \
    -H 'X-Object-Manifest: container/myobject/' \     http://<storage_url>/container/myobject --data-binary ''

    # Then you can download the segments as a single object
    curl -H 'X-Auth-Token: <token>' \
    http://<storage_url>/container/myobject

For more information, see the [Creating large objects](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#creating-large-objects) section in the Cloud Files Developer Guide.
