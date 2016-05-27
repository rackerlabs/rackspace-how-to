---
permalink: capturing-packets-with-tcpdump/
audit_date:
title: Capture Packets with Tcpdump
type: article
created_date: '2013-04-25'
created_by: Rose Contreras
last_modified_date: '2013-04-25'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

Tcpdump is a powerful network debugging tool that can be used for
intercepting and displaying packets on a network interface. An important
feature of tcpdump is a filter that allows you to display only the
packets you want to see.

### Installation

In this example, we are using Ubuntu 8.10, but the installation
steps are similar for other Linux distributions. The following command
installs tcpdump under Ubuntu:

    sudo apt-get install tcpdump

### Usage

    sudo tcpdump [options] [filter expression]

By default, tcpdump captures packets on eth0. We can specify a
different interface using the `-i` command line flag. This command 
captures all packets on the eth1 interface:

    sudo tcpdump -i eth1

In the following example, we will listen to all UDP connections:

    sudo tcpdump udp

Use this command to capture packets for a specific port:

    sudo tcpdump port 80

Our command is returning all packets which have port 80 as their
destination or source port.

Now let's be more specific and capture only packets with destination
port 80. If you have a web server on your cloud, you can use the
command below to see incoming packets.

    sudo tcpdump dst port 80

You can also capture packets for a specific host. This command 
catches packets coming only from IP 1.2.3.4:

    sudo tcpdump src host 1.2.3.4

Tcpdump can take logical arguments such as `and`, as well as `or`. You
can use logical statements in a tcpdump command. For example, this command catches
all the SSH packets going from an SSH server to a client with IP
1.2.3.4:

    sudo  tcpdump "src port 22" and "dst host 1.2.3.4"

Raw packets can be conveniently saved to a file using the '-w' option:

    tcpdump host 1.2.3.4 -w /home/users/demo/demo.dump

Let's read the saved file:

    tcpdump -r /home/users/demo/demo.dump

### Summary

Tcpdump is a powerful packet sniffer and a common tool used by system
administrators to solve network problems and investigate traffic. It can
be used with Boolean expressions to capture only those packets you're
interested.
