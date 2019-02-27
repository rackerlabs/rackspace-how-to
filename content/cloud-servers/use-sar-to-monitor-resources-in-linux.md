---
permalink: use-sar-to-monitor-resources-in-linux/
audit_date: '2019-01-18'
title: Use sar to monitor resources in Linux
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---
This article presents 10 ways that you can use the
System Activity Report (sar) command to monitor resources in Linux&reg;.

### 1. Display the collective usage of all CPUs

Run the following command to display a summary of CPU usage:

    sar -u

This command outputs the cumulative, real-time resource use of all CPUs.

You can add more parameters to this command. For example, adding `1 3` at
the end of the command as shown in the following example reports for every
1 second a total of 3 times:

    sar -u 1 3

The output is similar to the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:27:32 PM       CPU     %user     %nice   %system   %iowait    %steal     %idle
    01:27:33 PM       all      0.00      0.00      0.00      0.00      0.00    100.00
    01:27:34 PM       all      0.25      0.00      0.25      0.00      0.00     99.50
    01:27:35 PM       all      0.75      0.00      0.25      0.00      0.00     99.00
    Average:          all      0.33      0.00      0.17      0.00      0.00     99.50

The last field, `%idle`, indicates the CPU load.

The command has the following variations:

- `sar -u`: Displays CPU usage for the current day.
- `sar -u 1 3`: Displays real-time CPU usage every 1 second for 3 times.
- `sar -u ALL`: Same as the `sar -u` command, but displays additional fields.
- `sar -u ALL 1 3`: Same as the `sar -u 1 3` command, but displays additional
  fields.
- `sar -u -f /var/log/sa/sa10`: Displays CPU usage for the tenth day of the
  month from the `sa10` file.

### 2. Display CPU usage by CPU or core

Run the following command to display CPU usage by CPU or core:

    sar -P ALL 1 1

The `-P ALL` flag indicates that you want to display statistics for
all of the individual cores.

In the `CPU` column of the following example output, `0`, `1`, `2`, and `3`
are CPU core numbers:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:34:12 PM       CPU     %user     %nice   %system   %iowait    %steal     %idle
    01:34:13 PM       all     11.69      0.00      4.71      0.69      0.00     82.90
    01:34:13 PM         0     35.00      0.00      6.00      0.00      0.00     59.00
    01:34:13 PM         1     22.00      0.00      5.00      0.00      0.00     73.00
    01:34:13 PM         2      3.00      0.00      1.00      0.00      0.00     96.00
    01:34:13 PM         3      0.00      0.00      0.00      0.00      0.00    100.00

If you want to display statistics for only the second core,
use the `-P 1` flag (because core numbers start from 0),
as shown in the following example:

    sar -P 1 1 1

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:36:25 PM       CPU     %user     %nice   %system   %iowait    %steal     %idle
    01:36:26 PM         1      8.08      0.00      2.02      1.01      0.00     88.89

You might also find the following variations helpful:

- `sar -P ALL`: Displays CPU usage for each core for the current day.
- `sar -P ALL 1 3`: Displays real-time CPU usage of each core
  every 1 second for 3 times.
- `sar -P 1`: Displays CPU usage for core number 1 for the current day.
- `sar -P 1 1 3`: Displays real-time CPU usage for core number 1,
  every 1 second for 3 times.
- `sar -P ALL -f /var/log/sa/sa10`: Displays CPU usage for each
  core for the tenth day of the month from the `sa10` file.

### 3. Display free and used memory

Run the following command to display free and used memory:

    sar -r

If you add `1 3` to the command as shown in the following example,
the output reports for every 1 second a total of 3 times:

    sar -r 1 3

The output looks like the following example, in which
`kbmemfree` is free memory and `kbmemused` is used memory:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    07:28:06 AM kbmemfree kbmemused  %memused kbbuffers  kbcached  kbcommit   %commit  kbactive   kbinact
    07:28:07 AM   6209248   2097432     25.25    189024   1796544    141372      0.85   1921060     88204
    07:28:08 AM   6209248   2097432     25.25    189024   1796544    141372      0.85   1921060     88204
    07:28:09 AM   6209248   2097432     25.25    189024   1796544    141372      0.85   1921060     88204
    Average:      6209248   2097432     25.25    189024   1796544    141372      0.85   1921060     88204

This command has the following variations:

- `sar -r`
- `sar -r 1 3`
- `sar -r -f /var/log/sa/sa10`

### 4. Display swap space use

Run the following command to display the amount of swap space that is in use:

    sar -S

If you add `1 3` to the end of the command as shown in the following example,
the output reports for every 1 second a total of 3 times:

    sar -S 1 3

The output is similar to the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    07:31:06 AM kbswpfree kbswpused  %swpused  kbswpcad   %swpcad
    07:31:07 AM   8385920         0      0.00         0      0.00
    07:31:08 AM   8385920         0      0.00         0      0.00
    07:31:09 AM   8385920         0      0.00         0      0.00
    Average:      8385920         0      0.00         0      0.00

