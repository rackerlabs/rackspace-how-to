---
permalink: create-a-private-label-webmail-site/
audit_date: '2018-02-16'
title: Create a Private Label Webmail Site
type: article
created_date: '2018-02-21'
created_by: William Loy
last_modified_date: '2018-02-21'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Webmail private label sites allow you to customize the portal which your users or customers use to access their email.

### Prerequisites

- **Applies to:** Administrators of Reseller Accounts
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes create the site, 24-48 hours for the DNS changes to propagate
- **Tools required:**  DNS host administrator access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Secure Webmail Private Label Site

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com), and perform the following steps:

2. In the **Reseller Tools** section of the home page, click the **Webmail Sites** link.

   <img src="{% asset_path rackspace-email/secure-existing-webmail-private-label-site/webmail_sites.png %}"/>

3. On the **Webmail Sites** page, click **Add Site**.

   <img src="{% asset_path rackspace-email/secure-existing-webmail-private-label-site/action_secure_sites.png %}"/>

5. On the **Secure Webmail Site*** page, enter or verify the company information for your site. This information is used to register the security certificate that will secure your site. This information is visible by your end users, if they choose to view the certificate from their browser. Click 'Secure Site'.

   <img src="{% asset_path rackspace-email/secure-existing-webmail-private-label-site/secure_webmail_site.png %}"/>

6. You will be presented with instructions to update the DNS entry for your site with new information. Copy these instructions by clicking **Copy Instructions** before clicking **Ok, Got It**.

   <img src="{% asset_path rackspace-email/secure-existing-webmail-private-label-site/site_being_created.png %}"/>

    - The DNS for most existing sites will be an A record that points to a specific IP address. You need to change the A record type to CNAME, and change the IP address to the hostname provided. For example, if your webmail site is going to be **mail.yourdomainexample.com**, you would change the hostname to **mail** or **mail.yourdomainexample.com**. The tables below illustrate this change.

        **Before DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |A| @ | 000.00.000.00 |

        **After DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| mail| pl-10.webmail.emailsrvr.com |

    - If your existing DNS record is already a CNAME, then just update the existing hostname to the new one provided.

        **Example DNS entry:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| mail| pl-10.webmail.emailsrvr.com |

    **Note:** For specific instructions on editing your DNS records, please contact your DNS host. [Find your DNS host here.](/how-to/find-dns-host)

Once the DNS change is propagated, the site will show as secured in the **Webmail Sites** listing. It will have a green "locked" icon to the right of the name.

<img src="{% asset_path rackspace-email/secure-existing-webmail-private-label-site/secure_completed.png %}"/>
