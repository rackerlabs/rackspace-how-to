---
permalink: configure-flash-drives-in-high-io-instances-as-data-drives/
audit_date:
title: Configure flash drives in High I/O instances as Data drives
type: article
created_date: '2014-07-02'
created_by: Paul Querna
last_modified_date: '2014-08-15'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

The two 1.6 TB PCIe flash cards included with the OnMetal I/O flavor come unformatted. Use the following steps to configure your flash cards for use as a data disk.

1. Set the Linux I/O scheduler to <code>noop</code>.

        echo noop > /sys/block/sdb/queue/scheduler
        echo noop > /sys/block/sdc/queue/scheduler

2. Set the Linux queue configurations for SSD, as follows:

        echo 4096 > /sys/block/sdb/queue/nr_requests
        echo 1024 > /sys/block/sdb/queue/max_sectors_kb
        echo 1 > /sys/block/sdb/queue/nomerges
        echo 512 > /sys/block/sdb/device/queue_depth

        echo 4096 > /sys/block/sdc/queue/nr_requests
        echo 1024 > /sys/block/sdc/queue/max_sectors_kb
        echo 1 > /sys/block/sdc/queue/nomerges
        echo 512 > /sys/block/sdc/device/queue_depth

3. Use Linux Software RAID-0 across cards, as follows:

        mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb /dev/sdc
        mkfs.ext4 /dev/md0

4. Add /data mount point entry to `fstab`:

        mkdir /data
        echo "UUID=`blkid -s UUID -o value /dev/md0`  /data ext4  noatime 0  0" >> /etc/fstab
        mount /data
