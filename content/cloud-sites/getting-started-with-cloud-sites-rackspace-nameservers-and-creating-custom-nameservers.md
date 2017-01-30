---
permalink: getting-started-with-cloud-sites-rackspace-nameservers-and-creating-custom-nameservers/
audit_date:
title: Getting Started With Cloud Sites - Rackspace Nameservers and Creating Custom Nameservers
type: article
created_date: '2011-03-09'
created_by: Rackspace Support
last_modified_date: '2016-01-14'
last_modified_by: Kelly Holcomb
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

To change your name servers from your current registrar to point to the
Rackspace Cloud, follow these steps:

1.  Access your account with your current registrar (for example,
    **godaddy.com** or **register.com**).
2.  Change the name servers to **dns1.stabletransit.com** and
    **dns2.stabletransit.com**.

Your current registrar might offer "transfer lock" or a similar service
as a security measure to prevent unauthorized transfer of your domain
name. If this feature is activated, you need to log in to your account
with your current registrar to unlock the domain.

To unlock the domain, you must have access to the administrative email
address you used when first registering the domain. Your current
registrar will send an email to this account that will require a reply
from you, confirming that the transfer is authorized. If you do not have
access to this email address, contact [customer support](http://manage.rackspacecloud.com/SupportMain.do)
for help. You can do a WHOIS search to find the administrative email and
the current registrar for the domain.

All DNS changes take up to 48 hours to take effect. During this time you
can check your website by using the test URL (for
example, **www.yourdomain.com.websitetestlink.com**).

### Custom name servers

Configuring custom name servers can be done differently depending on
where your DNS is currently hosted. The following sections provide steps
to set up custom name servers based on some of the most commonly used DNS
providers:

-   GoDaddy
-   OpenSRS/Tucows/RackSpace Cloud
-   Dotster
-   eNom
-   Directi
-   Name.com

If you are hosting DNS at a provider that is not listed here, contact
your DNS provider for steps showing you how to configure custom
name servers.

#### GoDaddy

[Setting up Custom Nameservers in GoDaddy](http://help.godaddy.com/article/3952)

#### OpenSRS/Tucows/RackSpace Cloud

To register new name servers or update existing name servers with OpenSRS,
follow these steps.

1.  Log in to your account at
    [manage.opensrs.net](http://manage.opensrs.net/ "http://manage.opensrs.net")
    by entering your domain name, user and password, then clicking
    **Manage Domain**.
2.  On the domain management page, scroll to the bottom of the page to
    the link.

    **Note:** If you want to create or modify a name server which is
    based on yourhostdomain.com click here. (Ignore the name servers
    link in the main top menu.)

3.  On the next page, scroll down to the **Create name server** section
    and perform the following steps:
    1.  In the first field, enter the host prefix for your first server
        (example, **ns1**).
    2.  In the second box, enter the IP address for the name server you
        want to create.
    3.  Click the **Create Name Server** button.

4.  Repeat step 3 for your second DNS server (**ns2**).
5.  You will now see your DNS servers listed on the page.

#### Dotster

To register new or update current name servers with Dotster, follow these
steps.

1.  Open up your account information at Dotster and click the **My
    Domains** tab.
2.  Click the domain name for which you want to add the name servers. (Do
    not select the check box.)
3.  In the **Name Servers** section, click the **Register
    Name Server** link.
4.  Fill in the form with your name server name and IP address.

#### eNom

If your domain is registered with Enom, follow these steps to register
new or update current DNS servers.

1.  Log in to your account at **enom.com**.
2.  From the site menu, select **Domains > Advanced Tools > Register a Name Server**.

    A page with forms for adding new name servers and updating old
    name servers is displayed.

3.  Add the name server name to the form (for example,
    **ns1.yourdomain.com**), enter the old IP address for the DNS server
    (if updating), and enter the new one provided in your migration
    complete email.
4.  Click **Update**.

#### Directi

To register new name servers or update existing name servers with Directi,
follow these steps.

1.  Log in to your Domain Control Panel.
2.  From **Domains > Search > Domain Registration Search**, search
    for the domain name for which you want to manage child name servers.
3.  Click the domain name under which you want to create child
    name servers.
4.  Click the **Manage Child Name Server** button.
5.  In the **Add New Child Name Server** box, enter the hostname (for
    example, **ns1.youhost.com**) of the child name server that you want
    to create, and then enter its IP address in the second box.
6.  To modify a DNS server, make the modifications in the **IP Address**
    text box and click **Modify IP Address**.

#### Name.com

To register new name servers or update existing name servers with
Name.com, follow these steps.

1.  Log in to your account.
2.  Click the **My Account** image at the top of the page.
3.  Click the appropriate domain name.
4.  Under the Control Panel navigation list, click **Manage Name
    Servers**.
5.  To add a new name server, enter the host name and IP address for
    each name server you want to create.
6.  To modify an existing name server, enter the appropriate new IP
    address for the respective host name and click **Add**. Click the
    **remove** link next to the old IP address for each host name.

### Next section

[Creating Sub-domains and/or domain aliases](/how-to/getting-started-with-cloud-sites-creating-sub-domains-andor-domain-aliases)
