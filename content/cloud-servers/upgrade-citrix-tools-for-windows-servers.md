---
permalink: upgrade-citrix-xen-server-tools-for-windows-cloud-servers/
node_id:
title: Upgrade Citrix (XenServer) Tools for Windows cloud servers
type: article
created_date: '2016-04-05'
created_by: Luke Repko
last_modified_date: '2016-06-01'
last_modified_by: Hounsou Dansou
product: Cloud Servers
product_url: cloud-servers
---

### Supported Operating Systems

- Windows Server 2008
- Windows Server 2008 R2
- Windows Server 2012
- Windows Server 2012 R2

Citrix tools are fundamental to the proper operation of virtualized cloud servers in the Rackspace Cloud infrastructure. They are the underlying drivers for the virtual machine, giving it access to virtual hardware, specifically networking and block devices.

This article explains how to upgrade the Citrix Tools for Virtual Machines on Windows Cloud Servers. These tools should **only** be touched if the Windows server is having issues such as Blue Screen of Death (BSoD), or if support has recommended upgrading the tools.

**Warning:** Performing the steps in this article incurs network downtime. Therefore, *do not* perform these steps on a production server, as it will result in network disruption and multiple reboots of the server. Instead, you will create an image of the production server on which to perform the upgrade.

### Prerequisites

Before you begin, create a backup of your data from the server by using the Cloud Backup. Create an Image of the server to retain its configuration. The latest version of the Windows Agent is installed on the *production* server before beginning this tutorial.


#### Create a Backup using Cloud Backup

Use the Cloud Backup product to back up all user data. This [Cloud Backup instruction](https://support.rackspace.com/how-to/rackspace-cloud-backup-create-a-backup/) covers the installation of the Cloud Backup Agent and the configuration of the backup.

#### Create an image of the production server

1. [Create an image](/how-to/create-an-image-of-a-server-and-restore-a-server-from-a-saved-image/) of the production server that needs the upgrades. This can take less than an hour or multiple hours depending on the size of your server's virtual hard drive. You can find more information about images on the  [Cloud Images FAQ](/how-to/cloud-images-faq/).

2. Create a new server by using the image that you created.

3. Verify that the new server boots properly and that all data and services are intact.

The new server that you created from the image is considered your *non-production* server. The actions in all of the following sections should be performed on this server.

#### Upgrade the Rackspace Cloud Servers agent and download the Xenserver Tools 6.5

The upgrade requires an active connection to the internet. Follow these steps to install the Rackspace Cloud Servers agent.

1. Start a command prompt as an administrator.

2. In the command prompt, run the following code:

          powershell.exe -NoProfile -NoLogo -InputFormat None -ExecutionPolicy Bypass -Command "iex(New-Object Net.WebClient).DownloadString('http://b2566e7bb4c60838ad8e-2feac036ecfab0eba46621f3ae4943bc.r28.cf1.rackcdn.com/latest/Update-Xentools.ps1')"
   

   Your output should be similar to the following:

          Info  :: STEP 1 => Update the Nova Agent
          Info  :: Starting the Agent Upgrade to version 1.3.1.1
          Warn  :: RackspaceCloudServersAgent RackspaceCloudServersAgentUpdater is stopped
          Info  :: Downloading the AgentService_1.3.1.1.zip
          Info  :: Downloaded Successfully AgentService_1.3.1.1.zip in  C:\Windows\Temp
          Info  :: Downloading the UpdateService_1.3.1.1.zip
          Info  :: Downloaded Successfully UpdateService_1.3.1.1.zip in  C:\Windows\Temp
          Info  :: Renaming Agent to 1.3.0.1
          Info  :: Renaming AgentUpdater to 1.3.0.1
          Info  :: Unzipping AgentService.zip to Agent)
          Info  :: Creating the Directory C:\Program Files\Rackspace\Cloud Servers\Agent
          Info  :: Unzipping UpdateService.zip to AgentUpdater
          Info  :: Creating the Directory C:\Program Files\Rackspace\Cloud Servers\AgentUpdater
          Info  :: Cloning the AgentLog from Agent1.3.0.1 to Agent
          Info  :: Removing AgentService_1.3.1.1.zip and UpdateService_1.3.1.1.zip
          Info  :: Restarting the Agent and AgentUpdater services
          Info  :: STEP 1 => DONE!!!
                   ***************************************************************************************
          Info  :: STEP 2 => Download the latest XenServer Tools on the Server
          Info  :: Downloaded Successfully xs-tools-6.5.0-20200.zip in  C:\rs-pkgs
          Info  :: Creating the Directory C:\rs-pkgs\xs-tools-6.5.0-20200
          Info  :: STEP 2 => DONE!!!
          Info  :: ***************************************************************************************
          Info  :: STEP 3 => Before executing the installation of the Xenserver Tools,
                             YOU MUST CREATE A SNAPSHOT OF YOUR SERVER using the Control Panel
                             The Snapshot will allow you to recover your server if the installation fails.
                             Once you are done with This Step 3, Start the installation at STEP 4
                   ***************************************************************************************
          Warn  :: STEP 4 => Execute the Xenserver tools Installer.
                             Before you execute the installer, connect to the Console of the server
                             in the Control Panel, because the server will reboot few times on its own.
                             You will loose network access and Remote Desktop will fail
                             until the installation is completed.
                             *****************************************************************************
                             Execute:  C:\rs-pkgs\xs-tools-6.5.0-20200\install.bat
                             *****************************************************************************
```


### Upgrade to XenServer Tools 6.5 on the new non-production server

1. Access the non-production server's console through the [Cloud Control Panel](https://mycloud.rackspace.com/). On the Servers page, click the gear icon next to the server’s name and then select **Connect Via Console**.

2. Start a command prompt as an administrator.

3. In the command prompt, run the following code:

```
C:\rs-pkgs\xs-tools-6.5.0-20200\install.bat
```

4. When prompted, click **Restart Now**. The server will automatically restart several times before the installation is complete.

5. After the installation is complete, a dialog box may appear asking for the server to be restarted. If requested, restart the server.

6. Ping the server's IP address from a remote location to confirm that the network is working.


### Decide which server to keep

After performing the preceding steps on the new, non-production server, decide whether to use the new server as your production server, or continue using the original production server from which you made the new image. This section explains your options.


#### Option 1: Use the new server as the production server

Now that the new server contains the updated Citrix Tools for Virtual Machines and Rackspace Cloud Servers agent, it might be close to ready for production use.

You can delete the original server and continue using the new server as your production server. This option is usually the quickest and easiest option.

One notable caveat to this option is that the IP address on the new sever is different from the IP address of your original production server. The original server's IP address cannot be transferred to the new server.  This issue can be mitigated if Cloud Load Balancers has been in use with your original server. If you were using load balancers, simply remove the original server (node) from the load balancer, and then add the new one.

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

3. In the pop-up dialog box that appears, click the **Saved** tab to view your saved image and then select the image you created in step 1.

4. Click **Rebuild Server**.
