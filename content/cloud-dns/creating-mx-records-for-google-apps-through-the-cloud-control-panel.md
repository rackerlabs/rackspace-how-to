---
permalink: creating-mx-records-for-google-apps-through-the-cloud-control-panel/
audit_date:
title: Creating MX records for Google Apps through the Cloud Control Panel
type: article
created_date: '2012-09-19'
created_by: Lee Jelley
last_modified_date: '2016-01-27'
last_modified_by: Catherine Richardson
product: Cloud DNS
product_url: cloud-dns
---

This article shows how to add [Google Apps](http://www.google.com/enterprise/apps/business/pricing.html) MX records to a domain managed via the Cloud Control Panel.

**Important:** Be sure to verify your domain with Google Apps through their administrative interface.

After your domain has been verified, the next step is to add Google's MX records to the domain's information in the DNS
section of the [Cloud Control Panel](https://mycloud.rackspace.com/).

Google Apps provides five MX records to be added to the domain DNS
settings. You can find the latest MX record values on [the Google Apps web site](http://support.google.com/a/bin/answer.py?hl=en&answer=174125).

### Add MX records to a domain

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. Select **Networking > Cloud DNS**.

3. Click the gear icon next to your domain and select **Add DNS Record**.

4. In the popup dialog box, select **MX Record** as the record type.

  <img src="{% asset_path cloud-dns/creating-mx-records-for-google-apps-through-the-cloud-control-panel/addrecord.png %}" width="570" height="382" />

5. Enter the following information:

  - The hostname for your domain (optional)
  - Mailserver domain
  - Priority
  - Time to Live (TTL)

  You can find the five MX record mailserver domains, priority numbers, and recommended TTL on the [Google Apps website](https://support.google.com/a/answer/174125?hl=en).

  **Note**: Don't include a period at the end of the mailserver domain when you
  enter it. The system will add that for you behind the scenes if it's
  required.

6. Click **Add Record**.

After adding the first MX record, repeat the process for the other four MX records.

### Check and test

Now that the MX records have been stored within the DNS settings for
your domain, the changes should propagate after the time specified in
the TTL has passed. You can test your changes with a DNS checker.

Send an email through the Google Apps webmail interface to an email
address you can access on a different domain, then reply to it. If the
email to your domain gets back to Google Apps you'll know the DNS
changes worked.
