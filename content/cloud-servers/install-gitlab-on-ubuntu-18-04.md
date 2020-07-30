---
permalink: install-gitlab-on-ubuntu-18-04/
audit_date: '2020-07-28'
title: 'Install GitLab on Ubuntu 18.04'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-28'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

GitLab&reg; Community Edition, or GitLab CE, is an open-source web-based Git repository featuring
a wiki and issue tracking. This article describes how to install GitLab CE and configure
Secure Sockets Layer (SSL) on an Ubuntu&reg; 18.04 LTS cloud server.

### Prerequisites:

- A server with at least 8GB of ram
- A domain name pointed at your server

### Install Dependencies

There are a few dependencies that you must install before you install GitLab.

First, at the command line, update your `apt` cache with the following command:

    sudo apt update

Then, install the `ca-certificates`, `curl`, `openssh-server`, and `postfix` packages:

    sudo apt install ca-certificates curl openssh-server postfix

During the postfix installation, select **Internet Site**. On the next page, enter your domain name.

### Install GitLab CE

After you finish installing the dependencies, perform the following steps:

1. Change directory to **/tmp**:

       cd /tmp

2. Run the repository script from **gitlab.com**:

       wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh

3. Install the repository by using the following command:

       sudo bash script.deb.sh

4. Then, install GitLab CE:

       sudo apt install gitlab-ce


### Configure GitLab

After the command to install GitLab CE, you should see a warning about setting your domain name. While
fixing that, go ahead and enable SSL with `letsencrypt`. Perform the following steps:

1. Open the GitLab configuration file with a text editor. This example uses `nano`.

       sudo nano /etc/gitlab/gitlab.rb

2. Find the `external_url field` and update it to match your domain name, changing http to https.
   It should look similar to the following example:

       external_url 'https://example.com'

3. Look for the `letsencrypt[‘contact_emails’]` field. If there is ever a problem with your SSL
   certificate, the system alerts the email addresses listed in this field. It should look similar
   to the following example:

       letsencrypt['contact_emails'] = ['bob@example.com']

4. Save the file and exit.

5. Reconfigure GitLab to have it read the new configuration file. This part may take a few minutes.

       sudo gitlab-ctl reconfigure

After the reconfiguration finishes, navigate to your domain name in your web browser to start using GitLab CE.
