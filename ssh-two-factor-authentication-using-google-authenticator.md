---
permalink: ssh-two-factor-authentication-using-google-authenticator/
audit_date:
title: SSH - Two-factor authentication using Google Authenticator
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2019-01-17'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This guide provides an overview of how to set up two-factor authentication (2FA) by using Google Authenticator&trade;.

Many people are using Google Authenticator to secure their Google apps, such as Gmail&trade;. However, you can also use two-factor authentication for your Secure Shell (SSH) logins. Using SSH can protect you against accidently using weak passwords that can lead to a successful brute-force attack. This guide shows you how to implement Google Authenticator on the CentOS&reg; 6 and Ubuntu&reg; 12.04 Linux&reg; distributions.

**Important**: After you complete the steps in this guide, all of your users (including root) will be required to use Google Authenticator to connect via SSH unless you already have SSH keys in place. Check with your administration teams before setting up Google Authenticator to ensure that you don't accidentally disable their access or lock yourself out from using SSH.

### Install the module

First, you need to install the Google Authenticator module. Open a command-line interface (CLI), then follow the instructions that correspond to your distribution.

##### Red Hat 6-based systems

Install the module on Red Hat 6 by running the following commands:

    rpm -ivh http://linux.mirrors.es.net/fedora-epel/6/x86_64/epel-release-6-7.noarch.rpm
    yum install google-authenticator

##### Debian-based systems

1. Install the module on Debian by running the following command:

       aptitude install libpam-google-authenticator

2. Next, open the `/etc/pam.d/sshd` file and add the following line at the end of the `auth` section:

       auth required pam_google_authenticator.so

3. Open your `/etc/ssh/sshd_config` file and change `ChallengeResponseAuthentication no` to 
   `ChallengeResponseAuthentication yes`

4. Use the following command to restart `sshd`:

   - On Red Hat: 

         service sshd restart

   - On Ubuntu: 

         service ssh restart

### Set up keys for the user

Run the following command to set up keys for the user:

         google-authenticator

You are prompted to update your ~/.google_authenticator file, answer yes to this question, and whatever you would like to use for the next three. Once complete, the following will be presented to you:

* New Secret Key
* Verification Code 
* Emergency Scratch Codes

You will use the new secret key for adding the account to your phone's google authenticator app. The emergency scratch codes should be copied down and stored somewhere secure. They can be used if you ever lose your iphone, or otherwise need to get into your account without your phone's google authenticator app.

Now when you log into your server using your user account, it prompts you for your google auth token, followed by your normal password for the server. Any accounts that don't have the this setup will not be allowed to log in.
