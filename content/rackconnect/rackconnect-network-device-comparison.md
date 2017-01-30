---
permalink: rackconnect-network-device-comparison/
audit_date:
title: RackConnect network device comparison
type: article
created_date: '2012-11-07'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0 and RackConnect v2.0

The following tables provide a detailed comparison of the network devices available for use with your RackConnect configuration. RackConnect is abbreviated to RC in some instances.

### RackConnect network device comparison

Features | ASA 5505 Sec+ | ASA 5510 Sec+ | ASA 5520 | ASA 5540 | ASA 5550 | ASA 5515-X | ASA 5525-X | ASA 5545-X | ASA 5555-X | Brocade ADX 1000 | F5 1600 | F5 3600
--- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | ---
Load balancer pools | No | No | No | No | No | No | No | No | No | Yes | Yes | Yes
Maximum concurrent connections | 25,000 | 130,000 | 280,000 | 400,000 | 650,000 | 250,000 | 500,000 | 750,000 | 1 million | 4 - 8 million | 1 million | 8 million
Maximum SSL TPS<sup>1</sup> |  - | - | - | - | - | - | - | - | - | 7,250 - 14,500 | 5,000 | 10,000
Maximum concurrent SSL connections |  - | - | - | - | - | - | - | - | - | 64,000 | 1 million | 1 million
Stateful firewall<sup>2</sup> | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes (but not supported as a firewall) | No | No
VPN tunneling | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | No | No | No
High availability option | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes | Yes

<sup>1</sup> A license upgrade might be required to reach Maximum SSL TPS.

<sup>2</sup> We recommend using a Cisco ASA as the RackConnect edge device type.

### RackConnect specific overview

Device | Maximum RC cloud servers<sup>1</sup> | RC network device config options | RackConnect v2.0 compatible | RackConnect v3.0 compatible | Maximum throughput<sup>2</sup> <br /> (Cloud<->Dedicated) <br /> (Cloud<->Internet)
--- | --- | --- | --- | --- | ---
ASA 5505 Sec+ | 5 | Edge or Edge+Connected | Yes | Yes | 150 Mbps
ASA 5510 Sec+ | 25 | Edge or Edge+Connected | Yes | Yes | 300 Mbps
ASA 5520 | 50 | Edge or Edge+Connected | Yes | Yes | 450 Mbps
ASA 5540 | 80 | Edge or Edge+Connected | Yes | Yes | 650 Mbps
ASA 5550 | 100+ | Edge or Edge+Connected | Yes | Yes | 1 Gbps
ASA 5515-X | 50 | Edge or Edge+Connected | Yes | Yes | 1.2 Gbps
ASA 5525-X | 100+ | Edge or Edge+Connected | Yes | Yes | 2 Gbps
ASA 5545-X | 100+ | Edge or Edge+Connected | Yes | Yes | 3 Gbps
ASA 5555-X | 100+ | Edge or Edge+Connected | Yes | Yes | 4 Gbps
Brocade ADX 1000 |  100+ | Connected only | No (not in RackConnect edge or connected device roles)	| Yes	|  2-9 Gbps
F5 1600 | 100+ | Connected or Edge+Connected | Yes | Yes | In: 500 Mbps <br /> Out: 500 Mbps
F5 3600 | 100+ | Connected or Edge+Connected | Yes | Yes | In: 1 Gbps <br /> Out: 1 Gbps

<sup>1</sup> Maximum cloud server guidelines are based on internal testing. Actual results might vary by production load and edge device type.

<sup>2</sup> RackConnect throughput is limited by RackConnect switching infrastructure connectivity: maximum of 1 Gbps theoretical.
