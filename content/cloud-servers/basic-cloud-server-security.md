---
permalink: basic-cloud-server-security/
audit_date:
title: Basic Cloud Server Security
type: article
created_date: '2011-03-16'
created_by: Everett Toews
last_modified_date: '2016-04-11'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

Run the following script when setting security for an Ubuntu cloud server. This script
is only intended to be more secure than the default configuration. No promises are
made about this script preventing your server from being attacked. Ensure that you
are writing secure application code.

**Note:** This script assumes you're running it initially as root and logged in using
a key pair. If you didn't, you'll be locked out of your VM. For information on how to generate a public and private key pairs, see [Manage SSH Keypairs for Cloud Servers with-python-novaclient](/how-to/manage-ssh-key-pairs-for-cloud-servers-with-python-novaclient).

<pre><code>
{% include cloud-servers/basic-cloud-server-security/secure.sh %}
</code></pre>

### Troubleshooting

The incorrect configuration of SSH, sudo and/or iptables could cause you
to be locked out of your system. If this occurs, please log into the
the Rackspace Cloud Control Panel and use the Web Console or Rescue Mode
to repair the configurations.
