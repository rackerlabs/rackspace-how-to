---
permalink: the-rackconnect-v20-api/
audit_date:
title: RackConnect v2.0 API
type: article
created_date: '2012-08-21'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**Applies to:** RackConnect v2.0

The RackConnect API provides a way for you to access certain read-only
information about your cloud servers and their RackConnect
configuration. The RackConnect API is available to all customers who can
manage their RackConnect configurations
through the [MyRackspace portal](https://my.rackspace.com/) interface.

You can use the RackConnect API to access the following information:

-   When you are scripting or automating any post-server-build
    configuration tasks, you can query the API to learn when RackConnect
    automation is done configuring your server. If you have this
    information, you can avoid performing tasks that conflict with
    the automation.

-   When you are setting up the network configuration manually on your
    cloud server (when the Configure Network Stack automation feature is
    disabled on your cloud account), the API can return the gateway IP
    address to use as the default gateway on your server. You can
    use this address to correctly configure the cloud server
    network stack.

-   When you want to determine the specific actions that the automation
    will perform against one of your cloud servers, you can view the
    status of each automation feature for a specific server.

**Note:** In addition to using the RackConnect API, you can now use the
Cloud Servers API to query the RackConnect automation status of your
cloud servers. The benefit of using the Cloud Servers API is that you do not need to perform the query from the cloud server for which you want the status. The limitations of this method are that only the RackConnect automation status is available, and this method is compatible only with cloud servers. If you are interested in this method, see [Programmatically determine the RackConnect v2.0 automation status of your cloud servers](/how-to/how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud).

### API basics

The RackConnect API is exposed via regional endpoints. Use the endpoint
that matches the region where your cloud server resides.

-   https://dfw.api.rackconnect.rackspace.com
-   https://hkg.api.rackconnect.rackspace.com
-   https://iad.api.rackconnect.rackspace.com
-   https://lon.api.rackconnect.rackspace.com
-   https://ord.api.rackconnect.rackspace.com
-   https://syd.api.rackconnect.rackspace.com

**Note:** The URLs for each API operation include a version number. When
future versions of the calls available, this article will be updated. It
is important to note that this version number does not relate to the
version of RackConnect that you are using.

### Authentication

The RackConnect API authenticates all requests based on the source IP
address that is initiating the request. The API endpoints are exposed
only on the private (ServiceNet) network, so the private (ServiceNet)
network IP address of your cloud server is used to determine the source
of the request and to respond with the appropriate information. API
responses are limited to information about the specific cloud
server from which you are querying. Hypervisor-level protections are in place that prevent these IP
addresses from being spoofed, ensuring that the instance making the
request to the API endpoint is, in fact, your cloud server.

**Note:** You cannot query the RackConnect API from outside of your cloud
server.

### Rate limiting

There is a limit of 30 requests per minute from each of your cloud
servers. If you exceed the number of allowed requests per minute, you
will receive an `HTTP 403 (Forbidden)` response code. The counter resets
each minute.

### Operations

The following operations are supported by the API. The `format` query
string parameter is optional on each request. If it is not supplied, the
default response format is used.

`GET /v1/automation_status?format={format}`

-   Response formats: text, JSON, XML
-   Default response format: text
-   Expected HTTP response code: 200
-   Description: Returns the automation status of the cloud server
    (DEPLOYING, DEPLOYED, or FAILED).

`GET /v1/automation_status/details?format={format}`

-   Response formats: JSON, XML
-   Default response format: JSON
-   Expected HTTP response code: 200
-   Description: Returns the automation status of the cloud server
    (DEPLOYING, DEPLOYED, or FAILED) and an array of cloud server tasks with their associated statuses.

`GET /v1/gateway_ip?format={format}`

-   Response formats: text, JSON, XML
-   Default response format: text
-   Expected HTTP response code: 200
-   Description: Returns the gateway IP address for the cloud server. If the gateway IP address has not yet been assigned, an HTTP 404 response code is returned

`GET /v1/automation_features?format={format}`

-   Response formats: JSON, XML
-   Default response format: JSON
-   Expected HTTP response code: 200
-   Description: Returns a collection of automation features and their associated statuses for the cloud server

### API example

The following example uses cURL to retrieve the automation status.
Alternatively, you can use a web browser to query the RackConnect API.

**Request:**

    $ curl https://dfw.api.rackconnect.rackspace.com/v1/automation_status?format=text

**Response:**

    DEPLOYED
