---
permalink: basic-security-steps-for-linux
audit_date:
title: Basic Security Steps for Linux
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

It is important to understand that while root account security is important, it is always best to be extra careful. For this reason.

Ubuntu has disabled the root account, by default, so the only login is through the command "sudo -i".

This was accomplished while still allowing a single user to work by patching the [sulogin program to allow for a disabled root account.](https://help.ubuntu.com/community/RootSudo)

We aren't going to disable the account, but we are going to change the password to a string that humans cannot type in.
If using Ubuntu, this step can be skipped.

If you use anything other than Ubuntu, keep reading.
Before we make the root password ineffective, we need to establish a new user account to be pseudo-root (pun not intended):

# groupadd sudoers

# useradd -m -G sudoers myuser

# passwd myuser

The new user now has the password set, and that new user is a member of a group not provided by the system.

Change the root password to an extremely long password with characters that cannot be entered by a human.

# dd if=/dev/urandom bs=256 count=1 |passwd --stdin root

Add the new user to sudoers. If RHEL7 is being used, or a derivative of it, such as CentOS 7, or Scientific Linux 7, modify using the visudo command below as follows:

# visudo -f /etc/sudoers.d/local.conf

If any distribution other than the ones listed above, use visudo without any extra command line parameters:

# visudo

Regardless of distribution, add the below line to the end of the file:

%sudoers localhost=(ALL) ALL

This line says that any member of group sudoers (% is mandatory to denote group, rather than user) can use the root account to run any command. If not familiar with the sudo command, it prompts for your user password (not the root password)

*If using Ubuntu, pick back up here*

Additionally, tell SSH not to permit root logins. Each distribution's SSHd config file is slightly different in this respect, as some default to having the directive commented out, while others have it uncommented and set to "yes".

Generally, what is needed is to do as follows:

1) Edit the file /etc/ssh/sshd_config using and editor

2) Look for the line that contains "PermitRootLogin"

3) Change that line so it is uncommented and says "PermitRootLogin no"

This prevents any direct root login access over SSH whatsoever.

Next, we need to make it so that if someone gets into your MyCloud account, they cannot use your emergency console to reboot into single user mode.

You'll want to use a different password here than what you used for your user account.
The steps for doing this vary depending on whether your distribution uses legacy GRUB or GRUB2 bootloader. Additionally, even within GRUB2, there are 2 ways, depending on whether your distribution is based on RHEL7.2 or an earlier version of RHEL7.

There are three methods:

#### For RHEL7.2 and higher based distributions:

# grub2-setpassword

When entering single user mode, the username is root, and the password is whatever you entered above.

Manual changes to the /boot/grub2/grub.cfg persist when new kernel versions are installed, but are lost when re-generating grub.cfg using the grub2-mkconfig command. Therefore, to retain password protection, use the above procedure after every use of grub2-mkconfig.

#### For other distributions with GRUB2, (including RHEL7.0 and RHEL7.1) the process is like this:

# grub2-mkpasswd-pbkdf2

--> Enter the password you want

--> Enter the password you want, again

--> Copy the resulting encrypted password, starting at "grub.pbkdf2"

# vi /etc/grub.d/40_custom

--> Enter the below lines into this file (do not modify any existing lines)

set superusers="root"

password_pbkdf2 john (paste copied password here)

--> Save and exit, then reboot to test.

You should be able to boot the system without any issue or human intervention, but it should prompt you for a password before allowing you to edit any existing entry.

#### For old distributions using legacy GRUB:

# grub-md5-crypt

--> Enter the password you want

--> Enter the password you want, again

--> Copy the resulting encrypted password

# vi /boot/grub/menu.lst

--> Find the line that starts with "timeout="

--> Create a new line after that which sets "password --md5 (password)"

--> Paste the copied encrypted password on the same line as above, in place of "(password)”.

#### VPN Tunneling

*Definitions*

A VPN is not a service that gives you access to their VPN tunnel in order to anonymize your internet connection. Instead, what I'm talking about is setting up an actual Virtual Private Network between your desktop/laptop or a server in your home or office, and your server at Rackspace.

A VPN Client is the software that runs either on your desktop or laptop, or on a server at your local site. This client connects to the OpenVPN server over the public internet to establish an encrypted tunnel through the internet that allows you to connect to your servers via a back end private connection.

A VPN Server is the software that runs on your Rackspace Cloud servers in order to allow clients to connect. It is responsible for negotiating the encryption and assigning private IP addresses to the clients.

