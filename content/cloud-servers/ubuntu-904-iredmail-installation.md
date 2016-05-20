---
permalink: ubuntu-904-iredmail-installation/
audit_date:
title: Install iRedMail on Ubuntu 9.04
type: article
created_date: '2011-03-15'
created_by: Rackspace Support
last_modified_date: '2016-01-13'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This tutorial will walk you through the process of installing the
[iRedMail](http://code.google.com/p/iredmail/ "http://code.google.com/p/iredmail/")
bundled mail server to successfully send and receive e-mail.

This tutorial assumes a few things:

-   You have followed the Ubuntu 9.04 setup guide
-   You are running on a new server with no other software installed
-   You are running the commands as a normal user with sudo privileges
-   The current version of iRedMail at the time of writing is 0.6.0 and
    it is in **beta**.

**Read this before continuing:**

Mail servers are complex pieces of software and can be difficult to
setup and maintain. An improperly configured mail server could cause
quite a havoc not only on your server but for the rest of the Internet
if spammers begin using your servers to send spam. Before attempting to
run a mail server please be sure that you have a comfortable
understanding of DNS (SPF/TXT/MX records), Domain Keys, Sender Policy
Framework, and how mail servers/mail flow works. If you are not sure
about any of these topics please read up before continuing otherwise you
may run into problems and become frustrated very quickly.


### Reverse DNS

Before we can begin installing the mail server we need to setup our
reverse DNS. Without this you will find it hard to send or receive a lot
of e-mails across the Internet because servers will think you are
spamming them or sending falsified e-mail.

Setting up reverse DNS through our Control Panel is very easy. Please
refer to our instruction on [how to setup a reverse DNS
record](/how-to/create-a-reverse-dns-record-0).
Keep in mind that DNS changes may take up to 24 hours to propagate
across the Internet.

### Perl locale fix

Our servers ship with no locale information so they are world-friendly.
To install the locale information type the following:

     sudo aptitude install language-pack-en-base

### Aptitude update

Next we will make sure that our server is update to date software-wise.
To do this we will run an Aptitude update:

    sudo aptitude update
    sudo aptitude upgrade

### Set the host name

One final step that needs to take place is setting up the host name of
your mail server. You can view your current host name by typing:

    hostname --fqdn
    kelly.myServer

Now this might work for most applications but for a mail server this
just won't do! We need to set your mail server's host name to match the
**F**ully **Q**ualified **D**omain **N**ame. A Fully Qualified Domain
Name, or FQDN, might look like *www.google.com*. For most mail servers
it will be something like *mail.yourdomain.com*.

To change your host name we will need to modify the */etc/hostname* file
on your server. This is the file that stores the host name information.

     sudo nano /etc/hostname

When the *nano* editor opens you will see the default host name listed.
Delete the line and type in your host name. Like I said earlier, most
mail servers are *mail.yourdomain.com*. Be sure to write down what you
set your host name to as we will need it later on.

Once you have modified the host name simply press **CTRL-X** followed by
**Y** and **Enter** to save.

### Modify your host file

We have one more change to make before we can begin the installation.
When addressing your FQDN we need to tell the server that it will be
referring to itself and not some IP on the Internet. This will help
reduce traffic and helps the server know where it is located. To do this
we will need to modify the */etc/hosts* file. This, too, is an easy
task!

To modify the hosts file type the following:

     sudo nano /etc/hosts

The nano editor will open with your hosts file.

The first thing you need to do is delete the second 127.0.0.1 line with
your old host name. This should leave you with a single 127.0.0.1 line.
Move over to the *localhost* portion of that line and add your FQDN
(mail.mydomain.com, for instance) followed by your subdomain that you've
chosen (mail, in our example). Your line should look similar to the one
below:

    127.0.0.1  mail.mydomain.com mail localhost localhost.localdomain

To save the file simply press **CTRL-X** followed by **Y** and **Enter**
as we did before.

#### Reboot the server

To apply our host name changes we will need to reboot the server.

     sudo reboot

Once your server has rebooted please log back in.

### Enable Aptitude Sources

To enable the additional Aptitude sources so iRedMail can find the
software it needs to function. To do this we need to modify the
*/etc/apt/sources.list* file. To modify the file type the following:

     sudo nano /etc/apt/sources.list

Go to the bottom of the file and add the following lines:

    deb http://mirrors.163.com/ubuntu jaunty main universe
    deb http://mirrors.163.com/ubuntu jaunty-updates main universe

To save the file simply press **CTRL-X** followed by **Y** and **Enter**

Now we need to test our source list changes. To do this type the
following:

     sudo aptitude update

### Install prerequisite packages

You're probably thinking "when are we going to install the software?"
Have no fear, we are almost there! First we need to install a software
package for the system to install correctly. The following software
package needs to be installed:

-   acl - File system permission control

<!-- -->

     sudo aptitude install acl

### Enable ACL

We need to enable ACL access control on the file system. Please read
this portion **very carefully**.

**Making improper changes to this file could destroy
your file system**

Open up the */etc/fstab* file and modify the *mount options* that are
used to mount the main file system partition.

     sudo nano /etc/fstab

Look for a line that begins with either */dev/sda1* or */dex/xvda1* and
put a **\#** comment mark in front of it.

If that line started with */dev/sda1* go to the bottom of the file and
type or copy in the following line:

    /dev/sda1    /    ext3    errors=remount-ro,noatime,acl     0     1

If the line started with */dev/xvda1* go to the bottom of the file and
type or copy in the following line instead:

    /dev/xvda1    /    ext3    errors=remount-ro,noatime,acl     0     1

Save the file with CTRL-X, then Y and Enter.

### Remount the file system

Once you have the changes made to the /etc/fstab file you now need to
reload them. This is fairly easy to do.

     sudo mount -o remount,rw,acl /

Now we are ready to install iRedMail!

### Switch to Root User

iRedMail will not install with *sudo* privileges so we must switch to
the *root* user. To do this type the following:

     sudo su -

You should be presented with a *root@* prompt now.

### Download iRedMail

To install iRedMail you will need to download the installation package
from their website. Please point your web browser to
<http://code.google.com/p/iredmail/downloads/list> and download the
latest version. At the time of writing the current version is *0.6.0*.
For the purposes of our installation we will be using *wget* to download
the installation package. Note that we are downloading this to the home
directory of the current user.

     cd ~
     wget http://iredmail.googlecode.com/files/iRedMail-0.6.0.tar.bz2

### Uncompress iRedMail

You'll notice that iRedMail comes packaged as a TAR file with further
BZ2 (BZip2) compression. To unpack this type the following:

     tar xjf iRedMail-0.6.0.tar.bz2

This will create a directory called *iRedMail-0.6.0*.

### Download installation-related packages

A few packages need to be downloaded by the installer before
installation can commence. Run the following lines of code to make this
happen:

     cd iRedMail-0.6.0/pkgs/   (Note that the directory name may differ between versions)
     bash get_all.sh

This will download all of the packages necessary to install. Now we need
to refresh the repository list:

### Start the iRedMail installer

The moment has come! To start the installation type the following:

     cd ~/iRedMail-0.6.0     (Note that the directory name may differ between versions)
     bash iRedMail.sh

1.  On the welcome screen, click **Yes** to continue.
2.  You will be prompted for the home directory location for the
    *vmail* user.

    The default value, /home/vmail, will be listed -- this is okay.
    Simply press **Next** for the default option.

3.  You will be then asked which backend you would like to use: *MySQL*
    or *OpenLDAP*.

    For our example we will use MySQL as the backend, so highlight MySQL
    and press the space-bar to select, then click **Next** to continue.

4.  Enter your MySQL password and click **Next**.

5.  Enter your *vmail* user password This will be a system user that
    holds all of your mail. Type it and click **Next**.

6.  You will be asked to enter your first virtual domain.

    This is the domain that you will be hosting mail for. Type in your
    domain name (such as *mydomain.com*) and click **Next**.

7.  Enter the administrator name of your virtual domain.

    The default value of *postmaster* is an industry standard and should
    be used. This address will be *postmaster@mydomain.com* when the
    installation is completed. click **Next**.

8.  Set a password for the above *postmaster* e-mail address.
    Click **Next** after you have entered it.

9.  Add the first user for your domain.

    This will be your first e-mail account such as *john.doe*. The full
    e-mail address would be *john.doe@mydomain.com*. Enter the user name
    here and click **Next**.

10. Set a password for the user we just added.

    You will see the full e-mail address at the top of the window. Type
    in the password and click **Next**.

11. You will be prompted if you would like to setup SPF (Sender
    Policy Framework) and DKIM (DomainKeys Identified Mail).

    **SPF is highly recommended, but DKIM is optional and should only be
    installed by more experienced users.** Uncheck DKIM if you are
    unfamiliar with it. Keep in mind that these will require additional
    DNS entries to be made. If you would like to use these simply
    click **Next**. *We will walk you through setting up the SPF and
    DKIM records later.*

12. Because we are choosing MySQL as our backend we have a number of
    administrative tools we can install. Those tools include
    *phpMyAdmin*, *PostfixAdmin* and *AWstats*. We also have the ability
    to select which WebMail client we would like to install.

    Our installation will choose the default options (Roundcubemail,
    phpMyAdmin, PostfixAdmin and Awstats) so just click **Next**.

13. Select a default language for WebMail and click **Next**.

14. Set and e-mail address as the PostfixAdmin administrative e-mail.

    You can use the default *postmaster@mydomain.com* e-mail or use a
    different address. Click **Next**.

15. Set an e-mail address to use for the *root* user.

    This is where all system e-mail will be sent pertaining to the
    system and the root user. Put in your e-mail address and
    click **Next**<span>. It is advised to use an e-mail address *NOT*
    hosted on your mail server.</span>

16. When you are prompted to continue with the installation, enter **Y**
    and press **Enter**.

17. You will be prompted at the end of the installation if you would
    like to use the default iptables firewall configuration.

    If you have a brand new server simply press **Y** and then
    **Enter**. *Do not do this if you have previously made modifications
    to your iptables configuration.*

18. You will then be prompted if you would like to restart iptables.

    For now press **N** and press **Enter**.

19. You will be asked if you would like to start Postfix now.

    Press **N** and press **Enter**.

Your installation should now be finished and you will be returned to a
shell prompt.

### Delete setup files

Before this server is ready to be used in a production environment it
must be safely locked down and the setup files should be removed. This
is easily accomplished with one *rm* statement.

     rm -f ~/iRedMail-0.6.0/config

#### Reboot the server

Go ahead and reboot the server to reload everything and cleanly start
Postfix.

     reboot

Once the server comes back up go ahead and log back in as a normal user.

### Setup SPF Record

Now we will need to go setup an SPF record. Go to
<http://old.openspf.org/wizard.html> to determine what your SPF record
should be. Once you have done this please submit a ticket and we will
process your SPF record. Note that your mail may still function without
this but you may receive frequent mail rejections.

### OPTIONAL: Create DKIM (DomainKey)

To create a the Domain Key entry type the following:

     sudo apt-get install amavisd-new

     sudo /usr/sbin/amavisd-new showkeys

You will see an output like the following:

    [user@mail ~]$ sudo /usr/sbin/amavisd showkeys
    ; key#1, domain mydomain.com, /var/lib/dkim/mydomain.com.pem
    dkim._domainkey.mydomain.com.     3600 TXT (
      "v=DKIM1; p="
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCuv5EpKWzSRGm8Gtks8uDEpllQ"
      "Ug50USM6LjIEfx77+C9c3GpuxtTdfYMUlA7nqlolJ0GCx+PPrbSOCKZO1UeHAG2M"

      "/KYC9Kw8ByqP80Ni+Xx+M2fNSQCn4c+fmsX6AwLHZfshTmR6lGNTL/VMi84GgJtA"
      "vfufWEShr/j8f4udcwIDAQAB")

If you are hosting your DNS with Cloud Servers please submit a ticket
and request that the domain key is added. We will create a TXT record
for your domain with the above key. If you are hosting your DNS
elsewhere you will need to create a TXT record for
*dkim.\_domainkey.mydomain.com* and use the enclosed text (without the
quotes) as the content.

### OPTIONAL: Test DKIM

Once you have the TXT record created you can test it on your server by
typing the following:

     sudo /usr/sbin/amavisd-new testkeys

If it passes you should see something like the following:

    TESTING#1: dkim._domainkey.mydomain.com        => pass

If you receive 'fail' then you may have a problem with your key. Please
check it again. This will also result from DNS entries that have not
propagated yet.

#### Reboot the server

Reboot your server one more time.

     sudo reboot

Once the server has come back online proceed below.

### Access WebMail

Point your web-browser to <http://mail.mydomain.com/mail/> and this
should bring up the RoundCubeMail WebMail application. Type in your
login name and password and click Login. Send yourself an e-mail from
another e-mail account to see if it is working. You can also send an
e-mail to someone on the Internet to test outbound e-mail.

### Information about your install

You can find information about your installation file located here:
**\~/iRedMail-0.6.0/iRedMail.tips**

### Common links

The following links are valid for your iRedMail installation. Please
replace *mail.mydomain.com* with your FQDN.

-   postfix.admin - <https://mail.mydomain.com/postfixadmin/>
-   RoundCubeMail WebMail - <http://mail.mydomain.com/mail/>
-   phpMyAdmin - <https://mail.mydomain.com/phpmyadmin/>
-   AWstats - <http://mail.mydomain.com/awstats/awstats.pl>

### Troubleshooting: View mail logs

If you are having troubles with your mail server you might want to take
a peek at the logs. To view the logs for iRedMail simply type the
following:

     sudo tail -F /var/log/mail.log

This will display the last output of the log and show the entries as
they are added in real-time. Your output may look like the output below:

    Jul  8 23:25:53 mail postfix/smtp[4530]: 2CBEFD49DD: to=<john@doe.com>, relay=127.0.0.1[127.0.0.1]:10024,
        delay=2251, delays=2251/0.04/0/0.44, dsn=2.0.0, status=sent (250 2.0.0 Ok, id=04262-04, from
        MTA([127.0.0.1]:10025): 250 2.0.0 Ok: queued as 87F93D49DA)
    Jul  8 23:25:53 mail postfix/qmgr[4298]: 2CBEFD49DD: removed
    Jul  8 23:25:53 mail postfix/pipe[4536]: 87F93D49DA: to=<john@doe.com>, relay=dovecot, delay=0.06,
        delays=0.04/0.01/0/0.02, dsn=2.0.0, status=sent (delivered via dovecot service)
    Jul  8 23:25:53 mail postfix/qmgr[4298]: 87F93D49DA: removed
