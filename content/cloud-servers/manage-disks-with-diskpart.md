---
permalink: manage-disks-with-diskpart/
audit_date: '2020-03-31'
title: 'Manage disks with DiskPart'
type: article
created_date: '2020-03-19'
created_by: Derek Benson
last_modified_date: '2020-03-31'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

**Warning:** The commands available in the DiskPart utility have the potential to cause data loss. Proceed with caution.

### Access DiskPart

**Note:** Your user account must have administrator privileges to use DiskPart.

To access DiskPart, use the following steps:

1. Open an elevated, or Administrator, PowerShell window by using one of the following methods:

    - Use the **Start** button: Right-click the **Start** button and click **Windows PowerShell (Admin)**.
    - Use the search function: Type **PowerShell**. Right-click **Windows PowerShell** under **Apps** in the results and choose **Run as Administrator**.

2. In the PowerShell window, type **diskpart** and press **Enter**.

If successful, you should have a prompt that looks like this: **DISKPART>**

**Note:** You can also access DiskPart by running the `cmd` command to access the command prompt.

### List disk and partition details

Use the following instructions to access disk and partition details.

#### Disk information

From the DiskPart prompt, type **list disk** and press **Enter**.

This command returns the **Disk Number**, **Status**, **Total Size**, **Free Space**, whether it is a **Dynamic Disk**, and if the partition table is **GPT**.

#### Partition information

1. From the DiskPart prompt, type **select disk #**, replacing the **#** symbol with the number of the disk found in the **Disk Information** section.

2. After you select a disk, type **list partition** and press **Enter**.

This command returns the **Partition Number**, **Type**, **Size**, and **Offset** from the start of the disk.

**Important:** The **Primary** partition typically stores user and operating system (OS) data. The system creates partitions with the types **Recovery**, **System**, and **Reserved**, so you should not alter these partitions.

### Important DiskPart commands

The following list describes common DiskPart commands: 

**Note:** These commands run on the selected **disk/partition**, as previously described.

- **Create**: Used to create a **partition**, a **volume**, or a **virtual hard disk (VHD)**. 
    - Example commands:

    ```create partition```

    ```create volume```

    ```create vdisk```

- **Delete**: Used to delete a **partition** or **volume** *(Running this command causes all data on the partition or volume to be lost)*. 
    - Example commands:

    ```delete disk```

    ```delete partition```

    ```delete volume```

- **Format**: Used to format a **partition** or **volume** by using the specified file system *(Running this command causes all data on the partition or volume to be lost)*.
    - Example command:

    ```format d:```

- **Clean**: Removes any formatting on the **partition** or **volume** *(Running this command causes all data on the partition or volume to be lost)*.
    - Example commands:

    ```clean```

    ```clean all```

- **Convert**: Used to convert a **FAT** or **FAT32** partition or volume to **NTFS** while keeping data intact.
    - Example command:

    ```convert d: /fs:ntfs /v```

- **Online**: Sets a disk's status to **ONLINE**.
    - Example commands:

    ```online disk```

    ```online volume```

- **Offline**: Sets a disk's status to **OFFLINE**.
    - Example commands:

    ```offline disk```

    ```offline volume```

- **Exit**: Exits DiskPart and returns you to a PowerShell prompt.
    - Example:

    ```exit```
