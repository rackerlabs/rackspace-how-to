---
permalink: rackspace-auto-scale-control-panel-user-guide-introduction/
audit_date:
title: Rackspace Auto Scale Control Panel User Guide - Introduction
type: article
created_date: '2013-11-18'
created_by: Maria Abrahms
last_modified_date: '2016-05-17'
last_modified_by: Stephanie Fillmon
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

Welcome to Rackspace Auto Scale, the easy way to scale your cloud
resources up or down in response to an increase or decrease in overall
workload and based on your defined thresholds.

### What you will learn in this guide

After reading this guide you will understand the following information:

-   What Auto Scale does and the core concepts that drive it
-   The Auto Scale current policy options and how group configurations
    affect policy execution
-   How to use the Auto Scale control panel to create a scaling group
    and policies
-   Where to go next to get the most out of Auto Scale

### What you can do with Rackspace Auto Scale

You can use Rackspace Auto Scale to perform the following tasks:

-   Create a policy to add more servers at a specific time of day on a
    recurring basis or just one time; use cron to set the schedule, or
    use a webhook to respond to an event and trigger a policy; and set a
    policy to scale back down
-   Add and remove a specific number of servers or a percentage of your
    total resources
-   Support your dedicated servers by adding - and removing - cloud servers
    based on a schedule

### Prerequisites

Before you can use Rackspace Auto Scale, you need to have the following
prerequisites:

-   A Rackspace Cloud account. To sign up for a Rackspace Cloud account,
    go to the [Rackspace Public Cloud signup
    page](https://cart.rackspace.com/cloud/).
-   A server image or images that you have configured with all needed
    applications and settings, and that will be ready when the server
    is booted. You can do this with various programs such as Chef,
    Puppet, and Salt. You can create your images with the API or through
    the Cloud Control Panel. See the [Cloud Servers Developer
    Guide](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/)
    for information about using the API.
-   *(Optional)* A load balancer. One is allowed per each group of 25
    server images. You can create a load balancer with the API or the
    Cloud Control Panel. See the [Cloud Load Balancers Developer
    Guide](https://developer.rackspace.com/docs/cloud-load-balancers/v1/developer-guide/)
    for information about using the API.

After you are set up, there are some concepts that you should
understand. Those are addressed in the next section,
[Concepts](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts).

### User Guide sections

-   [Rackspace Auto Scale Control Panel User Guide - Introduction](/how-to/rackspace-auto-scale-control-panel-user-guide-introduction)
-   [Rackspace Auto Scale Control Panel User Guide - Concepts](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts)
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling group](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-group)
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling policy](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy)
