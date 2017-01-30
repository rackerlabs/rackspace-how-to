---
permalink: terminal-services-in-a-hosted-exchange-environment/
audit_date:
title: 'Terminal Services in a Hosted Exchange Environment'
type: article
created_date: '2013-11-12'
created_by: Milton Prado
last_modified_date: '2016-01-29'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

Terminal Services (Remote Desktop Services) provides a method for having
multiple users access Outlook from one centrally managed server.
Users connect to that server to access Outlook and view their mailboxes.
Terminal Services is useful in some configurations, but
it is not a good fit for our
Hosted Exchange environment.

### Not supported for Hosted Exchange

Email and Apps clients who have used Terminal Services (Remote Desktop
Services) with our services have had very poor experiences in the past.
From this we learned that the technical issues associated with
users connecting to our environment from a server are not something we
can reasonably, effectively, or Fanatically resolve. We need to ensure that
we are a good fit for the client, setting both the client and ourselves
up for success; for this reason, Rackspace does not support it.

### Not recommended for Outlook 2010 running in Cached Exchange Mode via Terminal Services

Outlook 2010 can run in Cached Exchange Mode when connected via
Terminal Services (Remote Desktop Services) and can connect to our
Exchange environment. However, clients in the past have had
poor experiences with Hosted Exchange when connecting via Terminal
Services. Many potential complications associated with users
connecting via Terminal Server make it a poor fit for our
environment and therefore something Email and Apps does not support or
encourage.

If you still feel that Terminal Services may be a good fit for your setup,
we recommend researching the topic at [Microsoft's
TechNet](http://technet.microsoft.com/en-us/default.aspx) site for
further information, including the
[Plan for Outlook 2010](http://technet.microsoft.com/en-us/library/ff394406.aspx)
article.
