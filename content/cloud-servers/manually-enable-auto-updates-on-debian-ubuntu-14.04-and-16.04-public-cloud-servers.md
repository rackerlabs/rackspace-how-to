---
permalink: manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/
audit_date: '2018-10-04'
title: Manually enable automatic updates on Debian and Ubuntu 14.04 and 16.04  Public Cloud Servers
type: article
created_date: '2018-10-05'
created_by: Rackspace Support
last_modified_date: '2018-10-04'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Keeping your servers up to date with security fixes can help you avoid server
compromises. While package updates can't prevent all security breaches,
keeping your servers up to date should be a key component of your security
procedures.

This article describes how to enable automatic updates on your Debian&reg; and
Ubuntu&reg; 14.04 and 16.04 Rackspace Public Cloud Servers to ensure that
crucial updates are installed and current.

### Enable automatic updates

Use the following steps to enable automatic updates on your Debian and
Ubuntu 14.04 and 16.04 Rackspace Public Cloud Server:

1. Connect to your Debian/Ubuntu server.

2. Run the following command:

       sudo apt install unattended-upgrades

    The following image shows the command and the output:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture1.png %}" />

3. Enter the following command to open the configuration file:

       vim /etc/apt/apt.conf.d/50unattended-upgrades

    The following image shows what the configuration file looks like:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture2.png %}" />

    The lines that begin with two forward slashes (`//`) are comments that are
    ignored. The configuration options that appear on those lines are
    placeholders that are inactive.

4. In order to enable auto-updates, you need to un-comment the line of code
   that has the text `"${distro_id}:${distro_codename}-updates";`.

    Press the **i** key on your keyboard (for Insert), and then press the down
    arrow to move the cursor to the forward slashes to the left of the line
    that says `"${distro_id}:${distro_codename}-updates";`. Press the **del**
    key on your keyboard twice.

    The color of that line changes to indicate that it is now active code,
    rather than a comment:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture3.png %}" />

5. If you want to enable other configuration options, use the same steps to
   un-comment additional lines.

6. After you have made the changes that you want, press the **esc** key, then
   type **:wq** and press **enter** or **return** to save the configuration
   file, as shown in the following image:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture4-1.png %}" />

    A message stating that the file was properly written displays, as shown in
    the following image:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture4-2.png %}" />

### Configure the automatic updates

Use the following steps to configure the automatic updates:

1. Set the recurring time for each of the updates by entering the following
   command:

       vim /etc/apt/apt.conf.d/10periodic

2. Press the **i** key to enter Insert mode again.

3. Use the arrow keys to move to the number between the quotes that you want
   to change, then press the **del** key on your keyboard to remove it.

4. Enter the new number that you want to use recurrence. Because the numbers
   are in `days`, the following image shows that three of the updates will be
   done each day, and the `AutocleanInterval` to clean the local download
   archive will be cleaned every fourteen days:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture5.png %}" />

    When you're finished making changes, press the **esc** key, then type
    **:wq** and press **enter** or **return** to save the configuration. A
    message stating that the file was properly written displays:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture6.png %}" />

#### Configure notifications for automatic package updates (optional)

You can also choose to set up notifications for automatic package updates,
such as time of installation, packages installed, and errors during
installation.

Use the following steps to set up notifications:

1. From the command prompt, use the following command:

        sudo apt-get install apticron

2. Use the following command to configure the notifications:

       vim /etc/apt/apt.conf.d/50unattended-upgrades

3. Scroll down to the the line of code that says
   `//Unattended-Upgrade::Mail “root”;`, then press the **i** key on your
   keyboard and click **del** twice to remove the forward slashes at the
   beginning of the line.

    The color of the line changes to indicate that it is now active code,
    rather than a comment.

4. Move to the right and press **del** to delete the word `root` inside of the
   quotation marks.

5. Between the same set of quotation marks, enter the email
   address that you want to use, as shown in the following image:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture8.png %}" />

6. After you're finished making changes, press the **esc** key, then type
   **:wq** and press **enter** or **return** to save the configuration.

    A message stating that the file was properly written displays, as shown in
    the following image:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture9.png %}" />

7. Next, enter the following command:

       vim /etc/apticron/apticron.conf

8. Scroll to the line of code that begins with `EMAIL`. Press the **i** key,
   then move to the right and press the **del** key to delete the word `root`
   between the quotation marks.

9. Between the same set of quotation marks, enter the email address to which
   you want to send the notifications, as shown in the following image:

    <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture10.png %}" />

10. When you're finished making changes, press the **esc** key, then type
    **:wq** and press **enter** or **return** to save the configuration.

     A message stating that the file was properly written displays, as shown
     in the following image:

     <img src="{% asset_path cloud-servers/manually-enable-auto-updates-on-debian-ubuntu-14.04-and-16.04-public-cloud-servers/picture11.png %}" />