I personally like the software OpenVPN which I run on both the client and on the server, as I can use NetworkManager to manage the client side OpenVPN connection, and systemd to manage the server side OpenVPN daemon which ensures the connection is always available. Additionally, if you want to put the OpenVPN client on a laptop running Windows, you can, and setup is fairly straightforward.

Note that there is a bug as of this writing (RHEL7.2) that prevents NetworkManager from bringing up the tunnel automatically on the client after a reboot, even when autostart is enabled. You can still use the GUI or the command line to bring it up manually, but you'll have to do that every reboot.

You might wonder why you need a VPN when SSH which encrypts everything already. There are a couple of reasons.
For one, when I get to firewalling, I'm going to recommend that you firewall off your servers from the public internet. Aside from the ports that need to be open for the server to do its job (80/443 for a web server, in this example), everything else will be firewalled. This includes port 22.

Another reason for having a VPN is that if you have a website which gets a DDOS attack against it, and Rackspace has to "nullroute" your public IP address, that makes your server is completely inaccessible from the internet. If you have a jumphost that you can connect to over your VPN, you can still get into your server over the back end.

Finally, I'll give you a little back story for why I do this. I've worked in IT for the last 10 years, including having worked for a short while at Rackspace. Most companies these days are switching to an indirect access model. That is, the important servers (app servers, web servers, database servers, etc) are all being kept behind an internal firewall (blocking the company offices from accessing servers at the datacenter through the internal network), even for SSH access, and anyone that needs to access them has to do so through a so-called jump host. It's essentially a server that serves one purpose. 

Sit on both networks (office and datacenter) and protect all the other servers from being accessed by SSH. The reason for this is that if the office network gets hacked, it prevents the hackers from getting into the datacenter. 

Similarly, if a server in the datacenter gets hacked, say through an exploit in Wordpress or some other app, the hackers can't go any farther than the one server (without additional effort), because no server can connect to another server over the internal datacenter network period, except for ssh to the jumphost, and specific services that you allow, like from your web server to your db server for example. 

Usually the jumphost has some sort of multi-factor authentication enabled in order to further restrict access back and forth. 

Now that we've defined what a VPN is, and why you might need one, lets go ahead and get into more details about the actual setup.

In my case, MFA for the jump host is overkill. I have one server at Rackspace which runs your basic LAMP stack, and one physical server at my house which is protected by my home router. Yes, I know there are flaws in most home routers -- that's why I have the server. 

They would have to break into my home network, then break into the server here, then use that to get across the VPN tunnel, then break into the jumphost, and then finally break into the actual server with the data. Remember, security is only as strong as the weakest link, and this guide is intended to eliminate as many of the weakest links as possible. This is called a multi-tiered configuration.

Since I am running my sites out of my home, I have a dynamic IP address assigned by my cable company. That prevents me from whitelisting my home IP in the firewall at Rackspace. Thus I use the VPN so that I have some way to privately connect to my server. So, what I did was to setup a second cloud server (nothing fancy -- I'm using a Standard 512MB instance) to act as my jumphost and VPN Endpoint.

So you setup this second host so that it has access to the public internet for now. Then you setup a private network (NOT ServiceNet) between the two cloud servers, and then you setup the VPN server software and make sure it is working and starts at boot. Then you firewall off all inbound protocols and ports except the VPN port on the public internet side, all inbound protocols and ports but SSH on the VPN side, and all inbound protocols and ports period on the Private side (this prevents any access if someone gets into your web server by exploiting your application through the internet, thus protecting the rest of your network.)

On both of my cloud hosts, I turned off the ServiceNet network in the MyCloud control panel. There are caveats to doing this. They are listed elsewhere within the Rackspace cloud documentation if you are curious. I don't use any other cloud services except for monitoring which does not require ServiceNet, so I was able to disable it without any issue. 

A suggestion if you use other services from Rackspace is to leave it enabled, but find out what ports you need to have open on ServiceNet in order for your cloud server to connect to those services. Definitely firewall off port 22 on ServiceNet, if nothing else. That way, any other customer's cloud server which is compromised and has ServiceNet enabled, can't connect to your servers.

Finally, on my main cloud server, I firewalled off everything except for ports 80 and 443 from the public internet, and firewalled off everything except for port 22 on the internal network. If you need other services, such as FTP or email, you can also open up those ports. 
