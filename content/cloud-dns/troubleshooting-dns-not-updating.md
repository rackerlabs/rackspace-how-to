---
permalink: troubleshoot-dns-not-updating/
audit_date: '2018-11-01'
title: Troubleshoot when the DNS doesn't update
type: article
created_date: '2012-06-27'
created_by: Shaun Crumpler
last_modified_date: '2018-11-01'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

This article shows you how to resolve issues in which the Domain Name System
(DNS) doesn't appear to be updating properly from [Cloud
DNS](https://www.rackspace.com/cloud/dns) entries. It helps you diagnose if
the DNS issue should be remedied from the customer side, or if you should
escalate it to Rackspace Support. It also describes information that you
should include when you create a ticket to expedite a response.

### Check system status and open support tickets

Check the Rackspace [system status
page](https://rackspace.service-now.com/system_status/) for open issues that
might be impacting your Cloud DNS. Also log in to the [Cloud Control
Panel](https://login.rackspace.com) and check for current support
tickets about Cloud DNS to ensure that there isn't a known problem.

### Try a different browser

If the DNS doesn't appear to be updating and resolving correctly,
check the domain in another browser to ensure that the issue occurs
across multiple browsers. If the domain resolves properly in another browser,
then it is likely that a cached site on the original browser is using outdated
information. Clear the cache on the browser that is experiencing the problem
and check the domain again.

### Check the authoritative name servers

If the issue persists on multiple browsers, check the authoritative name
servers to ensure that the DNS records are updated to reflect Rackspace's
data.

To check the name servers, open Terminal and run the command `dig ns
<domain>`, as shown in the following image:

The output displays the name servers that are being used at the far right of
the window under `ANSWER SECTION`, as shown in the following image:

    <img src="{% asset_path cloud-dns/troubleshoot-dns-not-updating/picture1.png %}" />

The two name servers that should appear for Rackspace Cloud are
`dns1.stabletransit.com` and `dns2.stabletransit.com`.

If the name servers are different, verify that they are set correctly at the
registrar where the domain name is hosted.

If the name servers are correctly set as Rackspace's `stabletransit` instances,
note that it can take up to 48 hours for the name servers to propagate fully.
You might need to wait for propagation to occur.

### Check the Time to Live

After you confirm that the registrar is correctly pointing the domain to
Rackspace, check the Time To Live (TTL) of the domain in Cloud DNS.

The TTL is the amount of time between pushes of the data before it is updated.
For example, if you have a domain set in Cloud DNS and it has a TTL of three
days (the default TTL), then even if you update the data in Cloud DNS, it does
not update globally until three days have passed and the data has expired. As
a result, it's important to check the TTL of a domain in the Cloud DNS.

Use the following steps to change the TTL for a domain:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Networking > Cloud DNS**.

4. Locate the proper DNS record and click the gear icon next to the left of
   it, then click **Edit Time to Live (TTL)**.

5. If the TTL is very high and a flush of the DNS is urgently needed, create a
   ticket with Rackspace Support by clicking **Ticket > Create Ticket** at the
   top right of the Rackspace Cloud Control Panel.

6. Click **Create Ticket**, then select **Cloud DNS** as the **Category** and
   provide an explanation of the steps that you have already taken.
