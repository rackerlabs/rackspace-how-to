---
permalink: sitecore-managed-cloud-topologies/
audit_date: 
title: Sitecore Managed Cloud topologies
type: article
created_date: '2017-08-16'
created_by: Juan Garza
last_modified_date: '2017-09-11'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

[Sitecore Managed Cloud Premium – FAQ](https://support.rackspace.com/how-to/sitecore-cloud-faq/).

The following table describes differences between various Sitecore XP environments for the Sitecore Managed Cloud service, as well as their related Azure components.

Customers can purchase these configurations under both Prod and NonProd SLA's.


**Note:** Tiers and topologies are subject to availability. Check [Sitecore Managed Cloud Premium – FAQ](https://support.rackspace.com/how-to/sitecore-cloud-faq/) for currently supported tiers for provisioning new Sitecore Managed Cloud, as well as Microsoft Azure data center compatibility information.

### Experience Management

* = not provisioned by default but supported

|Component / Performance Rating | xM1 | xM2 | xM3 | xM4 | xM5 |
|---|---|---|---|---|---|
|Visits per month	| 100,000 |	200,000 | 1,000,000 | 5,000,000 | 10,000,000 |
|Page views per month | 500,000	| 1,000,000	| 5,000,000	| 10,000,000 | 50,000,000 |
|Content Management Server – Azure Web App |1 x B2 | 1 x B2	| 1 x B2 | 1 x B2 |	1 x B2 |
|Content Delivery Server – Azure Web App | 1 x B2 | 2 x B2 | 3 x B2 | 4 x S3 | 8 x S3 |
|xDB Processing Service – Azure Web App	| -	| -	| -	| -	| - |
|xDB Reporting Service – Azure Web App | - | - | - | - | - |
|Core DB – SQL Azure | 1 x S1 |	1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 |
|Master DB – SQL Azure |1 x S1 | 1 x S1 |1 x S1 | 1 x S1 | 1 x S1 |
|Web DB – SQL Azure	| 1 x S1 | 1 x S1 | 1 x S1 | 1 x S2 | 1 x S3 |
|Analytics DB – SQL Azure | - | - |	- |	- |	- |
|MongoDB – mLab on Azure | - | - | - | - | - |
|Search – Azure Search | 2 x S1 | 2 x S1 | 2 x S1 | 2 x S1 | 2 x S1 |
|Monitoring – Azure App Insights | 1 x Basic | 1 x Basic | 1 x Basic | 1xEnterprise (4 nodes) | 1xEnterprise (4 nodes) |
|Session State – Redis Cache | 1 x C1 | 1 x C1 | 1 x C1	| 1 x C1 | 1 x C1 |
|Azure Traffic Manager – DNS Queries* | 1 million |	1 million |	1 million | 1 million |	1 million |
|Health Checks* | + | + | + | + | + |
|Bandwidth | 20 GB | 40 GB | 40 GB | 60 GB | 100 GB |

* = not provisioned by default but supported


### Experience Platform

* = not provisioned by default but supported

|Component / Performance Rating | xP0 | xP1 | xP2 | xP3 | xP4 | xP5 |
|---|---|---|---|---|---|---|
|Visits per month	| - | 100,000 |	200,000	 | 1,000,000 | 	5,000,000 | 	10,000,000 |
|Page views per month | - | 500,000	| 1,000,000	| 5,000,000	| 10,000,000 | 50,000,000 |
|Content Management Server – Azure Web App |1 x B2| 1 x B2 | 1 x B2	| 1 x B2 | 1 x B2 |	1 x B2 |
|Content Delivery Server – Azure Web App | - | 1 x B2 | 2 x B2 | 3 x B2 | 4 x S3 | 8 x S3 |
|xDB Processing Service – Azure Web App	| - | 1 x B1 | 1 x B1 | 1 x B1 | 1 x B2 | 1 x B2 |
|xDB Reporting Service – Azure Web App | - | 1 x B1 | 1 x B1 | 1 x B2 | 1 x B2 | 1 x B2 |
|Core DB – SQL Azure | 1 x S1 |	1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 |
|Master DB – SQL Azure |1 x S1 | 1 x S1 |1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 |
|Web DB – SQL Azure	| 1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 | 1 x S2 | 1 x S3 |
|Analytics DB – SQL Azure | 1 x S1 | 1 x S1 | 1 x S1 | 1 x S2 | 1 x S2 | 1 x S2 |
|MongoDB – Object Rocket | 20G Repl Set | 20G Repl Set | 50G Repl Set | 100G Repl Set | 500G Repl Set |
|Search – Azure Search | 1 x S1 | 2 x S1 | 2 x S1 | 4 x S1 | 6 x S1 | 6 x S1 |
|Monitoring – Azure App Insights | 1 x Basic | 1 x Basic | 1 x Basic | 1 x Basic | 1xEnterprise (4 nodes) | 1xEnterprise (4 nodes) |
|Session State – Redis Cache | 1 x C1 | 1 x C1 | 1 x C1 | 1 x C1	| 1 x C1 | 1 x C1 |
|Azure Traffic Manager – DNS Queries* | - | 1 million |	1 million |	1 million | 1 million |	1 million |
|Health Checks* | - | + | + | + | + | + |
|Bandwidth | 20 GB | 20 GB | 40 GB | 40 GB | 60 GB | 100 GB |

### Experience Database

* = not provisioned by default but supported

|Component / Performance Rating | xDB1 | xDB2 | xDB3 | xDB4 | xDB5 |
|---|---|---|---|---|---|
|Visits per month	| 100,000 |	200,000	 | 1,000,000 | 	5,000,000 | 	10,000,000 |
|Page views per month | 500,000	| 1,000,000	| 5,000,000	| 10,000,000 | 50,000,000 |
|Content Management Server – Azure Web App |- | - | - | - | - |
|Content Delivery Server – Azure Web App | - | - | - | - | - |
|xDB Processing Service – Azure Web App	| 1 x B1 | 1 x B1 | 1 x B1 | 1 x B2	| 1 x B2 |
|xDB Reporting Service – Azure Web App | 1 x B1 | 1 x B1 | 1 x B2 | 1 x B2	| 1 x B2 |
|Core DB – SQL Azure | 1 x S1 |	1 x S1 | 1 x S1 | 1 x S1 | 1 x S1 |
|Master DB – SQL Azure |1 x S1 | 1 x S1 |1 x S1 | 1 x S1 | 1 x S1 |
|Web DB – SQL Azure	| 1 x S1 | 1 x S1 | 1 x S1 | 1 x S2 | 1 x S3 |
|Analytics DB – SQL Azure | 1 x S1 | 1 x S1 | 1 x S2 | 1 x S2 | 1 x S2 |
|MongoDB – Object Rocket | 20G Repl Set | 20G Repl Set | 50G Repl Set | 100G Repl Set | 500G Repl Set |
|Search – Azure Search | 2 x S1 | 2 x S1 | 4 x S1 | 6 x S1 | 6 x S1 |
|Monitoring – Azure App Insights | 1 x Basic | 1 x Basic | 1 x Basic | 1xEnterprise (4 nodes) | 1xEnterprise (4 nodes) |
|Session State – Redis Cache | - | - | - | - | - |
|Azure Traffic Manager – DNS Queries* | 1 million |	1 million |	1 million | 1 million |	1 million |
|Health Checks* | + | + | + | + | + |
|Bandwidth | 20 GB | 40 GB | 40 GB | 60 GB | 100 GB |

### Next steps

For more information about Sitecore Managed Cloud, see [Sitecore Managed Cloud Premium – FAQ](https://support.rackspace.com/how-to/sitecore-cloud-faq/).
