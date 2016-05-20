---
permalink: setting-up-a-producer-consumer-model-with-cloud-queues/
audit_date:
title: Set up a producer-consumer model with Cloud Queues
type: article
created_date: '2013-08-21'
created_by: Megan Meza
last_modified_date: '2016-05-09'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

Setting up a Producer-Consumer model in Cloud Queues consists of posting
messages to your queue, consumers claiming messages from that queue, and
then deleting the completed message.

The producer-consumer mode has the following characteristics:

-   Messages are acted upon by one (and only one) worker.
-   Worker must delete message when done.
-   TTL restores message to unclaimed state if worker never finishes.
-   Ideal for dispatching jobs to multiple processors.

This mode is ideal for dispatching jobs to multiple processors.

### Post messages to a queue

Queues support posting 10 messages at the same time. The following cURL command posts two messages within the same request:

    $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/messages \
    -d '[{"ttl": 300, "body": {"event": "two"}}, {"ttl": 60, "body": {"event": "three"}}]' \
    -H "Content-type: application/json" \
    -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" \
    -H "X-Auth-Token: $TOKEN"

**Note:** Use Claim TTLs to protect from agent/client failure while they have a message claimed. In the event that a server goes offline and cannot complete the message it has claimed, the claim TTL will expire and that message will be returned to the queue for other consumers or workers to claim.

The response should look similar to the following:

    HTTP/1.1 201 Created     
    Content-Length: 153     
    Content-Type: application/json; charset=utf-8     
    Location: /v1/queues/samplequeue/messages?ids=51e840e71d10b2055fd565fb,51e840e71d10b2055fd565fc{partial": false, "resources": ["/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fb", "/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fc"]}

In the response, you can see that the queue returned
two IDs. It is always a good practice to post messages in batches as
network latency will be a smaller factor in overall performance compared
to sending one message at a time.

### Claim messages

Claiming a message is similar to marking a message so that it will be
invisible when another worker wants to claim messages. Cloud Queues claims 10 messages by default.

The following cURL command limits the number of claims to two:

    $ curl -i -X POST https://\
    $ENDPOINT:443/v1/queues/samplequeue/claims?limit=2 -d ' { "ttl": 60, "grace": 60} '\
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830"

The response should look similar to the following. Note that there are only two messages returned because of the limit used in the request.

    HTTP/1.1 200 OK Content-Length: 306
    Content-Type: application/json; charset=utf-8
    Location: /v1/queues/samplequeue/claims/51e852d01d10b2056dd5703c [{"body": {"event": "two"}, "age": 5,         "href":"/v1/queues/samplequeue/messages/51e852cb1d10b20571d56f10?claim_id=51e852d01d10b2056dd5703c",
    "ttl": 300}, {"body": {"event": "three"}, "age": 5, "href":
    "/v1/queues/samplequeue/messages/51e852cb1d10b20571d56f11?claim_id=51e852d01d10b2056dd5703c",
    "ttl": 120}]

### Delete messages

The following cURL command deletes messages that have been processed by a worker:

    $ curl -i -X DELETE $API_ENDPOINT/queues/samplequeue/messages/51ca00a0c508f154c912b85c?claim_id=51ca011c821e7250f344efd6 \
    -H "Content-type: application/json" \
    -H "X-Auth-Token: $AUTH_TOKEN" \
    -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" \
    -H "Accept: application/json" \
    -H "X-Project-Id: $TENANT_ID"

The response should look similar to the following:

    HTTP/1.1 204 No Content

`204 No Content` validates that there are no existing messages with
the given message and claim id. However, it doesn't necessarily indicate that message
is deleted.

For additional API documentations, see the following resources:

- [Rackspace Cloud Queues Getting Started Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#getting-started)
- [Rackspace Cloud Queues API Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#developer-guide)
