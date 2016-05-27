---
permalink: setting-up-a-pub-sub-model-in-cloud-queues/
audit_date:
title: Set up a publisher-subscriber model in Cloud Queues
type: article
created_date: '2013-08-21'
created_by: Megan Meza
last_modified_date: '2016-05-09'
last_modified_by: Rose Contreras
product: Cloud Queues
product_url: cloud-queues
---

Setting up a Publisher-Subscriber model in Cloud Queues consists of posting messages to
your queue and listing messages from your queue.

The publisher-subscriber model has the following characteristics:

-   All subscribers listen to the messages in the queue.
-   Messages are not claimed.
-   Subscribers can send a marker or cursor to skip messages already seen.
-   TTL deletes messages eventually.
-   Ideal model for sending event notifications to multiple listeners at once.

### Post messages to a queue

Queues support posting 10 messages at the same time. The following cURL command posts two messages within the same request:

    $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/messages \
    -d ' [{"ttl": 300, "body": {"event": "two"}}, {"ttl": 60, "body": {"event": "three"}}]'\
    -H "Content-type: application/json" \
    -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" \
    -H "X-Auth-Token: $TOKEN"

The response should look similar to the following:

    HTTP/1.1 201 Created     
    Content-Length: 153     
    Content-Type: application/json; charset=utf-8     
    Location: /v1/queues/samplequeue/messages?ids=51e840e71d10b2055fd565fb,51e840e71d10b2055fd565fc

    {
       "partial": false,
       "resources": [
          "/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fb",
          "/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fc"
        ]
    }

In the response, you can see that the API returned two IDs. You can minimize the impact of
network latency on overall performance of Cloud Queues by posting messages in batches instead
of posting one at a time.

### List messages from a queue

You can generate the list of messages from your queue by using the following cURL command:

    $ curl -i -X GET https://$ENDPOINT:443/v1/queues -H "X-Auth-Token: $TOKEN"

The API response returned lists the queues in the following format:

    HTTP/1.1 200 OK     
    Content-Length: 140     
    Content-Type: application/json; charset=utf-8     
    Content-Location: /v1/queues  
    {
       "queues":[
           {
               "href": "/v1/queues/samplequeue",
               "name": "samplequeue"
            }
        ],
       "links":[
          {
             "href": "/v1/queues?marker=samplequeue",
             "rel": "next"
          }
        ]
    }

To avoid getting messages the subscriber has already read, use marker semantics in your
API request. For example: `/v1/queues/{queue_name}/messages?marker=63`.

**Note:** You can retrieve messages with the marker by following the URLs in the links section of the JSON response.

For additional API documentations, see the following resources:

- [Rackspace Cloud Queues Getting Started Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#getting-started)
- [Rackspace Cloud Queues API Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#developer-guide)
