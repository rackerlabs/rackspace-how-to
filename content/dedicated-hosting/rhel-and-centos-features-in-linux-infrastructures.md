---
permalink: /rhel-and-centos-features-in-linux-infrastructures/
audit_date:
title: Red Hat and CentOS features in Linux infrastructures
type: product
created_date: '2016-11-02'
created_by: Stephanie Fillmon
last_modified_date: '2016-11-02'
last_modified_by: Stephanie Fillmon
product: Dedicated Hosting
product_url: dedicated-hosting
---

Because it is important to make an appropriate decision regarding which point release version your servers should be subscribed to when we build your new infrastructure, following is a short description of the options available to you. There are effectively three choices when choosing Red Hat or CentOS at Rackspace.

### Options applicable to both RHEL and CentOS

- **Base channel**

  A server subscribed to base channel is kicked with the most recent version of Red Hat Enterprise Linux or CentOS that is available to us, following our formal product release strategy. This version will make available updates most regularly as we keep our mirrors in sync with our upstream providers. For hardware or software compatibility reasons, you may wish to use a specific point release channel (outlined below), but this will likely be the most applicable option for you if you do not have a preference otherwise. Rackspace defaults to this channel unless a specific hardware or software requirement is pointed out at the time of sale.

- **Locked Point Release**

  A server subscribed to a locked point release channel is kicked with a specific minor version of that release (e.g. 5.6) and is never provided with updates beyond that version. Locked point release should be used with caution, and only where specific software requirements are in place.

### Options applicable to RHEL only

- **Rolling Point Release**

  Rolling point release is typically only used when a server is subscribed to a Rackspace storage platform (e.g. shared SAN) which requires OS certification for compatibility reasons. When subscribed to rolling point release, a server will be kicked with the most recent minor release of RHEL that is certified for that storage platform. When newer minor versions receive certification, Rackspace engineers will open a ticket notifying customers subscribed to that channel that their device will be moved to the new channel automatically on a future date unless they opt out. The move is for subscription purposes only and the customer is still required to update per their own patching schedule.
