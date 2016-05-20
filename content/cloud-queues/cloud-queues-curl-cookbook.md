---
permalink: cloud-queues-curl-cookbook/
audit_date:
title: Cloud Queues cURL Cookbook
type: article
created_date: '2013-08-21'
created_by: Megan Meza
last_modified_date: '2016-05-02'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

Cloud Queues are an open source message queue implementation that
utilizes a RESTful HTTP interface to provide an asynchronous
communications protocol which is one of the main requirements in todays
scalable applications. Using a queue as a communication layer, the
sender and receiver of the message do not need to interact with the
message queue at the same time. As a result, these can scale
independently and be less prone to individual failures.

Cloud Queues support publisher-subscriber and producer-consumer
patterns. This article reviews the terminology used with Cloud Queues followed by examples of common cURL commands.

For more information on available Cloud Queues API resources and methods and cURL request and response examples, see the API Reference section in the [Cloud Queues Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-api-reference).

### Cloud Queues terminology

-   **Queue** - A logical entity that groups messages. Ideally a queue is
    created per work type. For example if you want to compress files,
    you would create a queue dedicated for this job. Any application
    that reads from this queue would only compress files.
-   **Message** - Messages are stored in a queue and exist until deleted by a
    recipient or automatically by the system based on a
    TTL (time-to-live) value. Messages store meaningful data for
    the application.
-   **Worker** - An application that reads one or many messages from the
    queue.
-   **Producer** - An application that creates messages in a queue.
-   **Claim** - A mechanism to mark messages so that other workers will
    not process the same messages.
-   **Publisher - Subscriber** - A pattern where all worker applications
    have access to all messages in the queue. Workers can't delete or update messages.
-   **Producer - Consumer** - A pattern where each worker application that
    reads the queue has to claim the message in order to prevent
    duplicate processing. Later, when work is done, the worker is
    responsible from deleting the message. If a message isn't deleted in a
    predefined time, it can be claimed by other workers.
-   **Message Time to Live (TTL)** - Defines how long a message will be accessible.
-   **Claim Time to Live (TTL)** - Defines how long a message will
    be in claimed state. A message can be claimed by one worker at
    a time.

### Use cURL to send requests

#### Authenticate

To send requests to the Rackspace Cloud Queues API, you need an authentication token to include in the `X-Auth-Token` header of each API request.

With a valid token, you can send API requests to any of the API service endpoints that you are authorized to use. The authentication response includes a token expiration date. When a token expires, you can send another authentication request to get a new one.

Follow the steps in the [Cloud Queues Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-getting-started/authenticate) to authenticate to the Rackspace Cloud.

#### List queues

This operation lists your existing queues, sorted alphabetically by name. If you have no queues in your account, this request returns a `204 No Content` error because there was no information to send back.

**Request**

    GET /v1/queues HTTP/1.1
    Host: ord.queues.api.rackspacecloud.com
    Content-type: application/json
    X-Auth-Token: 0f6e9f63600142f0a970911583522217
    Accept: application/json
    X-Project-Id: 806067

**Response**

    HTTP/1.1 200 OK
    Content-Length: 3170
    Content-Type: application/json; charset=utf-8
    Content-Location: /v1/queues

    {
       "queues":[
          {
             "href":"/v1/queues/036b184b28fcb548349af623079119c6a966cbc",
             "name":"036b184b28fcb548349af623079119c6a966cbc"
          },
          {
             "href":"/v1/queues/0441f28617afbdecf4887e635fd0777fb3cec38",
             "name":"0441f28617afbdecf4887e635fd0777fb3cec38"
          },
          {
             "href":"/v1/queues/0f8f0eff158922874536efa9cf8412b9e0fd07a",
             "name":"0f8f0eff158922874536efa9cf8412b9e0fd07a"
          },
          {
             "href":"/v1/queues/160f981379972a4a0afaee5f5394a5d960c410e",
             "name":"160f981379972a4a0afaee5f5394a5d960c410e"
          },
          {
             "href":"/v1/queues/2888a4527d0a11a3d82202d800f8e90eebd60ea",
             "name":"2888a4527d0a11a3d82202d800f8e90eebd60ea"
          },
          {
             "href":"/v1/queues/2ad8eeca7f53d480d8ca4885d620643bfc6a7f9",
             "name":"2ad8eeca7f53d480d8ca4885d620643bfc6a7f9"
          },
          {
             "href":"/v1/queues/3926ce2051db957d76a04cb2ea2d89fd49e6894",
             "name":"3926ce2051db957d76a04cb2ea2d89fd49e6894"
          },
          {
             "href":"/v1/queues/46b30ebd60186c30194039824e6405300dc0903",
             "name":"46b30ebd60186c30194039824e6405300dc0903"
          },
          {
             "href":"/v1/queues/486d5af3e057ee1a430eee3ee845aeb60c900d3",
             "name":"486d5af3e057ee1a430eee3ee845aeb60c900d3"
          },
          {
             "href":"/v1/queues/58e8622645f07c7673412acbed51abb97ddb25d",
             "name":"58e8622645f07c7673412acbed51abb97ddb25d"
          }
       ],
       "links":[
          {
             "href":"/v1/queues?marker=58e8622645f07c7673412acbed51abb9",
             "rel":"next"
          }
       ]
    }

#### Create a queue

This operation creates a new queue, which is required before you can post any messages.

**Request**

    PUT /v1/queues/demoqueue HTTP/1.1
    Host: ord.queues.api.rackspacecloud.com
    X-Auth-Token: 0f6e9f63600142f0a970911583522217
    Accept: application/json
    X-Project-Id: 806067

**Response**

    HTTP/1.1 201 Created
    Content-Length: 0
    Location: /v1/queues/demoqueue

#### Post a message

This operation posts the specified number of messages. You can submit up to 10 messages in a single request, but you must always encapsulate the messages in a collection container. For example, an array in JSON.

For more information about the `POST` message operation, see the [Cloud Queues Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#post-message).

**Request**

    POST /v1/queues/demoqueue/messages HTTP/1.1
    Host: ord.queues.api.rackspacecloud.com
    Content-type: application/json
    Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830
    X-Auth-Token: 0f6e9f63600142f0a970911583522217
    Accept: application/json
    X-Project-Id: 806067

    [
       {
          "ttl":300,
          "body":{
             "event":"BackupStarted"
          }
       },
       {
          "ttl":60,
          "body":{
             "play":"hockey"
          }
       }
    ]

**Response**

    HTTP/1.1 201 Created
    Content-Length: 149
    Content-Type: application/json; charset=utf-8
    Location: /v1/queues/demoqueue/messages?ids=51db6f78c508f17ddc924357,51db6f78c508f17ddc924358

    {
       "partial":false,
       "resources":[
          "/v1/queues/demoqueue/messages/51db6f78c508f17ddc924357",
          "/v1/queues/demoqueue/messages/51db6f78c508f17ddc924358"
       ]

#### Determine number of workers needed

Determine the number of workers for an application based on how many
message you expect to see. If the number of new messages coming in is
growing at a faster rate than the number of workers subscribed can
process, you probably need more workers. Determine this ratio by
creating a call to the `/queues/{queue_name}/stats endpoint` and looking
at the number of messages free vs. the total.

**Note:** Additional API calls with request and response examples can be found in the API Reference section of the [Cloud Queues Developer Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-api-reference).
