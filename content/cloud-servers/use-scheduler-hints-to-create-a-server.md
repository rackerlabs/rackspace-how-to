---
permalink: use-scheduler-hints-to-create-a-server/
audit_date: '2019-02-18'
title: Use scheduler hints to create a server
type: article
created_date: '2019-02-18'
created_by: Rackspace Community
last_modified_date: '2019-02-18'
last_modified_by: Cat lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article covers the scheduler hint Application Programmer Interface (API)
extension and provides an example of how to use it when building a cloud server.

This process requires use of the API, so basic knowledge of how to generate
authentication tokens and how to interact with the API by using curl is required.

### The scheduler hint extension

The scheduler hint extension enables you to specify the proximity of newly
provisioned cloud servers to already existing cloud servers on your account.
For more details on why this is important, see our
[Cloud Server API Guide](https://developer.rackspace.com/docs/cloud-servers/v2/extensions/ext-sched-hint/).

### Create a server with scheduler hints

You can create a server with scheduler hints by using curl calls or API browser
plug-ins. Make sure that you have the server Universal Uniform Identifiers (UUIDs)
for any servers that you want to build *close to* or *far away* from. You can
find the UUIDs on the **Server Details** page in the **Servers** section of the
[Cloud Control Panel](https:\\login.rackspace.com).

In the following cURL examples, substitute the following variables with the
corresponding values for your account:

- **region**: The region of your new server.

- **yourAccountNumber**: Your Rackspace account number.

- **yourAuthToken**: An authentication token from the Identity service.

- **serverUUID**: The UUID of the cloud server that you are building near to or far from.

- **serverName**: The name of your new cloud server.

- **serverImage**: The UUID of the server image for your new server.

- **flavorID**: The ID of the flavor for your new server.


### Create a server near another server

Use the following cURL statement to create a new server near an existing server:

    curl -XPOST "https://<region>.servers.api.rackspacecloud.com/v2/<yourAccountNumber>/servers" \
      -H "X-Auth-Token: <yourAuthToken>" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -d '{"os:scheduler_hints":{"public_ip_zone:near":["<serverUUID>"]},"server":{"name":"<serverName>","imageRef":"<serverImage>","flavorRef":"<flavorID","max_count":1,"min_count":1,"networks":[{"uuid":"00000000-0000-0000-0000-000000000000"},{"uuid":"11111111-1111-1111-1111-111111111111"}]}}'


### Create a server far away from another server

Use the following cURL statement to create a new server near an existing server:

    curl -XPOST "https://<region>.servers.api.rackspacecloud.com/v2/<yourAccountNumber>/servers" \
      -H "X-Auth-Token: <yourAuthToken>" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -d '{"os:scheduler_hints":{"public_ip_zone:far":["<serverUUID>"]},"server":{"name":"<serverName>","imageRef":"<serverImage>","flavorRef":"<flavorID","max_count":1,"min_count":1,"networks":[{"uuid":"00000000-0000-0000-0000-000000000000"},{"uuid":"11111111-1111-1111-1111-111111111111"}]}}'