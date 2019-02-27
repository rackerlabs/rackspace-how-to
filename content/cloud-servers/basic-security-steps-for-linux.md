---
permalink: basic-security-steps-for-linux
audit_date: '2019-01-25'
title: Basic security steps for Linux
type: article
created_date: '2019-01-25'
created_by: Rackspace Community
last_modified_date: '2019-01-28'
last_modified_by: William Loy
product: Cloud Servers
product_url: cloud-servers
---

This article discusses basic security settings for an initial setup of a Linux&reg; server.


### Root account security

**Note:** Ubuntu&reg; has disabled the root account by default. Ubuntu users should begin at [disabling root login](#disabling-root-login).

This section covers the importance of root account security and the steps to take to make root more secure.
Rather than disabling the root account, you should change the password to an unreadable string.

Prior to changing the root account password, you need to establish a pseudo-root user account by using the following commands:

  `groupadd sudoers`

  `useradd -m -G sudoers myuser`

  `passwd myuser`

The password for the new user is now set, and that new user is a member of a non-default group.

Next, you change the root password to an extremely long password that includes characters that cannot be entered by a human by using the following command:

- ```dd if=/dev/urandom bs=256 count=1 |passwd --stdin root```

Now you add the new user to the **sudoers** group. If you are using RHEL7&reg; or a derivative of it, such as CentOS 7&reg;, or Scientific Linux 7&reg;, modify the **sudoers** group by using the following ```visudo``` command:

- ```visudo -f /etc/sudoers.d/local.conf```

**Note:** If you are using any distribution other than the ones listed above, use ```visudo``` without any command line parameters as follows: ```visudo```

Regardless of distribution, add the following line to the end of the file:

- ```%sudoers localhost=(ALL) ALL```

This line indicates that any member of **sudoers** group may use the root account to run any command. If the system does not have access to the sudo command, you are prompted for your pseudo-root user account password.

### Disabling the root login

In this section, you configure Secure Shell (SSH) so that it does not permit root logins. Each distribution's Secure Shell Daemon (SSHD) configuration file is slightly different in this respect. Some default to having the directive commented out, while others have it uncommented and set to ```yes```.

For most Linux distributions, you perform the following steps:

1. Edit the file ```/etc/ssh/sshd_config``` by using a text editor such as **vim**.

2. Locate the line in the SSHD configuration file that contains ```PermitRootLogin```.

3. Edit the ```PermitRootLogin``` line so that it is uncommented and reads ```PermitRootLogin no```.

This configuration change disables the ability to directly login as the root user account over SSH.

### Emergency console security

This section describes measures to mitigate damage if your MyCloud account is compromised. Your primary goal is to ensure that bad actors cannot use your emergency console to restart in single-user mode.

These instructions vary based on whether your distribution uses legacy GRUB or GRUB2 bootloader.

#### Instructions for RHEL7.2&reg; and higher based distributions

Run the following command:  ```grub2-setpassword```. You are prompted to set the password.

**Note:** When entering single-user mode, the username is ```root```, and the password is whatever you entered above.

Manual changes to the **/boot/grub2/grub.cfg** file persist when new kernel versions are installed but are lost when you regenerate **grub.cfg** using the ```grub2-mkconfig``` command. Therefore, use the preceeding procedure after every use of ```grub2-mkconfig``` to retain password protection.

#### Instructions for distributions that use GRUB2

Use the steps below for distributions that use GRUB2:

1. Run the following command: 

   `grub2-mkpasswd-pbkdf2`
    
   You are prompted to set the password.

    1. Enter the new password.

    2. Enter the new password again.

    3. Copy the resulting encrypted password, starting at ```grub.pbkdf2```.

2. Run the following command: 

   `vi /etc/grub.d/40_custom`

3. Enter the following lines into this file:

    **Warning:** Do not modify any existing lines in the file.

      `set superusers="root"
       password_pbkdf2 john (paste copied password here)`

4. Save and exit, then restart the system to test.

You should be able to start the system without any issue or human intervention, but it should prompt you for a password before allowing you to edit any existing entry.

#### Instructions for distributions that use legacy GRUB

1. Run the following command: 

   `grub-md5-crypt`

    1. Enter the new password.

    2. Enter the new password again.

    3. Copy the resulting encrypted password.

2. Run the following command: 

   `vi /boot/grub/menu.lst`

3. Locate the line that begins with ```timeout=```.

4. Create a new line after that line which sets ```password --md5``` _(paste copied password here)_.

