---
permalink: keep-cloud-servers-up-to-date/
audit_date: '2017-08-26'
title: Keep a cloud server up-to-date
type: article
created_date: '2017-07-31'
created_by: Shaun Crumpler
last_modified_date: '2017-08-26'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

Although package updates cannot completely prevent cyberattacks, you can avoid compromised servers if the servers are kept up-to-date with the proper appropriate security fixes. Keeping your servers up-to-date should be a key component of your security strategy.

This article describes how to update packages on your Rackspace public cloud server and how to keep them updated.

### Migrate away from EOL operating systems

After an operating system (OS) reaches its end-of-life (EOL) date, it is no longer
supported by the OS provider, nor does it receive security updates. For example, CentOS
5, Debian 6 (Squeeze), and Ubuntu 12 LTS have reached their EOL date. Check your OS's
home page for EOL dates, and plan to migrate to a newer OS before the EOL date.

### Enable automatic updates when creating a server

When you create a new Rackspace public cloud server through the Cloud Control Panel,
you can enable automatic updates. 

In the Recommended Installs section of the Create Server page, select the **Operating
system security patched applied on selected images** option.

**Note:** This option is not available for all types of cloud servers.

### Enable automatic updates on existing cloud servers

If your existing Rackspace public cloud servers do not have automatic updates enabled,
you can enable them manually. See the following steps for your OS.

#### Windows 2008

1. Connect to the server.
2. From the **Start** menu, select **Control Panel > System and Security**.
3. In the **Windows Update section**, click **Turn automatic updating on or off**.
4. In the drop-down menu, select **Install updates automatically (recommended)**.
5. Select the check box under **Recommended Updates** so that the recommended updates are automatic.
6. To allow all users the option to install updates on the server, select the check box
under **Who can install updates**.

#### Windows 2012

1. Connect to the server.
2. Click the Windows icon in the lower-left corner and select **Control
Panel > System and Security**.
3. In the **Windows Update** section, click **Turn automatic updating on or off**.
4. In the drop-down menu, select **Install updates automatically (recommended)**.
5. Select the check box under **Recommended Updates** so that the recommended
updates are automatic.
6. To enable updates for other Microsoft products at the same time that Windows
updates are completed, select the check box under **Microsoft Update**.

#### Debian or Ubuntu 14.04 and 16.04

1. Connect to the server. 

2. Run `sudo apt install unattended-upgrades`.

3. Run `vim /etc/apt/apt.conf.d/50unattended-upgrades` to open the configuration file.

4. Any line beginning with "//" will be ignored when the command is run. Delete the "//" before the `${distro\_id}:${distro\_codename}-update;` line. To do this, enter "i" on your keyboard, use the directional pad to navigate to the line.  Press the **del** key twice to delete the "//".

5. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.

6. Use `vim /etc/apt/apt.conf.d/10periodic` to set the desired recurrence time for each of the updates. Click the "i" key on your keyboard to enter "Insert" mode.  Use the keys on the your keyboard to navigate to the number between quotes that you want to change.  Press the **del** key twice to remove the number, and then enter the number of times you want the server to update each day.  

6. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.

7. (Optional) Set up notifications for automatic package updates (time of installation, packages installed, errors during installation) by entering `sudo apt-get install apticron`

8. Enter _vim /etc/apt/apt.conf.d/50unattended-upgrades_ to configure unattended upgrades. Scroll down to the portion that has the line `//Unattended-Upgrade::Mail "root";` and then enter the **i** key. Enter the **del** key twice to remove the // at the beginning of the line.  Note that the color of the line changes. Move the cursor to the right and enter **del** key to delete `root` from in between the quotes. Enter the email you want to use in between the quotes.

9. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.

10. Enter  _vim /etc/apticron/apticron.conf_ and scroll to the portion that begins with "EMAIL".  Click the "i" key on your keyboard, then the cursor to the right and delete the `root` located in between quotes by.  Enter the email address between the same quotes that you want notifications to be sent.

11. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.


#### Red Hat Enterprise Linux (RHEL 6) & CentOS 6

1. Connect to your CentOS 6 or RHEL 6 server, and then run _yum –y install yum-cron_.

2. To view the yum-cron configuration, run _vi /etc/sysconfig/yum-cron_ .  By default, the configuration should be set to download and install the updates.

3. (Optional) Set up notifications for automatic package updates (time of installation, packages installed, errors during installation). Press the "i" key on your keyboard to enter "INSERT" mode unless still in it from earlier steps).  Use the arrow keys on your keyboard to move down to the section with a "MAILTO=" field. Enter the desired email after "MAILTO=".

4. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.

6. Start the yum-cron service, run _/etc/inid.d/yum-cron start_.

7. To configure the server to start the yum-cron service during a reboot, run _chkconfig yum-cron on_


#### Red Hat Enterprise Linux 7 (RHEL 7) & CentOS 7

1. Connect to your CentOS 7 or RHEL 7 server, and then run _yum –y install yum-cron_.

2. Run _vi /etc/sysconfig/yum-cron_ to view the configuration for yum-cron.

3. Check that `download\_updates` and `apply\_updates` are set to "yes" so that automatic updates are enabled.

4. (Optional) Notifications can be set up so that the output of the yum updates is emailed to inform the user what updates completed and what updates failed. Use the arrow keys on the keyboard to move down to the section titled "emitters".  The `emit\_via` value should should be set to `stdio`. 

5. Move your cursor to the the "email" section.

6. Update the configuration to change the `email\_to` field to the email you want the output you to be sent.

7. Click the **esc** key, and then enter the keys `:wq` to save the configuration.  If successful, a message stating that the file was properly written appears.

8. Run _systemctl status yum-cron_ to check that the yum-cron service is already active. If the service is inactive, run `systemctl start yum-cron`.

9. Make sure that the yum-cron service is set to start during a reboot _systemctl list-unit-files –type=service_ Find the `yum-cron.service` process in the file and make sure it is set to `enabled`. If the process is `disabled` run _systemctl enable yum-cron_.

10. Run  _systemctl list-unit-files –type=service_ to find the yum-cron service again.  The service should not be set to `enabled`.
