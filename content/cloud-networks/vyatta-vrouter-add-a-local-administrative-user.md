---
permalink: vyatta-vrouter-add-a-local-administrative-user/
audit_date:
title: 'Vyatta vRouter: Add a local administrative user'
type: article
created_date: '2014-09-09'
created_by: Sameer Satyam
last_modified_date: '2015-02-18'
last_modified_by: Rose Contreras
product: Cloud Networks
product_url: cloud-networks
---

This article demonstrates how to add a local user to a Brocade Vyatta vRouter, for administration purposes.

### Access the vRouter through the console

If you have remote (SSH) access to the vRouter, skip to the "Add a local administrative user" section.

If you do not have remote access to the vRouter, connect to the vRouter via the console.

1.	Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2.	In the Cloud Servers list, click on the **vRouter** instance.

3.	From the **Actions** menu on the vRouter details page, select **Connect Via Console**.

    <img src="{% asset_path cloud-networks/vyatta-vrouter-add-a-local-administrative-user/880-1_0.png %}" alt="" />

    A Java-based applet is launched, and you are presented with a CLI console interface.

    <img src="{% asset_path cloud-networks/vyatta-vrouter-add-a-local-administrative-user/880-2.png %}" alt="" />

4.	Log in with the *Vyatta* account and the root password that was given when the vRouter was first created.

    **Note:** The vRouter does not use the *root* account. Its root-like account is the *Vyatta* account. Removal of this account is not recommended.

**Tip:** At this point, you should follow the steps in [Vyatta vRouter: Allowing IP to access the vRouter via SSH](/how-to/vyatta-vrouter-allow-an-ip-address-to-access-the-vrouter-via-ssh).

### Add a local administrative user

After you are logged in to the vRouter, use the following commands to add the user:

    set system login user userName authentication plaintext-password <password>
    set system login user userName level admin</pre>

Although the password is added in plain text, the vRouter encrypts the password and shows it encrypted in the configuration, as shown in the following example:

    vyatta@vya-1:~$ show configuration commands | grep userName
    set system login user userName authentication encrypted-password '$1$H03jUAcd$siWYAiqvF9DQ4vrym2aRK.'
    set system login user userName authentication plaintext-password ''
    set system login user userName level 'admin'
