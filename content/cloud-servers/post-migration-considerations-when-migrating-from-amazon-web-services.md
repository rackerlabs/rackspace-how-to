---
permalink: post-migration-considerations-when-migrating-from-amazon-web-services/
audit_date:
title: Post-migration considerations when migrating from Amazon Web Services
type: article
created_date: '2013-07-02'
created_by: Rackspace Support
last_modified_date: '2016-01-07'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

### Previous sections

Migrate an application from Amazon Web Services to Rackspace:

-   [Migrate an application built on a LAMP stack from Amazon Web Services](/how-to/migrating-an-application-built-on-a-lamp-stack-from-amazon-web-services)
-   [Migrate a .NET application from Amazon Web Services](/how-to/migrating-a-net-application-from-amazon-web-services)
-   [Migrate a Java web application from Amazon Web Services](/how-to/migrating-a-java-web-application-from-amazon-web-services)
-   [Migrate an application based on Backbone.js, Node.js, and MongoDB from Amazon Web Services](/how-to/migrating-an-application-based-on-backbonejs-nodejs-and-mongodb-from-amazon-web-services)

### Security

For many reasons, key-based SSH authentication is considered safer than
authentication based on user names and passwords. For example, the
latter method is subject to brute-force attacks, poor choice or strength
of passwords, and a higher risk of being stolen remotely. For these
reasons, we recommend that you enable key-based SSH or OpenSSH
authentication on your newly provisioned cloud server. Depending on your
server's OS distribution, see the following references for instructions:

-   Ubuntu: <https://help.ubuntu.com/community/SSH/OpenSSH/Keys>
-   CentOS: <http://wiki.centos.org/HowTos/Network/SecuringSSH>
-   openSUSE:
    <http://en.opensuse.org/SDB:OpenSSH_public_key_authentication>

Consider disabling password authentication altogether, or at least
disabling root logon. Also consider limiting simultaneous user logons
and using a nonstandard (other than port 22) port for SSH.

-   Tighten iptables rules as follows:

    -   Allow remote access only from a trusted IP or range.

            iptables -A INPUT -p tcp -s XXX.XXX.XXX.XXX --dport 22 -j ACCEPT #Replace XXX.XXX.XXX.XXX with your IP

    -   Limit the number of connections to the SSH port.

            iptables -A INPUT -p tcp --dport 22 --syn -m limit --limit 1/m --limit-burst 3 -j ACCEPT
            iptables -A INPUT -p tcp --dport 22 --syn -j DROP

    -   Prevent brute-force attacks by logging and blocking repeated
        attempts from the same IP address.

            iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name ssh --rsource
            iptables -A INPUT -p tcp --dport 22 -m state --state NEW -m recent ! --rcheck --seconds 60 --hitcount 4 --name ssh --rsource -j ACCEPT

### Monitoring

To create a robust and scalable monitoring system, consider using
Rackspace Cloud Monitoring. Read [Install and Configure the Rackspace Monitoring Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent) for
information about installing, configuring, and running an agent and
enabling monitoring checks by using the Cloud Control Panel.

After you have installed the agent, based on your requirements, you can
configure one or more of the following checks and alerts:

-   Remote service checks
    -   Ping check (server)
    -   HTTP check (website or web application)
    -   TCP check (port)
-   Agent checks
    -   Memory
    -   CPU
    -   Load average
    -   File system
    -   Network

### Backups

Backups are an integral part of any production-level deployment and an
essential component of a disaster recovery (DR) strategy. Rackspace
provides a file-based backup system to help you meet your backup and
restore needs. You can install the [Rackspace Cloud Backup agent](http://www.rackspace.com/cloud/backup/) by following the steps in the article [Install the agent on Linux](/how-to/rackspace-cloud-backup-install-the-agent-on-linux) or [Install the agent on Windows](/how-to/rackspace-cloud-backup-install-the-agent-on-windows).

Following are the key features of Cloud Backup:

-   Select the files and folders from your cloud server that you want to
    back up.
-   Run your backups manually or on a customized schedule.
-   See the activity from all your backups.
-   Use AES-256 encryption with a private encryption key known only
    to you.
-   Restore individual files and folders from a particular date.
-   Save space with incremental backups that save only the changed
    portions of files.
-   Create unlimited backups.
