---
title: Rackspace PDR on Azure
type: article
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-10-09'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-azure/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Getting Started on Azure with Rackspace PDR

PDR on Azure has two main componants that will need to be implemented in your Azure environment; the setup of the IDS appliance infrastructure and deployment of select vendor agents.

### Deployment of an IDS appliance infrastructure

To enable visibility of your AWS network we deploy an IDS appliance into each distinct network environment.

### IDS appliance platform requirements
At this time the Rackspace Azure and PDR support teams deploy, manage and monitor your IDS Threat Manager appliances. Below are the platform requirements required by Rackspace PDR on Azure.

- Be a Rackspace Azure customer
- An IDS appliance for each routable network segment(appliance needs to be reachable by agents and visa versa)
- Egress and Ingress firewall rules(NSGs) as defined by [Rackspace PDR Threat Manager Network Requirements](/how-to/rackspace-pdr-ids-networking/)
