---
permalink: using-cdn-edge-purge/
audit_date:
title: Using CDN Edge Purge
type: article
created_date: '2011-11-10'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

### What is edge purge?

When using the Content Delivery Network (CDN) with Cloud Files, your
files are distributed across a global network of *edge
servers* increasing the speed at which your audience can download files
from your site. This is accomplished by the CDN automatically caching
your files to an edge server after the first time it is requested from a
given geographic region. Those files will remain cached on the edge
server until such a time as the Time To Live (TTL) setting for an
individual file expires, or until an edge purge request is sent to the
node.

This can cause problems if your content is frequently updated or
modified, and your audience may be downloading older files that are
cached on the edge server. The edge purge function will clear the cache
of a given edge server, and allow it to cache a newer version of a file
after the first time it is requested from a given geographic area.
Customers are allowed up to 25 object purges a day, per account. If a
customer needs to purge an entire container, they can simply contact our
Fanatical Support team for assistance.

Purging content from edge servers is a great feature to have for CDN,
especially when you're really in a pickle. However, edge purge isn't
your only option for controlling your content on the edge. Let's review
some best practices for when and when not to use edge purge to control
your content.

### Work flow

In general, if you have purge as a part of your basic workflow, you
probably have better options (see below). Purge should be used as a
one-off method for controlling content, rather than a final step to
uploading new content.

### Updating user content

If you are sending purges every time your site visitors update their
profile, pictures, or other information, then you will likely be happier
using a TTL setting to control when your content expires and is removed
from the edge servers' cache.  The average purge request takes about 20
minutes to process, and sometimes hours, depending on activity levels.
Your TTL can be set as low as 15 minutes.  Give it a try, and we bet
your site visitors will see better performance from their updates.

### Removing content

Possibly you have files hosted on the CDN that were set with a long TTL
because you did not expect the content to be updated frequently.  In a
circumstance where you need to get those files removed from the edge
node cache immediately, this is a great time to use the edge purge
feature.  If the TTL of your file is nowhere near expiration and you
need to immediately remove some outdated or sensitive content, then
purge is the right tool for you.

### Releasing a new version of your product

Sometimes developers want to wipe out their edge content so they can
start fresh with updated content once a new release comes out.
Something to keep in mind is that, in that type of situation, you are
probably required to issue a ton of purge requests to refresh all data.
All purge requests are put into one centralized queue, meaning you
might be creating an unnecessarily high queue and slowing down the
purging process. You should think about versioning your files instead
of using identical file names for all your releases. This means you can
instantly tell your website or application to request the new file, and
the old one simply gets retired to Cloud Files. This also gives you the
flexibility to launch at an exact time, rather than waiting on a purge
to propagate the updated content.

**Not sure if purge is the right way for you to control your CDN content?**

As a rule of thumb, try other plans first. If you can solve your needs
by using a low TTL or versioning your objects, these are great first
options. Of course, edge purge is always available as a last resort.
Still not sure?  Please contact Rackspace Support with any questions.
