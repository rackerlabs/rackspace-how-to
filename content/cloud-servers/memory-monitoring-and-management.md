---
permalink: memory-monitoring-and-management	
audit_date:
title: Memory monitoring and management
created_date: '2020-03-04'
created_by: Matthew Brown
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article is meant to assist with checking and monitoring memory usage within a Linux server. There are many different things to consider when managing memory utilization for a linux server and we will be focusing on the following:

*	How to view memory usage
*	Swap  
*	OOM Killer

## How to view memory usage 


### The free command

The command free is used to display the amount of free and used memory in the system. When run it will display the following output:

    $ free
                  total        used        free      shared  buff/cache   available
    Mem:        8009408     1878604      970740      470152     5160064     5341764
    Swap:       4194300       92160     4102140


          
You can add different flag options to the command to change the output such as the following:



 - -h: Will make the output of the command human readable 
 - -[b, k, m, g]: Outputs the data in the respected data type (byte, kilobyte, megabyte, gigabyte)
 - -s: Will output the data at every interval specified (-s 3 will display data every 3 seconds)


### top/htop
The top command is used to display the current running processes on the server. The command htop does the same thing however it displays the processes in a more organized process. The only caveat is with htop, it is not installed onto most servers by default.

## Swap Space 

Swap space is the amount of space that is reserved whenever the RAM is taken up. You can use the above commands to view the swap space along with the memory. If you would like to view more information about swap space, you can visit the following article [here](link-to-swap-article).



## OOM Killer
OOM Killer is what happens when the system is running low on memory, it will invoke this and kill of certain processes in order to free up memory so that the system will keep running. Often times when a process is killed by OOM Killer, you can see that entry in /var/log/messages (or /var/log/syslog for ubuntu) or in /var/log/dmesg.
