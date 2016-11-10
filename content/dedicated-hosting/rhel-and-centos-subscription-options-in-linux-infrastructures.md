---
permalink: rhel-and-centos-subscription-options-in-linux-infrastructures/
audit_date: '2016-11-09'
title: Red Hat and CentOS subscription options in Linux infrastructures
type: product
created_date: '2016-11-02'
created_by: Stephanie Fillmon
last_modified_date: '2016-11-09'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

When the dedicated team builds your new infrastructure, you must choose a point release version subscription that is appropriate for your servers. This article describes the options available to you when you choose Red Hat Enterprise Linux or CentOS at Rackspace.

#### Base channel

A server subscribed to the base channel is created with the most recent version of Red Hat Enterprise Linux or CentOS that is available, following the Rackspace formal product release strategy. This version is updated regularly as Rackspace synchronizes our mirror images with upstream providers. For hardware or software compatibility reasons, you might want to use a specific point release channel (see the next option); however, if you don't have a preference, the base channel is likely the most applicable option for you. Rackspace defaults to this channel unless you specify a specific hardware or software requirement.

#### Locked point release

A server subscribed to a locked point release channel is created with a specific minor version of that Red Hat Enterprise Linux or CentOS release (for example, 5.6) and is never updated beyond that version. Locked point releases should be used with caution, and only when you have specific software requirements.

#### Rolling point release

*(Red Hat only)* A rolling point release is typically used only when a server is subscribed to a Rackspace storage platform (for example, shared SAN) that requires OS certification for compatibility reasons. When subscribed to rolling point release, a server is created with the most recent minor release of Red Hat that is certified for that storage platform. When newer minor versions receive certification, Rackspace engineers open a ticket notifying you that your device will be moved to the new channel automatically on a future date unless you opt out. The move is for subscription purposes only; you are still required to update the server according to your own patching schedule.
