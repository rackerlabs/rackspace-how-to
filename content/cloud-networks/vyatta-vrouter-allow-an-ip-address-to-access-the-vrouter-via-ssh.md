---
permalink: vyatta-vrouter-allow-an-ip-address-to-access-the-vrouter-via-ssh/
audit_date:
title: 'Vyatta vRouter: Allow an IP address to access the vRouter via SSH'
type: article
created_date: '2014-09-09'
created_by: Sameer Satyam
last_modified_date: '2016-01-07'
last_modified_by: Renee Rendon
product: Cloud Networks
product_url: cloud-networks
---

This article demonstrates how to configure an IP address to connect to a Brocade Vyatta vRouter through SSH, for administration purposes.

### Connect to the vRouter

**Note:** After you've accessed the vRouter, you should add a local user. If you are not logged in via SSH as the user *Vyatta* or as an administrative user, then access the vRouter remotely or through the console, then add a local user. Follow the procedure described in [Vyatta vRouter: Adding a local administrative user](/how-to/vyatta-vrouter-add-a-local-administrative-user).

### Add the IP address to the SSH group

After you are logged in to the vRouter, add the IP address to the `VYATTA-SSH-ALLOW` group, as follows:

    set firewall group network-group VYATTA-SSH-ALLOW network 1.1.1.1/32

The `VYATTA-SSH-ALLOW` group contains the IP addresses that Rackspace uses to connect to this device. This group is also applied to a firewall that protects traffic destined for the vRouter itself. Do not remove this group.

Verify that the group is applied to the vRouter's local firewall of the public interface, as follows:

    vyatta@vya-1:~$ show configuration commands | grep local
    set interfaces ethernet eth0 firewall local name 'PUBLIC-LOCAL-IN'

    vyatta@vya-1:~$ show configuration commands | grep PUBLIC-LOCAL-IN
    set firewall name PUBLIC-LOCAL-IN rule 6 action 'accept'
    set firewall name PUBLIC-LOCAL-IN rule 6 destination port '22'
    set firewall name PUBLIC-LOCAL-IN rule 6 protocol 'tcp'
    set firewall name PUBLIC-LOCAL-IN rule 6 source group network-group 'VYATTA-SSH-ALLOW'

### More information about SSH

-  [Connecting to a server using SSH on Linux or Mac OS](/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os)
-  [Rackspace Cloud Essentials - Checking a server's SSH host fingerprint with the web console](/how-to/rackspace-cloud-essentials-checking-a-server-s-ssh-host-fingerprint-with-the-web-console)
-  [Generating RSA Keys With SSH - PuTTYgen](/how-to/generating-rsa-keys-with-ssh-puttygen)
