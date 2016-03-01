---
node_id: 3684
title: Listing Cloud Queues
type: article
created_date: '2013-09-16'
created_by: Megan Meza
last_modified_date: '2014-06-30'
last_modified_by: Jered Heeschen
product: Cloud Queues
product_url: cloud-queues
---

You have 2 options on listing your Cloud Queues.  You can use the
Control Panel or generate the list through your terminal.

#### In the Control Panel

-   In the Control Panel, click the **Queues** tab.
-   You will see you Cloud Queues listed under Cloud Queues in the
    resulting screen.

#### Or, In Your Terminal

-   Enter the following request in your terminal to list your Cloud
    Queues:

<!-- -->

        $ curl -i -X GET https://$ENDPOINT:443/v1/queues -H "X-Auth-Token: $TOKEN"

-   Watch for your Queues to be listed in the format of the following
    response:

<!-- -->

        HTTP/1.1 200 OK
        Content-Length: 140
        Content-Type: application/json; charset=utf-8
        Content-Location: /v1/queues
     {"queues": [{"href": "/v1/queues/samplequeue", "name": "samplequeue"}], "links": [{"href": "/v1/queues?marker=samplequeue", "rel": "next"}]}

