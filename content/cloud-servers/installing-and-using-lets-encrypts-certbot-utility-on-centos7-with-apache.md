---
permalink: installing-and-using-lets-encrypts-certbot-utility-on-centos7-with-apache/
audit_date:
title: "Installing and using Let's Encrypt's Certbot utility on CentOS 7 with Apache"
type: article
created_date: '2020-08-01'
created_by: Z McCrocklin
last_modified_date: '2020-08-01'
last_modified_by: Z McCrocklin
product: Cloud Servers
product_url: cloud-servers
---

# Installing and using Let's Encrypt's Certbot utility on CentOS 7 with Apache

This article describes the process of installing and utilizing the Let's Encrypt certbot utility on a CentOS7 server.

## What is Let's Encrypt?

Let's Encrypt is a Certificate Authority that provides free 90-day SSL Certificates.  From their [About Page](https://letsencrypt.org/about/):

> **Let's Encrypt is a free, automated, and open certificate authority (CA), run for the public's benefit. It is a service provided by the Internet Security Research Group (ISRG).**
>
> **We give people the digital certificates they need in order to enable HTTPS (SSL/TLS) for websites, for free, in the most user-friendly way we can. We do this because we want to create a more secure and privacy-respecting Web.**
>
>
> **The key principles behind Let's Encrypt are:**
>
> - **Free: Anyone who owns a domain name can use Let's Encrypt to obtain a trusted certificate at zero cost.**
> - **Automatic: Software running on a web server can interact with Let's Encrypt to painlessly obtain a certificate, securely configure it for use, and automatically take care of renewal.**
> - **Secure: Let's Encrypt will serve as a platform for advancing TLS security best practices, both on the CA side and by helping site operators properly secure their servers.**
> - **Transparent: All certificates issued or revoked will be publicly recorded and available for anyone to inspect.**
> - **Open: The automatic issuance and renewal protocol will be published as an open standard that others can adopt.**
> - **Cooperative: Much like the underlying Internet protocols themselves, Let's Encrypt is a joint effort to benefit the community, beyond the control of any one organization.**

### What is the difference between Let's Encrypt and other SSL Certificates?