**Note**: If the `kbswpused` and `%swpused` are at `0`, then your system
is not swapping.

This command has the following variations:

- `sar -S`
- `sar -S 1 3`
- `sar -S -f /var/log/sa/sa10`

#### Additional swap space commands

You might also find the following swap space commands helpful:

- Use `sar -R` to identify the number of memory pages that the system has
  freed, used, and cached.
- Use `sar -H` to identify the Linux&reg; HugePages (in kilobytes (KB)) that
  are in use and available.
- Use `sar -B` to generate paging statistics such as the number of KB paged in
  (and out) from disk per second.
- Use `sar -W` to generate page swap statistics, such as page swap in (and out)
  per second.

### 5. Display I/O activities

Run the following command to display overall input and output (I/O) activities:

    sar -b

The output from this command displays I/O statistics. If you add `1 3` to the
end of the command as shown in the following example, the output reports for every 1 second a total of 3 times:

    sar -b 1 3

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:56:28 PM       tps      rtps      wtps   bread/s   bwrtn/s
    01:56:29 PM    346.00    264.00     82.00   2208.00    768.00
    01:56:30 PM    100.00     36.00     64.00    304.00    816.00
    01:56:31 PM    282.83     32.32    250.51    258.59   2537.37
    Average:       242.81    111.04    131.77    925.75   1369.90

The output includes the following fields:

- `tps`: Transactions per second (both read and write)
- `rtps`: Read transactions per second
- `wtps`: Write transactions per second
- `bread/s`: Bytes read per second
- `bwrtn/s`: Bytes written per second

This command has the following variations:

- `sar -b`
- `sar -b 1 3`
- `sar -b -f /var/log/sa/sa10`

**Note**: Use `sar -v` to display the number of inode handlers, file handlers,
and pseudo-terminals that the system is using.

### 6. Display the I/O activities of individual block devices

Run the following command to display the I/O activities of individual block
devices:

    sar -d

To identify activities by individual block device (such as a specific
mount point, logical unit number (LUN), or partition), use `sar -d`, as shown
in the following example:

    sar -d 1 1

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:59:45 PM       DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
    01:59:46 PM    dev8-0      1.01      0.00      0.00      0.00      0.00      4.00      1.00      0.10
    01:59:46 PM    dev8-1      1.01      0.00      0.00      0.00      0.00      4.00      1.00      0.10
    01:59:46 PM dev120-64      3.03     64.65      0.00     21.33      0.03      9.33      5.33      1.62
    01:59:46 PM dev120-65      3.03     64.65      0.00     21.33      0.03      9.33      5.33      1.62
    01:59:46 PM  dev120-0      8.08      0.00    105.05     13.00      0.00      0.38      0.38      0.30
    01:59:46 PM  dev120-1      8.08      0.00    105.05     13.00      0.00      0.38      0.38      0.30
    01:59:46 PM dev120-96      1.01      8.08      0.00      8.00      0.01      9.00      9.00      0.91
    01:59:46 PM dev120-97      1.01      8.08      0.00      8.00      0.01      9.00      9.00      0.91

In this example, the values in the `DEV` column represent specific block
devices. For example, `dev53-1` means a block device with 53 as major number,
and 1 as minor number.

You can use the pretty print (`-p`) flag as shown in the following example to
make the column display the actual device name (such as sda, sda1, or sdb1):

    sar -p -d 1 1

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:59:45 PM       DEV       tps  rd_sec/s  wr_sec/s  avgrq-sz  avgqu-sz     await     svctm     %util
    01:59:46 PM       sda      1.01      0.00      0.00      0.00      0.00      4.00      1.00      0.10
    01:59:46 PM      sda1      1.01      0.00      0.00      0.00      0.00      4.00      1.00      0.10
    01:59:46 PM      sdb1      3.03     64.65      0.00     21.33      0.03      9.33      5.33      1.62
    01:59:46 PM      sdc1      3.03     64.65      0.00     21.33      0.03      9.33      5.33      1.62
    01:59:46 PM      sde1      8.08      0.00    105.05     13.00      0.00      0.38      0.38      0.30
    01:59:46 PM      sdf1      8.08      0.00    105.05     13.00      0.00      0.38      0.38      0.30
    01:59:46 PM      sda2      1.01      8.08      0.00      8.00      0.01      9.00      9.00      0.91
    01:59:46 PM      sdb2      1.01      8.08      0.00      8.00      0.01      9.00      9.00      0.91

This command has the following variations:

- `sar -d`
- `sar -d 1 3`
- `sar -d -f /var/log/sa/sa10`
- `sar -p -d`

### 7. Display the context switch per second

Run the following command to display the context switch per second:

    sar -w

This command reports the total number of processes created per second and the
total number of context switches per second. If you add `1 3` to the end of
the command as shown in the following example, it reports for every 1 second
a total of 3 times:

    sar -w 1 3

