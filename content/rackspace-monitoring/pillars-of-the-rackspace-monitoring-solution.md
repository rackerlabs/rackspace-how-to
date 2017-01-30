---
permalink: pillars-of-the-rackspace-monitoring-solution/
audit_date:
title: Pillars of the Rackspace monitoring solution
type: article
created_date: '2016-03-03'
created_by: Shane Duan
last_modified_date: '2016-06-29'
last_modified_by: Nate Archer
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Rackspace offers its monitoring solution through three pillars of products: Rackspace Monitoring, Rackspace Metrics and Rackspace Intelligence—the MMI products. Through the seamless integration, the MMI products enable customers to improve system performance and availability through through a single pane of glass and enterprise-grade platform.

<img src="{% asset_path rackspace-monitoring/pillars-of-the-rackspace-monitoring-solution/monitoring-mmi.svg %}" alt="Monitoring and Intelligence improve data gathering, alert generation, and data storage." />

- Rackspace Monitoring offers reliable data gathering and accurate alert generation. For details, see the following concepts section.
- Rackspace Metrics provides on economical and reliable data storage at scale. For details, see the [Rackspace Metrics overview](https://support.rackspace.com/how-to/rackspace-metrics-overview/).
- Rackspace Intelligence delivers an intuitive interface that gives users a transparent view into their (infrastructure health along with actionable insights. For details, see the [Rackspace Intelligence Introduction](https://support.rackspace.com/how-to/rackspace-intelligence/).


### Monitoring concepts

The following diagram illustrates the key concepts of the Rackspace Monitoring product.  The concepts are explained further after the following diagram.

<img src="{% asset_path rackspace-monitoring/pillars-of-the-rackspace-monitoring-solution/rackspace-monitoring-concepts.png %}" alt="" />

- **Entities** represent any object or resource that you want to monitor. You can create an entity through the UI, API, or CLI for any server or website that you want to monitor. Entities can be servers or non-server objects, but most often entities refer to individual servers. As you create new cloud servers, cloud databases, or dedicated devices, entities are created automatically. For more information, see the API operations reference for the [entities resource](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#entities-operations).
- **Checks** specify the parts or pieces of the entity for which you want to collect metrics on and how you want to do it. In other words, a check returns a group of related metrics. Checks of different types return different sets of metrics, which help you figure out how to collect the data you want. For a complete list of check types, see the [Check typs documentation](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-tech-ref-info/check-type-reference).
- **Alarms**  contain the rules that determine the state of an alarm as OK, WARNING or CRITICAL. The state change of an alarm will trigger an alert. For details of the alarm, see [Alert Triggering and Alarms](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-tech-ref-info/alert-triggers-and-alarms).
- **Notifications** and **Notification** plans describe how Rackspace Monitoring sends alerts to you when an alarm state changes.
    - Each  notification specifies two things: to whom the alert should be sent (the target) and how it should be delivered (the type). For a complete list of notification types see [Notification types](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notification-type-operations).
    - A notification plan is a group of notifications used by alarms.

For other terms and concepts in Rackspace Monitoring, see [Monitoring key terms and concepts](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#monitoring-key-terms-and-concepts).
