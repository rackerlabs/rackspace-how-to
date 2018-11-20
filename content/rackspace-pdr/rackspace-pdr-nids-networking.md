---
permalink: rackspace-pdr-nids-networking/
title: Rackspace PDR NIDS networking requirements
type: article
audit_date: '2018-11-12'
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-11-12'
last_modified_by: Nick Shobe
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

Although there are implementation differences accross platforms, the network requirements are
generally consistant. Differences are indicated in italics with where and why the network
access control list (ACL) might differ.

### Ingress requirements to the Threat Manager&trade; appliances

***Cloud platforms only***

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| *Agent(s) CIDR* | Appliance | TCP | 443 | Agent updates |
| *Agent(s) CIDR* | Appliance | TCP | 7777 | Agent data transport (between agent and appliance on local network) |
| 208.71.209.32/27 | Appliance | TCP | 22 | *Optional and temporary* Required for troubleshooting during provisioning only |
| 204.110.218.96/27 | Appliance | TCP | 22 | *Optional and temporary* Required for troubleshooting during provisioning only |
| 204.110.219.96/27 | Appliance | TCP | 22 | *Optional and temporary* Required for troubleshooting during provisioning only |
| *185.54.124.0/24* | Appliance | TCP | 22 | *Optional EU Alert Logic&reg; Datacenter as directed by your PDR team and temporary* Required for troubleshooting during provisioning only |

### Egress requirements from the Threat Manager appliances

***Standard US Alert Logic datacenter***

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Appliance | Agent(CIDRs) | ALL | ALL | Active Scanning |
| Appliance | 8.8.4.4 | TCP/UDP | 53 | DNS |
| Appliance | 8.8.8.8 | TCP/UDP | 53 | DNS |
| Appliance | 0.0.0.0/0 | TCP | 80 | Appliance updates |
| Appliance | 204.110.218.96/27 | TCP | 443 | Updates |
| Appliance | 204.110.219.96/27 | TCP | 443 | Updates |
| Appliance | 208.71.209.32/27 | TCP | 443 | Updates |
| Appliance | 208.71.209.32/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.218.96/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.219.96/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.219.96/27 | UDP | 123 | NTP, time sync |
| Appliance | 208.71.209.32/27 | UDP | 123 | NTP, time sync |

### Egress requirements from the Threat Manager appliances standard EU Alert Logic datacenter

***Only implemented when instructed by your PDR team***

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Appliance | Agent(CIDRs) | ALL | ALL | Active Scanning |
| Appliance | 185.54.124.0/24 | TCP | 443 | Updates |
| Appliance | 185.54.124.0/24 | TCP | 4138 | Event transport |
| Appliance | 8.8.8.8 | TCP/UDP | 53 | DNS |
| Appliance | 8.8.4.4 | TCP/UDP | 53 | DNS |
| Appliance | 0.0.0.0/0 | TCP | 80 | Appliance updates |
| Appliance | 185.54.124.0/24 | UDP | 123 | NTP, time sync |
