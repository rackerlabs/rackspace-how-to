---
permalink: transferring-your-dns-hosting-to-rackspace/
audit_date: '2017-07-26'
title: Transfer your DNS hosting to Rackspace
type: article
created_date: '2011-11-16'
created_by: Rae D. Cabello
last_modified_date: '2017-07-26'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Rackspace enables you to manage your DNS through our control panel while
allowing you to keep your domain registered with your current hosting provider.

To ensure a seamless transition with minimal service interruption, you duplicate
the DNS records from your current host into the Rackspace Cloud Control Panel
before changing name servers.

**Note:** Because DNS changes can take up to 48 hours to resolve, we recommend
that you make this switch during nonbusiness hours or when email activity is
light. No email will be lost during this transition, but do not cancel your
current DNS hosting service until the transfer is complete.

### Transfer DNS hosting

1.  Log in to the Rackspace Cloud Control Panel.

2.  In the navigation bar at the top of the page, select
**Networking** > **Cloud DNS**.

3.  On the Cloud DNS page, click **Create Domain**.

4.  In the pop-up dialog box, enter the domain that you are adding and an
administrative email address that will be publicly associated with the domain.
We recommend leaving the TTL at the default of 5 minutes.  Then, click
**Create Domain**.

5. On the Domain Details page, duplicate the DNS records that exist on your
original DNS host. By entering records with the same information, the name
server change propagates, and end users get the same answer regardless of which
DNS host they query. Complete the following steps for each record:

	A.  Click **Add Record**.
	B.  Choose the record type, and then provide the information requested.
	C.  Leave the TTL at the default of 5 minutes.
	D.  Click **Add Record**.

6. Log in to your domain registrar’s control panel, and change the name servers
for your domain to:
    - dns1.stabletransit.com
    - dns2.stabletransit.com

Following these steps initiates the process to switch DNS hosting to
Rackspace, but the changes can take up to 48 hours to propagate.  If you want
to *change* any DNS records (such as moving an A record to point to your
Rackspace cloud server), you must either make the change on both DNS hosts or
wait until the changes have propagated worldwide.

Making these changes redirects all DNS queries to Rackspace but does not
affect the registration of your domain.  You must maintain your registration
with the original registrar.


