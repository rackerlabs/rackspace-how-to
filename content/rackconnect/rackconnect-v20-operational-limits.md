---
permalink: rackconnect-v20-operational-limits/
audit_date:
title: RackConnect v2.0 operational limits
type: article
created_date: '2012-10-30'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

This article describes the recommended RackConnect operational limits to use when building multiple cloud servers through the Cloud Servers API. These limits are guidelines and might not match what is possible in your environment. The following variables can affect the limits for your environment:

-   The number of RackConnect network policies that are active in your environment
-   The type of network devices that you are using with RackConnect

For details about the performance capabilities associated with each of the network devices supported by RackConnect, see [RackConnect network device comparison](/how-to/rackconnect-network-device-comparison).

### RackConnect API operational limits

Limit | Description | Value
--- | --- | ---
Maximum number of total cloud servers connected to RackConnect when bursting | The maximum number of cloud servers that you can deploy in your environment before you can expect to begin receiving consistent RackConnect deployment failures. If you need to deploy more than this number of cloud servers, we recommend contacting your RackConnect Support Team first. <br /><br /> **Note:** Not all customer environments (network devices) will be capable of handling 500 active cloud servers adequately. | 500
API: Optimal number of concurrent builds (bursting) | The maximum number of cloud servers you should burst at the same time. Exceeding this value might lead to a degradation in performance or to build errors or failures. | 50
API: Optimal time delay between builds | The minimum amount of time you should wait between cloud server builds. This limit applies even between cloud servers built during a single bursting process. Exceeding this value might lead to a degradation in performance or to build errors or failures. | 3 seconds
API: Optimal time delay between groups of builds | After bursting a group of cloud servers, the amount of time you should wait before bursting another group of cloud servers. The Once All Deployed time delay signifies that after bursting a group of cloud servers, you should wait until that group is fully deployed with RackConnect before attempting to burst another group of cloud servers. | Once All Deployed

### RackConnect Linux operational limits

The values shown in this table are estimates and might not match your results.

Limit | Description | Value
--- | --- | ---
Total potential 512 MB Linux builds per hour (bursting 50 at a time) | The total number of Linux cloud servers that you can expect to build in an hour by bursting 75 cloud servers, waiting for them to fully deploy with RackConnect, and then immediately bursting 75 more cloud servers, repeating this same bursting process for a full hour. | 150
Potential time to build 100 (512 MB) Linux cloud servers (bursting 50 at a time) | The total amount of time that you can expect it to take to build 100 Linux cloud servers by bursting 75 cloud servers, waiting for them to fully deploy with RackConnect, and then immediately bursting 25 more cloud servers. | 40 minutes

### RackConnect Windows operational limits

The values shown in this table are estimates and might not match your results.

Limit | Description | Value
--- | --- | ---
Total potential 1 GB Windows builds per hour (bursting 50 at a time) | The total number of Windows cloud servers that you can expect to build in an hour by bursting 75 cloud servers, waiting for them to fully deploy with RackConnect, and then immediately bursting 75 more cloud servers, repeating this same bursting process for a full hour. | 100
Potential time to build 100 (1 GB) Windows cloud servers (bursting 50 at a time) | The total amount of time that you can expect it to take to build 100 Windows cloud servers by bursting 75 cloud servers, waiting for them to fully deploy with RackConnect, and then immediately bursting 25 more cloud servers. | 60 minutes

### Summary of findings

- If you need to create more than 500 cloud servers in your RackConnect environment, we recommend contacting your RackConnect Support Team first. Because of the time required to deploy more than 500 cloud servers, it might be feasible only in static environments that will not change often.

- For the best results, there should always be a 3-second time delay between API build calls when multiple cloud servers are built simultaneously.

- For the best results, you should burst no more than 50 cloud servers at once (with a 3-second delay between builds), wait for them to all go into a RackConnect Deployed status, and then burst no more than 50 more, repeating the same bursting process until the number of cloud servers you need is reached.

- The Once All Deployed time delay signifies that after bursting a group of cloud servers, you should wait until that group is fully deployed with RackConnect before attempting to burst another group of cloud servers.

- If you follow the limits in this article, there should not be a significant time difference (normally less than 20 percent) between building smaller and larger cloud server flavors.

For more information about using the available APIs, see the following documentation:

-   [Cloud Servers API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/)
-   [RackConnect v2.0 API](/how-to/the-rackconnect-v20-api)
-   [Programmatically determine the RackConnect v2.0 automation status of your cloud servers](/how-to/how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud)
