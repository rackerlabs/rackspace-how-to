---
permalink: rescue-mode-on-windows-servers/
audit_date:
title: Rescue mode on Windows cloud servers
type: article
created_date: '2015-09-15'
created_by: Richard Hinojosa
last_modified_date: '2018-10-26'
last_modified_by: Kate Dougherty

---

If your Microsoft&reg; Windows&reg; system has become non-bootable or is
suffering from critical system errors, you can use *rescue mode* to recover
your system data. These problems might be caused by file system corruption,
boot file corruption, or other configuration errors.

####Rescue mode vs. safe mode

Normally, if your system encounters any problem during the boot process, you
would boot into a maintenance mode environment known as *safe mode* that would
allow you to log in with your root password and check for any errors.
Unfortunately, using safe mode has the following problems:

-   Most services, such as networking, are disabled. This prevents
    you from copying your data to another server.
-   You would have to access your server by using the Console, which is
    slower than using a traditional Remote Descktop Protocol (RDP) login.

To avoid having to use safe mode, you can bring your server up in
rescue mode by using the Rackspace Control Panel. Rescue mode grants the
Administrator user full access to your non-bootable server's file system.
You can use it to modify problems in configuration files or to copy data from
your cloud server to a remote location. Rescue mode through the Rackspace Cloud
Control Panel is similar to booting into safe mode with networking enabled.

### Start the server in rescue mode

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).

2.  In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3.  Select **Servers > Cloud Servers**.

4.  In your list of servers, click the gear icon next to the server
    that you want to start in rescue mode and select **Enter Rescue Mode**.

5.  Read the text in the pop-up message, and then click **Enter Rescue Mode**.

6.  When the temporary password is displayed, copy it to a safe locations. You
    will not be able to see the password again after you close this message.

7.  After copying the temporary password click **Dismiss Password**.

   The server starts to enter rescue mode and the initial status should be **Entering rescue mode**.

   When the rescue mode build is complete, the status turns red and displays **Rescue**.

   **Note:** The rescue environment is limited to 24 hours, which means that you
   have 24 hours to correct the problems on your server before it automatically
   reverts to its original state.

### Connect to the server in rescue mode

To connect to the server in rescue mode, use an RDP client. Use the public IP address and the temporary Administrator
password to connect.


### Troubleshoot the server in rescue mode

Before you can access the files on your server, you need to mount the
server's file system. To do that, you need to look at your partitions
to determine your file system's device.

**Note:** If you plan to use **chkdsk** on this file system, *do not mount* the file system.

1. After you log in to your server in rescue mode, click the **Start** button
   and enter **diskmgmt.msc** in the search box.

2. Double-click **diskmgmt** to start the program.

   When the program is running, the output shows the device and the size of
   the disk.

   Following is a description of the different disks that appear:

      - Disk 0 is the rescue file system. It is currently being used as drive **C**.
      - Disk 1 is your system disk. You must set it to online in order to work with your data.

3.  Right-click Disk 1 and select **Online**.

   Your system disk is set as drive **D**, and you can now access your data.

### Revert the server from rescue mode

There is currently a known issue when a Windows Cloud Server is put into rescue
mode. After the old system drive is brought online, you can no longer boot
into Windows when reverting back from the rescue environment. This issue is
caused by a Disk ID conflict. The original Boot Disk ID is rewritten and no
longer matches what the server expects for the boot volume. Since the Cloud
Server's rescue mode uses the image that was initially used to create the server,
the disk ID of the server and the temporary image for the rescue OS are the same.
This causes a name collision when the server disk is brought online. Due to this
issue, the OS rewrites the ID of the disk. After this takes place, the boot
loader can no longer find the boot disk. This is what causes the server crash.

#### Resolve the ID conflict

**Note**: This process has been tested on Cloud Servers only.

1. With the server in rescue mode and the original system drive set online, open a command line.

   **Note**: Do not use Powershell for this process; the commands will not work.

2. Run the following command:

        bcdedit /store d:\boot\bcd

3. Review the output and ensure that drive **C** is the target for objects in the output.

4. If the objects do not point to drive **C**, run the following commands:

        bcedit /store d:\boot\bcd /set {default} osdevice partition=c:

        bcdedit /store d:\boot\bcd /set {default} device partition=c:

        bcdedit /store d:\boot\bcd /set {bootmgr} device partition=c:

        bcdedit /store d:\boot\bcd /set {memdiag} device partition=c:

        bcdedit /store d:\boot\bcd /set {ntldr} device partition=c:

5. Run the following command again to verify the output:

        bcdedit /store d:\boot\bcd

  If all the objects point to drive **C**, only an adjustment to the drive ID of drive **D** is needed.

6. Open the Disk Management window (see "Troubleshoot the server in rescue mode" for instructions).

7. From the command line, run `DISKPART`.

8. In DISKPART, run the following command:

        LIST DISK

9. In the Disk Management window, match the disk number to the drive.

10. To find the disk ID of drive **C**, run the following command:

        SELECT DISK ( the disk number that was found in diskpart and Disk Manager)

11. To get the drive ID, enter the following command:

        UNIQUEID DISK

12. Record the disk ID.

   **Note:** You should use this ID value (in hexadecimal format) to set up up drive D.

   - If you forget this value, you can recover it by taking the server out of
      rescue mode and placing it back into rescue mode. If you do this, you must
      start over at the beginning of  these instructions.

   - If the preceding step does not work, recover the value by mounting the BCE
     file into the registry of the rescue server. This is detailed in the
     [Microsoft blog](https://blogs.technet.microsoft.com/markrussinovich/2011/11/06/fixing-disk-signature-collisions/).

   **Note**: After you record this ID, you must change this ID to something else to resolve a name collision.

#### Change the drive ID

1. To change the ID, run the following command:

        UNIQUEID DISK id=<any hex value of 8 characters>

2. Run the following command to verify that the value changed:

        UNIQUEID DISK

3. Change drive D by running the following commands:

        SELECT DISK ( the disk number that our found in DISKPART and disk manager

        UNIQUEID DISK id=(disk ID from C drive that was recorded, in the example this was 42D9DECD)

4. Run the `UNIQUEID DISK` command to verify that the ID matches what you recorded.

   After this process is complete, you can take the server out of rescue mode. The server should now boot up normally.

#### Related information

- [Fixing disk signature collisions](https://blogs.technet.microsoft.com/markrussinovich/2011/11/06/fixing-disk-signature-collisions/)
