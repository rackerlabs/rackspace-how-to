---
permalink: faq-for-seamless-sign-on-between-myrackspace-and-the-cloud-control-panel/
audit_date: '2018-03-10'
title: FAQ for Seamless sign-on between MyRackspace and the Cloud Control Panel
type: article
created_date: '2014-10-15'
created_by: David Hendler
last_modified_date: '2018-03-13'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

This article provides quick answers to common questions about seamless single
sign-on (SSO) between the MyRackspace Customer Portal and the Rackspace Cloud
Control Panel.

#### What is seamless SSO?

Seamless SSO enables dedicated customers to manage their public cloud
environments through a single sign-on. After you log in
to the MyRackspace Customer Portal, you can seamlessly move between your
dedicated account and the cloud accounts that are linked to it.

#### How do I use seamless SSO?

Seamless SSO is integrated into Rackspace products to the greatest extent possible. When you navigate Cloud accounts in the MyRackspace portal, hyperlinks for
products such as Cloud Servers, Cloud Networks, and Cloud DNS take you
to the Cloud Control Panel, where you are logged in automatically.

<img src="{% asset_path cloud-servers/faq-for-seamless-sign-on-between-myrackspace-and-the-cloud-control-panel/sso_howto_use.png %}" alt="MyRackspace screenshot - Access SSO from the cog next to the user name" />

#### How do I disable seamless SSO?

If you do not want a user to have seamless SSO access to a linked Cloud
account, you can remove user permissions for that account. To manage user
permissions in the MyRackspace portal, navigate to **Account > Permissions >
Assign by Product**.

#### What permissions do I have when using seamless SSO?

Your permissions are based on your access level for the Cloud account that you are trying to access.

<img src="{% asset_path cloud-servers/faq-for-seamless-sign-on-between-myrackspace-and-the-cloud-control-panel/sso_permissions_layout.png %}" alt="MyRackspace screenshot - layout of permissions screen" />

#### How do MyRackspace permissions map to Cloud Control Panel permissions?

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left"><div class="tablesorter-header-inner">
<div class="tablesorter-header-inner">
<p> MyRackspace</p>
</div>
</div></th>
<th align="left"><div class="tablesorter-header-inner">
<div class="tablesorter-header-inner">
 &gt;&gt;&gt;
</div>
</div></th>
<th align="left"><div class="tablesorter-header-inner">
<div class="tablesorter-header-inner">
 Cloud Control Panel
</div>
</div></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"> NONE</td>
<td align="left"> =</td>
<td align="left"> NONE</td>
</tr>
<tr class="even">
<td align="left"> VIEW</td>
<td align="left"> =</td>
<td align="left">OBSERVER</td>
</tr>
<tr class="odd">
<td align="left"> EDIT</td>
<td align="left"> =</td>
<td align="left"> ADMIN</td>
</tr>
<tr class="even">
<td align="left">ADMIN</td>
<td align="left">=</td>
<td align="left">ADMIN</td>
</tr>
</tbody>
</table>

#### How are user permissions set or changed for seamless SSO?

User permissions for seamless SSO map directly to the user's Cloud
account permission settings. The MyRackspace Customer Portal enables you to view permissions by user or by product.

**View permissions by user**

The following image shows how to view permissions by user in MyRackspace:

<img src="{% asset_path cloud-servers/faq-for-seamless-sign-on-between-myrackspace-and-the-cloud-control-panel/sso_permissions_by_user.png %}" alt="MyRackspace screenshot - Assign SSO permissions by user" />

**View permissions by product**

The following image shows how to view permissions by product in MyRackspace:

<img src="{% asset_path cloud-servers/faq-for-seamless-sign-on-between-myrackspace-and-the-cloud-control-panel/sso_permission_by_product.png %}" alt="MyRackspace screenshot - Assign SSO permissions by product" />

#### Can I link back to MyRackspace from the Cloud Control Panel?

Yes. To link back to MyRackspace, click the **Back to MyRackspace** link in the upper-left corner of the Cloud Control Panel.

#### Can I log in to the Cloud Control Panel and seamlessly link to and be logged in to MyRackspace?

No, not at this time.

#### Can I manage all of my tickets, billing, and users in one place?

No, not at this time. Tickets, billing, and users are currently managed
separately in the respective interfaces.

#### How do I add or modify metadata?

With the introduction of this new functionality, one of the features
that is no longer available is the ability to edit Cloud Server
metadata through a user interface (such as MyRackspace). In lieu of this
functionality, the following options are available:

1.  Use the Nova Client to issue these commands. The Nova Client allows you to
    provision and delete servers, work with metadata, and more. See the
    [python nova client command reference](/how-to/useful-python-novaclient-commands)
    for more information.
2.  Use the Cloud Servers API to specify your server's metadata. The
    [Cloud Servers Developer Guide](http://bit.ly/2tKspm2) provides
    instructions on how to do this.
3.  Contact the Rackspace Support team by phone or ticket and ask them to make
    these changes on your behalf.

#### What are the limitations of seamless SSO?

Seamless SSO has the following limitations:

-   Tickets are not consolidated in one location. Cloud and dedicated
    support tickets are still handled in their respective interfaces.
-   User management is not consolidated in one location. Cloud and
    MyRackspace users are still managed separately.
-   The following items are not available when you log in to the
    Cloud Control Panel from MyRackspace through seamless SSO:
    -   Billing
    -   Usage Overview
    -   Account Settings
    -   User Management
    -   Service level upgrades

To access these features, log out, and then log in to the [Cloud Control Panel](http://mycloud.rackspace.com) directly with your cloud
credentials.
