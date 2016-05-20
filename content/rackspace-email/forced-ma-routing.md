---
permalink: forced-ma-routing/
audit_date:
title: Enable forced MX routing
type: article
created_date: '2013-11-19'
created_by: Milton Prado
last_modified_date: '2015-12-17'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

Typically used during an email migration to Rackspace, forced MX routing
allows you to add your domain and all mailboxes to the Rackspace Email
environment while still being able to send and receieve mail on your old
environment. Enabling this feature will ensure that emails sent to your
domain from current Rackspace users do not deliver to the mailboxes on
our system. Those emails will be routed to your live environment
instead.

Enabling forced MX routing is ideal for customers who want to pre-stage
their email migration to Rackspace. This allows a company to completely
mirror their current environment, migrate all data, and setup all users,
without affecting the delivery of email until the date of the MX records
change.

If forced MX routing has been enabled, it's important that it be
immediately disabled after the switch-over to Rackspace. Not doing so
may result in email delivery problems for the domain.

If you require forced MX routing, contact our support team and
request that it be enabled. We are available 24x7 through chat and support ticket in the [Cloud Office Control Panel](https://cp.rackspace.com/).
