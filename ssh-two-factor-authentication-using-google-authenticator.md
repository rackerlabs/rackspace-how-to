---
permalink: ssh-two-factor-authentication-using-google-authenticator
audit_date:
title: SSH - Two-Factor Authentication Using Google Authenticator
created_date: '2019-01-14'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This guide will provide an overview of how to setup Two Factor Authentication using Google Authenticator.
Overview
Many people are using Google Authenticator to secure their google apps such as gmail. However what if you wanted to be able to utilize two factor authentication (something you have, something you know) for your SSH logins? What if you want to protect yourself against accidently using weak passwords, which can lead to a successful brute force attack?
On both RedHat and Debian based systems, Google Authenticator's one time passwords are pretty simple to implement. For the purposes of this guide, I'll be using CentOS 6 and Ubuntu 12.04.
It should be noted that by using this guide, ALL your users (including root) will be required to use the google authenticator to SSH in unless you have SSH keys already in place. Please check with your administration teams before setting this up to ensure you don't accidentally disable their access, or lock yourself out from SSH!
Procedure
Install the module
# RedHat 6 based systems
rpm -ivh http://linux.mirrors.es.net/fedora-epel/6/x86_64/epel-release-6-7.noarch.rpm
yum install google-authenticator
# Debian based systems
aptitude install libpam-google-authenticator
Now update the /etc/pam.d/sshd file and add the following at the end of the 'auth' section:
auth required pam_google_authenticator.so
Then update your /etc/ssh/sshd_config
# Change
ChallengeResponseAuthentication no
# To
ChallengeResponseAuthentication yes
Restart sshd
# Redhat: 
service sshd restart
# Ubuntu: 
service ssh restart
Now, setup keys for your user
google-authenticator
It will ask you to update your ~/.google_authenticator file, answer yes to this question, and whatever you would like to use for the next three. Once complete, the following will be present to you:
* New Secret Key
* Verification Code 
* Emergency Scratch Codes
You will use the new secret key for adding the account to your phone's google authenticator app. The emergency scratch codes should be copied down and stored somewhere secure. They can be used if you ever lose your iphone, or otherwise need to get into your account without your phone's google authenticator app.
Now when you log into your server using your user account, it will prompt you for your google auth token, followed by your normal password for the server. Any accounts that don't have the this setup will not be allowed to log in.
