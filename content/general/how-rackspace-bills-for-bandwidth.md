---
permalink: how-rackspace-bills-for-bandwidth/
audit_date: '2018-02-26'
title: How Rackspace bills for bandwidth
type: article
created_date: '2014-02-19'
created_by: Rose Contreras
last_modified_date: '2018-02-26'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace introduced the concept of charging customers for only the
bandwidth that they actually use in a given period. Other providers use
what is commonly called *the 95th percentile method*. This method
takes readings of inbound and outbound bandwidth usage at regular
intervals, and the larger value of the two is recorded. At the end
of the billing period, the highest 5 percent of the readings are
discarded, and the customer is charged for a full month of use at the 
95 percent mark.

Although this method provides some level of protection against short
traffic spikes, the disadvantage occurs during hours of lower use. With
95th percentile billing, your lower, off-hour use is billed at the
higher 95th percentile rate. Traditionally, this period of lower
bandwidth usage is approximately 50 percent of the hours in the billing
period, resulting in significant charges for bandwidth that you did not use.

Rackspace, however, charges based on *aggregate transfer*. This method is
ideal for our hosting customers because it results in lower bandwidth
charges. Instead of penalizing for peak hour consumption (as in the 95th
percentile method), this method charges you for only the bandwidth that
you use. 

Finally, Rackspace charges for only outbound bandwidth, meaning that
routine site maintenance, such as content publishing and uploads, is
not counted against your bandwidth allocation.
