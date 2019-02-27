---
permalink: set-up-two-factor-authentication-by-using-google-authenticator/
audit_date:
title: Set up two-factor authentication by using Google Authenticator
type: article
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-01-17'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This guide provides an overview of how to set up two-factor authentication
(2FA) by using Google Authenticator&trade;.

Many people use Google Authenticator to secure their Google apps, such as
Gmail&trade;. However, you can also use two-factor authentication for your
Secure Shell (SSH) logins.

Using SSH can protect you against inadvertently using weak passwords that can
lead to a successful brute-force attack. This guide shows you how to implement
Google Authenticator on servers that are running CentOS&reg; 6 and Ubuntu&reg;
12.04 Linux&reg; distributions.

**Important**: After you complete the steps in this guide, all of your users
(including root) will be required to use Google Authenticator to connect via
SSH unless you already have SSH keys in place. Check with your administration
teams before setting up Google Authenticator to ensure that you don't
accidentally disable their access or lock yourself out from using SSH.

### Install the module

First, you need to install the Google Authenticator module. Open a command-
line interface (CLI), then follow the instructions that correspond to your
distribution.

##### Red Hat 6-based systems

Install the module on Red Hat&reg; 6 by running the following commands:

    rpm -ivh http://linux.mirrors.es.net/fedora-epel/6/x86_64/epel-release-6-7.noarch.rpm
    yum install google-authenticator

##### Debian-based systems

Use the following steps to install the module on Debian&reg;-based systems:

1. Install the module on Debian by running the following command:

       aptitude install libpam-google-authenticator

2. Next, open the `/etc/pam.d/sshd` file and add the following line at the end
   of the `auth` section:

       auth required pam_google_authenticator.so

3. Open your `/etc/ssh/sshd_config` file and change
   `ChallengeResponseAuthentication no` to
   `ChallengeResponseAuthentication yes`.

4. Use the following command to restart `sshd`:

   - On Red Hat:

         service sshd restart

   - On Ubuntu:

         service ssh restart

### Set up keys for the user

Use the following steps to set up keys for the user:

1. Run the following command:

       google-authenticator

2. Answer `yes` when you are prompted to update your
   `~/.google_authenticator file`, then provide answers to the
   next three prompts.

After you complete these steps, you see the following information:

- New secret key
- Verification code
- Emergency scratch codes

You use the new secret key to add the account to your phone's Google
Authenticator app. Note the emergency scratch codes and store them somewhere
secure. You can use them if you lose your iPhone&reg; or otherwise need to log
in to your account without using your phone's Google Authenticator app.

Now when you log in to your server under your user account, you are prompted
for your Google authentication token and your standard password for the
server. Any accounts that don't have this setup are not allowed to log in.
