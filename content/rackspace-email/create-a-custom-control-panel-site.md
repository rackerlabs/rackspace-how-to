---
permalink: create-a-custom-control-panel-site/
audit_date:
title: Create a Custom Control Panel Site
type: article
created_date: '2018-02-23'
created_by: William Loy
last_modified_date: '2018-02-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

A custom control panel allows you to customize the portal which your customers use to access their administrator portal.

### Prerequisites

- **Applies to:** Administrators of Reseller Accounts
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes create the site, 24-48 hours for the DNS changes to propagate
- **Tools required:**  DNS host administrator access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Create a Custom Control Panel Site

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com), and perform the following steps:

2. In the **Reseller Tools** section of the home page, click the **Custom Control Panel** link.

   <img src="{% asset_path rackspace-email/create-a-custom-control-panel-site/customer_control_panel.png %}"/>

3. On the **Custom Control Panel Site** page, click **Let's Get Started**.

   <img src="{% asset_path rackspace-email/create-a-custom-control-panel-site/get_started.png %}"/>

4. On the **Control Panel Settings** step, enter the control panel website address you would like to create in the **Control Panel Address** field.

   <img src="{% asset_path rackspace-email/create-a-custom-control-panel-site/cp_address.png %}"/>


  **Warning:** You cannot create a control panel site using a site name that already exists, uses the root domains of mymailsrvr.com, mycpsrvr.com or a domain which is listed on Google Safe Browsing.

5. On the **Secure Certificate Information** step, enter or verify the company information for your site. This information is used to register the security certificate that secures your site. If your end users choose to view the certificate from their browser, this information is visible to them. Click **Add Control Panel Site**.

   <img src="{% asset_path rackspace-email/create-a-custom-control-panel-site/company_info.png %}"/>

6. You will be presented with instructions to update the DNS entry for your site with new information. Copy these instructions by clicking **Copy Instructions** before clicking **Ok, Got It**.

   <img src="{% asset_path rackspace-email/create-a-custom-control-panel-site/dns_info.png %}"/>

    - The DNS for most existing sites will be an A record that points to a specific IP address. You need to change the A record type to CNAME, and change the IP address to the hostname provided. For example, if your control panel site is going to be **cp.yourdomainexample.com**, you would change the hostname to **cp** or **cp.yourdomainexample.com**. The tables below illustrate this change.

        **Before DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |A| @ | 000.00.000.00 |

        **After DNS change:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| cp | pl-10.admin.emailsrvr.com |

    - If your existing DNS record is already a CNAME, then just update the existing hostname to the new one provided.

        **Example DNS entry:**

        |Record Type | Host | Point-to/Address |
        |---|---|---|
        |CNAME| cp | pl-10.admin.emailsrvr.com |

    **Note:** For specific instructions on editing your DNS records, please contact your DNS host. [Find your DNS host here.](/how-to/find-dns-host)

The site will now appear in the **Custom Control Panel** listing. Once the DNS change is propagated it will have a green "locked" icon to the right of the name to show that the site is secure.

<img src="{% asset_path rackspace-email/create-a-private-label-webmail-site/secured.png %}"/>
