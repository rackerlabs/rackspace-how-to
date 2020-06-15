---
permalink: rms-cloudflare-faq/
title: Cloudflare Edge Security FAQ
type: faq
audit_date: '2020-06-11'
created_date: '2020-06-11'
created_by: Rackspace Managed Security
last_modified_date: '2020-06-11'
last_modified_by: Stephanie Fillmon
product: Cloudflare Edge Security
product_url: rms-cloudflare
---

#### How do I contact the Rackspace team?

The best way to reach us is by creating a ticket in the
[MyRackspace portal](https://login.rackspace.com/) and selecting your
Cloudflare
device, if applicable. You can also call us at (US) 1-800-961-4454 or
(International) +1-210-312-4600.

#### When should I contact Cloudflare&reg;?

Always contact Rackspace for support. If required, the Rackspace
team escalates issues to Cloudflare where we have a direct
line to quickly solve the problem.

#### Is Cloudflare a free DNS provider?

Cloudflare offers [free DNS services](https://www.cloudflare.com/dns) to
customers in all plans.

**Note**: You do not need to move away from your registrar. The only change
that you make with your registrar is to point the authoritative nameservers
to the Cloudflare nameservers.

### Where do I change my nameservers to point to Cloudflare?

Make the change at your registrar. Your registrar is body from whom you
purchased your domain. If you don't know who your registrar is for the
domain, you can find this by doing a [WHOis](http://www.whois.net/)
search. Follow the instructions
in your Rackspace Technology onboarding ticket to change nameservers to
Cloudflare.

#### How long does it take for a DNS change I made to take effect?

The Cloudflare DNS default Time-To-Live (TTL) is 300 seconds (five minutes). Any
changes or additions you make to your Cloudflare zone file push out in five
minutes or less.

**Note**: Your local DNS cache might take longer to update. Thus,
propagation everywhere might take longer than five minutes. In rare cases,
it could take up to 48 hours.

#### Can I add domains to my Cloudflare account?

Yes, however Cloudflare considers each separate domain unique
with their own service contracts attached. This might result in a mixture of
server levels in one account, so you should consider this concern when you
deploy a subdomain.  

In the following example, we added **example1.com** to an
account with an enterprise support agreement. Any subdomains, such as **www**
and **dev** inherit this contract because we deployed them simply as a DNS
record. If, however, we want to deploy and manage a subdomain as a
separate entity, different service-level agreements apply. See the
following **blog.example1.com** example:

- Example1.com (Enterprise)

  - www.example1.com (Enterprise - inherited)
  - dev.example.com (Enterprise - inherited)

- Blog.example1.com (free)

  - Test.blog.example1.com (free)

- Example2.com (free)
- Example3.com (free)

While this does allow management and configuration segmentation, it can have
cost implications.  

#### Does Cloudflare offer domain masking?

No, Cloudflare does not offer domain masking or DNS redirect services. It offers only
URL forwarding through [Page Rules](http://blog.cloudflare.com/introducing-pagerules-url-forwarding).
