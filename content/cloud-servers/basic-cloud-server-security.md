---
permalink: basic-cloud-server-security/
audit_date: '2018-05-11'
title: Basic Cloud Server Security
type: article
created_date: '2011-03-16'
created_by: Everett Toews
las_modified_date: '2018-05-11'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article provides a script to make web servers more secure. Run the following script for Ubuntu cloud servers to provide more security than the default configuration. While this script helps protect your server, it can't prevent an attack. Ensure that you are writing secure application code.

**Note:** To run the following script, log in as root using a key pair. Otherwise, you might be locked out of your virtual machine (VM). For information on how to generate public and private key pairs, see [Manage SSH Keypairs for Cloud Servers with-python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

<pre><code>
{% include cloud-servers/basic-cloud-server-security/secure.sh %}
</code></pre>

### Script activities

The script performs the following activities:

1) Disables root ssh access.

2) Sets up a new user with the same authorized key used for the root login (it assumes this is setup).

3) Installs a package to help prevent brute force login attempts.

4) Enables automatic updates.

5) Blocks all ports except for HTTP, HTTPS and SSH.


### Troubleshooting

If SSH, sudo, or iptables are configured incorrectly, you might be locked out of your system. If this occurs, log in to the Rackspace Cloud Control Panel and use the Web Console or Rescue Mode to repair the configurations.
