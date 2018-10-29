---
permalink: dovecot-installation-and-configuration-on-centos/
audit_date: '2018-10-17'
title: Install and configure Dovecot on CentOS
type: article
created_date: '2012-08-15'
created_by: Lee Jelley
last_modified_date: '2018-10-29'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If you have installed the [Postfix](http://www.postfix.org) mail server to
operate as the Simple Mail Transfer Protocol (SMTP) service on an
email server, you might still need a way to retrieve the incoming mail
from the server.

This article shows you how to install and configure Dovecot, an
open-source Internet Message Access Protocol (IMAP) and Post Office Protocol
version 3 (POP3) server application designed specifically for Linux&reg; and
UNIX&reg; operating systems. Dovecot retrieves emails from Postfix and
delivers them to the relevant mailbox on the server.

You can get your mail through Dovecot by using either the POP3 or the IMAP
protocol.

### Prerequisites

You need the following operating system and software to use Dovecot:

- A CentOS&reg; 6.0 or later Linux distribution
- Postfix

### Install Dovecot

Download and install the Dovecot package by running the following command:

    $ sudo yum install dovecot

### Configure Dovecot

After you install Dovecot, you need to configure the services in the
configuration file at `/etc/dovecot/dovecot.conf`. This example uses
the `nano` text editor, but you can use any text editor that you want.

1. Use the following command to open the file in `nano`:

       $ sudo nano /etc/dovecot/dovecot.conf

2. Uncomment the following lines in the file and, if necessary, change them to
   reflect your plans for the environment:

       protocols = imap pop3
       mail_location =  maildir:~/Maildir

    These lines contain the following parameters:

    - `protocols`: The protocols through which users can access their
      email
    - `mail_location`: The format and the location of each user's
      mailbox

### Configure the authentication process file

Next you need to configure the authentication process file,
which is located at `/etc/dovecot/conf.d/10-auth.conf`.

1. Use the following command to open the file in `nano`:

       $ sudo nano /etc/dovecot/conf.d/10-auth.conf

2. Uncomment the following line in the file and, if necessary, change them to
   reflect your plans for your environment:

       auth_mechanisms = plain login

    The `auth_mechanisms` parameter specifies the method that the email client
    uses to authenticate with Dovecot.

### Configure the mail location

You can set the location for your mail by editing the configuration file at
`/etc/dovecot/conf.d/10-mail.conf`.

1. Use the following command to open the file in `nano`:

       sudo nano /etc/dovecot/conf.d/10-mail.conf

2. Either add or uncomment the following line in the configuration file:

       mail_location = maildir:~/Maildir

### Configure Postfix SMTP authentication

Next you need to configure the UNIX socket for Postfix SMTP
authentication (SMTP AUTH). The file that you need to change is located at
`/etc/dovecot/conf.d/10-master.conf`.

1. Use the following command to open the file in `nano`:

       sudo nano /etc/dovecot/conf.d/10-master.conf

2. Comment out the following lines:

        #unix_listener auth-userdb {
            #mode = 0600
            #user =
            #group =
          #}

3. In the same file, edit the following lines:

        # Postfix smtp-auth
          unix_listener /var/spool/postfix/private/auth {
            mode = 0666
            user = postfix
            group = postfix
          }

### Configure POP3

Finally, configure the `/etc/dovecot/conf.d/20-pop3.conf` file, which enables
older and less popular email clients to connect and transmit messages
correctly.

1. Use the following command to open this file in `nano`:

       sudo nano /etc/dovecot/conf.d/20-pop3.conf

2. Uncomment or add the following lines:

       pop3_uidl_format = %08Xu%08Xv
       pop3_client_workarounds = outlook-no-nuls oe-ns-eoh

### Create a mailbox

The example in this section adds a mailbox that a hypothetical user named Joe
Bloggs (joe.bloggs) can use to send and receive emails.

You can create a user for this example, or you can use an existing user.

1. If necessary, use the following command to make a new user:

       sudo useradd joe.bloggs

2. Use the following command to create the mail directory for your user:

       sudo mkdir /home/joe.bloggs/Maildir

3. Give ownership of the mailbox that you just created to joe.bloggs by
   changing its permissions:

       sudo chown joe.bloggs:joe.bloggs /home/joe.bloggs/Maildir
       sudo chmod -R 700 /home/joe.bloggs/Maildir

### Start Dovecot

Use the following steps to start the Dovecot service:

1. Use the following `chkconfig` command to verify that the Dovecot
   application will run when the server is restarted:

       sudo chkconfig --level 345 dovecot on

2. Use the following command to start the Dovecot service:

       sudo service dovecot start

### Configure Postfix

Next, you need to configure Postfix to enable your email client to connect to
your new SMTP server.

1. Use the following command to open the file at `/etc/postfix/main.cf` in
   `nano`:

       sudo nano /etc/postfix/main.cf

2. Add the following lines to the file:

        smtpd_sasl_auth_enable = yes
        smtpd_sasl_security_options = noanonymous
        smtpd_sasl_local_domain = $myhostname
        smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks, reject_unauth_destination
        broken_sasl_auth_clients = yes
        smtpd_sasl_type = dovecot
        smtpd_sasl_path = private/auth

3. After you have added the preceding lines, exit the **main.cf** file and
   restart the Postfix service by using the following command:

       sudo service postfix restart

### Add ports to iptables

Now that you have enabled secure SMTP Secure Sockets Layer (SSL), you should
allow connections to port 587 by opening the port for your server in iptables.

1. Add the rule for this port by entering the following command:

       sudo iptables -I INPUT 2 -p tcp --dport 587 -j ACCEPT

2. Add the POP and IMAP ports, as well as their secure counterparts:

       sudo iptables -I INPUT 3 -p tcp --dport 110 -j ACCEPT
       sudo iptables -I INPUT 4 -p tcp --dport 143 -j ACCEPT
       sudo iptables -I INPUT 5 -p tcp --dport 993 -j ACCEPT
       sudo iptables -I INPUT 6 -p tcp --dport 995 -j ACCEPT

3. Use the following commands to save the iptables rules and restart iptables:

       sudo /etc/init.d/iptables save
      sudo /etc/init.d/iptables restart
