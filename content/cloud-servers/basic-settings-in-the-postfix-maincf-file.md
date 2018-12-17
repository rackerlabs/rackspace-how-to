---
permalink: basic-settings-in-the-postfix-maincf-file/
audit_date: '2018-01-16'
title: Basic settings in the Postfix main.cf file
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-01-16'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

After you have installed Postfix, you can work with settings in the
**main.cf** file to further configure Postfix.

**Note:** This article assumes that you are using a single domain for
your email needs.

### Modular nature of Postfix

One of the key aspects of Postfix is that it is designed to be a modular
package. The base installation itself is fairly small, and the vast
majority of the "usual" mail administration, such as anti-spam and
anti-virus, is actually conducted by third-party packages like
SpamAssassin.

You can begin to see the modular nature of Postfix when you look at the
**main.cf** file. Many settings refer to other files on the server. This
setup can seem slightly confusing at first, and your initial reaction
might be to hard code the data rather than reference another file with a
single word in it. However, we recommend retaining the modularity of
Postfix and editing multiple files for what might seem like simple
settings. Such modularity will be useful when you start adding multiple
domains, users, and aliases to your setup.

### The main.cf file

To see the **main.cf** file, issue the following command:

    sudo nano /etc/postfix/main.cf

The file consists of basically three sections. The first section
includes several settings such as the `smtpd_banner` and `biff`
parameters. The second section has settings for TLS parameters.

This article focuses on the last section, which looks as follows on the
**democloud** server:

    myhostname = mail.democloud.com

    alias_maps = hash:/etc/aliases
    alias_database = hash:/etc/aliases

    myorigin = /etc/mailname
    mydestination = mail.democloud.com, localhost.democloud.com, localhost

    relayhost =
    mynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = all

**Note**: Some of the settings already have the host name from the base
Postfix installation.

Although some of the settings might be self-explanatory, the following
sections describe them so that you can get a better understanding of
Postfix and what you can do with it.

#### myhostname

The `myhostname` value was set during the Postfix installation when you
entered the domain name that you want to use. This name also matches the
cloud server host name.

#### aliases

Aliases provide a method for delivering mail to different users without
having to set up dozens of different accounts. The default settings in
the **main.cf** reference another file:

    alias_maps = hash:/etc/aliases
    alias_database = hash:/etc/aliases

Open that file, as follows:

    sudo nano /etc/aliases

The file shows a list of names followed by `root`. Mail delivered to the
first name is actually delivered to the second name. You do not need to
set up the `postmaster`, `news`, `webmaster`, `abuse`, and other users
for Postfix because mail delivered to those names is sent to `root`.

Using the same syntax, you can have all mail for `root` delivered to the
admin user by adding the following line (`demo `is the main admin user
for the **democloud** server):

    root: demo

As a result, the delivery destination would change as follows:

1.  Mail sent to `mailer-daemon` is sent to `postmaster`.
2.  Mail to `postmaster` is sent to `root`.
3.  Mail sent to `root` is sent to the main admin user `demo`.

You can adjust the aliases as you see fit, but instead of changing all
the `root` users in the file, it is easier to add the one line as shown.
Adding that line also makes future migration and administration easier.

After you change the **aliases** file, you must refresh the aliases
database for any changes to occur. Use the following command:

    sudo newaliases

#### myorigin

Internal emails from packages such as cron jobs do not supply full mail
credentials; they use the `myorigin` setting instead. As such, you need
to set this parameter to the main host name of the server.

By default, the setting refers to the **/etc/mailname** file. To look at
the contents, run the following command:

    cat /etc/mailname

Example output for the **democloud** server is as follows:

    mail.democloud.com

However, you can also set `myorigin` by using `$mydomain` in the
**main.cf** file, as follows:

    myorigin = $mydomain

Although you haven't specifically set the `$mydomain` variable, Postfix
gets the information from the `myhostname` setting, parsing the host
name to gain the main domain name.

Setting the `myorigin` parameter this way allows for easier
administration at a later date because only one setting (`myhostname`)
needs to change. All the other parameters take the change from that.

#### mydestination

Although you have not yet set the server to receive mail, the
`mydestination` parameter defines the domains from which the server will
accept mail.

The default looks as follows:

    mydestination = mail.democloud.com, localhost.democloud.com, , localhost

The default is adequate when you are setting up mail for a single
domain. However, like with the `myorigin` setting, you can reduce future
administration by using the `$mydomain` variable as follows:

    mydestination = $mydomain, localhost.$mydomain, localhost

#### relayhosts

For the setup in this series of articles, you do not need this setting.
You can leave it blank.

#### mynetworks

The `mynetworks` parameter defines the network to use. The default value
includes IPv6 settings, which you can remove. The remaining value looks
as follows:

    mynetworks = 127.0.0.0/8

#### The rest

You can use the default values for the remaining settings. They are
relevant for more complex configurations.

#### Final settings

After the preceding changes, the last section in the example **main.cf**
file looks as follows:

    myhostname = mail.democloud.com

    alias_maps = hash:/etc/aliases
    alias_database = hash:/etc/aliases

    myorigin = $mydomain
    mydestination = $mydomain, localhost.$mydomain, localhost

    relayhost =
    mynetworks = 127.0.0.0/8
    mailbox_size_limit = 0
    recipient_delimiter = +
    inet_interfaces = all

### Test the settings

As with all packages, after you have made any changes to the
configuration, you must restart, as follows:

    sudo /etc/init.d/postfix restart

After Postfix is restarted, you can conduct a quick test by sending an
email to a working email address, as shown in the following example.

    mail user@example.com
    Subject: test
    test
    .
    Cc:

You should receive an email from the correct user and the correct
domain. Check the headers to verify that they are correct.

### Summary

Configuring Postfix can be a daunting task. This introduction helps with
the basics and shows how using variables instead of hard coding domain
names can save time and effort in any future
administration. 
