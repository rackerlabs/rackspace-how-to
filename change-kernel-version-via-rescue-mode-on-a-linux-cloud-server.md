---
permalink: change-kernel-version-via-rescue-mode-on-a-linux-cloud-server
audit_date:
title: Change Kernel Version Via Rescue Mode on a Linux Cloud Server
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Changing kernel version via Rescue Mode on Linux Cloud Server
Sometimes, you've made an update to your server or an automatic update has taken place that prevents your VM booting up properly. In these cases, it doesn't hurt to try and roll back the kernel that your VM is booting with to see if the issue is resolved and you're able to bring the VM online. This article will cover the process of doing this as painlessly as possible.


### Entering Rescue Mode

1) First thing is to place your server into Rescue Mode. If you're unfamiliar, or want more information on Rescue Mode, this article will provide that: https://support.rackspace.com/how-to/rackspace-cloud-essentials-rescue-mode-on-linux-cloud-servers/

2) After initiating Rescue Mode, be sure to copy the temporary root password that flashes on the screen so that you can access your rescued server.

3) The server will continue to show 'Rescuing' until it finally appears with a red status bar reading 'Rescue'. At this point, we can attempt to log into it via SSH or emergency console if you prefer (NOTE: you cannot paste easily with emergency console).

4) Assuming you're using SSH, you'll open a terminal or putty session and run your normal SSH command to log you into the VM with the root user. Note that as you type your password, its characters will not be displayed for security purposes. Once finished entering the password hit “ENTER.” 

Command:

ssh root@1.2.3.4

Please be sure to use your own PublicNet IP in place of *1.2.3.4 (the example IP address here). You will also NOT need to specify the port as a rescued server defaults to port 22. 

Mounting your Filesystem on the Rescue Instance

5) Once you've successfully logged into the server, run the following:

fdisk -l

This will show the mounted system device for Rescue and then the unmounted filesystem of your server. In most cases, it's going to be /dev/xvdb1 for your server. Very old servers might be /dev/sda1

6) Once you've identified it as using the /dev/xvdb1 or /dev/sda1, you'll run the following command to mount that filesystem:

mount /dev/xvdb1 /mnt

Changing the Kernel

7) Now you'll need to change into that directory where you mounted it with the following command:

cd /mnt/boot/grub

8) Once you've changed to that directory, you'll want to run an 'ls' command to list the files contained.

ls

9) From here you should see a list of various files, and the one we are interested in is the menu.lst file. You can use any text editor to open it, such as nano. But for this example we are using vi as it's easiest to operate from emergency console and SSH. The command to run to edit the file is:

vi menu.lst


10) Now you'll find the contents of the file, and it should contain a number of lines of information regarding the kernel, booting, etc. The only thing we are worried about changing in this case is the line which says 'default=0'. If you're in the vi text editor, press 'i' on your keyboard to go into 'INSERT' mode, and use the arrow keys to take you down to the 0 after default=. Change this to a 1, and then hit ESC on your keyboard to leave INSERT mode. Now enter the following:

:wq!

Note, that you do need to include the colon in this. This command saves the file menu.lst and the changes you made. 

### Exiting Rescue Mode

11) Now, we just need to exit Rescue Mode to allow the VM to boot up with the edited menu.lst. Back in the mycloud.rackspace.com panel, click “Exit Rescue Mode” along the top of the “Server Details” page. The server will boot up, and should become “Active.”
