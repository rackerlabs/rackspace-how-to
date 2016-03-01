---
node_id: 6001
title: Use the API to manage large files
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2016-02-10'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

If you are interested in developing against the Rackspace Large File
Support code to incorporate into your application, you should work
directly with the Cloud Files API. Use the following steps:

1.  Upload the segments:

        curl -X PUT -H 'X-Auth-Token: <token>' \
        http://<storage_url>/container/myobject/1 --data-binary '1'

        curl -X PUT -H 'X-Auth-Token: <token>' \
        http://<storage_url>/container/myobject/2 --data-binary '2'

        curl -X PUT -H 'X-Auth-Token: <token>' \
        http://<storage_url>/container/myobject/3 --data-binary '3'

2.  Create the manifest file:

        curl -X PUT -H 'X-Auth-Token: <token>' \

        -H 'X-Object-Manifest: container/myobject/' \
        http://<storage_url>/container/myobject --data-binary ''

3.  Download the segments as a single object:

        curl -H 'X-Auth-Token: <token>' \

        http://<storage_url>/container/myobject
