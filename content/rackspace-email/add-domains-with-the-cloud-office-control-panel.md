---
permalink: add-domains-with-the-cloud-office-control-panel/
audit_date:
title: Add domains with the Cloud Office Control Panel
type: article
created_date: '2014-04-10'
created_by: William Loy
last_modified_date: '2017-09-22'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to add a domain in your Cloud Office Control Panel.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 15 minutes
- **Tools required:**  Cloud Office Control Panel access


To add a domain, log in to the [Cloud Office Control Panel](https://cp.rackspace.com), and perform the following steps:

If you would prefer a video tutorial see [Rackspace Email - Adding a Domain <img src="{% asset_path rackspace-email/add-domains-with-the-cloud-office-control-panel/add_domain_thumb.png %}" /> ](https://www.youtube.com/watch?v=Y6aaeoBVkGc).

1.  From the **Go to section** menu, select **Domains**.

    <img src="{% asset_path rackspace-email/add-domains-with-the-cloud-office-control-panel/go_to_domains.png %}" />

2.  In the **Manage** section, click **Domains**.

    <img src="{% asset_path rackspace-email/add-domains-with-the-cloud-office-control-panel/manage_domains.png %}" />

3. Click **Add Domain**.

    <img src="{% asset_path rackspace-email/add-domains-with-the-cloud-office-control-panel/add_domain.png %}" />

4.  Enter the domain name in the **Domain Name** field and select the applicable option.

    <img src="{% asset_path rackspace-email/add-domains-with-the-cloud-office-control-panel/domain_name.png %}" />

    - Option 1: **I own this domain** I will continue to use my current domain registrar and DNS hosting company and I will point my [MX records](/how-to/dns-record-definitions) to Rackspace servers.
        1. Select the services you would like to include on the domain, click **Save**.
        2. [Create mailboxes](/how-to/add-rackspace-email-mailboxes).
        3. [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email) to start receiving email at Rackspace.

    - Option 2: **I own this domain and want Rackspace to Host my DNS** I will continue to use my current domain registrar, but I would like Rackspace to host my [DNS](/how-to/set-up-dns-records-for-cloud-office-email).  
        1. Select the services you would like to include on the domain, click **Save**.
        2. [Create mailboxes](/how-to/add-rackspace-email-mailboxes).
        3. [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email). In order for these records to become active, you must first contact your domain's current registrar and request that the Name Server records be switched over to Rackspace's Name Servers.

        4. You will want to [configure your DNS records](/how-to/set-up-dns-records-for-cloud-office-email) within the Cloud Office Control Panel **BEFORE** you change the Name Server records so that you will not experience any interruption of service.

            You will want to update the following Name Server records at your registrar to the following records:

              Primary: **DNS1.NAME-SERVICES.COM**<br>
            Secondary: **DNS2.NAME-SERVICES.COM**<br>
            Secondary: **DNS3.NAME-SERVICES.COM**<br>
            Secondary: **DNS4.NAME-SERVICES.COM**<br>
            Secondary: **DNS5.NAME-SERVICES.COM**

    - Option 3: **I want to register this domain(price varies)** Rackspace will charge an annual renewal fee to register this domain and host my DNS records.
        1. Select the services you would like to include on the domain, click **Save**.
        2. Confirm your purchase by clicking **Register Domain**.

            **Note:** When you purchase a new domain, a verification email is sent to the email address on record. You must click the verification link in the email within 15 days to avoid any disruption to your domains. For more information, see [Additional information about Registrant Benefits and     Responsibilities](http://www.rackspace.com/information/legal/RAAInfo).

        3. [Create mailboxes](/how-to/add-rackspace-email-mailboxes).
        4. [Set up DNS records for Cloud Office email](/how-to/set-up-dns-records-for-cloud-office-email) to start receiving email.

5. You have successfully added a domain to your Cloud Office account!
