---
permalink: basic-security-steps-for-linux
audit_date: '2019-01-25'
title: Basic Security Steps for Linux
created_date: '2019-01-25'
created_by: Rackspace Community
last_modified_date: '2019-01-28'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article discusses basic security settings for initial setup of a Linux server.


### Root account security

**Note:** Ubuntu&reg; has disabled the root account by default. Ubuntu users will begin at [disabling root login](#disabling-root-login)

In this section we will discuss the importance of root account security and steps to take to make root more secure.
Rather than disabling the root account, we are going to change the password to an unreadable string.

Prior to changing the root account password, we need to establish a pseudo-root user account by using the following commands:

1. ```groupadd sudoers```

2. ```useradd -m -G sudoers myuser```

3. ```passwd myuser```

The password for the new user is now set, and that new user is a member of a non-default group.

Next you will change the root password to an extremely long password that includes characters that cannot be entered by a human using the following command:

- ```dd if=/dev/urandom bs=256 count=1 |passwd --stdin root```

Now you will add the new user to the **sudoers** group. If RHEL7&reg; is being used, or a derivative of it, such as CentOS 7&reg;, or Scientific Linux 7&reg;, modify using the ```visudo``` command below as follows:

- ```visudo -f /etc/sudoers.d/local.conf```

**Note:** If you are using any distribution other than the ones listed above, use ```visudo``` without any extra command line parameters as follows: ```visudo```

Regardless of distribution, add the following line to the end of the file:

- ```%sudoers localhost=(ALL) ALL```

This line indicates that any member of group **sudoers** may use the root account to run any command. If the system is not familiar with the sudo command, you are prompted for your pseudo-root user account password.

### Disabling root login

In this section we will configure Secure Shell (SSH) so that it does not permit root logins. Each distribution's Secure Shell Daemon (SSHD) configuration file is slightly different in this respect, as some default to having the directive commented out, while others have it uncommented and set to ```yes```.

For most Linux distributions you will perform the following:

1. Edit the file ```/etc/ssh/sshd_config``` using a text editor such as **vim**.

2. Locate the line in the SSHD configuration file that contains ```PermitRootLogin```.

3. Edit the ```PermitRootLogin``` line so that it is uncommented and reads ```PermitRootLogin no```.

This configuration change disables the ability to directly login as the root user account over SSH.

### Emergency console security

In this section we will outline measures to mitigate damage should your MyCloud account be compromised. Our primary goal is to ensure that bad actors cannot use your emergency console to reboot into single user mode.

These instructions will vary based on whether your distribution uses legacy GRUB or GRUB2 bootloader.

#### Instructions for RHEL7.2&reg; and higher based distributions

1. Run the following command:  ```grub2-setpassword```. You are prompted to set the password.

**Note:** When entering single user mode, the username is ```root```, and the password is whatever you entered above.

Manual changes to the ```/boot/grub2/grub.cfg``` persist when new kernel versions are installed, but are lost when re-generating ```grub.cfg``` using the ```grub2-mkconfig``` command. Therefore, use the above procedure after every use of ```grub2-mkconfig``` to retain password protection.

#### Instructions for distributions using GRUB2

1. Run the following command: ```grub2-mkpasswd-pbkdf2```. You are prompted to set the password.

    1. Enter the new password.

    2. Enter the new password again.

    3. Copy the resulting encrypted password, starting at ```grub.pbkdf2```.

2. Run the following command: ```vi /etc/grub.d/40_custom```

3. Enter the below lines into this file (do not modify any existing lines)

    **Warning:** Do not modify any existing lines in the file.

      `set superusers="root"
       password_pbkdf2 john (paste copied password here)`

4. Save and exit, then reboot the system to test.

You should be able to boot the system without any issue or human intervention, but it should prompt you for a password before allowing you to edit any existing entry.

#### Instructions for distributions using legacy GRUB.

1. Run the following command: ```grub-md5-crypt```.

    1. Enter the password you want

    2. Enter the password you want, again

    3. Copy the resulting encrypted password

2. Run the following command: ```vi /boot/grub/menu.lst```

3. Locate the line that begins with ```timeout=```.

4. Create a new line after that which sets ```password --md5 (paste copied password here)```



