---
permalink: ras-sitecore-mongodb/
audit_date:
title: Connecting to Mongo DB
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/sitecore-faq)

### Getting Started

Download a Mongo Database client application

[Download Studio3T](https://studio3t.com/download/) (formerly MongoChef)

[Login to the Object Rocket Portal](https://app.objectrocket.com/sign_in)

If you have multiple Object Rocket Instances select the appropriate instance by clicking the Instance name. 

Click the **+Add ACL** button 

Access Control Lists (ACL) limit what IPs connect to your instance.

Note* ObjectRocket denies access by default so you need to add any appropriate ACL’s for servers that are connecting to ObjectRocket.

Enter an IP address/CIDR block and a description.

Only the IP address is mandatory, but adding descriptions can help when maintaining larger lists.

Note* You can click the Add My IP or Allow Any IP to have our system automatically add those options.

Click Add ACL.

_images/createmongo3.png

Once you’ve added at least one ACL, or deferred to add one later, you can click Create Instance to finish.

------------------------------------------------------------------------
