---
permalink: listing-cloud-queues/
audit_date:
title: List Cloud Queues
type: article
created_date: '2013-09-16'
created_by: Megan Meza
last_modified_date: '2016-05-09'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

There are two available methods for listing your available Cloud Queues: the Cloud Control Panel or through the command line.

### View queues in the control panel

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2. In the Servers tab, click on **Message Queueing**.

Your queues are listed on the Cloud Queues screen.

### View queues through the command line

Use the following cURL command to view your list of queues:

    $ curl -i -X GET https://$ENDPOINT:443/v1/queues -H "X-Auth-Token: $TOKEN"

The response should look similar to the following:

    HTTP/1.1 200 OK
    Content-Length: 140
    Content-Type: application/json; charset=utf-8
    Content-Location: /v1/queues
    {"queues": [{"href": "/v1/queues/samplequeue", "name": "samplequeue"}], "links": [{"href": "/v1/queues?marker=samplequeue", "rel": "next"}]}
