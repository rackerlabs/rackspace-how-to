---
permalink: build-your-application-on-the-rackspace-cloud/
audit_date: '2019-01-22'
title: Build your application on the Rackspace cloud
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-02-01'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

After you’ve signed up and spoken with our Launch Team, you’ll be ready to jump in and start building your application. Here are a few resources that might be helpful:

### Control panel

* Cloud Control Panel - This is your control panel to manage your cloud infrastructure.
* Use Role Based Access Control (RBAC) to allow the correct stakeholder access to only the services he or she needs to access.


### How to access your Cloud Servers

Once you've built one or more Cloud Servers, you'll want to jump in and start building something on them. We have three different ways to connect to a Cloud Server: SSH, RDP, or Console. Read more about it in our article on the subject.
### Get a head start with Cloud Orchestration

If you are building an application from scratch, you might want to try Cloud Orchestration. The stacks offered in Cloud Orchestration can help you get your application up and running much faster than building from scratch. Orchestration stacks range from single server setups (LAMP Stack) to complex, mulit-server, configurations (for example a multi-server WordPress stack.)

### Migration assistance

If your application is already live at another provider, we can potentially offer some limited help migrating from another hosting provider to Rackspace. We also work with some professional services partners who can provide additional help. Contact your Launch Manager or Account Team for more information.
For those of you who want to take a DIY approach to migrating to Rackspace, we have the following guides available:
* Tips for a Successful Migration to Rackspace - Part 1: Preparation and Design
* Tips for a Successful Migration to Rackspace - Part 2: Implementation and Transition


### Modularize your application

We strongly recommend creating a modular application - it’s one of the 5 Pillars of Cloudiness. Modularizing your application can eliminate a single point of failure, and allow for significantly faster scaling if necessary. Here are a few tips for making a modular application.
* Decouple your database from your web/app servers by using a Cloud Database or a separate cloud server running your database. Additionally, look to Object Rocket for hosted MongoDB or Redis.
* Build at least two web/app servers for redundancy and uptime.
* Place a Cloud Load Balancer in front of your web/app servers for horizontal scalability.
* Use a messaging queue for asynchronous processes.


### Sending email from your application

If your application sends any email messages - think “Welcome!” emails, password resets, or weekly digests - then you’ll need to configure your application to do that. We have a few tips for best results:
* To avoid blacklists, relay your mail through MailGun rather than sending directly from your cloud servers.
* Use Rackspace Cloud Office for employee mailboxes and collaboration, if needed. (IMAP, Exchange, Google Apps for Work, and Office 365 are available).


### Security

Security is a partnership. To be effective, security needs to happen at every level. Make sure to take the time to secure your application at every level.

### Account level

* Setup role-based access control for your team Use strong passwords and security questions/answers for each team member Infrastructure level Keep software and security patches up to date
* Configure 2-factor authentication

### Server level

* Practice basic server security
* Lock down your firewalls manually or with a service such as Dome9 or CloudPassage

### Application level

* Secure user authentication manually or with a tool like Stormpath
* Secure application communication with SSL
* Use strong passwords and rotate them often (here’s a fun example)
* Keep up to date with security patches
* Filter out malicious traffic to your sites with tools like CloudFlare or Incapsula

###Backups & Monitoring

Just as important as beginning or migrating your app to Rackspace is protecting that app with a solid backup and monitoring plan.

### Backups

Backups are important if you need to restore your site should a server fail for any reason. There are many ways to backup your site and content. We recommend using a combination of server images, file-level differential backups, and configuration management to achieve a robust, comprehensive backup strategy.
We recommend that you use Cloud Backup on the following directories:

### Linux

* Web/App servers: Verify/configure backup jobs for your Web/App servers /home /root /etc /var/www.
* Database servers: Verify/configure Database backups (frequent backups and long retention are recommended):
* /home
* /root
* /etc
* /var/lib/mysqlbackup (For servers with a mySQL database. Managed Operations customers automatically dump the db to this location. Managed Infrastructure customers can configure the same backup using Holland.)

### Windows

* Verify/configure backup jobs for your Web/App servers C:\inetpub.
* Verify/configure Database backups (the location you are dumping your database files) frequent backups and long retention are recommended.

### Backing up block storage

Block storage is a great way to increase the amount of storage space your application can use. You can include block storage in a Cloud Backup job; you can also save the volumes as image snapshots. If you’re using Cloud Block Storage, please check and double check that backed up everything, and that you have configured to resume in the event of a reboot.
* Verify/configure backup of any Cloud Block Storage volumes.
* Verify that your attached Cloud Block Storage volumes reconnect after reboot.

### Monitoring

Monitoring can alert you if your site becomes non-responsive. Customers with our Managed Operations service level can choose to atuomatically alert Rackspace Support when monitoring notices anything amiss.
* URL Check: Add a Cloud Monitoring check for your site’s URL to ensure your site is responding.
* New Relic: Sign up for a free New Relic account at http://newrelic.com/rackspace Install New Relic’s server and application monitoring agents on your cloud servers.
