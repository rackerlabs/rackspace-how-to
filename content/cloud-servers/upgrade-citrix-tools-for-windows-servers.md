---
permalink: upgrade-citrix-xen-server-tools-for-windows-cloud-servers/
node_id:
title: Upgrade Citrix (Xen Server) Tools for Windows cloud servers
type: article
created_date: '2016-04-05'
created_by: Luke Repko
last_modified_date: '2016-04-05'
last_modified_by: Luke Repko
product: Cloud Servers
product_url: cloud-servers
---

Citrix tools are fundamental to the proper operation of virtualized cloud servers in the Rackspace cloud infrastructure. They are the underlying drivers for the virtual machine, giving it access to virtual hardware, specifically networking and block devices.

This article explains how to upgrade the Citrix Tools for Virtual Machines on Windows cloud servers. These tools should **only** be touched if the Windows server is having issues such as Blue Screens of Death (BSoD), or if support has recommended upgrading the tools.

**Warning:** Performing the steps in this article incurs network downtime. Therefore, *do not* perform these steps on a production server, as it will result in network disruption and multiple reboots of the server. Instead, you will create an image of the production server on which to perform the upgrade.

### Prerequisites

Before you begin, download the following tools to the *production* server before beginning this tutorial.

- [Citrix Tools for Virtual Machines 6.0](http://8d268c176171c62fbd4b-7084e0c7b53cce27e6cc2142114e456e.r30.cf1.rackcdn.com/xstools-6.0.zip)

- [Citrix Tools for Virtual Machines 6.2](http://8d268c176171c62fbd4b-7084e0c7b53cce27e6cc2142114e456e.r30.cf1.rackcdn.com/xstools-6.2.zip)

- [Cloud Servers Agent Service](http://5ef1b700b2e853350a6a-52080ce862bc0ea8ae107677959a39ad.r97.cf2.rackcdn.com/Rackspace-Cloud-Servers-Agent-Latest.zip)

### Create an image of the production server

1. [Create an image] (https://support.rackspace.com/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/) of the production server that needs the upgrades. This can take less than an hour or multiple hours depending on the size of your server's virtual hard drive. You can find more information about images on the  [Cloud Images FAQ](https://support.rackspace.com/how-to/cloud-images-faq/).

2. Create a new server by using the image that you created.

3. Verify that the new server boots properly and that all data and services are intact.

The new server that you created from the image is considered your *non-production* server. The actions in all of the following sections should be performed on this server.

### Upgrade to Xen Server Tools 6.0 on new non-production server

**Note:** You can skip the next section if you already have Citrix Tools 6.0.5837 installed.

**Tip:** Stop/disable all non-system applications/services for an unimpeded installation.

1. Access the non-production server's console through the [Cloud Control Panel](https://mycloud.rackspace.com/). On the Servers page, click the gear icon next to the server’s name and then select **Connect Via Console**.

2. Extract the archive named **xstools-6.0.zip** to a local directory, such as **C:\**.

   <img src="{% asset_path cloud-servers/upgrade-citrix-tools-for-windows-servers/extract-xen-tools.png %}" alt="" />

3. In the extracted folder, run **xensetup.exe**.

4. Click **Next**, and then **Install**.

5. At the end of the installation process, select **Reboot now** and then **Finish**. The server will be rebooted.

6. After your server has rebooted, open the **Programs and Features** window to ensure that Citrix Tools version 6.0.58937 is installed.

### Upgrade to Xen Server Tools 6.2 on the new non-production server

1. Access the non-production server's console through the [Cloud Control Panel](https://mycloud.rackspace.com/). On the Servers page, click the gear icon next to the server’s name and then select **Connect Via Console**.

2. Extract the archive named **xstools-6.2.zip** to a local directory, such as **C:\**.

3. In the extracted folder, run **installwizard**.

4. Follow the instructions on the wizard. We recommend using the default folder for your destination directory.

5. Click **Install** to prepare the Citrix Tools Installer.

6. After the setup launches, click **Install Tools**.

7. When prompted, click **Restart Now**. The server will automatically restart several times before the installation is complete.

8. After the installation is complete, a dialog box may appear asking for the server to be restarted. If requested, restart the server.

### Upgrade the Rackspace Cloud Servers agent

#### Online installation

If your upgraded server has an active connection to the internet, you can install the Rackspace Cloud Servers agent by using the following steps.

1. Start a command prompt as an administrator.

2. In the command prompt, run the following code:

         powershell.exe -NoProfile -ExecutionPolicy unrestricted -Command (New-Object Net.WebClient).DownloadFile('http://5ef1b700b2e853350a6a-52080ce862bc0ea8ae107677959a39ad.r97.cf2.rackcdn.com/Rackspace-Cloud-Servers-Agent-Installer-Latest.bat', '%tmp%\Rackspace-Cloud-Servers-Agent-Installer-Latest.bat') & %tmp%\Rackspace-Cloud-Servers-Agent-Installer-Latest.bat

#### Offline installation

If your server *does not* have an active connection to the internet, use the following installation instructions.

1. Extract the archive named, **Rackspace-Cloud-Servers-Agent-Latest.zip**.

   <img src="{% asset_path cloud-servers/upgrade-citrix-tools-for-windows-servers/extract-agent.png %}" alt="" />

2. Inside the extracted folder, right click the **Agent-Services-Install-OR-Upgrade** batch file and choose **Run as administrator**.

### Decide which server to keep

After performing the preceding steps on the new, non-production server, decide whether to use the new server as your production server, or continue using the orginal production server from which you made the new image. This section explains your options.

#### Option 1: Use the new server as the production server

Now that the new server contains the updated Citrix Tools for Virtual Machines and Rackspace Cloud Servers agent, it might be close to ready for production use.

You can delete the original server and continue using the new server as your production server. This option is usually the quickest and easiest option.

One notable caveat to this option is that the IP address on the new sever is different from the IP address of your orginal production server. The orginal server's IP address cannot be transferred to the new server.  This issue can be mitigated if Cloud Load
Balancers has been in use with your original server. If you were using load balancers, simply remove the original server (node) from the load balancer, and then add the new one.

Before deleting the original server, ensure that *all important data* has been properly restored to the new server. This includes any data that may reside on an ephemeral disk drive that is not included in the image of the original server. If you are not sure what an ephemeral drive is, [the Rackspace Core Infrastructure User Guide](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/diskconfig/). If you are still uncertain, please contact Rackspace support for further guidance.

If the original server does have ephemeral storage, you can migrate the data to the new server in a number of ways. If both servers have a service network IP address, you can use the file sharing built into Windows. Alternatively, you could use FTP, FTPS, or our Cloud Backup agent for cloud servers, which can be installed on both Windows and Linux instances.

You can also transfer data between servers by adding Cloud Block Storage to the original server. You create a volume and attach it to the original server, copy the data that you need to the volume, detach the volume from the original server, and then attach the volume to the new server where the ephemeral drive had been mounted before, for example, **D:**. The following articles can help you get started:

- [Overview of Cloud Block Storage](cloud-block-storage-overview)
- [Prepare your Cloud Block Storage Volume](prepare-your-cloud-block-storage-volume)
- [Cloud Block Storage FAQ](cloud-block-storage-faq)

If you decide to use this option one, we recommend taking a final image of the server which can be used as a base image to create new servers, or to rebuild your current server.

#### Option 2

You can perform all of the installation steps on the production server during a planned
maintenance window. The server will retain its original IP address.

After installing the Citrix Tools on the non-production server, you should have a better understanding of how long your maintenance window should be.

Before you start this process a second time, on the production server, we recommend that you have proper backups, preferably both an image of the server and backups of all important content on the server. Although the previously built new server should still be accessible and contain a nearly identical root file system of the original server, multiple backups allow you to use the Cloud Backup agent, which can be installed on both Windows and Linux cloud servers.

You can delete your new non-production server once the maintenance window has been complete.

#### Option 3

You can rebuild the original production server from an image of the new server. The server retains its original IP address.

Of all three options, this option takes the longest amount of time. The length of time depends on how large your new non-production server's virtual hard drive is.

**Warning:** If you choose this option, we recommend that you create the "proper backups" as outlined in Option 2. Rebuilding a server destroys all of the data on the original server and installs the image that you select.

1. In the Cloud Control Panel, create an image of your new non-production server and wait for the image to build.

2. In the Cloud Control Panel, navigate to the original server's detail page.  Underneath the server's **UUID**, click **Rebuild**.

3. In the popup dialog box that appears, click the **Saved** tab to view your saved saved image and then select the image you created in step 1.

4. Click **Rebuild Server**.
