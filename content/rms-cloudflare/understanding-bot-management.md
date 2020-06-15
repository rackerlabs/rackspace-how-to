---
permalink: understanding-bot-management/
title: 'Understanding bot management'
type: article
audit_date: '2020-06-11'
created_date: '2020-06-11'
created_by: Rackspace Managed Security
last_modified_date: '2020-06-11'
last_modified_by: Stephanie Fillmon
product: Cloudflare Edge Security
product_url: rms-cloudflare
---

Effective bot management blends distributed systems, web development,
machine learning, security, research, and every discipline in between, while
fighting ever adaptive and motivated adversaries.

### Key concepts

- **Bot** - An autonomous program on a network that can interact with computer
  systems or users, imitating or replacing a human user's behavior, performing
  repetitive tasks much faster than human users could.
- **Good bots** - Bots which are useful to businesses that they interact
  with, such as search engine bots like Googlebot or Bingbot, or bots that
  operate on social media platforms like Facebook Bot.
- **Bad bots** - Bots which are designed to perform malicious actions,
  ultimately hurting businesses, such as credential stuffing bots,
  third-party scraping bots, spambots, and sneaker bots.
- **Bot management** - Blocking undesired or malicious Internet bot traffic
  while still allowing useful bots to access web properties by detecting
  bot activity, discerning between desirable and undesirable bot behavior,
  and identifying the sources of the unwanted activity.
- **Web Application Firewall (WAF)** - A security system that monitors and
  controls network traffic based on a set of security rules.

The following image shows the difference between good and bad bots:

<img src="{% asset_path rms-cloudflare/understanding-bot-management/good-bad-bots.png %}" />

### The module

All bot detection mechanisms are applied on every request in real time during
the request processing stage in the bot management module that runs on
every machine at Cloudflare's edge locations. When a request comes in, we
extract and transform the required request attributes and feed them to our
detection mechanisms.

### Detection mechanisms

The Cloudflare Bot Management platform currently uses five complementary
detection mechanisms, producing their own scores, which we combine to form
the single score going to the firewall. Most of the detection mechanisms are
applied on every request, while some are enabled on a per-customer basis to
better fit their needs.

Overall globally, more than a third of the Internet traffic visible to
Cloudflare is coming from bad bots, while Bot Management customers have the
ratio of bad bots even higher at approximately 43%.

### Summary

Cloudflare has the unique ability to collect data from trillions of requests
flowing through its network every week. With this data, Cloudflare can
identify likely bot activity with machine learning, heuristics, behavioral
analysis, and other detection mechanisms. Cloudflare Bot Management
integrates seamlessly with other Cloudflare products, such as WAF and Workers.
