---
permalink: disabling-tcp-offloading-in-windows-server-2012/
audit_date: '2019-08-19'
title: Disable TCP Offloading in Windows Server 2012
type: article
created_date: '2014-01-16'
created_by: Kyle Laffoon
last_modified_date: '2019-08-19'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

TCP offload engine is a function used in network interface cards (NIC)
to offload processing of the entire TCP/IP stack to the network
controller. By moving some or all of the processing to dedicated
hardware, a TCP offload engine frees the system's main CPU for other
tasks. However, TCP offloading has been known to cause some issues, and
disabling it can help avoid these issues.

**Note:** We recommend keeping TCP offloading enabled in any source
images that you use to build new servers and then disabling TCP
offloading in the source image after the new server is built. If TCP
offloading is disabled on an image, a server build from that image might
fail. 

### Disable TCP offloading

1.  In the Microsoft&reg; Windows&reg; server, open the **Control Panel**.

2.  Select **Network and Internet > Network and Sharing Center > Change Adapter Settings**.

3.  Right-click on each of the **private** and **public** adapters,
    select **Configure** from the **Networking** menu, and click
    the **Advanced** tab. The window displays the TCP offload settings for the
    Citrix adapter as shown in the following image:

    <img src="{% asset_path cloud-servers/disabling-tcp-offloading-in-windows-server-2012/TCPOffloading9.png %}" width="410" height="459" />

4.  Select each of the following TCP offload options, changing the value to **Disabled**, and click **OK**:

    -   IPv4 Checksum Offload
    -   Large Receive Offload
    -   Large Send Offload
    -   TCP Checksum Offload