SSL Certificates are keys that help encrypt your server data.  Web browsers will only recognize SSL Certificates that have been provided by a well-known Certificate Authority (DigiCert, GoDaddy, COMODO, etc.).  All the well-known & trusted Certificate Authorities are members of the CA/Browser Forum ([cabforum.org](https://cabforum.org/)) and follow a strict set of requirements to issue Certificates.

There are 3 different levels of SSL Certificates:
- **Domain Validation (DV) Certificate**  
  This is a basic SSL Certificate that proves domain ownership.  No additional validation is needed.

- **Organizational Validation (OV) Certificate**  
  This Certificate not only proves domain ownership, but also proves that it is owned by an actual business in good standing with a government authority.

- **Extended Validation (EV) Certificate**  
  This Certificate goes a step further than the OV Certificate by further validating that the business has been in operational existence for at least 3 years.

On the back end, these differences seem to be significantly important, and they play a major factor when you purchase a Certificate from a CA as you will have to go through their Validation process.

On the front end, there is no visible difference among the three Certificate types.  The browser feature that used to differentiate among the different Certificate levels has been deprecated. You can read more about it here:

[Extended Validation Certificates are (Really, Really) Dead](https://www.troyhunt.com/extended-validation-certificates-are-really-really-dead/)

Let's Encrypt is an official Certificate Authority in the CA/Browser Forum that offers free basic DV Certificates that are good for 90 days at a time.  What makes them unique is their Certbot utility that can be installed on a web server to issue and manage your SSL Certificates using automated processes, resulting in less maintenance and less headache.  The 90-day validity period means that the Certificate keys will be cycled more often, which provides better security as there is a much smaller window of possibly having your key compromised.

---

## Getting Started

This article focuses on installing certbot on the latest release of CentOS7.  The server used in this example is running the following LAMP stack:
- CentOS Linux release 7.8.2003 (Core)
- PHP 7.4.8
- MariaDB 5.5.65
- Apache 2.4.6

However, the instructions and commands in this article provide the basic functions for obtaining a Certificate from Let's Encrypt.  Certbot is not dependent on a web application to run, but it does require a way to validate that you actually control the domain.  This article will only cover validation using the webroot method, meaning that the domain you are requesting the Certificate for is being hosted on the server where Certbot is installed.

> **It's important to note that the instructions in this article use a default Apache configuration for a single site on the server.  Your configuration may vary depending on how you have Apache configured.**

---

### Installing Certbot

Once you have your server set up to serve your web page, you're ready to install Certbot:

```
[root@leexample-centos7 ~]# yum install certbot
```

Certbot will require the following dependencies:
```
=================================================================================================================================
 Package                                   Arch                    Version                           Repository             Size
=================================================================================================================================
Installing:
 certbot                                   noarch                  1.6.0-1.el7                       epel                   44 k
Installing for dependencies:
 pyOpenSSL                                 x86_64                  0.13.1-4.el7                      base                  135 k
 python-ndg_httpsclient                    noarch                  0.3.2-1.el7                       epel                   43 k
 python-requests-toolbelt                  noarch                  0.8.0-3.el7                       epel                   78 k
 python-zope-component                     noarch                  1:4.1.0-5.el7                     epel                  228 k
 python-zope-event                         noarch                  4.0.3-2.el7                       epel                   79 k
 python-zope-interface                     x86_64                  4.0.5-4.el7                       base                  138 k
 python2-acme                              noarch                  1.6.0-1.el7                       epel                   81 k
 python2-certbot                           noarch                  1.6.0-1.el7                       epel                  374 k
 python2-configargparse                    noarch                  0.11.0-2.el7                      epel                   31 k
 python2-future                            noarch                  0.18.2-2.el7                      epel                  806 k
 python2-josepy                            noarch                  1.3.0-2.el7                       epel                   89 k
 python2-mock                              noarch                  1.0.1-10.el7                      epel                   92 k
 python2-parsedatetime                     noarch                  2.4-6.el7                         epel                   78 k
 python2-pyrfc3339                         noarch                  1.1-3.el7                         epel                   16 k
 python2-six                               noarch                  1.9.0-0.el7                       epel                  2.9 k
 pytz                                      noarch                  2016.10-2.el7                     base                   46 k

Transaction Summary
=================================================================================================================================
```

---

### Requesting a New Certificate Using Certbot

Now that you have Certbot installed, you are able to request a Certificate from Let's Encrypt.  However, before you do so, you will want to make sure you take note of a few things:
- The domain(s) you are requesting.  You can request up to **100 domains** on a single Let's Encrypt Certificate.

- The location of your site's Document Root directory/directories:
  This will be used in the certbot command to install the txt file for validation.  If you are adding multiple domains that point to different directories, you will need to list them all in the command.


- You <u>**MUST**</u> allow access to the `/.well-known/acme-challenge/` directory

- You <u>**MUST**</u> exclude the `/.well-known/acme-challenge/` directory from a force HTTP to HTTPS redirect.

---

> **It's important to note that the very first time you run Certbot, you will be prompted to enter your email address and Agree to the Terms of Service:**

```
Enter email address (used for urgent renewal and security notices)
 (Enter 'c' to cancel): z@mccrocklin.space
Starting new HTTPS connection (1): acme-v02.api.letsencrypt.org

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please read the Terms of Service at
https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf. You must
agree in order to register with the ACME server at
https://acme-v02.api.letsencrypt.org/directory
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(A)gree/(C)ancel: a

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Would you be willing, once your first certificate is successfully issued, to
share your email address with the Electronic Frontier Foundation, a founding
partner of the Let's Encrypt project and the non-profit organization that
develops Certbot? We'd like to send you email about our work encrypting the web,
EFF news, campaigns, and ways to support digital freedom.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o: n
```

---

Now to request a Certificate.  Here is what the command looks like:

```
[root@leexample-centos7 ~]# certbot certonly --webroot -w /var/www/vhosts/example.com -d example.com -d www.example.com
```

Let's break this down:

- `certonly` Is a flag that states to **ONLY** issue a Certificate and **DO NOTHING ELSE** (no web application configuration)
- `--webroot` tells Certbot to use a specified web directory, each separated by the `-w` flag.
- `-d` specifies the domain to be requested - you <u>**MUST**</U> have `-d` flag for each domain you want on the Certificate.
  For example: `-d domain1.tld -d domain2.tld -d domain3.tld`
> **If you want to cover both the www & non-www versions of a domain on a single Certificate, you HAVE to use a `-d` flag for each one!**

---

Once you enter the command, you will get the following output:
```
Obtaining a new certificate
Performing the following challenges:
http-01 challenge for letest.mccrocklin.space
Using the webroot path /var/www/vhosts/example.com for all unmatched domains.
Waiting for verification...
```

If there are no issues with the validation, you will see the following output seamlessly:
```
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/example.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/example.com/privkey.pem
   Your cert will expire on 2020-10-30. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

---

#### Certificate File Locations

Certbot, by default, installs the Certificates to `/etc/letsencrypt/live/<domain.tld>/`.
> **`<domain.tld>` will always be the first domain you set when running the `certbot` command.  Keep this in mind when configuring your VirtualHost/Server blocks to point to the Certificate Files.**

Here are the list of files you can expect to see in the directory:
```
[root@leexample-centos7 ~]# ls -al /etc/letsencrypt/live/example.com
total 12
drwxr-xr-x. 2 root root 4096 Aug  1 13:35 .
drwx------. 3 root root 4096 Aug  1 13:35 ..
lrwxrwxrwx. 1 root root   47 Aug  1 13:35 cert.pem -> ../../archive/example.com/cert1.pem
lrwxrwxrwx. 1 root root   48 Aug  1 13:35 chain.pem -> ../../archive/example.com/chain1.pem
lrwxrwxrwx. 1 root root   52 Aug  1 13:35 fullchain.pem -> ../../archive/example.com/fullchain1.pem
lrwxrwxrwx. 1 root root   50 Aug  1 13:35 privkey.pem -> ../../archive/example.com/privkey1.pem
-rw-r--r--. 1 root root  692 Aug  1 13:35 README
```

Notice that every single one of these files are symbolic links.  This is important for the automated renewal process, which is further explained in the Renewal section below.  For now, let's note the file names and their uses:

- `cert.pem` is the Certificate by itself.
- `chain.pem` is the CA bundle by itself.
- `fullchain.pem` is the Certificate, followed by the CA Bundle.
- `privkey.pem` is the Private Key.

Using the default Apache configuration, we'll add the following lines into `/etc/httpd/conf.d/ssl.conf`


  ```
  SSLEngine on
  SSLCertificateFile /etc/letsencrypt/live/example.com/cert.pem
  SSLCACertificateFile /etc/letsencrypt/live/example.com/chain.pem
  SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem
  ```

Once you have your configuration set, save the changes & exit, then make sure you do a syntax check:  
`httpd -t`  

If you get `Syntax OK`, then reload Apache:  
`systemctl reload httpd`

---

### Renewing your Certificate(s)

Let's Encrypt Certificates have a lifespan of 90 days, so when you're trying to renew a large number of Certificates you requested using the Certbot utility, it can get pretty daunting to think about manually renewing your Certificates every 60-90 days!

Certbot has a built in renewal function that will take care of this for you.  However, it does not run automatically and must be scheduled to run as a cron job in order for it to be effective.  Let's go over how the renewal process works with Certbot:

1. The renewal is initiated by running `certbot renew`.


2. Certbot then checks all the Certificates that have been issued and installed on your server.
  - It specifically looks for any Certificates that will be expiring in the next **30 days**.


3. Certbot then attempts to renew these expiring Certificates using the same validation method that was originally used when first obtaining the Certificate.
  - The same requirements in the above section **Requesting a new Certificate using Certbot** apply.


4. Upon successful renewal, Certbot will create new files inside the `/etc/letsencrypt/archive/<donain.tld>/` directory (incrementing in number for each renewal iteration) and update the symlinks in the `/etc/letsencrypt/live/<domain.tld>/` directory.
  > **Because the Certificate file names don't actually change, there is no need to change the file path in the VirtualHost/Server block configuration files.  This makes for a more seamless renewal process.**

---

#### Setting Up the Cron Job

It's important to note that the actual frequency of the cron job is dependent upon your server configuration.  The renew function will only scan existing Certificates until it finds one that is expiring within the next 30 days.  It's safe to set to run once a day during low traffic times, and is ideal if you have many Let's Encrypt Certificates that were issued at different times so it can catch them as they get to the 30-day mark.

However, you may choose to have it run less frequently.  For example, once a week: 3AM every Sunday morning.

You can create the cron using the root user's crontab or using Anacron.  Anacron will ensure that the cron job runs if it was missed during server downtime.

First, let's make sure we get the proper path calling the command directly:

```
[root@leexample-centos7 ~]# which certbot
/usr/bin/certbot
```

Then determine which cron method you want to use:

- **Anacron**: create a new file in `/etc/cron.weekly/` - you can name it something like `certbotrenew`

- **Cron**: use `crontab -e`

Then create the cron entry:
`0 3 * * 0 /usr/bin/certbot renew`

And Save the file.

---

## Final Notes
Let's Encrypt is a great alternative to obtain free SSL Certificates for your domains.  These Certificates are Domain Validated Certificates, which means that they only validate domain ownership.  This article only covers the basic functions of the Let's Encrypt Certbot utility.  If you are looking for additional options and more advanced functionality, you can get further assistance from the Let's Encrypt Community:

- [Let's Encrypt](https://letsencrypt.org/)
- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Let's Encrypt Community Forum](https://community.letsencrypt.org/)
