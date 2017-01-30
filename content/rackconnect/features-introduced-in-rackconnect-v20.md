---
permalink: features-introduced-in-rackconnect-v20/
audit_date:
title: Features introduced in RackConnect v2.0
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**Previous section:** [Introducing RackConnect
v2.0](/how-to/introducing-rackconnect-v20)

**Applies to:** RackConnect v2.0

The 2.0 version of RackConnect added the following automation and
security features:

-   **Support for Rackspace Cloud Servers**, powered by    
    OpenStack<sup>&reg;</sup>

-   **RackConnect API**, which gives you a way to programmatically
    access certain read-only information about your cloud servers and
    their RackConnect configuration from within your cloud servers

-   **Improved RackConnect automation responsiveness to cloud server
    events**, which means that RackConnect picks up changes in your
    Cloud environment much faster

-   **A RackConnect Management Interface in the MyRackspace<sup>&reg;</sup> portal**,
    where you can perform the following tasks:
    -   Set RackConnect network policies.
    -   Manage cloud servers.
    -   View configuration details.
    -   View automation tasks and event logs.

-   **Network security policies:**
    -   Set once, applied automatically.
    -   Manage dedicated firewall, load balancer, and cloud server
        software firewalls.

-   **Managed software firewalls for cloud servers:**
    -   Iptables for Linux
    -   Advanced firewall for Windows

-   **Optional automation features:**
    -   Provision public IP addresses: Cloud servers are
        automatically provisioned with a public IP address from your
        dedicated network's public IP block.
    -   Configure network stack: Cloud servers are
        automatically configured with network connectivity to your
        dedicated environment.
    -   Manage software firewall: Cloud servers can be
        automatically load balanced based on server name matching or
        metadata.

**Important:** RackConnect adds a service-level user account called
**rackconnect** to each cloud server in a RackConnect solution. This
account enables RackConnect to automate network connectivity and
software firewalls on cloud servers as part of the RackConnect solution.
This account is for use only by the automated system, not by actual
Rackers (support personnel). It should not be deleted under any
circumstances.

### Next step

[RackConnect key terms](/how-to/rackconnect-key-terms)
