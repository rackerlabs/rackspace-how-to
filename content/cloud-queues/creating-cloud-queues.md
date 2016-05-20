---
permalink: creating-cloud-queues/
audit_date:
title: Create a Cloud Queue
type: article
created_date: '2013-09-16'
created_by: Megan Meza
last_modified_date: '2016-05-06'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

Creating a Cloud Queue can be accomplished through the [Cloud Control Panel](https://mycloud.rackspace.com) or
at the command line. After creating the Queue, you can use the
Control Panel for viewing Queue details or deleting the Queue as
needed. All other Queue commands will be completed through the command line.

**Note:** Be sure to [set up your authentication token](/how-to/cloud-queues-curl-cookbook)
before creating a queue by using the command line.

### Create a queue in the control panel

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the Servers tab, click **Message Queueing**.

3. Click the **Create Queue** button.

4. In the pop out box, enter a name for your queue, select your preferred region, and then click **Create Queue**.

When the queue is finished building, you will see the details for your
queue listed in the Control Panel. You will then need to complete the
steps under [Testing Your Queue](/how-to/cloud-queues-curl-cookbook)
in your terminal to begin posting messages to your Queue.

### Create a queue from the command line

You can create a queue from the command line by submitting a request to the Rackspace Cloud
Queues API. You need to provide the following values in your request:

-  `$TOKEN` - [valid Rackspace Cloud authentication token](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-getting-started/authenticate)
-  `$ENDPOINT` -  the Cloud Queues API endpoint returned in the service catalog

Use the following cURL command to create a queue using the Cloud Queues API:

    $ curl -i -X PUT https://$ENDPOINT:443/v1/queues/samplequeue -H "X-Auth-Token: $TOKEN"

The response should look similar to the following:

    HTTP/1.1 200 OK Content-Length: 140 Content-Type: application/json; charset=utf-8 Content-Location: /v1/queues {"queues": [{"href": "/v1/queues/samplequeue", "name": "samplequeue"}], "links": [{"href": "/v1/queues?marker=samplequeue", "rel": "next"}]}

#### Test your queue

You can test that your queue was created successfully by posting a message to it with the following cURL command:

    $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/messages -d \
    '[{"ttl": 300, "body": {"event": "one"}}]' \
    -H "Content-type: application/json" \
    -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" \
    -H "X-Auth-Token: $TOKEN"

The response should look similar to the following:

    HTTP/1.1 201 Created
    Content-Length: 93
    Content-Type: application/json; charset=utf-8
    Location: /v1/queues/samplequeue/51e840b61d10b20570d56ff4

    {"partial": false, "resources": ["/v1/queues/samplequeue/messages/51e840b61d10b20570d56ff4"]}
