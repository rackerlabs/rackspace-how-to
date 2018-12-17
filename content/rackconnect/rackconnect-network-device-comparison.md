---
permalink: rackconnect-network-device-comparison/
audit_date: '2017-10-24'
title: RackConnect network device comparison
type: article
created_date: '2012-11-07'
created_by: Juan Perez
last_modified_date: '2017-10-04'
last_modified_by: Sean Laszakovits
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0 and RackConnect v2.0

The following tables provide a detailed comparison of the network devices available for use with your RackConnect (RC) configuration. 

### RackConnect network device comparison

Device | Load Balancer Pools | Maximum concurrent connections | Maximum SSL TPS<sup>1</sup> | Maximum Concurrent SSL Connections | Stateful Firewall<sup>2</sup> | VPN Tunneling | High Availability Option
--- | --- | --- | --- | --- | --- | --- | --- 
ASA 5505 Sec+ | No | 25,000 | - | - | Yes | Yes | Yes
ASA 5508-X | No | 100,000 | - | - | Yes | Yes | Yes
ASA 5510 Sec+ | No | 130,000 | - | - | Yes | Yes | Yes
ASA 5520 | No | 280,000 | - | - | Yes | Yes | Yes
ASA 5540 | No | 400,000 | - | - | Yes | Yes | Yes
ASA 5550 | No | 650,000 | - | - | Yes | Yes | Yes
ASA 5515-X | No | 250,000 | - | - | Yes | Yes | Yes
ASA 5525-X | No | 500,000 | - | - | Yes | Yes | Yes
ASA 5545-X | No | 750,000 | - | - | Yes | Yes | Yes
ASA 5555-X | No | 1 million | - | - | Yes | Yes | Yes
Juniper SRX 340 | No | 256,000 | - | - | Yes | Yes | Yes
Juniper SRX 1500 | No | 2 million | - | - | Yes | Yes | Yes
Brocade ADX 1000 | Yes | 4 - 8 million | 7,250 - 14,500 | 64,000 | Yes (but not supported as a firewall) | No | Yes
F5 1600 | Yes | 1 million | 5,000 | 1 million | No | No | Yes
F5 3600 | Yes | 8 million | 10,000 | 1 million | No | No | Yes

<sup>1</sup> A license upgrade might be required to reach Maximum SSL TPS.

<sup>2</sup> We recommend using a Cisco ASA as the RackConnect edge device type.

### RackConnect specific overview

Device | Maximum RC cloud servers<sup>1</sup> | RC network device config options | RackConnect v2.0 compatible | RackConnect v3.0 compatible | Maximum throughput<sup>2</sup> <br /> (Cloud<->Dedicated) <br /> (Cloud<->Internet)
--- | --- | --- | --- | --- | ---
ASA 5505 Sec+ | 5 | Edge or Edge+Connected | Yes | Yes | 150 Mbps
ASA 5508 | 50+ | Edge or Edge+Connected | Yes | Yes | 500 Mbps
ASA 5510 Sec+ | 25 | Edge or Edge+Connected | Yes | Yes | 300 Mbps
ASA 5520 | 50 | Edge or Edge+Connected | Yes | Yes | 450 Mbps
ASA 5540 | 80 | Edge or Edge+Connected | Yes | Yes | 650 Mbps
ASA 5550 | 100+ | Edge or Edge+Connected | Yes | Yes | 1 Gbps
ASA 5515-X | 50 | Edge or Edge+Connected | Yes | Yes | 1.2 Gbps
ASA 5525-X | 100+ | Edge or Edge+Connected | Yes | Yes | 2 Gbps
ASA 5545-X | 100+ | Edge or Edge+Connected | Yes | Yes | 3 Gbps
ASA 5555-X | 100+ | Edge or Edge+Connected | Yes | Yes | 4 Gbps
Juniper SRX 340 | 100+ | Edge or Edge+Connected | No | Yes | 1 Gbps
Juniper SRX 1500 | 100+ | Edge or Edge+Connected | No | Yes | 5 Gbps
Brocade ADX 1000 |  100+ | Connected only | No (not in RackConnect edge or connected device roles)	| Yes	|  2-9 Gbps
F5 1600 | 100+ | Connected or Edge+Connected | Yes | Yes | In: 500 Mbps <br /> Out: 500 Mbps
F5 3600 | 100+ | Connected or Edge+Connected | Yes | Yes | In: 1 Gbps <br /> Out: 1 Gbps

<sup>1</sup> Maximum cloud server guidelines are based on internal testing. Actual results might vary by production load and edge device type.

<sup>2</sup> RackConnect throughput is limited by RackConnect switching infrastructure connectivity at a theoretical maximum of 1 Gbps.
