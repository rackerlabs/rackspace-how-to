---
permalink: install-auter-on-centos6/
audit_date: '2017-08-24'
title: 'Install Auter on CentOS 6'
type: article
created_date: '2017-07-06'
created_by: Ruth Lee
last_modified_date: '2017-08-24'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

Auter provides automatic updates for Red Hat Enterprise Linux, CentOS, and Fedora
Linux servers. Auter provides flexible scheduling to ensure that updates and reboots
happen when you want them to. It enables you to customize how updates run: you can
download updates before you can apply them, and you can run custom scripts before
and after the updates. Auter is a more flexible option than yum-cron or dnf-automatic.
This article describes how to install and configure the Auter package on CentOS 6.
Minor adjustments might be required for other OSs and other major releases of CentOS.

### Prerequisites

   - A CentOS 6 or Red Hat Enterprise Linux server configured to use an EPEL repository. For instructions on how to configure an EPEL repository with your server,  see [Install and EPEL, IUS, and Remo repositories on CentOS and Red Hat](/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat).
   - Your server must be able to successfully reboot with all necessary applications restarting automatically or be able to be started using scripts.

### Install the Auteur package

**Note:** The following steps are specific to CentOS 6. For other distributions, use that distribution's equivalent command.

1. Install the package on your server: 

       sudo yum install auter

2. Enable auter:

       auter --enable


### Configure Auter

1. Enable autoreboot by opening the **/etc/auter/auter.conf** and changing the `AUTOREBOOT` field from the default of `"no"` to `"yes"`.

       AUTOREBOOT="yes"

2. Configure update times by editing a cron file in the **/etc/cron.d/auter** directory. 

   The default installation contains some examples, which are commented out. Remove the preceding # from each line that you want to apply. At a minimum you must uncomment one line from the `Preparing package downloads` section and one line of the `Executing updates` section. 
   
   You can use the following command to see which options are enabled:

       egrep -v '^#|^$' /etc/cron.d/auter 

   Following is an example of the output that the preceeding command might return:

       30 1 2 * *   root /usr/bin/auter --prep                              # On the 2nd of every month
       30 1 14 * *    root /usr/bin/auter --apply                              # On the 14th of every month

   The scheduling is based on cron syntax, so if you require a time that is not listed as an example you can manually configure the time. 

3. If any of your applications require specific steps to be performed before shutdown or after reboot, configure these by placing the necessary scripts in the correct location. You can specify a nondefault location in **/etc/auter/auter.conf**. Default locations are as follows:

       PREAPPLYSCRIPTDIR="/etc/auter/pre-apply.d"
       POSTAPPLYSCRIPTDIR="/etc/auter/post-apply.d"
       PREREBOOTSCRIPTDIR="/etc/auter/pre-reboot.d"
       POSTREBOOTSCRIPTDIR="/etc/auter/post-reboot.d"

3. Test that your server reboots without any errors. Run the following commands to manually perform an Auter patching run:

       auter --prep
       auter --apply


Auter is now configured on your system to automatically apply updates at the specified time and reboot the server after application.


### More information

You can find more information about different configuration options in the [Auter GitHub repository](https://github.com/rackerlabs/auter). 
