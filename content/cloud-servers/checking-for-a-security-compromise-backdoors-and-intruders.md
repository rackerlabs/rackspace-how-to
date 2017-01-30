---
permalink: check-for-a-security-compromise-back-doors-and-intruders/
audit_date:
title: 'Check for a security compromise: back doors and intruders'
type: article
created_date: '2013-04-25'
created_by: Rose Contreras
last_modified_date: '2016-06-10'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Cloud servers can be compromised as a result of various factors: weak passwords, weak iptables, old software versions with known exploits, and so on.

If your cloud server has been compromised, don't panic. Panic leads to poor decisions, which could make the situation worse. Instead, try to understand what happened and ensure that your cloud server is not compromised again in the same manner. This article's objective is simple: Learn from your mistakes, and don't make the same mistakes twice.

This article describes some techniques and tools that you can use to investigate your servers if you suspect that they have been compromised. You should use these tools before going into rescue mode (which is covered in [Checking for a security compromise: Rescue mode investigation](/how-to/check-for-a-security-compromise-rescue-mode-investigation)). The cloud server used for this article was running Ubuntu 8.10; however, the steps demonstrated will be similar for other Linux distributions.

### Important warning

Before proceeding, you must make an important decision: Do you plan to involve law enforcement and prosecute the attacker? If you do, then leave the compromised system alone and make no changes to it. Any changes you make post-attack could taint the evidence and complicate the investigation. Because of that, a common policy is to power off a system after a compromise is detected and leave it off until law enforcement is ready to investigate.

### Check network connections

Begin your investigation by checking your cloud server's network connections.

Use the `netstat -an` command to check for any back doors that have been opened on your cloud server.

    netstat -an
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q             Local Address                     Foreign Address            State
    tcp        0               0                         0.0.0.0:22                               0.0.0.0:*                  LISTEN
    tcp        0               0                         0.0.0.0:80                               0.0.0.0:*                  LISTEN
    tcp        0               0                         0.0.0.0:25                               0.0.0.0:*                  LISTEN
    tcp        0             284                      1.2.3.4:6697                           5.6.7.8:34506              ESTABLISHED

In this example, **port 6697** is open. This port is commonly used by IRC servers. This is not a good sign, unless you are running your own chat server. You can discover any connections to that by port using `tcpdump`.

    tcpdump src port 6697

This will capture all the packets with destination port 6697.

### Use lsof

`lsof` is a command line utility that stands for *list open files*. It is used in many systems based on UNIX to report a list of all open files and the processes that opened them. By default, Linux treats everything, including devices, as a file. This makes `lsof` a very powerful tool.

For example, you can use `lsof` to see what user has a particular file open:

    sudo lsof /etc/passwd

If you discover the username under the intruder's control, you can use `lsof` to display all of the intruder's running processes:

    sudo lsof -u hisUserName

`lsof` also helps you check your network connections. Investigating various aspects of your cloud server with multiple tools is important because if you suspect the system is compromised, you can't be sure which commands will provide reliable results. Also, `lsof` provides some options that `netstat` does not.

To list all the open IP sockets associated with your cloud server's SSH
server, run the following command:

    sudo lsof -i:22

### Summary

You've learned some techniques to use to discover back doors and track intruders on your server. This will help you avoid a repeat of whatever situation or mistake led up to the compromise, so you are less likely to get hacked again in the same way. In the next article, [Checking for a security compromise: Rescue mode investigation](/how-to/checking-for-a-security-compromise-rescue-mode-investigation), you will learn how to investigate your cloud server in rescue mode.
