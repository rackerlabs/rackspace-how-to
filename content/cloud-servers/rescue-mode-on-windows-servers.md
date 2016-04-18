---
permalink: rescue-mode-on-windows-servers/
node_id: 4812
title: Rescue Mode on Windows Cloud Servers
type: article
created_date: '2015-09-15'
created_by: Richard Hinojosa
last_modified_date: '2016-04-04'
last_modified_by: Christophe Bonard
product: Cloud Servers
product_url: cloud-servers
---

If your Windows system has become non-bootable or is suffering from
critical system errors, you can use **Rescue Mode** to recover your
system data. These problems may be caused by file system corruption,
boot file corruption, or other configuration errors. Normally, if your
system encounters any problem during the boot process, you would boot in
to a maintenance mode environment known as Safe Mode that would allow
you to login with your root password and check for any errors.
Unfortunately, using Safe User Mode has its share of problems:

-   Most services such as networking are disabled. This would prevent
    you from copying your data to another server.
-   You would have to access your server using the Console, which is
    slower than using a traditional RDP login.

To avoid having to use Safe Mode, you can bring your server up in
**Rescue Mode** through the Rackspace Cloud Control Panel.

### What is Rescue mode?

Rescue mode grants the Administrator user full access to your
non-bootable server's filesystem. You can use it to modify problems in
configuration files or to copy data from your Cloud Server to a remote
location. Rescue Mode through the Rackspace Cloud Control Panel is
similar to booting into safe mode with networking enabled.

**Getting your server into Rescue mode**

1.  Log in to the Cloud Control Panel, and click **Servers**.

2.  From your list of servers, click the Actions cog next to the server
    that you want to bring up in Rescue Mode and select **Enter Rescue Mode** from the drop-down menu.

    <img src="{% asset path cloud-servers/rescue-mode-on-windows-servers/Windowsenter.png %}" alt="" />

3.  Read the text in the Rescue Mode pop-over and then click **Enter
    Rescue Mode**.

    <img src="{% asset path cloud-servers/rescue-mode-on-windows-servers/rescuepopup.png %}" alt="" />

4.  The temporary password is displayed. Copy the password to a safe
    location since you won't be able to see it again after closing
    this message.

5.  After copying the temporary password click **Dismiss Password**.

The server will start to enter Rescue Mode and the initial status should
be **Entering rescue mode**.

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/winrescue.png %}" alt="" />

When the Rescue Mode build is complete, the status will turn red and
display **Rescue**.

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/rescueactive.png %}" alt="" />

Notice that the rescue environment is limited to 24 hours. This means
that you will have one day to correct the problems on your server before
it automatically reverts to its original state.

### Connecting to your server in Rescue Mode

You can now use a RDP client to connect to your server using the public
IP address and the temporary Administrator password to login to Rescue
Mode.

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/rdpclient.png %}" alt="" />

### Troubleshooting your server in Rescue Mode

Before you can access the files on your server you'll need to mount the
server's file system. To do that you'll need to look at your partitions
to determine your file system's device.

**Note:** If you plan on using chkdsk on this filesystem, DO NOT MOUNT the filesystem.

Once you've logged into your server in Rescue Mode, click on the
**Start** button and enter the search box **diskmgmt.msc**. Click
**diskmgmt** to start the program.

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/diskmgmt.png %}" alt="" />

Once the program is running, the output should resemble the following:

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/diskmgmtoutput.png %}" alt="" />

This shows us the device and the size of the disk. Following is a description
of the different disks in the screenshot:

1.  Disk 0 is the rescue file system and is currently being used as **C:\\**
2.  Disk 1 is your system disk and will need to be set to online in
    order to work with your data.

Right click on the Disk 1 and select **online**.

<img src="{% asset_path cloud-servers/rescue-mode-on-windows-servers/disk1.png %}" alt="" />

Your system disk will be set as drive **D:\\** and you will now be able to
access your data.

