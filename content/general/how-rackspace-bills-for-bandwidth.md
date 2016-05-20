---
permalink: how-rackspace-bills-for-bandwidth/
audit_date:
title: How Rackspace Bills for Bandwidth
type: article
created_date: '2014-02-19'
created_by: Rose Contreras
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Rackspace introduced the concept of charging customers only for the
bandwidth that they actually use in a given period. Other providers use
what is commonly referred to as the 95th percentile method. This method
takes readings of inbound and outbound bandwidth use on regular
intervals. The larger bandwidth use of the two is recorded. At the end
of the billing period, the highest 5 percent of the readings are
discarded and the customer is charged for a full month of use at the 95
percent mark.

Although this method provides some level of protection against short
traffic spikes, the disadvantage occurs during hours of lower use. With
95th percentile billing, your lower, off-hour use is billed at the
higher 95th percentile rate. Traditionally, this period of lower
bandwidth use is approximately 50 percent of the hours in the billing
period, resulting in charges for bandwidth that you did not use.

Rackspace instead charges based upon aggregate transfer. This method is
ideal for our hosting customers because it results in lower bandwidth
charges. Instead of penalizing for peak hour consumption (as in the 95th
percentile method), this method charges you only for the bandwidth that
you use. As shown in the following graph, in the 95th percentile method
you would be charged for bandwidth use at a rate of 377 kbps sustained
across the entire month. With Rackspace, you would instead be charged
for the equivalent of 196 kpbs, converted a per GB transferred.

Finally, Rackspace charges only for outbound bandwidth, meaning that
routine site maintenance, such as content publishing and uploads, are
not counted against your bandwidth allocation.

<img src="{% asset_path general/how-rackspace-bills-for-bandwidth/3911-1_0.png %}" width="512" height="212" />
