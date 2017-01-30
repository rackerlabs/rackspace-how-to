---
permalink: dovecot-installation-and-configuration-on-centos/
audit_date:
title: Dovecot installation and configuration on CentOS
type: article
created_date: '2012-08-15'
created_by: Lee Jelley
last_modified_date: '2016-06-22'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

If you've installed Postfix to operate as the SMTP service on a would-be
email server you might still need a way to retrieve the incoming mail
from your server.

This article shows how to install and configure Dovecot.

Dovecot is an open-source IMAP and POP3 server application which was
designed specifically for Linux/Unix Operating Systems. Dovecot
retrieves emails from Postfix and delivers them to the relevant mailbox
on the server.

You can get your mail through Dovecot using either of the POP3 or IMAP
protocols.

### Prerequisites

-   Operating System and version: Linux - CentOS 6.0 and above.
-   Postfix installed.
-   Intended purpose for document: Basic installation and configuration
    of Dovecot.
-   Target Audience: System Administrators, Mail
    Administrators, Postmasters.

### Install Dovecot

Download and install the Dovecot package by running the following command:

    $ sudo yum install dovecot

### Configure Dovecot

After installing Dovecot, you need to configure the services in the configuration file at
**/etc/dovecot/dovecot.conf**. This example uses `nano`, but you can use any text editor you want.

    $ sudo nano /etc/dovecot/dovecot.conf

The following lines will need to be uncommented in the **/etc/dovecot/dovecot.conf** file and, if necessary, changed
to reflect your plans for the environment:

    protocols = imap pop3
    mail_location =  maildir:~/Maildir

-   `protocols` - Specifies the protocols that are available for
    users to access their email.
-   `mail_location` - Specifies the format and the location of each
    user's mailbox.

### Authentication process file

Next you need to configure the authentication process file. This configuration file
can be located at **/etc/dovecot/conf.d/10-auth.conf**. This example uses `nano`, but you can use any text editor you want.

    $ sudo nano /etc/dovecot/conf.d/10-auth.conf

The following line will need to be uncommented in the **/etc/dovecot/conf.d/10-auth.conf** file and, if necessary, changed to reflect your plans for your environment:

    auth_mechanisms = plain login

`auth_mechanisms` specifies the way in which the email client authenticates with Dovecot.

### Mail location

To set the location for your mail use the configuration file at
**/etc/dovecot/conf.d/10-mail.conf**.

    sudo nano /etc/dovecot/conf.d/10-mail.conf

Either add or uncomment the line below in the configuration file.

    mail_location = maildir:~/Maildir

### Postfix smtp-auth

Next change the configuration file to configure the unix socket for
postfix smtp-auth. This can be found at
**/etc/dovecot/conf.d/10-master.conf**

    sudo nano /etc/dovecot/conf.d/10-master.conf

Comment out the following lines first.

    #unix_listener auth-userdb {
        #mode = 0600
        #user =
        #group =
      #}

Now edit these lines in the same file.

    # Postfix smtp-auth
      unix_listener /var/spool/postfix/private/auth {
        mode = 0666
        user = postfix
        group = postfix
      }

### POP3 configuration

Finally we need to configure the **pop3.conf** file. This will allow some
older or lesser-used email clients to connect and transmit correctly. This file can be found at **/etc/dovecot/conf.d/20-pop3.conf**.

    sudo nano /etc/dovecot/conf.d/20-pop3.conf

We will now need to uncomment or add the following lines.

    pop3_uidl_format = %08Xu%08Xv
    pop3_client_workarounds = outlook-no-nuls oe-ns-eoh

### Creating a Mailbox

Now we'll add an example mailbox for a user Joe Bloggs (joe.bloggs) to
send and receive emails.

You may need to create a user for this example, or you can use an
existing user. To make a new one:

    sudo useradd joe.bloggs

You'll need to create the mail directory for your user.

    sudo mkdir /home/joe.bloggs/Maildir

Next we need to give joe.bloggs ownership of the mailbox we have just
created by changing its permissions.

    sudo chown joe.bloggs:joe.bloggs /home/joe.bloggs/Maildir
    sudo chmod -R 700 /home/joe.bloggs/Maildir

### Starting Dovecot

Once we have finished the mailbox creation we will need to make sure the
Dovecot application will be run with the server upon restart. We'll use
the `chkconfig` command for that purpose.

    sudo chkconfig --level 345 dovecot on

The final step for Dovecot to be completed is to start the service.

    sudo service dovecot start

Dovecot should now be up and running.

### Postfix Configuration

We now need to go over to the Postfix directories and make the following
changes in our **main.cf** file. The reason for this final piece is so
that we can allow our email client to connect to our newly built SMTP
server.

Please take a moment to navigate over to **/etc/postfix/main.cf** and open
it with your chosen text editor.

    sudo nano /etc/postfix/main.cf

Now we should add the following lines.

    smtpd_sasl_auth_enable = yes
    smtpd_sasl_security_options = noanonymous
    smtpd_sasl_local_domain = $myhostname
    smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks, reject_unauth_destination
    broken_sasl_auth_clients = yes
    smtpd_sasl_type = dovecot
    smtpd_sasl_path = private/auth

Once you have added the above lines you can exit the **main.cf** file and
restart the Postfix service.

    sudo service postfix restart

### Iptables port additions

Now that we have enabled secure SMTP 'SSL' we should allow connections
to port 587 by opening the port in iptables for our server.  Add the
rule for this port by entering the following command:

    sudo iptables -I INPUT 2 -p tcp --dport 587 -j ACCEPT

After adding the SSL SMTP port we should also add the POP and IMAP ports
along with their secure counterparts.

    sudo iptables -I INPUT 3 -p tcp --dport 110 -j ACCEPT
    sudo iptables -I INPUT 4 -p tcp --dport 143 -j ACCEPT
    sudo iptables -I INPUT 5 -p tcp --dport 993 -j ACCEPT
    sudo iptables -I INPUT 6 -p tcp --dport 995 -j ACCEPT

Once these lines have been added we should save the iptables rules and
restart iptables.

    sudo /etc/init.d/iptables save
    sudo /etc/init.d/iptables restart

### Summary

In this guide you've learned to configure and install a basic Dovecot
setup. The steps you have covered today should have given you a solid
foundation of a basic Dovecot install and configuration. From here you
can explore the Dovecot package in more depth.