![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/ddrive.svg % })

### Revert Windows server from "Rescue Mode" in the cloud once drive has been accessed

Since the cloud server's rescue mode uses the image that was initially used to create the server, the disk ID of the server and the temporary image for the rescue OS are the same. This causes a name collision when the server disk is brought online. Due to this issue the OS rewrites the ID of the disk. Once this takes place the boot loader can not longer find the boot disk. This is what causes the server crash.

#### Known issue

There is currently an issue when a Windows cloud server is put into rescue mode. Once the old system drive is brought online, you will no longer be able to boot into Windows when reverting back from the rescue environment.

![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/boot-fail-message.svg % })

This issue is caused by a Disk ID conflict. The original Boot DISK ID is rewritten and no longer matches what the server expects for the boot volume.

#### Process to resolve this

1. With the server in rescue mode and the original system drive has been set online open a command line.

   **Note**: Do not use Powershell for this process, the commands will not work.

2. Run the following command:

        bcdedit /store d:\boot\bcd

3. Review the output and make sure that the C: drive is the target for objects in the output.
   Sample of good BCD output:


   ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/goodBCD.svg % }

4. If the objects do not point to the C drive, run the following commands:

        bcedit /store d:\boot\bcd /set {default} osdevice partition=c:
        
        bcdedit /store d:\boot\bcd /set {default} device partition=c:
        
        bcdedit /store d:\boot\bcd /set {bootmgr} device partition=c:
        
        bcdedit /store d:\boot\bcd /set {memdiag} device partition=c:
        
        bcdedit /store d:\boot\bcd /set {ntldr} device partition=c:

5. When complete, re-run the command to verify the the output.

        bcdedit /store d:\boot\bcd

   If the objects all point to the C drive, only an adjustment to the drive ID of the D drive is needed.

6. To adjust the drive ID for the D drive, run the disk manger from **Computer manager** and then enter `DISKPART` from command line.

7. In DISKPART run the following command:

        LIST DISK

   ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/Disklist.svg % })

8. On the Disk Manager, match the disk number to the drive.

9. To find the disk ID of the C drive run the following command:

        SELECT DISK ( the disk number that was found in diskpart and Disk Manager)

    ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/selectDisk.svg % })

10. To get the drive ID, enter the command:

        UNIQUEID DISK

    ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/uniqueIDdisk.svg % })

11. Record the output.

**Note** : This output (in hex format) will be used to setup up the D drive.

 - If you forget this hex value, you can recover it by taking the server out of rescue mode and placing it back into rescue mode. If you do this, you must start over at the beginning of  these instructions.

 - If this does not work, recover the value by mounting the BCE file into the registry of the rescue server. This is detailed on the link provided.

**Note**:Once you record this ID, you must change this ID to something else to resolve a name collision.

#### Change the drive ID

1. To change the ID, run the following command:

        UNIQUEID DISK id=00220022
        #Example Hex, this can be any HEX as long as the length is correct

2. Run the following, to verify the value has changed:

        UNIQUEID DISK

    ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/uniqueIDdiskverify.svg % })

3. Change the D drive:

        SELECT DISK ( the disk number that our found in DISKPART and disk manager
        
        UNIQUEID DISK id=(disk ID from C drive that was recorded, in the example this was 42D9DECD)

4. Run the command, `UNIQUEID DISK` to verify that the ID matches what you recorded.

   ![]({%  asset path cloud-servers/rescue-mode-on-windows-servers/matchRecordedname.svg % })

**Note**: Once this is done you can take server out of rescue mode. The server should now boot up normally.

#### Tips & Warnings

This process has been tested on Next Gen servers only.

#### Related Links

[https://blogs.technet.microsoft.com/markrussinovich/2011/11/06/fixing-disk-signature-collisions/](https://blogs.technet.microsoft.com/markrussinovich/2011/11/06/fixing-disk-signature-collisions/)



