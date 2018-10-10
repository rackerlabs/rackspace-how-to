---
title: Rackspace PDR Agent Networking Requirements
type: article
created_date: '2018-10-09'
created_by: Nick Shobe
last_modified_date: '2018-10-09'
last_modified_by: Nick Shobe
permalink: rackspace-pdr-agent-networking/
product: Rackspace Proactive Detection & Response
product_url: rackspace-pdr
---

#### Alert Logic Egress Requirements

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Agent | vaporator.alertlogic.com | TCP | 443 | Alert Logic agent updates |
| Your AL Appliances | Agent host | ALL | ALL | Active Scanning from the IDS appliances |
| **Agent | Threat Manager Appliances | TCP | 7777 | **cloud platforms only**  Alert Logic agent data transport (between agent and appliance on local network) |

#### Crowd Strike Egress Requirements

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Agent | Endpoint IPs Below | TCP | 443 | Crowd Strike agent endpoint |

**Crowd-Strike Agent Endpoint IPs**

|             |               |               |
|-------------|---------------|---------------|
| 52.8.160.82 | 54.193.90.171 | 54.219.179.25 |
| 52.8.54.244 | 54.241.161.60 | 54.67.72.218 |
| 54.183.24.162 | 52.8.45.162 | 54.67.78.134 |
| 54.193.27.226 | 54.183.148.43 | 54.241.183.151 |
| 54.215.176.108 | 54.183.51.69 | 54.241.182.78 |
| 54.67.96.255 | 54.215.131.232 | 54.219.158.223 |
| 52.8.172.89 | 54.67.105.202 | 54.241.183.232 |
| 52.8.61.206 | 52.8.52.230 | 54.67.108.17 |
| 54.183.252.86 | 54.183.234.42 | 54.241.161.242 |
| 54.193.29.47 | 54.193.117.199 | 54.67.122.238 |
| 54.219.145.181 | 54.215.169.199 | 54.67.51.32 |
| 54.67.99.247 | 54.67.123.150 | 54.215.170.42 |
| 52.8.173.58 | 54.241.181.78 | 54.183.28.214 |
| 54.183.122.156 | 50.18.198.237 | 54.67.114.188 |
| 54.183.34.154 | 54.67.24.156 | 54.67.41.192 |
| 54.193.67.98 | 54.241.183.229 | 54.67.5.136 |
| 54.241.150.134 | 54.193.86.245 | |
| 52.8.32.113 | 54.67.17.131 | |
| 54.183.148.116 | 54.67.4.108 | |
| 54.183.39.68 | 54.183.215.154 | |

#### Rapid7 Agent Endpoints

| Source | Destination | Protocol | Port | Description |
| ------ | ----------- | -------- | ---- | ----------- |
| Agents | endpoint.ingress.rapid7.com | TCP | 443 | United States Agent messages and beacons |
| Agents | ca.endpoint.ingress.rapid7.com | TCP | 443 | Canada Agent messages and beacons |
| Agents | eu.endpoint.ingress.rapid7.com | TCP | 443 | Europe Agent messages and beacons |
| Agents | ap.endpoint.ingress.rapid7.com | TCP | 443 | Japan  Agent messages and beacons |
| Agents | au.endpoint.ingress.rapid7.com | TCP | 443 | Australia Agent messages and beacons |
| Agents | s3.amazonaws.com | TCP | 443 | United States Agent file uploads for collection and update downloads |
| Agents | s3.ca-central-1.amazonaws.com | TCP | 443 | Canada Agent file uploads for collection and update downloads |
| Agents | s3.eu-central-1.amazonaws.com | TCP | 443 | Europe Agent file uploads for collection and update downloads |
| Agents | s3.ap-northeast-1.amazonaws.com | TCP | 443 | Japan Agent file uploads for collection and update downloads |
| Agents | s3-ap-southeast-2.amazonaws.com | TCP | 443 | Australia Agent file uploads for collection and update downloads |
