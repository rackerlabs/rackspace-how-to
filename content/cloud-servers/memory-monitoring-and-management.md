---
permalink: memory-monitoring-and-management/
audit_date: '2020-03-04'
title: Memory monitoring and management
type: article
created_date: '2020-03-04'
created_by: Matthew Brown
last_modified_date: '2020-03-06'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article shows you how to check and monitor the memory usage of a Linux&reg; server. You must
consider many different things when managing memory use for a Linux server, but this article focuses
on the following:

*	How to view memory usage
*	Swap  
*	Out-of-memory (OOM) killer

### How to view memory usage 

You can use the `free`, `top`, or `htop` commands to view memory usage.

#### The free command

Use the `free` command to display the amount of free and used memory in the system. After you 
run it, you should see output similar to the following example:

    $ free
                  total        used        free      shared  buff/cache   available
    Mem:        8009408     1878604      970740      470152     5160064     5341764
    Swap:       4194300       92160     4102140
    
You can add the following flag options to the command to customize the output:

 - **-h**: Makes the output of the command human readable.
 - **-[b, k, m, g]**: Formats the data in the corresponding data type (byte, kilobyte, megabyte, or gigabyte).
 - **-s**: Outputs the data at the specified interval.  For example, `-s 3` displays data every 3 seconds.

#### The top and htop commands

Use the `top` command to display the current processes running on the server. The `htop` command
displays the same information in a more organized way, however `htop` is not installed on most
servers by default.

### Swap space 

Swap space is the amount of space that is reserved whenever the random access memory (RAM) is
used up. You can use the commands in the preceding sections to view the swap space along with the memory. If you
want to learn more about swap space, see
[Swap space on Cloud Servers](https://support.rackspace.com/how-to/swap-space-on-cloud-servers/).

### OOM Killer

When a server runs low on memory, the system invokes OOM Killer to kill certain processes
in order to free up memory so that the system can keep running. Often when a process is
killed by OOM Killer, you can see an entry in the following log files:

- **/var/log/messages** (or **/var/log/syslog** for Ubuntu) 
- **/var/log/dmesg**

