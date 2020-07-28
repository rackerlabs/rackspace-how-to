---
permalink: getting-started-with-tasksel-on-debian/
audit_date:
title: 'Getting Started with Tasksel on Debian'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date:
last_modified_by:
product: Cloud Product
product_url: cloud-product
---

Tasksel is a Debian/Ubuntu tool that allows you to install multiple related packages as coordinated “tasks” onto your server. For example, instead of going step-by-step and installing each part of a LAMP stack, you could have Tasksel install all the parts of the LAMP stack for you in a single keystroke.

###Prerequisites:
•Debian Server

###Installing Tasksel
To install Tasksel, execute the following command from the server:

# sudo apt-get install tasksel
Running Tasksel
After you install Tasksel, run Tasksel with the following command:

# sudo tasksel

###Installing Software

After initiating Tasksel, a GUI-based interface appears that contains a list of Tasks you can install to your server. Use the ARROW KEYS to move your cursor, and the SPACEBAR to check a box next to the Task you want to install. After you’ve selected the software, press ENTER.

You will see a progress bar as the software installs. When Tasksel returns you to the command prompt, your software is installed.

# sudo service apache2 status
● apache2.service - The Apache HTTP Server
   Loaded: loaded (/lib/systemd/system/apache2.service; enabled; vendor preset: enabled)
  Drop-In: /lib/systemd/system/apache2.service.d
           └─apache2-systemd.conf
   Active: active (running) since Tue 2020-02-25 18:57:30 UTC; 13s ago
 Main PID: 10802 (apache2)
    Tasks: 6 (limit: 1145)
   CGroup: /system.slice/apache2.service
           ├─10802 /usr/sbin/apache2 -k start
           ├─10810 /usr/sbin/apache2 -k start
           ├─10811 /usr/sbin/apache2 -k start
           ├─10812 /usr/sbin/apache2 -k start
           ├─10813 /usr/sbin/apache2 -k start
           └─10815 /usr/sbin/apache2 -k start

Feb 25 18:57:30 tasksel systemd[1]: Starting The Apache HTTP Server...
Feb 25 18:57:30 tasksel systemd[1]: Started The Apache HTTP Server.

###Tasksel Options
For more information about the packages available via Tasksel, run the following command:

# sudo tasksel --list-tasks
Refer to the 'man' pages for the service for additional information about Tasksel and its features:

# sudo man tasksel