The output is similar to the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    08:32:24 AM    proc/s   cswch/s
    08:32:25 AM      3.00     53.00
    08:32:26 AM      4.00     61.39
    08:32:27 AM      2.00     57.00

This command has the following variations:

- `sar -w`
- `sar -w 1 3`
- `sar -w -f /var/log/sa/sa10`

### 8. Display the run queue and load average

Run the following command to display the run queue and load average:

    sar -q

This command reports the run queue size and load average for the past minute,
past 5 minutes, and past 15 minutes. If you add `1 3` to the end of the
command as shown in the following example, it reports for every 1 second a
total of 3 times:

    sar -q 1 3

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    06:28:53 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
    06:28:54 AM         0       230      2.00      3.00      5.00         0
    06:28:55 AM         2       210      2.01      3.15      5.15         0
    06:28:56 AM         2       230      2.12      3.12      5.12         0
    Average:            3       230      3.12      3.12      5.12         0

**Note**: The `blocked` column displays the number of tasks that are currently
blocked and waiting for I/O operations to complete.

This command has the following variations:

- `sar -q`
- `sar -q 1 3`
- `sar -q -f /var/log/sa/sa10`

### 9. Display network statistics

Run the following command to display network statistics:

    sar -n

This command reports various network statistics, such as the number of packets
received (transmitted) through the network card or the number of packet
failures that occurred. If you add `1 3` to the end of the command, it reports
for every 1 second a total of 3 times.

You can also add a keyword to the command, as shown in the following example:

    sar -n KEYWORD

`KEYWORD` can be one of the following options:

- `DEV`: Displays vital statistics for network devices
- `EDEV`: Display failure statistics for network devices
- `NFS`: Displays Network File System (NFS) client activities
- `NFSD`: Displays NFS server activities
- `SOCK`: Displays the sockets that are in use for IPv4
- `IP`: Displays IPv4 network traffic
- `EIP`: Displays IPv4 network errors
- `ICMP`: Displays ICMPv4 network traffic
- `EICMP`: Displays ICMPv4 network errors
- `TCP`: Displays TCPv4 network traffic
- `ETCP`: Displays TCPv4 network errors
- `UDP`: Displays UDPv4 network traffic
- `SOCK6`, `IP6`, `EIP6`, `ICMP6`, and `UDP6`: Displays IPv6
  network information
- `ALL`: Displays all of the preceding information

The following example uses the `DEV` keyword:

    sar -n DEV 1 1

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    01:11:13 PM     IFACE   rxpck/s   txpck/s   rxbyt/s   txbyt/s   rxcmp/s   txcmp/s  rxmcst/s
    01:11:14 PM        lo      0.00      0.00      0.00      0.00      0.00      0.00      0.00
    01:11:14 PM      eth0    342.57    342.57  93923.76 141773.27      0.00      0.00      0.00
    01:11:14 PM      eth1      0.00      0.00      0.00      0.00      0.00      0.00      0.00

### 10. Report sar data by start time

Run the following command to report sar data by start time:

    sar -s

When you view historical sar data from the `/var/log/sa/saXX` file by using
the `sar -f` option, the output displays all of the sar data for that specific
day beginning at 12:00 a.m.

You can use the `-s hh:mi:ss` option to specify the start time. For example,
if you specify `sar -s 10:00:00`, the output from the command displays the sar
data beginning at 10 a.m. (instead of the default of midnight).

You can combine the `-s` flag with other sar flags. For example, to report the
load average on the 26th of the current month starting from 10 a.m., combine
the `-q` and `-s` flags as shown in the following example:

    sar -q -f /var/log/sa/sa23 -s 10:00:01

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    10:00:01 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
    10:10:01 AM         0       127      2.00      3.00      5.00         0
    10:20:01 AM         0       127      2.00      3.00      5.00         0
    ...
    11:20:01 AM         0       127      5.00      3.00      3.00         0
    12:00:01 PM         0       127      4.00      2.00      1.00         0

You cannot specify an end time. Instead, you need to use the `head`
command. For example, if you want to start from 10 a.m. and see 7 entries, you
pipe the preceding output to `head -n 10`, as shown in the following example:

    sar -q -f /var/log/sa/sa23 -s 10:00:01 | head -n 10

The output looks like the following example:

    Linux 2.6.18-194.el5PAE (dev-db)        03/26/2011      _i686_  (8 CPU)

    10:00:01 AM   runq-sz  plist-sz   ldavg-1   ldavg-5  ldavg-15   blocked
    10:10:01 AM         0       127      2.00      3.00      5.00         0
    10:20:01 AM         0       127      2.00      3.00      5.00         0
    10:30:01 AM         0       127      3.00      5.00      2.00         0
    10:40:01 AM         0       127      4.00      2.00      1.00         2
    10:50:01 AM         0       127      3.00      5.00      5.00         0
    11:00:01 AM         0       127      2.00      1.00      6.00         0
    11:10:01 AM         0       127      1.00      3.00      7.00         2
