---
permalink: setting-up-a-mail-relay/
audit_date:
title: Set up a Mail Relay
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2013-04-17'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

Since IP addresses are dynamically assigned in cloud servers, the IP
space has been declared unfit for email use. This means that major
blacklist providers have stated that email coming from cloud servers
should not be accepted. For this reason, email from Cloud Servers may
not reliably get through to your intended recipients.

To be able to send email reliably from your server, we recommend you
sign up for a [Rackspace Email account](http://www.rackspace.com/apps/email_hosting/),
use a relay service like
[Mailgun](/how-to/introduction-to-mailgun-email-automation),
or use any email account that allows you to send email via secure SMTP
authentication. You can then configure your server to send email through
that account. This way, you are still able to send mail and avoid these
issues.

This article is here to help with that setup. For our example, we will
show how to set up this relay with Rackspace Email and using the a
smarthost, but the basic steps are the same for most email providers.
This is specifically intended for system generated emails, like sign-up
scripts, password conformation pages, etc. that you cannot otherwise
easily route through an outside mail provider. Depending on your email
needs, you may need to configure an account with a third party like
Mailgun, Mailchimp, or SendGrid.

For Managed Support customers, you can request support to do this for
you. All we will need are the email server, the username and the
password for the account you are going to send the mail to. For our
other Cloud Servers customer, this article is intended to help you with
the basic setup.

### Step by Step

1. Install postfix and SASL tools

   For RHEL or CentOS:

        yum install postfix cyrus-sasl-plain cyrus-sasl-md5

   For Ubuntu:

        aptitude update
        apt-get install postfix libsasl2-modules

2. Configure Postfix

   Add the following to /etc/postfix/main.cf:

        relayhost = secure.emailsrvr.com
        smtp_sasl_auth_enable=yes
        smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd
        smtp_sasl_mechanism_filter = AUTH LOGIN
        smtp_sasl_security_options =

   Add the Rackspace Email username and password to
   /etc/postfix/sasl\_passwd by running these commands:

        echo 'secure.emailsrvr.com username@domain.com:secretpassword' > /etc/postfix/sasl_passwd
        chmod 600 /etc/postfix/sasl_passwd
        postmap /etc/postfix/sasl_passwd

   Restart Postfix and check the mail logs, you should see something like
   this:

        Nov 23 10:46:05 web2 postfix/qmgr\[24259\]: 5497F3708AA:
        from=<orders@myawesomeecommercesite.com>, size=1762, nrcpt=1 (queue active)
        Nov 23 10:46:05 web2 postfix/smtp\[1343\]:497F3708AA:to=<customer@someisp.com>,
        relay=secure.emailsrvr.com\[98.129.185.2\]:25, delay=0.31, delays=0.02/0.01/0.19/0.1,
        dsn=2.0.0, status=sent (250 2.0.0 Ok: queued as B5E3D2D0476)
