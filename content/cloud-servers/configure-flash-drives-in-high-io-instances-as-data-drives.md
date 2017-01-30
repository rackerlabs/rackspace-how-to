---
permalink: configure-flash-drives-in-high-io-instances-as-data-drives/
audit_date:
title: Configure flash drives in High I/O instances as Data drives
type: article
created_date: '2014-07-02'
created_by: Paul Querna
last_modified_date: '2016-08-17'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

The two 1.6 TB PCIe flash cards included with the OnMetal I/O flavor come unformatted. Use the following steps to configure your flash cards for use as a data disk.

1. Determine what devices are the PCIe block devices.

   **Note:** Find the high performance PCIe cards by running `lsblk -oNAME, MODEL` and looking for devices listed with model `NWD-BLP* or XP6302*`.

2. Apply best SSD settings for each devices (sub DEVICENAME with name
   identified in step 1).

        echo noop | sudo tee /sys/block/DEVICENAME/queue/scheduler
        echo 4096 | sudo tee /sys/block/DEVICENAME/queue/nr_requests
        echo 1024 | sudo tee /sys/block/DEVICENAME/queue/max_sectors_kb
        echo 1 | sudo tee /sys/block/DEVICENAME/queue/nomerges
        echo 512 | sudo tee /sys/block/DEVICENAME/device/queue_depth

3. (*Optional*) Partition the created raid device if you prefer, or can create
   an FS directly.

4. Create an ext4 FS on it.

        mkfs.ext4 /dev/md0
