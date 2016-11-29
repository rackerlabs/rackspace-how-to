---
permalink: use-split-domain-routing/
audit_date:
title: Use split domain routing
type: article
created_date: '2016-11-20'
created_by: Thomas Hester
last_modified_date: '2016-11-20'
last_modified_by: Laura Santamaria
product: Cloud Sites
product_url: cloud-sites
---

Split domain routing (SDR) allows you to have a single domain's mailboxes distributed between our system and an external system, working together as if they were in one environment. This process is primarily used when a large number of mailboxes are being migrated over to our system from another server over an extended period of time.

Mailboxes can be moved in batches to make the move more manageable for administrators and to make the transition almost seamless for users. Though it is not common, SDR can also be used when you need to maintain some mailboxes on an existing system for an extended period of time or permanently.

**Note:** Split domain routing can be a complicated email setup process and should only be utilized if you are sure that you need this option turned on for your domain. We cannot troubleshoot SDR issues for your domain.

1. Log in to the Cloud Sites Email Control Panel.

1. Click the **Domains** section.

    <img src="{% asset_path cloud-sites/use-split-domain-routing/splitrouting1.png %}" alt="Domains section of the Cloud Sites Email Control Panel" />

1. In the **Tools** section, click **Split Domain**.

    <img src="{% asset_path cloud-sites/use-split-domain-routing/splitrouting2.png %}" alt="Split Domain option in the Tools section of the Domains Home tab" />

1. If you have multiple domains, select the appropriate domain name. To change domains at any time, click the **change domain** link at the top of the page.

1. Click on the option to **Enable Split Domain Routing**.

    <img src="{% asset_path cloud-sites/use-split-domain-routing/splitrouting3.png %}" alt="Split Domain settings page in the Tools tab" />

1. Add your external mail server and a valid email address hosted by the external mail server.

1. Click on **Save** to save these settings for your domain.
