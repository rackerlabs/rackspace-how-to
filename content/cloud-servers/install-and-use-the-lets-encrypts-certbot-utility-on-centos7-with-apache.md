---
permalink: install-and-use-the-lets-encrypt-certbot-utility-on-centos7-with-apache/
audit_date: '2020-08-12'
title: 'Install and use the Let&apos;s Encrypt Certbot utility on CentOS 7 with Apache'
type: article
created_date: '2020-08-01'
created_by: Z McCrocklin
last_modified_date: '2020-08-12'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to install and use the Let's Encrypt&reg; Certbot utility on a CentOS&reg; 7 server.

### What is Let's Encrypt?

Let's Encrypt is a Certificate Authority (CA) that provides free 90-day SSL Certificates.  The following details
come from their [About Page](https://letsencrypt.org/about/):

> Let's Encrypt is a free, automated, and open certificate authority (CA), run for the public's
> benefit. It is a service provided by the Internet Security Research Group (ISRG).
>
> We give people the digital certificates they need in order to enable HTTPS (SSL/TLS) for
> websites, for free, in the most user-friendly way we can. We do this because we want to create
> a more secure and privacy-respecting Web.
>
> The key principles behind Let's Encrypt are:
>
> - **Free**: Anyone who owns a domain name can use Let's Encrypt to obtain a trusted certificate at zero cost.
> - **Automatic**: Software running on a web server can interact with Let's Encrypt to painlessly
>   obtain a certificate, securely configure it for use, and automatically take care of renewal.
> - **Secure**: Let's Encrypt will serve as a platform for advancing TLS security best practices, both
>   on the CA side and by helping site operators properly secure their servers.
> - **Transparent**: All certificates issued or revoked will be publicly recorded and available for anyone to inspect.
> - **Open**: The automatic issuance and renewal protocol will be published as an open standard that others can adopt.
> - **Cooperative**: Much like the underlying Internet protocols themselves, Let's Encrypt is a joint
>   effort to benefit the community, beyond the control of any one organization.

### What is the difference between Let's Encrypt and other SSL certificates?

SSL certificates are keys that help encrypt your server data. Web browsers recognize only SSL certificates
that have been provided by a well-known CA, such as DigiCert, GoDaddy, COMODO, and so on. All the well-known
and trusted CAs are members of the CA/Browser Forum ([cabforum.org](https://cabforum.org/)) and follow a strict
set of requirements to issue certificates.

There are three different levels of SSL certificates:

- **Domain Validation (DV) certificate**: This is a basic SSL certificate that proves domain ownership.  No
  additional validation is needed.

- **Organizational Validation (OV) certificate**: This certificate not only proves domain ownership but also
  proves that an actual business, in good standing with a government authority, owns the domain.

- **Extended Validation (EV) certificate**: This certificate goes a step further than the OV certificate by
  further validating that the business has been in operational existence for at least three years.

On the back end, these are significant differences, and they play a major role when you
purchase a certificate from a CA because you must go through their validation process.

On the front end, there is no visible difference between the three certificate types. The browser feature used
to differentiate among the different certificate levels has been deprecated. To learn more, see:
[Extended Validation Certificates are (Really, Really) Dead](https://www.troyhunt.com/extended-validation-certificates-are-really-really-dead/)

Let's Encrypt, an official CA in the CA/Browser Forum, offers free basic DV Certificates that are good for 90
days at a time.  What makes Let's Encrypt unique is their Certbot utility, which you can install on a webserver to issue
and manage your SSL Certificates by using automated processes. Using the Certbot results in less maintenance and
less headache.  The 90-day validity period means that the certificate keys are cycled more often, which provides
better security because there is a much smaller window of a possibly compomised key.

### Get started

This article focuses on installing Certbot on the latest release of CentOS 7. The server used in this example runs
the following LAMP stack:

- CentOS Linux&reg; release 7.8.2003 (Core)
- PHP 7.4.8
- MariaDB&reg; 5.5.65
- Apache&reg; 2.4.6

This article's instructions and commands provide the basic functions for obtaining a certificate from
Let's Encrypt. Certbot does not depend on a web application to run, but it does require a means to validate that
you actually control the domain.  This article covers validation using the webroot method, which means that you
are hosting the domain for which you need a certificate on the server where you installed Certbot.

**Important**: The article's instructions use a default Apache configuration for a single site on the server. Your
configuration might vary depending on your Apache configuration.

### Install Certbot

After you set up your server to serve your web page, use the following command to install Certbot:

    [root@leexample-centos7 ~]# yum install certbot

Certbot requires the following dependencies:

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

### Request a new certificate by using Certbot

With Certbot installed, you can request a certificate from Let's Encrypt.  Before proceeding, take note of the follwing items:

- The domains you are requesting. You can request up to 100 domains on a single Let's Encrypt certificate.

- The location of your site's document root directory or directories. You need this information for the `certbot` command
  to install the txt file for validation. If you add multiple domains that point to different directories, you need to list
  them all in the command.

- You must allow access to the **/.well-known/acme-challenge/** directory.

- You must exclude the **/.well-known/acme-challenge/** directory from a forced HTTP to HTTPS redirect.

**Note:** The first time you run Certbot, it prompts you to enter your email address and agree to the terms of service.

Run the following command with your details to request a certificate:

    [root@leexample-centos7 ~]# certbot certonly --webroot -w /var/www/vhosts/example.com -d example.com -d www.example.com

An explanation of the command elements follows:

- `certonly`: a flag that states to only issue a certificate and do nothing else. The command performs no web application configuration.
- `--webroot`: tells Certbot to use a specified web directory, each separated by the `-w` flag.
- `-d`: specifies the domain to be requested. You must have `-d` flag for each domain you want on the certificate.

**Note:** If you want to cover both the **www** and **non-www** versions of a domain on a single certificate, you must use
a `-d` flag for each one.

After you enter the command, the following output displays:

    Obtaining a new certificate
    Performing the following challenges:
    http-01 challenge for letest.mccrocklin.space
    Using the webroot path /var/www/vhosts/example.com for all unmatched domains.
    Waiting for verification...

If there are no issues with the validation, you see the following output:

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

### Certificate file locations

Certbot, by default, installs the certificates to **/etc/letsencrypt/live/\<domain.tld\>/**.

`<domain.tld>` is always the first domain you set when running the `certbot` command. Keep this in mind when you
configure your virtual host or server blocks to point to the certificate files.

You can expect to see the following files in the directory:

    [root@leexample-centos7 ~]# ls -al /etc/letsencrypt/live/example.com
    total 12
    drwxr-xr-x. 2 root root 4096 Aug  1 13:35 .
    drwx------. 3 root root 4096 Aug  1 13:35 ..
    lrwxrwxrwx. 1 root root   47 Aug  1 13:35 cert.pem -> ../../archive/example.com/cert1.pem
    lrwxrwxrwx. 1 root root   48 Aug  1 13:35 chain.pem -> ../../archive/example.com/chain1.pem
    lrwxrwxrwx. 1 root root   52 Aug  1 13:35 fullchain.pem -> ../../archive/example.com/fullchain1.pem
    lrwxrwxrwx. 1 root root   50 Aug  1 13:35 privkey.pem -> ../../archive/example.com/privkey1.pem
    -rw-r--r--. 1 root root  692 Aug  1 13:35 README

Notice that all of these files are symbolic links. This is important for the automated renewal process, described in
the following Renewal section.  Note the following file names and their uses:

- **cert.pem** is the certificate.
- **chain.pem** is the CA bundle.
- **fullchain.pem** is the certificate, followed by the CA bundle.
- **privkey.pem** is the Private Key.

### Configure Apache

Use the following commands to configure Apache:

1. In the default Apache configuration, add the following lines into **/etc/httpd/conf.d/ssl.conf**:

       SSLEngine on
       SSLCertificateFile /etc/letsencrypt/live/example.com/cert.pem
       SSLCACertificateFile /etc/letsencrypt/live/example.com/chain.pem
       SSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem

2. Save the changes and exit.

3. Run the following commmand to do a syntax check:  

       httpd -t 

4. If you get `Syntax OK`, then run the following command to reload Apache:  

       systemctl reload httpd

### Renew your certificates

Let's Encrypt Certificates have a lifespan of 90 days, so when you need to renew many certificates requested through the
Certbot utility, the frequent renewal cycle can be daunting.

Fortunately, Certbot has a built-in renewal function that takes care of this for you. However, it does not run automatically,
so you should schedule it to run as a `cron` job.  The Cerbot renewal process uses the following steps:

1. The command, `certbot renew`, initiates the process.

2. Certbot checks all the certificates that have been issued and installed on your server. It specifically
   looks for any certificates that will be expiring in the next 30 days.

3. Certbot attempts to renew these expiring certificates by using the same validation method used for the original
   certificate request.

4. After the renewal succeeds, Certbot creates new files inside the **/etc/letsencrypt/archive/\<donain.tld\>/** directory,
   incrementing the number for each renewal iteration, and updates the symlinks in **/etc/letsencrypt/live/\<domain.tld\>/**.
   Because the certificate file names don't actually change, you don't need to change the file path in the virtual host
   or server block configuration files. This makes for a more seamless renewal process.

#### Set up the cron job

It's important to note that the actual frequency of the cron job is dependent upon your server configuration. The renew
function scans only existing certificates until it finds one that is expiring within the next 30 days. It's safe to set
the cron job to run once a day during low traffic times. If you have many Let's Encrypt Certificates that were
issued at different times, it can catch them as they get to the 30-day mark.

However, you can choose to have it run less frequently.  For example, once a week at 3 AM every Sunday.

You can create the cron job by using the root user's crontab or Anacron. Anacron ensures that the cron job runs even if
it was missed during server downtime.

Use the following steps to create the cron job:

1. Confirm the proper path by issuing the command directly:

       [root@leexample-centos7 ~]# which certbot
       /usr/bin/certbot

2. Determine which cron method you want to use:

      - **Anacron**: create a new file in `/etc/cron.weekly/` - you can name it something like `certbotrenew`

      - **Cron**: use `crontab -e`

3. Create the cron entry, such as the following, in your chosen method:

       0 3 * * 0 /usr/bin/certbot renew

4. Save the file.

### Conclusion

Let's Encrypt is a great alternative to obtain free SSL Certificates for your domains. These Certificates are DV
certificates, which means that they validate only domain ownership. This article covers the basic functions of the
Let's Encrypt Certbot utility. If you need additional options and more advanced functionality, you can get further
assistance from the Let's Encrypt Community:

- [Let's Encrypt](https://letsencrypt.org/)
- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Let's Encrypt Community Forum](https://community.letsencrypt.org/)
