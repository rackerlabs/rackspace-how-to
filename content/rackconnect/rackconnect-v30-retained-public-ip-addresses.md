---
permalink: rackconnect-v30-retained-public-ip-addresses/
audit_date:
title: RackConnect v3.0 retained public IP addresses
type: article
created_date: '2015-12-04'
created_by: Sean Laszakovits
last_modified_date: '2015-12-11'
last_modified_by: Nate Archer
product: RackConnect
product_url: rackconnect
---

With RackConnect v3.0, when a new cloud server is created and a public
IP address is assigned through the RackConnect v3.0 API or the myCloud
Portal, the public IP address is stored as a separate database record
that is linked to that server.

A RackConnect *public IP record* references a public IP address that has
been provided from an IP address block assigned exclusively to your
dedicated environment (the same IP address blocks used to assign public
IP addresses to dedicated servers).

By default, a RackConnect public IP record is destroyed when the
assigned server is deleted or the public IP address is unassigned from
that server. If you want to prevent this behavior, you can use
the *Retained Public IP Address* Automation Feature.

The RackConnect public IP record uses the `retain` flag
to enable or disable the Retained Public IP Address feature.
By default, the `retain` flag is set to false, and you can enable it
by using a RackConnect v3 API call. Enabling this flag not
only prevents the RackConnect public IP record from being deleted, but
also allows users to change the assigned cloud server on the fly.

### API capabilities

You can use the RackConnect v3 API to perform the following actions
related to public IP records.

-   List public IP records where the retain flag is set to true (or
    false).
-   Toggle the retain flag for a RackConnect public IP address that
    is currently assigned to a server.
-   Assign a public IP address with the `retain` flag set to true
    to a cloud server (the server must not have an existing public IP
    address at the time of assignment).
-   Move a public IP address from one cloud server to another (the
    destination server must not have an existing public IP address at
    the time of assignment).

    The old server's existing static NAT configuration (which is used to link the public IP address to the server's private IP address) on the edge network device is removed and replaced with a new static NAT configuration that translates the retained public IP address to the new server's private IP address.

-   Unassign a public IP address from a cloud server without
    deleting the RackConnect public IP record (if the public IP record
    has its `retain` flag set to true).

    Doing so completely removes the static NAT configuration (used to link the public IP address to its assigned server's private IP address) on the edge network device.

You can find detailed RackConnect v3 API documentation for the Retained Public IP Address feature at [http://docs.rcv3.apiary.io/#reference/public-ips/single-public-ip/modify-public-ip](http://docs.rcv3.apiary.io/#reference/public-ips/single-public-ip/modify-public-ip).

### Requirements

This section explains the requirements for and limitations of using the
Retained Public IP Address feature.

#### API only

The Retained Public IP Address feature is available only via the RackConnect v3
API. There is currently no UI support for the feature.

#### Limits

A default limit of five retained public IP addresses is applied to each
Cloud Account that is attached to a RackConnect v3 configuration.

If you do not know how many retained public IP addresses you have used,
you can request that Network Security report this value to you.

If you have reached your limit of retained public IP addresses, when you
attempt to set the `retain` flag for a specified public IP record, the
API responds with a message indicating that you have reached your limit

#### RackConnect automation

The retain feature relies on the use of RackConnect public IP records.
RackConnect public IP records are created as a result of RackConnect
automation assigning a public IP address. Therefore, public IP addresses
that were manually assigned and configured by Network Security are not
recognized by RackConnect automation. These addresses must be removed
before public IP address assignments or retainable public IP addresses
can be used.

### Caveats

When using the Retained Public IP Address feature, be aware of the
following caveats.

#### Removing a cloud network from an active cloud server

If a cloud network is removed from an active cloud server, any assigned
public IP records are also removed.

-   If the `retain` flag was set to false at the time of removal, the
    public IP record is deleted.
-   If the `retain` flag was set to true at the time of removal, the
    public IP record is *not* deleted. The assigned server is updated to
    be NULL (no owner). If you want the server to use the same public IP
    record, use the API call to reassign the server to the public
    IP address.

#### Moving a retained public IP address from one cloud server to another

When you move a retained public IP address from one cloud server to
another, the destination server must *not* have an existing public IP
address at the time of assignment. If the destination server has a
public IP address assigned, the API returns a message indicating that it
could not assign the new public IP address. The API call fails until the
destination server's existing public IP address assignment is removed.
