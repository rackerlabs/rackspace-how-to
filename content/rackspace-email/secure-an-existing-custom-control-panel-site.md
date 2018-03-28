---
permalink: secure-an-existing-custom-control-panel-site/
audit_date: '2018-03-28'
title: Secure an existing custom control panel site
type: article
created_date: '2018-02-23'
created_by: William Loy
last_modified_date: '2018-03-28'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

Custom control panel sites created before September 2017 were deployed to an environment that did not enforce the use of secure web protocols over HTTPS, such as SSL or TLS. To add this additional level of protection to your existing customer control panel site, we recommend that you secure your own control panel site.

### Prerequisites

- **Applies to:** Administrators of Reseller Accounts
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes to create the site and 24 to 48 hours for the DNS changes to propagate
- **Tools required:**  DNS host administrator access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Secure a Custom Control Panel Site

To secure your control panel site, perform the following steps:

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).

2. In the **Reseller Tools** section of the home page, click the **Custom Control Panel** link.

   <img src="{% asset_path rackspace-email/secure-an-existing-custom-control-panel-site/custom_control_panel.png %}"/>

3. On the **Custom Control Panel Site** page, locate the site that you want to secure. It should have a red “unlocked” icon to the right of the name.

4. Click **Secure Site** from the **ACTIONS** drop-down list.

   <img src="{% asset_path rackspace-email/secure-an-existing-custom-control-panel-site/secure_site.png %}"/>


  **Warning:** You cannot secure a control panel site using a site name that uses the root domains of **mymailsrvr.com**, **mycpsrvr.com**, or a domain that is listed on Google Safe Browsing.

5. On the **Secure Certificate Information** step, enter or verify the company information for your site. This information is used to register the security certificate that secures your site. If your end users choose to view the certificate from their browser, this information is visible to them. Click **SECURE CONTROL PANEL SITE**.

   <img src="{% asset_path rackspace-email/secure-an-existing-custom-control-panel-site/company_info.png %}"/>

6. Instructions to update the DNS entry for your site with new information appears. Copy these instructions by clicking **COPY INSTRUCTIONS** before clicking **OK, GOT IT**.

   <img src="{% asset_path rackspace-email/secure-an-existing-custom-control-panel-site/dns_info.png %}"/>

    - The DNS for most existing sites is an A record that points to a specific IP address. You need to change the A record type to a CNAME and change the IP address to the host name provided. For example, if your control panel site is going to be **cp.yourdomainexample.com**, change the host name to **cp** or **cp.yourdomainexample.com**. The following tables illustrate this change:

        **Before DNS change:**

        |Record type | Host | Point-to or address |
        |---|---|---|
        |A| @ | 000.00.000.00 |

        **After DNS change:**

        |Record type | Host | Point-to or address |
        |---|---|---|
        |CNAME| cp | pl-10.admin.emailsrvr.com |

    - If your existing DNS record is already a CNAME, then just update the existing hostname to the new one provided.

        **Example DNS entry:**

        |Record type | Host | Point-to or address |
        |---|---|---|
        |CNAME| cp | pl-10.admin.emailsrvr.com |

    **Note:** For specific instructions on editing your DNS records, contact your DNS host. [Find your DNS host here.](/how-to/find-dns-host)

The site should now appear as a secured **CUSTOM CONTROL PANEL** listing. After the DNS change is propagated, a green "locked" icon appears to the right of the name to show that the site is secure.

<img src="{% asset_path rackspace-email/secure-an-existing-custom-control-panel-site/secured.png %}"/>
