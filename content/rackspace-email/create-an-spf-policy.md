---
permalink: create-an-spf-policy/
audit_date:
title: Create an SPF(Sender Policy Framework) policy
type: article
created_date: '2017-09-25'
created_by: William Loy
last_modified_date: '2017-09-27'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to create an SPF policy to protect your email traffic.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 15 minutes to create record, 24-48 hours for the record to propagate
- **Tools required:**  DNS host administrator access

You also need access to update DNS entries for your domain. If you do not know where your DNS is hosted, see [Find your DNS host](/how-to/find-dns-host).

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

1. Log in to the control panel for your domain DNS host.

2. Create a TXT record with the following specifications.

    | Type | Hostname | Destination | TTL |
    | :---: | :---: | :---: | :---: |
    | TXT | @ | **v=spf1 include:emailsrvr.com ~all** | 3600 |

3. Before saving changes, decide how you would like to enforce SPF failures.

    - **~** all will result in a soft fail(Not authorized, but not explicitly unauthorized).
    - **-** all will result in a hard fail(Unauthorized).
    - **?** all is neutral(As if there is no policy at all).

4. Authorize additional mail servers that you utilize by adding their IP or server name just after **include:**.

    - For example:

    | Type | Hostname | Destination | TTL |
    | :---: | :---: | :---: | :---: |
    | TXT | @ | **v=spf1 include:emailsrvr.com include:othermailer.com ~all** | 3600 |

3. Save your changes.
