---
permalink: mapping-of-amazon-web-services-resources-to-rackspace-resources/
audit_date:
title: Mapping of Amazon Web Services resources to Rackspace resources
type: article
created_date: '2013-07-01'
created_by: David Hendler
last_modified_date: '2017-06-06'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Migrating to the Rackspace Cloud from Amazon Web Services](/how-to/migrating-to-the-rackspace-cloud-from-amazon-web-services)

This article is intended to help you map Amazon Web Services (AWS)
infrastructure as a service (IaaS) products to Rackspace
products.

| AWS product | Corresponding Rackspace product |
| --- | --- |
| Amazon EC2 | [Cloud Servers product and pricing](http://www.rackspace.com/cloud/servers)<br />[Cloud Servers API](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/) |
| Elastic Load Balancing | [Cloud Load Balancers product and pricing](http://www.rackspace.com/cloud/load-balancing)<br />[Cloud Load Balancers API](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/)|
| Amazon EMR | [Rackspace Cloud Big Data Platform product and pricing](https://www.rackspace.com/cloud/big-data)<br />[Cloud Big Data API](https://developer.rackspace.com/docs/cloud-big-data/v2/developer-guide/) |
| Amazon VPC | [Cloud Networks product and pricing](https://www.rackspace.com/cloud/networks) |
| Amazon Route 53 | [Cloud DNS product and pricing](https://www.rackspace.com/cloud/dns) |
| AWS Direct Connect | [RackConnect](https://www.rackspace.com/cloud/hybrid/rackconnect) |
| Amazon S3 | [Cloud Files product and pricing](http://www.rackspace.com/cloud/files)<br />[Cloud Files API](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/) |
| Amazon Glacier | [Cloud Backup (with compression)](https://www.rackspace.com/cloud/backup) |
| Amazon EBS | [Cloud Block Storage product and pricing](http://www.rackspace.com/cloud/block-storage)<br />[Cloud Block Storage API](https://developer.rackspace.com/docs/cloud-block-storage/v1/developer-guide/) |
| AWS Import/Export | Hard Drive Import/Export |
| AWS Storage Gateway | Multiple Partner solutions available |
| Amazon CloudFront | [Rackspace CDN product and pricing](http://www.rackspace.com/cloud/cdn-content-delivery-network)<br />[Rackspace CDN API](https://developer.rackspace.com/docs/cdn/v1/developer-guide/) |
| Amazon RDS | [Cloud Databases product and pricing](https://www.rackspace.com/cloud/databases)<br />[Cloud Databases API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/) |
| Amazon DynamoDB | Object Rocket (MongoDB - open) |
| Amazon SES, SNS | Partner solutions - [Mailgun](https://www.mailgun.com/) |
| Elastic Transcoder | Partner solutions - [Enterprise Media Processing](https://www.encoding.com/) |
| IAM & Mgmt Console | [Cloud Control Panel](http://mycloud.rackspace.com) |
| AWS CloudWatch | [Cloud Monitoring product and pricing](http://www.rackspace.com/cloud/monitoring)<br />[Cloud Monitoring API](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/)  |
| AWS CloudFormation | Deployments |
| CloudSearch & Redshift | Non Core - Partner |

### Mapping of EC2 instance types to Rackspace Cloud instance types

The following table maps Amazon EC2 instance types to equivalent
Rackspace Cloud instance types so that you can select an appropriate
instance size for your Rackspace Cloud Server.

| EC2 instance type   | Rackspace instance type   |
|---------------------|---------------------------|
| Micro:<br />613 MB RAM, up to 2 ECUs, EBS storage, 64 bit | Standard: 512 MB RAM, 20 GB HDD, 1 vCPU<br />1 GB RAM, 40 GB HDD, 1 vCPU<br />Performance: 1 GB RAM, 20 GB SSD, 1 vCPU |
| M1 Small:<br />1.7 GB RAM, 1 ECU, 160 GB local storage, 32 or 64 bit | Standard: 2 GB RAM, 80 GB HDD, 2 vCPUs<br />Performance: 2 GB RAM, 40 GB and 20 GB SSDs, 2 vCPU |
| M1 Medium:<br />3.75 GB RAM, 2 ECUs, 410 GB local storage, 32 or 64 bit | Standard: 4 GB RAM, 160 GB HDD, 2 vCPUs<br />Performance: 4 GB RAM, 40 GB and 40 GB SSDs, 4 vCPU |
| M1 Large:<br />7.5 GB RAM, 4 ECUs, 850 GB local storage, 64 bit | Standard: 8 GB RAM, 320 GB HDD, 4 vCPUs<br />Performance: 8 GB RAM, 40 GB and 80 GB SSDs, 8 vCPU |
| M1 Extra Large:<br />15 GB RAM, 8 ECUs, 1690 GB local storage, 64 bit | Standard: 15 GB RAM, 620 GB HDD, 6 vCPUs<br />Performance: 15 GB RAM, 40 GB and 150 GB SSDs, 4 vCPU |
| M3 Extra Large:<br />15 GB RAM, 13 ECUs, EBS storage, 64 bit | Standard: 15 GB RAM, 620 GB HDD, 6 vCPUs<br />Performance: 15 GB RAM, 40 GB and 150 GB SSDs, 4 vCPU |
| M3 Extra Double Large:<br /> 30 GB RAM, 26 ECUs, EBS storage, 64 bit | Standard: 30 GB RAM, 1200 GB HDD, 8 vCPUs<br />Performance: 30 GB RAM, 40 GB and 300 GB SSDs, 8 vCPU |
| High-Memory Extra Large:<br />17 GB RAM, 6.5 ECUs, 420 GB storage, 64 bit | Standard: 15 GB RAM, 620 GB HDD, 6 vCPUs<br />Performance: 15 GB RAM, 40 GB and 150 GB SSDs, 4 vCPU |
| High-Memory Double Extra Large:<br />34 GB RAM, 13 ECUs, 850 GB local storage, 64 bit | Standard: 30 GB RAM, 1200 GB HDD, 8 vCPUs<br />Performance: 30 GB RAM, 40 GB and 300 GB SSDs, 8 vCPU |

### Fanatical Support

[Rackspace Support](http://www.rackspace.com/whyrackspace/support)


### Next section

[High-level steps for migrating from Amazon Web Services](/how-to/high-level-steps-for-migrating-from-amazon-web-services)
