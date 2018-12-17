---
permalink: cloud-servers-attaching-and-detaching-networks/
audit_date:
title: Attach and detach networks from a Cloud Server
type: article
created_date: '2013-12-17'
created_by: Rose Contreras
last_modified_date: '2016-07-07'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

You can attach (add) or detach (disconnect) networks from Cloud Servers by using the [Cloud Networks API](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/)
or the [Cloud Control Panel](http://mycloud.rackspace.com).

This article describes how to attach and detach networks by using the
Cloud Control Panel. Please be aware that if you attach networks to or
detach them from a cloud server, you might experience a brief
interruption, usually lasting less than a minute, in traffic hitting
your cloud server while networking is reset on the server.

### Exceptions (OnMetal and RackConnect v2)

OnMetal servers cannot attach and detach networks. For OnMetal, you must specify all desired networks at initial build time. While you can attach and detach networks from RackConnect v2 servers (API only), these actions are unsupported and will break Internet connectivity on your RackConnect v2 servers.

### To Attach (Add) a Network:

1.  Log in to the Cloud Control Panel at
    [mycloud.rackspace.com](http://mycloud.rackspace.com).

2.  On the Cloud Servers page, click the server to which  you want to
    attach a network. The details page for that server is displayed.

3.  Scroll to the Networks section and click **Add Network**.

    A pop-up box lists the networks that you can attach to this
    server.

4.  Select a network and click **Add Network**.

    You can also create a new cloud network and attach it to the
    server.

    **Note**: Adding networks may take several minutes.

    After the network is attached, it is displayed in the list of
    networks for that server.

    **Note**: Disconnecting networks may also take several minutes.


### To Detach (Disconnect) a Network:

You can detach a network from the server from the same page under the
Networks section. Please refer to the [Cloud Networks Developer Guide](https://developer.rackspace.com/docs/cloud-networks/v2/developer-guide/#document-overview/consequences-of-detaching) before you detach
Public or ServiceNet interfaces from cloud servers.

1.  Log in to the Cloud Control Panel at
    [mycloud.rackspace.com](http://mycloud.rackspace.com).

    **Note**: Disconnecting networks may also take several minutes. 

2.  On the Cloud Servers page, click the server from which you want to
    detach a network.

    The details page for that server is displayed.

3.  In the Networks section, click the gear icon next to the network
    that you want to detach.

4.  In the pop-up box, click **Disconnect Network**.

After the network is detached from the server, it is no longer displayed
in the list of networks for that server.
