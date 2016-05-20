---
permalink: rackconnect-global-user-workflow/
audit_date:
title: RackConnect Global user workflow
type: article
created_date: '2015-10-16'
created_by: Sameer Satyam
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

RackConnect Global provides highly available, secure, private network
connectivity between Rackspace and your off-premises data centers or
your infrastructure at other cloud hosting providers, such as Microsoft
Azure. It allows you to share application workloads and data across
environments. For more details about the product, see
<http://www.rackspace.com/cloud/hybrid/rackconnect/global>.

This document shows the steps needed to establish a RackConnect Global
virtual circuit with Rackspace.

### Establish a RackConnect Global dedicated connection

Use this process only if you are colocated in the same facility as
Rackspace.

**Note**: If you are part of the Equinix Cloud exchange or a Microsoft
Azure customer and need to establish a RackConnect Global connection
with Rackspace, see the sections following this one.

1.  You order the RackConnect Global service using the dedicated connection method via our sales account team or appropriate Rackspace representative.

2.  You are responsible for the physical cross-connection to the Rackspace RackConnect Global edge devices. Rackspace generates and provides a Letter of Authority (LOA) that identifies the physical port and cage location for the RackConnect Global edge device.

3.  You submit the LOA and order the cross-connection via the colocation provider's portal. Currently, the only supported colocation provider is Equinix.

4.  The colocation provider makes the physical connection between you and RackConnect Global edge devices.

5.  Rackspace configures the RackConnect Global edge devices while you establish the virtual connection.

6. The virtual circuit is established.


### Establish a RackConnect Global connection via Equinix Cloud Exchange

Use this procedure if you are an Equinix Cloud Exchange customer.

**Note**: If you need to connect your on-premises infrastructure to
Rackspace via a dedicated connection or a Microsoft
Azure customer needing to establish RackConnect Global connectivity with
Rackspace, see the other sections in this article.

1.  Order the RackConnect Global service using a cloud exchange connection method via your sales account team or appropriate Rackspace representative.

2.  Rackspace generates a service key and provides it to you. You use the service key when requesting a new virtual circuit.

3.  You order a virtual circuit via the Equinix Cloud Exchange portal and initiate the virtual circuit using the service key.

4.  Rackspace completes the RackConnect Global Edge configuration.

5.  Rackspace accepts the virtual circuit request from you within the Cloud Exchange.

### Establish a RackConnect Global connection if you use Microsoft Azure (via Microsoft ExpressRoute)

This procedure applies if you are Microsoft Azure customer requiring a
private connection to your infrastructure at Rackspace.

**Note**: If you need to connect your on-premises infrastructure to
Rackspace via a dedicated connection or if you need to establish
RackConnect Global connectivity with Rackspace via Equinix Cloud
Exchange, please see the relevant sections in this article.

1.  You order RackConnect Global service to connect to Microsoft Azure via your sales account team or appropriate Rackspace representative.
    If you are a fanatical Azure customer, contact your appropriate Rackspace support representative.

2.  You configure Azure's dedicated virtual circuit and and provide the Azure Service Key to Rackspace for provisioning the Virtual Connection.

3.  Rackspace orders a virtual circuit on your behalf via the Equinix Cloud Exchange portal and initiates the virtual circuit provisioning using the service key.

4.  You complete the configuration on the cloud to establish the virtual circuit and BGP connection.

5. Rackspace completes the configuration on the RackConnect Global edge and backbone devices to establish the virtual circuit connection.
