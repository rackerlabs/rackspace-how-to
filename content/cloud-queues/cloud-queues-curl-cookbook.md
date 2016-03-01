---
node_id: 3655
title: Cloud Queues cURL Cookbook
type: article
created_date: '2013-08-21'
created_by: Megan Meza
last_modified_date: '2015-09-01'
last_modified_by: Catherine Richardson
product: Cloud Queues
product_url: cloud-queues
---

### What are Cloud Queues?

Cloud Queues are an open source message queue implementation that
utilizes a RESTful HTTP interface to provide an asynchronous
communications protocol which is one of the main requirements in todays
scalable applications. Using a queue as a communication layer, the
sender and receiver of the message do not need to interact with the
message queue at the same time. As a result, these can scale
independently and be less prone to individual failures.

Cloud Queues support publisher-subscriber and producer-consumer
patterns. Let's review the terminology we'll be using and then the curl
samples.

### Terminology

-   Queue, is a logical entity that groups messages. Ideally a queue is
    created per work type. For example if you want to compress files,
    you would create a queue dedicated for this job. Any application
    that reads from this queue would only compress files.
-   Message, is stored in a queue and exists until it is deleted by a
    recipient or automatically by the system based on a
    TTL (time-to-live) value. Message stores meaningful data for
    the application.
-   Worker, is an application that reads one or many messages from the
    queue
-   Producer, is an application that creates messages in a queue.
-   Claim, is a mechanism to mark messages so that other workers will
    not process the same messages.
-   Publisher - Subscriber, is a pattern where all worker applications
    have access to all messages in the queue. Workers can't (shall not)
    delete / update messages.
-   Producer - Consumer, is a pattern where each worker application that
    reads the queue has to claim the message in order to prevent
    duplicate processing. Later, when work is done, worker is
    responsible from deleting the message. If message isn't deleted in a
    predefined time, it can be claimed by other workers.
-   Message TTL, is time-to-live value and defines how long a message
    will be accessible.
-   Claim TTL, is time-to-live value and defines how long a message will
    be in claimed state. A message can be claimed by one worker at
    a time.

### Queue cURL Commands

#### **Get Authentication Token**

You will need to get an authentication token in order to use with the
following calls.

First, assign your Rackspace Cloud username, Rackspace API key, and
Rackspace endpoint to shell variables to make getting a token just a
copy-paste. (For information about viewing your API key, see [View and
reset your API
key](/how-to/view-and-reset-your-api-key).)

        $ USERNAME=my-username
        $ APIKEY=my-long-api-key
        $ ENDPOINT=ord.queues.api.rackspacecloud.com
        $ echo $USERNAME
        my-username
        $ echo $APIKEY
        my-long-api-key
        $ echo $ENDPOINT
        ord.queues.api.rackspacecloud.com

Use curl to populate TOKEN variable.

***Request***

        $ TOKEN=`curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' -d '{"auth":{"RAX-<br>
        KSKEY:apiKeyCredentials":{"username":"$USERNAME", "apiKey":"$APIKEY"}}}' -H "Content-Type: application/json" <br>
        | python -c "import sys,json;print json.loads(sys.stdin.readlines()[0])['access']['token']['id']"`

***Check if TOKEN value is set***

        $ echo $TOKEN
        0998e7a6des3344f91184f213eaacbe7

    Do a quick check if TOKEN works, by listing the queues we have.

***Request***

        $ curl -i -X GET https://$ENDPOINT:443/v1/queues -H "X-Auth-Token: $TOKEN"

***Response***

        HTTP/1.1 204 No Content

We don't have a queue yet so we get the expected "204 No Content"
result. If there was a problem with the TOKEN we would get "401
Unauthorized".

#### **Get Node Health**

Let's see if there is a service we can talk to.

***Request***

        $ curl -i -X GET https://$ENDPOINT:443/v1/health -H "X-Auth-Token: $TOKEN"

***Response***

        HTTP/1.1 204 No Content

Here, we get a 204 response, even though it may seem like something is
wrong with the service, this call is just to see if service can reply
back. So, 204 is good. Maybe this is an indication that queues are
brief, to the point and don't like chatter.

#### **Create a Queue**

We will have to create a queue in order to be able to post messages
into. Queues are not created with the first message so we need to send
the request below to create a queue named "samplequeue".

***Request***

    $ curl -i -X PUT https://$ENDPOINT:443/v1/queues/samplequeue -H "X-Auth-Token: $TOKEN"

***Response***

    HTTP/1.1 201 Created Content-Length: 0 Location: /v1/queues/samplequeue

#### **List Queues**

So far we have one queue, let's list our queues.

***Request***

        $ curl -i -X GET https://$ENDPOINT:443/v1/queues -H "X-Auth-Token: $TOKEN"

***Response***

        HTTP/1.1 200 OK
        Content-Length: 140
        Content-Type: application/json; charset=utf-8
        Content-Location: /v1/queues

        {"queues": [{"href": "/v1/queues/samplequeue", "name": "samplequeue"}], "links": [{"href": "/v1/queues?marker=samplequeue", "rel": "next"}]}

#### **Post a Message**

**Note**: Smaller payloads will keep your bandwidth low. If your
json data will be large in your submitted messages (such as PDF files or
video conversion requests) be sure to store the large files in another
locations (like Cloud Files) and just refer to a link to the location in
your message.

