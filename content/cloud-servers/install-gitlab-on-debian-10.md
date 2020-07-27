---
permalink: install-gitlab-on-debian-10/
audit_date: '2020-07-27'
title: 'Install GitLab on Debian 10'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-27'
last_modified_by: Stephanie Fillmon
product: Cloud Product
product_url: cloud-product
---

GitLab Community Edition, or GitLab CE, is an open-source web-based Git repository featuring
a wiki and issue tracking. This article describes how to install GitLab CE and configure
Secure Socket Layer (SSL) on a Debian 10 cloud server.

### Prerequisites:

- A Debian 10 server with at least 8GB of ram
- A domain name pointed at your server

#### Install Dependencies

There are a few dependencies that you must install before you install GitLab. 

First, at the command line, update your apt cache with the following command:

    sudo apt update

Then, install the `ca-certificates`, `curl`, `openssh-server`, and `postfix` packages:

    sudo apt install ca-certificates curl openssh-server postfix

During the postfix installation, select **Internet Site**. On the next page, enter your domain name.

### Install GitLab CE

After you finish installing the dependencies, change directory to **/tmp**:

    cd /tmp
    
Run the repository script from **gitlab.com**:

    wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

Install the repository by using the following command:

    sudo bash script.deb.sh

Then, install GitLab CE:

    sudo apt install gitlab-ce

### Configure GitLab

After the last command, you should have gotten a warning about setting your domain name. While fixing that, we’ll also go ahead and enable SSL with letsencrypt. Open the gitlab configuration file with nano:

sudo nano /etc/gitlab/gitlab.rb
Here you’re looking for the external_url field. Update it to match your domain name and change http to https. It should look something like this once done.

external_url 'https://example.com'
Next, look for the letsencrypt[‘contact_emails’] field. The email addresses here will be alerted if there is ever a problem with your SSL certificate. Once done, it should look something like this:

letsencrypt['contact_emails'] = ['bob@example.com']
Save the file and exit. Now we’ll reconfigure gitlab to have it re-read the new configuration file. This part may take a few minutes.

sudo gitlab-ctl reconfigure
Once the reconfiguration is finished, navigate to your domain name in your web browser to start using GitLab CE!
