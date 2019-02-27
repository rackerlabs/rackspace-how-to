---
permalink: export-and-download-a-saved-image-with-pitchfork-cyberduck/
audit_date: '2019-01-23'
title: Export and download a saved image with Pitchfork and Cyberduck
type: article
created_date: '2019-01-25'
created_by: Rackspace Community
last_modified_date: '2019-01-25'
last_modified_by: Kate Dougherty
product: Cloud Images
product_url: cloud-images
---

This article takes you through the process of exporting your saved image.
The process involves the following steps:

- Using the Rackspace Pitchfork tool to interface with our API
- Using the free, easy-to-use Cyberduck&reg; app to download the image

**Note**: Due to licensing restrictions by Microsoft&reg; and Red Hat&reg;,
you cannot export Windows&reg; and Red Hat images.

### Prerequisites

You need the following tools to complete the steps in this article.

#### Cyberduck

Cyberduck is a tool for managing storage solutions like Rackspace Cloud Files
through a simple graphical user interface (GUI).

Download [Cyberduck](https://cyberduck.io/).

**Note**: Cyberduck is not affiliated with Rackspace, and we are unable to
provide support for using this application.

#### Pitchfork

Pitchfork is a Rackspace-developed tool for interfacing with various products
APIs.

Download [Pitchfork](https://pitchfork.rax.io).

#### Other prerequisites

You need to have the following information ready to perform the export and
download:

- The username that you use to log in to the [Cloud Control
  Panel](https://login.rackspace.com)

- Your [API key](/how-to/view-and-reset-your-api-key/)

- The universally unique identifier (UUID) of the image that you want to export

- The name of the Cloud Files container to which you want to export the image

- The region in which the image and container exist

### Export and download your image

Use the following steps to export and download your image:

1. After you have all of the preceding information and the tools ready, go to
   the [Pitchfork home page](https://pitchfork.rax.io) and click **Log In** at
   the top right. Enter your username and API key to log in.

2. Click the icon for Cloud Images, then select your region from the drop-down
   list on the left side of the page.

3. Select **Export Task** from the list and click **POST**. A set of blank
   variables displays.

4. The variable **task_type** should be set to **Export** in the drop-down,
   the **image_id** variable should be the UUID of the image that you are
   exporting, and **receiving_container** should be the name of the container
   to which you are exporting the image.

5. Click **SEND API CALL** to start the export. The **Response Headers**
   section displays output that contains an `id` and a long, alphanumeric
   value. You can use `id` and the Get Task Details Pitchfork call to check
   the status of your export. The response returns the following statuses:

   - `Pending`
   - `Processing`
   - `Successful`
   - `Failed`

6. In your container in the Cloud Control Panel, files that are 125 MB in size
   eventually begin to appear. The file names follow the format
   **uuid_of_the_image_you_exported.vhd-0001**.

   After the export is complete, there might be many of these files, depending
   on the size of your image. There should also be a single file without the
   **-0001** numbering at the end of the **.vhd** file name.

7. After the export is complete, open Cyberduck and click **Open Connection**
   at the top left. From the drop-down list at the top of the window, select
   **Rackspace Cloud Files (US)**.

8. Enter your username and API key, leave the default values in the other
   fields, and click **Connect**.

   You are connected to Rackspace and see your list of Cloud Files containers.

9. In the container to which you exported your image, find the file that ends
   in **.vhd** without the additional hyphenated numbering. The size of that
   file displays as 0 B. This file is the manifest file.

   Right-click the file and download it. Cyberduck actually downloads a file
   that is much larger than 0 B because the manifest file gathers all of
   the 125 MB files together back into a workable **.vhd** file.

10. Cyberduck notifies you when the download is complete. You can now use the
    **.vhd** file that contains the image for your own purposes.

**Note**: Because Cyberduck sees the manifest file as 0 B in size, it might
generate an error after it has finished downloading. However, you can go to
your download location to verify that the file is there and that its size
matches the total size of the individual parts.
