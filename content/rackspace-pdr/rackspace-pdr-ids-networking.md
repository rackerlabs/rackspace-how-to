---
title: Rackspace PDR IDS Networking Requirements
type: article
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-10-09'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-ids-networking/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

### Ingress Requirements to the Threat Manager Appliances

***Cloud platforms only***

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| *Agent(s) CIDR* | Appliance | TCP | 443 | Agent updates |
| *Agent(s) CIDR* | Appliance | TCP | 7777 | Agent data transport (between agent and appliance on local network) |
| 208.71.209.32/27 | Appliance | TCP | 22 | ***Optional and temporary*** required for troubleshooting during provisioning only |
| 204.110.218.96/27 | Appliance | TCP | 22 | ***Optional and temporary***  required for troubleshooting during provisioning only* |
| 204.110.219.96/27 | Appliance | TCP | 22 | ***Optional and temporary*** required for troubleshooting during provisioning only |
| *185.54.124.0/24* | Appliance | TCP | 22 | ***Optional*** *EU Alert Logic Datacenter as derected by your PDR team and temporary- required for troubleshooting during provisioning only* |

### Egress Requirements from the Threat Manager Appliances

***Standard US Alert Logic Datacenter***

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Appliance | Agent(CIDRs) | ALL | ALL | Active Scanning |
| Appliance | 8.8.4.4 | TCP/UDP | 53 | DNS |
| Appliance | 8.8.8.8 | TCP/UDP | 53 | DNS |
| Appliance | 0.0.0.0/0 TCP | 80 | Appliance updates |
| Appliance | 204.110.218.96/27 | TCP | 443 | Updates |
| Appliance | 204.110.219.96/27 | TCP | 443 | Updates |
| Appliance | 208.71.209.32/27 | TCP | 443 | Updates |
| Appliance | 208.71.209.32/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.218.96/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.219.96/27 | TCP | 4138 | Event transport |
| Appliance | 204.110.219.96/27 | UDP | 123 | NTP, time sync |
| Appliance | 208.71.209.32/27 | UDP | 123 | NTP, time sync |

### Egress Requirements from the Threat Manager Appliances standard EU Alert Logic Datacenter

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
