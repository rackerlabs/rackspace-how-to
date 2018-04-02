---
permalink: transferring-images-between-regions-of-the-rackspace-open-cloud/
audit_date: '2018-03-19'
title: Transfer images between regions of the Rackspace open cloud
type: article
created_date: '2014-02-27'
created_by: Cloud Images
last_modified_date: '2018-04-01'
last_modified_by: Kate Dougherty
product: Cloud Images
product_url: cloud-images
---

This article explains how to use Cloud Images to transfer images between regions of the Rackspace cloud.

Before we get into the details, consider the following information:

-   You can't really copy a server. Instead, you create an image of the
    server that you want to copy (by using either the Cloud Servers API
    or the Cloud Control Panel), export the image out of the source
    region (DFW in the example in this article), import it into the
    target region (SYD in this article), and then boot a new server in the target region from the imported image.
    -   The *source region* is the region where the server you want to
        copy is located.
    -   The *target region* is the region where you want to build a new
        server identical to the one you have in the source region.
-   Because not all images can be exported, not all images can
    be transferred. For details, see [How can I tell if an image can exported?](/how-to/cloud-images-faq) in the Cloud Images FAQ.
-   Cloud Images uses JSON only. It does not use XML.

### Working in the source region

1.  Create an image of the source server.

    This example uses a server named Slave Database 3 in the
    source region. You can use either the [Cloud Servers
    API](https://developer.rackspace.com/docs/cloud-servers/v2/getting-started/)
    or the Cloud Control Panel to create the image. For information about
    creating an image of a server by using the Cloud Control Panel, see [Create an image backup
        (cloning)](/how-to/creating-an-image-backup-cloning/).

2.  Optionally, use the metadata function of the API to assign an
    identifying property to the image. If you want to transfer several
    images, we recommend that you perform this step to help organize
    your images and track them across regions.

    Use either the Cloud Images API or the Cloud Servers API to put a
    "coordinating metadatum" on the new image. (You cannot
    use the Control Panel for this step). This example uses an image ID
    of `a6da1504-e1c0-4f40-8461-1ed9a9990e90`. You could create an
    image property named `com.mycompany.image-of` and give it the value
    `db-slave-3`. You can add the metadatum by using the Images API,
    as in the following example:

        OS_AUTH_TOKEN="<your auth token>"
        OS_IMAGE_URL="<cloud images baseurl in source region>"
        MY_IMG="a6da1504-e1c0-4f40-8461-1ed9a9990e90"
        curl -X PATCH <br>
          -H "X-Auth-Token: $OS_AUTH_TOKEN" <br>
          -H "Content-type: application/openstack-images-v2.1-json-patch" <br>
          -d '[{ "op": "add", "path": "/com.mycompany.image-of", "value": "db-slave-3"}]' <br>
          "$OS_IMAGE_URL/v2/images/$MY_IMG"

    **Note**: Images are stored differently inside the cloud. They are not in
    the same VHD format used for image interchange. Therefore, you can't use
    the checksum on your image in the source region to determine which of your
    images in the target region corresponds to it, because there won't be an
    image with that checksum. You can't use the source image's UUID either,
    because the image in the target region has a different UUID. Putting the
    same coordinating metadatum on each image addresses this issue.      

3.  You need a container in your Cloud Files account to put the exported
    image in. If you don't already have one, you can create a container
    by using the Cloud Control Panel, as follows:

    1. In the top navigation bar, click **Storage > Files**.
    2. Click **Create Container**.
    3. Specify a name, the source region, and the container type.
    4. Click **Create Container**.

4.  Create a Cloud Images `export` task in the source region. When this
    task is executed, it copies the image in Cloud Images and puts the
    copy into the container named `exported-images` in your Cloud Files
    account (also in the source region). Use the following API call as an example:

        curl -X POST <br>
              -H "X-Auth-Token: $OS_AUTH_TOKEN" <br>
              -H "Content-Type: application/json" <br>
              -d "{\"type\": \"export\", \"input\": {\"receiving_swift_container\": \"exported-images\", \"image_uuid\": \"$MY_IMG\"} }" <br>
              "$OS_IMAGE_URL/v2/tasks"

    Cloud Images returns a 201 (Created) response. The body of the
    response contains an `id` element whose value is the UUID of your
    export task. The response looks similar to the following one:

        {
            "created_at": "2014-02-26T02:01:13Z",
            "id": "7bdc8ede-9098-4d79-9477-697f586cb333",
            "input": {
                "image_uuid": "a6da1504-e1c0-4f40-8461-1ed9a9990e90",
                "receiving_swift_container": "exported-images"
            },
            "message": "None",
            "owner": "10000001",
            "schema": "/v2/schemas/task",
            "self": "/v2/tasks/7bdc8ede-9098-4d79-9477-697f586cb333",
            "status": "pending",
            "type": "export",
            "updated_at": "2014-02-26T02:01:13Z"
        }

    Note that the ID of the task in the above example is
    `7bdc8ede-9098-4d79-9477-697f586cb333`.

5.  Poll your task to monitor its status by using the task ID. If your
    image is large, processing it and transferring it to your Cloud Files
    account might take some time. Do not poll more frequently
    than every 30 seconds. The following example shows how to make a Cloud Images API call to check on your task:

        TASK="7bdc8ede-9098-4d79-9477-697f586cb333"
        curl -X GET <br>
          -H "X-Auth-Token: $OS_AUTH_TOKEN" <br>
          "$OS_IMAGE_URL/v2/tasks/$TASK"

    The response has a `status` field that starts out as `pending`,
    changes to `processing` when the task is being worked on, and then
    reaches a final status of either `success` or `failure`. The following
    example shows a successful task response:

        {
            "created_at": "2014-02-26T02:01:13Z",
            "expires_at": "2014-02-28T02:16:50Z",
            "id": "7bdc8ede-9098-4d79-9477-697f586cb333",
            "input": {
                "image_uuid": "a6da1504-e1c0-4f40-8461-1ed9a9990e90",
                "receiving_swift_container": "exported-images"
            },
            "message": "None",
            "owner": "10000001",
            "result": {
                "export_location": "exported-images/a6da1504-e1c0-4f40-8461-1ed9a9990e90.vhd"
            },
            "schema": "/v2/schemas/task",
            "self": "/v2/tasks/7bdc8ede-9098-4d79-9477-697f586cb333",
            "status": "success",
            "type": "export",
            "updated_at": "2014-02-26T02:16:50Z"
        }

    Note the `result` element in this response. It contains the location
    of the exported image in your Cloud Files account. The image is in
    the container that you specified and its file name follows the
    convention `{original_image_UUID}.vhd.` If you forget which image
    `a6da1504-e1c0-4f40-8461-1ed9a9990e90.vhd` is, you can look it up
    using either the Cloud Images or Cloud Servers API.

### Working between the regions

At this point, you need to download the image from your Cloud Files
account in the source region to a neutral location, and then upload the image from the neutral location to your Cloud Files account in the target region. (For the neutral location, you could use your laptop or you could use a cloud server.) How you accomplish this is up to you. Here are some suggestions:

-   Use the
    [python-swiftclient](https://pypi.python.org/pypi/python-swiftclient)
-   Use [turbolift](https://github.com/cloudnull/turbolift)
-   Use [Swiftly](https://github.com/gholt/swiftly):
    -   [Use Swiftly to download an exported image](/how-to/use-swiftly-to-download-an-exported-image)
    -   [Use Swiftly to upload an image to be imported](/how-to/use-swiftly-to-upload-an-image)

We don't recommend using the Cloud Control Panel for this operation.
The large size of most images means that you would likely have a poor user
experience.  

### Working in the target region

This example assumes that the object
named  `a6da1504-e1c0-4f40-8461-1ed9a9990e90.vhd` is in a container
named `imported-files` in your Cloud Files account in the target region.

After you upload the image copy to Cloud Files in the target region, you
can import it for use with Cloud Servers.

1.  Create an `import` task in the target region by using the Cloud Images
    API. Use the following code as an example:

        OS_AUTH_TOKEN="<your auth token>"
        OS_IMAGE_URL="<cloud images baseurl in target region>"
        IMAGE_CONTAINER="imported-files"
        IMAGE_FILE="a6da1504-e1c0-4f40-8461-1ed9a9990e90.vhd"
        IMAGE_NAME="Slave Database 3"
        curl -i -X POST <br>
          -H "X-Auth-Token: $OS_AUTH_TOKEN" <br>
          -H "Content-Type: application/json" <br>
          -d "{\"type\": \"import\", \"input\": {\"import_from\": \"$IMAGE_CONTAINER/$IMAGE_FILE\", \"import_from_format\": \"vhd\", \"image_properties\" : {\"name\": \"$IMAGE_NAME\"} } }" <br>
          "$OS_IMAGE_URL/v2/tasks"

    Cloud Images returns a 201 (Created) response. The body of the
    response contains an `id` element whose value is the UUID of your
    import task. For this example, suppose that the value of the `id` element is `d8dd8c24-2534-473c-881f-9097bc784068.`

2.  To monitor the status of your task, poll your task by using the task ID. As
    mentioned earlier, don't poll more frequently than every 30 seconds.
    Your task eventually goes to a status of `success`. The body of
    the task detail response is similar to the following one:

        {
            "created_at": "2014-02-26T03:02:23Z",
            "expires_at": "2014-02-28T03:28:18Z",
            "id": "d8dd8c24-2534-473c-881f-9097bc784068",
            "input": {
                "image_properties": {
                    "name": "Slave Database 3"
                },
                "import_from": "exported-images/a6da1504-e1c0-4f40-8461-1ed9a9990e90.vhd",
                "import_from_format": "vhd"
            },
            "message": "None",
            "owner": "10000001",
            "result": {
                "image_id": "1d944ab7-6748-4f3c-b7e2-3553bf006677"
            },
            "schema": "/v2/schemas/task",
            "self": "/v2/tasks/d8dd8c24-2534-473c-881f-9097bc784068",
            "status": "success",
            "type": "import",
            "updated_at": "2014-02-26T03:28:18Z"
        }

    Note the `result` element, which contains the `image_id` of the
    imported image.

3.  If you put a coordinating metadatum on the original image in the
    source region, now put the same coordinating metadatum on the image
    you just imported. For this example, add it to the image with `image_id`  
    `1d944ab7-6748-4f3c-b7e2-3553bf006677`. You can use the same Cloud Images
    API call that you used in the source region. Just ensure that you set
    `MY_IMG` to the new image ID and that you set `OS_AUTH_TOKEN` and
    `OS_IMAGE_URL` properly for the target region.

    Putting the same coordinating metadatum on each image enables you to use
    the advanced list filtering features of the Cloud Images API to locate
    the image in each region. The following code shows how to use filtering to
    locate the images:

        OS_AUTH_TOKEN="<your auth token>"
        OS_IMAGE_URL="<cloud images baseurl>"
        curl -X GET -H "X-Auth-Token: $OS_AUTH_TOKEN" "$OS_IMAGE_URL/v2/images?com.mycompany.image-of=db-slave-3

    As long as you use different values for each set of related images, the
    response to this call will be a list of images that contain a single image.

4.  You can now create a server in the target region with the
    imported image. You can use the Cloud Servers API or the Cloud
    Control Panel for this task.

5.  To find your imported image in the image selector on the Create
    Server page of the Control Panel, click  under **Image**,
    and among the saved images, look for the images of **Deleted
    Server**. Because the imported image is not an image of any server
    in the target region, the Control Panel shows the server as deleted.

### Related information

The following pages present related information:

-   [Rackspace Cloud Images Developer Guide](https://developer.rackspace.com/docs/cloud-images/v2/)
-   [Cloud Images FAQ](/how-to/cloud-images-faq)
