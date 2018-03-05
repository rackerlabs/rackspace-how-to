---
permalink: create-a-private-label-webmail-site/
audit_date: '2018-03-05'
title: Create a private label webmail site
type: article
created_date: '2018-02-21'
created_by: William Loy
last_modified_date: '2018-03-05'
last_modified_by: Cat Lookabaugh
product: Rackspace Email
product_url: rackspace-email
---

Private label webmail sites allow you to customize and secure the portal used by your users or customers to access their email.

### Prerequisites

- **Applies to:** Administrators of Reseller Accounts
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes to create the site, and 24 to 48 hours for the DNS changes to propagate
- **Tools required:**  DNS host administrator access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Customize and secure a private label webmail site

To customize and secure your private label webmail site, perform the following steps:

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).

2. In the **Reseller Tools** section of the home page, click **Webmail Sites**.

   <img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/webmail_sites.png %}"/>

3. On the **Webmail Sites** page, click **Add Site**.

   <img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/add_webmail_site1.png %}"/>

4. On the **Customer Selection** page, select the customer company for which you are creating a private label webmail site.

   <img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/customer_selection.png %}"/>

5. In the **Webmail Site Settings** window, enter the webmail website address that you would like to create in the **Webmail Address** field. You can choose to allow your customers to customize their site themselves or to copy the look and feel of an existing webmail site.

    <img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/site_settings.png %}"/>

  **Warning:** You cannot create a private label webmail site that uses a site name that already exists, that uses the root domain of mymailsrvr.com, or that is listed on *Google Safe Browsing*.

6. When you are presented with instructions to update the DNS entry for your site with new information, copy these instructions by clicking **Copy Instructions** and then clicking **Ok, Got It**.

   <img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/site_being_created.png %}"/>

    - The DNS for most existing sites will be an ``A`` record that points to a specific IP address. You need to change the ``A`` record type to ``CNAME``, and change the IP address to the hostname provided. For example, if your webmail site is going to be **mail.yourdomainexample.com**, change the hostname to **mail** or **mail.yourdomainexample.com**. The following tables illustrate this change.

        **Before DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |A| @ | 000.00.000.00 |

        **After DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| mail| pl-10.webmail.emailsrvr.com |

    - If your existing DNS record is already a ``CNAME``, then just update the existing hostname to the new one provided.

        **Example DNS entry:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| mail| pl-10.webmail.emailsrvr.com |

    **Note:** For specific instructions on editing your DNS records, please contact your DNS host. [Find your DNS host here.](/how-to/find-dns-host)

The site appears in the **Webmail Sites** listing. After the DNS change is propagated, it has a green "locked" icon to the right of the name, indicating that the site is secure.

<img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/secure_completed.png %}"/>
