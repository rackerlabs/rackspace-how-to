---
permalink: access-contents-of-a-first-generation-cloud-server-image/
node_id:
title: Access Contents of a First Generation Cloud Server Image
type: article
created_date: '2016-11-24'
created_by: Luke Repko
last_modified_date: '2016-11-28'
last_modified_by: Luke Repko
product: Cloud Servers
product_url: cloud-servers
---

Because first generation images cannot be used for next generation servers, this article guides you through the process of downloading the **tar.gz** parts of an image, and then concatenating and extracting those parts. This process is useful when you need to access the data in an image and file-level backups don't exist. This process doesn't guarantee the successful recovery of data, but it can help you to access the data contained within an image.

###Download the first generation server image

You can download the **tar.gz** image files by using either the Cloud Control Panel or a client tool.

####Use the Cloud Control Panel

In the [Cloud Control Panel](https://mycloud.rackspace.com), navigate to **Storage** > **Files**.

A list of your Cloud Files containers is displayed. Image files are stored in the **cloudservers** container. If your image is larger than 5 GB, you can expect to see multiple image “parts.” It's important to download all of the **tar.gz** parts for a given image.

####Use a client tool

You can use a client tool, such as swiftly, to download your image from Cloud Files. Using swiftly from the command line, you can download all “parts” of an image by invoking the `--prefix` flag. 

If you do not have swiftly installed, install it by using `pip`. 

    pip install swiftly

If you need more detailed instructions for installing swiftly, see [Install the Swiftly Client for Cloud Files](https://support.rackspace.com/how-to/install-the-swiftly-client-for-cloud-files/).

The following example uses swiftly to download an image. Because the full file name is not specified, swiftly can systematically download all of the **tar.gz** parts.

    swiftly -v -A https://identity.api.rackspacecloud.com/v2.0 --region=ORD -U {username} -K {API_Key} get cloudservers --prefix={"image_name.tar"} --all-objects -o {local_download_directory/}
          
If you need a client that is compatible with Windows, try [Cyberduck](https://cyberduck.io/). Configuration instructions for Rackspace Cloud Files can be found on the [Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles). 
          
###Extract the image in Linux

You can concatenate and extract the **tar.gz** image files by using one command, as shown in the following example. This command also works with a single file. Before running the command, ensure that all of the image files have successfully downloaded and are located in the same directory. 

    cat {image_name.tar.gz.*} | pv | tar -zxf - -i

**Note:** The `pv` command, or pipe viewer, enables you to monitor the progress of data through a pipe. It provides information such as time elapsed, percentage completed (with progress bar), current throughput rate, total data transferred, and ETA. This command is not required, but it is very convenient. Most Linux distributions don't come with this package, so you may need to install it. If you’d rather not use `pv`, run the following command:

    cat {image_name.tar.gz.*} | tar -zxvf - -i
          
###Extract the image in Windows

If the image has multiple parts, you must concatenate the files before decompressing and extracting the image. To do this in Windows, open a command prompt at the directory where the image files were downloaded and then use the following command to concatenate, or combine, the files: 

    copy /b {image_name.tar.gz.*} {image_name.tar.gz}
    
While the `copy` command is running, no progress is shown in the command prompt. To get progress and status information, watch the file grow in the File Explorer, or monitor disk I/O by using task manager. 

Windows can't extract the **tar.gz** format natively, but many third party applications have the ability to extract this format. One popular open source application is [7-Zip](http://www.7-zip.org/). The 7-Zip extraction process has two steps: you decompress the file, revealing a **tar** archive, which you then unarchive. 

1. Right-click the concatenated **image_name.tar.gz** file and select **7-Zip > Extract Here**.
2. Right-click the decompressed **image_name.tar** file, and select **7-Zip > Extract Here**.
          
###View the image contents

The preceeding commands extract the image files into a subdirectory named, **image**, which contains the file system. If there is another image file named "image.vhd" within this directory, you should mount it separately, because the first generation infrastructure used several different versions of Xen (XenClassic and XenServer). Images taken on XenClassic were file level, while images taken on XenServer were block level. Mounting a VHD in Linux is possible, but we recommend that you attach the VHD to a virtual machine on your local workstation by using VMware Workstation, or VirtualBox. If the image is a Windows Cloud Server image, mounting the VHD is an easier process, as shown in the following example. 

###Mount a Windows VHD

1. Open a run dialog box, type **diskmgmt.msc**, and then press **Enter**. This starts the Disk Management utility.
2. Click, **Action**, and then click **Attach VHD**.
3. Click **Browse**, locate the VHD file, click **Open**, and then click **OK**.
4. The disk is now available in disk management.
5. A drive letter can now be assigned, if one isn't already assigned.