As we have a queue named `samplequeue` we can now post a message to the
queue. We will post a message with a TTL value of 300 and it will have a
key-value pair in the body as `"event" : "one"`.

***Request***

        $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/messages -d '
        [{"ttl": 300, "body": {"event": "one"}}]
        ' -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" -H "X-Auth-Token: $TOKEN"

***Response***

        HTTP/1.1 201 Created
        Content-Length: 93
        Content-Type: application/json; charset=utf-8
        Location: /v1/queues/samplequeue/51e840b61d10b20570d56ff4

        {"partial": false, "resources": ["/v1/queues/samplequeue/messages/51e840b61d10b20570d56ff4"]}

#### **Post Messages**

Queues support posting 10 messages at the same time, so lets try to post
two within the same request.

***Request***

        $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/messages -d '
        [
            {"ttl": 300, "body": {"event": "two"}},
            {"ttl": 60, "body": {"event": "three"}}
        ]
        ' -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830" -H "X-Auth-Token: $TOKEN"

***Response***

        HTTP/1.1 201 Created
        Content-Length: 153
        Content-Type: application/json; charset=utf-8
        Location: /v1/queues/samplequeue/messages?ids=51e840e71d10b2055fd565fb,51e840e71d10b2055fd565fc

        {partial": false, "resources": ["/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fb", "/v1/queues/samplequeue/messages/51e840e71d10b2055fd565fc"]}

Above, if you check the response, you will see that the queue returned
two ids. It is always a good practice to post messages in batches as
network latency will be a smaller factor in overall performance compared
to sending one message at a time.

#### **Get Messages**

We can get 10 messages with a call

***Request***

        $ curl -i -X GET https://$ENDPOINT:443/v1/queues/samplequeue/messages?echo=true -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830"

***Response***

        HTTP/1.1 200 OK
        Content-Length: 461
        Content-Type: application/json; charset=utf-8
        Content-Location: /v1/queues/samplequeue/messages?echo=true

        {"messages": [
        {"body": {"event": "two"}, "age": 230, "href": "/v1/queues/samplequeue/messages/51e84e8b1d10b2055fd565fd", "ttl": 300},
        {"body": {"event": "two"}, "age": 3, "href": "/v1/queues/samplequeue/messages/51e84f6e1d10b20571d56f0e", "ttl": 300},
        {"body": {"event": "three"}, "age": 3, "href": "/v1/queues/samplequeue/messages/51e84f6e1d10b20571d56f0f", "ttl": 60}], "links": [{"href": "/v1/queues/samplequeue/messages?marker=9&echo=true", "rel": "next"}
        ]}

Wait for 60 seconds to see 2 messages instead of 3 as message with ttl
value of 60 seconds expire. You can also get a specific message by
providing the message id.

***Request***

        $ curl -i -X GET https://$ENDPOINT:443/v1/queues/samplequeue/messages?echo=true&ids=51e84e8b1d10b2055fd565fd -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830"

***Response***

        HTTP/1.1 200 OK
        Content-Length: 261
        Content-Type: application/json; charset=utf-8
        Content-Location: /v1/queues/samplequeue/messages?echo=true

        {"messages": [
        {"body": {"event": "two"}, "age": 230, "href": "/v1/queues/samplequeue/messages/51e84e8b1d10b2055fd565fd", "ttl": 300}
        ]}

#### **Claim Messages**

Claiming a message is pretty much like marking a message so it will be
invisible when another worker wants to claim messages. By default 10
messages are claimed. In the sample request below, we will get 2
messages claimed as we use pass 2 as limit.

***Request***

        $ curl -i -X POST https://$ENDPOINT:443/v1/queues/samplequeue/claims?limit=2 -d '
        { "ttl" : 60, "grace": 60}
        ' -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830"

"Client-ID: QClient" is the field value for the Client-ID.

***Response***

    HTTP/1.1 200 OK
    Content-Length: 306
    Content-Type: application/json; charset=utf-8
    Location: /v1/queues/samplequeue/claims/51e852d01d10b2056dd5703c [{"body": {"event": "two"}, "age": 5, "href": "/v1/queues/samplequeue/messages/51e852cb1d10b20571d56f10?claim_id=51e852d01d10b2056dd5703c", "ttl": 300}, {"body": {"event": "three"}, "age": 5, "href": "/v1/queues/samplequeue/messages/51e852cb1d10b20571d56f11?claim_id=51e852d01d10b2056dd5703c", "ttl": 120}]

#### **Delete a Message**

***Request***

        $ curl -i -X DELETE https://$ENDPOINT:443/v1/queues/samplequeue/messages/51e852cb1d10b20571d56f10?claim_id=51e852d01d10b2056dd5703c -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -H "Client-ID: e58668fc-26eb-11e3-8270-5b3128d43830"

***Response***

        HTTP/1.1 204 No Content

204 is a valid response which validates that there isn't a message with
the given message and claim id. It doesn't necessarily say that message
is deleted, though.

#### Determine Number of Workers Needed

Determine the number of workers for an application based on how many
message you expect to see.  If the number of new messages coming in is
growing at a faster rate than the number of workers subscribed can
process, you probably need more workers. Determine this ratio by
creating a call to the `/queues/{queue_name}/stats endpoint` and looking
at the number of messages free vs. the total.

**Please Note**: We have additional developer information available in
our API documentation.  Listed under Other Products, we have a [Getting
Started
Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#getting-started)
and an [API Developer
Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-developer-guide)
for Cloud Queues.
