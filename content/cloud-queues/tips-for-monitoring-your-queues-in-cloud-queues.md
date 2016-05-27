---
permalink: tips-for-monitoring-your-queues-in-cloud-queues/
audit_date:
title: Tips for monitoring your queues
type: article
created_date: '2013-08-21'
created_by: Megan Meza
last_modified_date: '2016-05-09'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

**Note:** Be sure to set up your [authentication token](/how-to/cloud-queues-curl-cookbook) before following the steps to create a queue by submitting an API request from the terminal.

Use the following procedures to get queue statistics, including the number of messages that exist in the queue, and the number of messages for each message status.

### Monitor through the API

Send the following request to get queue statistics:

    GET /v1/queues/fizbit/stats HTTP/1.1
    Host: marconi.example.com

The response should look similar to the following:

    HTTP:/1.1 200 OK
    {
      "messages": {
      "free": 146929,
      "claimed": 2409,
      "total": 149338,
      "oldest": {
          "href": "/v1/queues/fizbit/messages/50b68a50d6f5b8c8a7c62b01",
          "age": 63,
          "created": "2013-08-12T20:44:55Z"
      },
      "newest": {
          "href": "/v1/queues/fizbit/messages/50b68a50d6f5b8c8a7c62b01",
          "age": 12,
          "created": "2013-08-12T20:45:46Z"
      }
    }

### Monitor through the Cloud Control Panel

You can view statistics for a queue in the Cloud Control Panel.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Servers > Message Queueing**.

3. Click on a queue name to go to the Queue Details page.

      <img src="{% asset_path cloud-queues/tips-for-monitoring-your-queues-in-cloud-queues/3658-tipsformonitoring-2_0.png %}" width="793" height="590" border="1" alt=""  />

**Note:** If total is 0, the display does not include statistics for *oldest* and *newest* messages.

You can find more developer information in the [Getting Started Guide](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#getting-started) and [API Developer Guide for Cloud Queues](https://developer.rackspace.com/docs/cloud-queues/v1/developer-guide/#document-developer-guide).
