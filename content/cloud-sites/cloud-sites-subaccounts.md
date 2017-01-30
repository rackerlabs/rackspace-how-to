---
permalink: getting-started-with-cloud-sites-set-up-site-security-with-subaccounts/
audit_date:
title: Set up site security with Cloud Sites subaccounts
type: article
created_date: '2011-06-15'
created_by: Rackspace Support
last_modified_date: '2016-07-12'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

A Cloud Sites *subaccount*, also called a *client*, provides access to a
white label control panel. A white label control panel provides all of
the functionality needed for your clients' web hosting accounts. The
sub-account owner is also allocated websites, databases, and FTP users,
based on your previously selected preferences. This article provides
more information about sub-accounts and their limitations.

### Isolated file structure

All sites created within a sub-account are segregated from the main
account and other sub-accounts. When a site is created under a
subaccount, a subfolder is created with unique subaccount user access
settings. This isolation provides significant security protection. If
one subaccount becomes compromised by malware, the compromise cannot
spread to other subaccounts or the main account. Although this feature
cannot prevent individual site vulnerabilities from being exploited, it
can prevent compromises from leaving the account.

#### Limitations

Because these subaccount sites are in their own portion of the file
structure, the main FTP user account (and other sub-account FTP user
accounts) cannot access these subaccount sites. The main account owner
must either use the subaccount FTP user account to log in to the file
structure or create site-specific FTP users to access the sub-account
file structure.

### White label control panel

Each subaccount has access to a white label control panel (at
https://www.websitesettings.com). This control panel provides a subset
of the features in the main Cloud Sites Control Panel. Additionally,
this control panel does not reference Rackspace, so the main account can
resell the Cloud Sites without the client knowing where the product is
hosted.

The main account has total control over the sub-account and can access
any sub-account site or its features from the Cloud Sites Control Panel
(https://manage.rackspacecloud.com). Additionally, only the main account
user can create sites and FTP user accounts. The following table shows
which sub-account features are available to main account and sub-account
users.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><strong>Actions for sub-account websites</strong></td>
<td align="left"><p><strong>Main account</strong></p></td>
<td align="left"><strong>Sub-account</strong></td>
</tr>
<tr class="even">
<td align="left">Create site</td>
<td align="left"><p>X</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left">Edit Rackspace DNS records</td>
<td align="left"><p>X</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left">Create databases</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="odd">
<td align="left">Create FTP users</td>
<td align="left"><p>X</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left">Edit permissions for FTP users</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="odd">
<td align="left">Change password for FTP users</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="even">
<td align="left">Change site technology</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="odd">
<td align="left">Change contact information</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="even">
<td align="left">View usage reports</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="odd">
<td align="left">Turn on raw logs</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
<tr class="even">
<td align="left">Rebuild Windows or IIS sites</td>
<td align="left"><p>X</p></td>
<td align="left"><p>X</p></td>
</tr>
</tbody>
</table>

#### Limitations

Cloud Sites does not provide direct support to sub-account users. All
sub-accounts must go to the main account owner to receive support. All
support inquiries must be initiated from the main account holder or
user. In addition, main account usernames and passwords do not work with
the white label control panel. Only sub-account usernames and passwords
work with the **www.websitesettings.com** control panel. Lastly,
subaccounts can create databases that include Microsoft SQL Server
instances, which incur a cost at creation (see
[rackspace.com/cloud/sites](http://www.rackspace.com/cloud/sites) for
pricing information). MySQL databases do not incur a cost at creation.

### Sub-account actions from the main control panel

Navigate to the subaccount actions from within the Cloud Sites Control
Panel as follows

1.  Click **Hosting > Cloud Sites**.
2.  Click the **Subaccounts** tab.
3.  Click a subaccount name to display the **General Settings** tab for
    the subaccount.

On this tab you can complete the following actions:

-   Add, remove, and edit the contacts for a sub-account.
-   Suspend and unsuspend all websites within a sub-account at one time.
    Click the **Edit-Sub-Account** link, select the **Suspended**
    option, and then click **Finish**.
-   Change the sub-account password.
-   Log in directly to the white-label control panel by using the **Log
    in as Sub-Account** link.
-   Display usage reports per sub-account.

#### Limitation

Given the unique infrastructure configuration of IIS sites, the suspend
function does not work for IIS sites in the Cloud Sites environment.
Main account users must contact support to suspend IIS sites.
