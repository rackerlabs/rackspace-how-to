---
permalink: get-started-with-tasksel-on-debian/
audit_date: '2020-07-28'
title: 'Get Started with Tasksel on Debian'
type: article
created_date: '2020-07-24'
created_by: Rackspace Support
last_modified_date: '2020-07-28'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

Tasksel is a Debian&reg; and Ubuntu&reg; operating system tool that allows you to install multiple related
packages as coordinated tasks on your server. For example, instead of going step-by-step and installing each
LAMP stack component, you can have Tasksel install all the parts of the LAMP stack for you in a single keystroke.

### Prerequisites

You need a Debian or Ubuntu operating system server.

### Install Tasksel

To install Tasksel, execute the following command from the server:

    sudo apt-get install tasksel

### Run Tasksel

After you install Tasksel, run Tasksel with the following command:

     sudo tasksel

### Install applications

After you initiate Tasksel, a GUI-based interface appears that contains a list of applications you can install on
your server. Use the arrow keys to move your cursor to the software you want to install and press the spacebar
to check the box next to it. After you’ve selected the software, press **Enter**.

As the software installs, a progress bar displays. When the installation completes, Tasksel returns you to the
command prompt.

    # sudo service apache2 status

    apache2.service - The Apache HTTP Server
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

### Tasksel options

For more information about the packages available via Tasksel, run the following command:

    sudo tasksel --list-tasks

Refer to the `man` pages for the service for additional information about Tasksel and its features:

    sudo man tasksel
