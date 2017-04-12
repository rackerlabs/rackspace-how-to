---
permalink: cloud-big-data-faq/
audit_date:
title: Cloud Big Data FAQ
type: article
created_date: '2015-12-10'
created_by: Rackspace Support
last_modified_date: '2016-01-20'
last_modified_by: Stephanie Fillmon
product: Cloud Big Data
product_url: cloud-big-data
---

### Account Services

#### Can I manage the Cloud Big Data service through my Cloud Control Panel?

Yes, you can manage your Cloud Big Data service through the Rackspace
Cloud Control Panel, as well as by using a RESTful API.

#### What is Rackspace Cloud Big Data?

Rackspace Cloud Big Data is an on-demand Apache Hadoop service for the
Rackspace Open Cloud. The service supports a RESTful API and alleviates
the pain associated with deploying, managing, and scaling Hadoop
clusters.

Cloud Big Data is just as flexible and feature-rich as Hadoop. With
Cloud Big Data, you benefit from on-demand servers, utility-based
pricing, and access to the full set of Hadoop features and APIs.
However, you do not have to worry about provisioning, growing, or
maintaining your Hadoop infrastructure. The Cloud Big Data service uses
an environment that is specifically optimized for Hadoop, which ensures
that your jobs run efficiently and reliably. Note that you are still
responsible for developing, troubleshooting, and deploying your
applications.

Cloud Big Data creates on-demand infrastructure for applications in
production where physical servers would be too costly and time-consuming
to configure and maintain.

You can use Big Data to perform the following tasks:

-   Develop, test, and pilot data analysis applications
-   Create or resize Hadoop clusters in minutes and pay only for what
    you use
-   Access the Hortonworks Data Platform (HDP), an enterprise-ready
    distribution that is 100 percent Apache open source
-   Provision and manage Hadoop through an easy-to-use Control Panel and
    a RESTful API
-   Seamlessly access data in Cloud Files containers
-   Gain interoperability with any third-party software tool that
    supports HDP
-   Access Fanatical Support&reg; on a 24x7x365 basis via chat, ticket, or
    phone at 1-800-961-4454 (US toll free) and
    1-210-312-4000 (international)

------------------------------------------------------------------------

### Billing

#### What is the pricing for Cloud Big Data and how is it billed?

Cloud Big Data is part of the Rackspace Cloud, and your use of it
through the API is billed according to the pricing schedule listed on
the [Cloud Big Data product
page](http://www.rackspace.com/cloud/big-data). Cloud Servers is also
part of the Rackspace Cloud, and your use of it through the Cloud
Control Panel is billed according to [Cloud Servers
pricing](https://www.rackspace.com/cloud/servers/pricing)

------------------------------------------------------------------------

### General

#### How do I manage and customize Cloud Big Data?

You can provision and manage the Cloud Big Data service through your
Cloud Control Panel and a RESTful API.

#### Where can I find the Cloud Big Data SLA?

The service level agreements (SLAs) for Cloud Big Data and Cloud Servers
are available at <http://www.rackspace.com/cloud/legal/sla>.

#### Where can I access the Cloud Big Data API?

You can access the Big Data API documentation
at <https://developer.rackspace.com/docs/>.

#### Who do I contact if I need help or have problems with my Cloud Big Data service?

You can access Rackspace Fanatical Support&reg; on a 24x7x365 basis by using
the following methods:

-   Live Chat: Click LiveChat in the Cloud Control Panel
-   Phone: US toll free 1-800-961-4454, international 1-210-312-4000
-   Ticket: Create a ticket in the Cloud Control Panel from the Support
    menu

Learn more about the Rackspace cloud service levels on the cloud service
levels comparison page.

#### What are the service access endpoints for Cloud Big Data?

The Cloud Big Data service is a regionalized service. The user of the
service is therefore responsible for appropriate replication, caching,
and overall maintenance of Cloud Big Data data across regional
boundaries to other Cloud Servers. The endpoints to use for your Cloud
Big Data API calls are summarized in the following table:

| Region                  | Endpoint                                                         |
|-------------------------|------------------------------------------------------------------|
| Chicago (ORD)           | `https://ord.bigdata.api.rackspacecloud.com/v1.0/yourAccountID/` |
| Dallas/Ft. Worth (DFW)  | `https://dfw.bigdata.api.rackspacecloud.com/v1.0/yourAccountID/` |
| London (LON)            | `https://lon.bigdata.api.rackspacecloud.com/v1.0/yourAccountID/` |
| Northern Virginia (IAD) | `https://iad.bigdata.api.rackspacecloud.com/v1.0/yourAccountID/` |

Replace the yourAccountID placeholder with your actual account number,
which is returned as part of the authentication service response, after
the final slash (/) in the `publicURL` field.

For Cloud Big Data v2, replace v1.0 with v2 in the service access URLs.

