---
permalink: cloud-queues-message-patterns/
audit_date:
title: Cloud Queues message patterns
type: article
created_date: '2014-04-24'
created_by: Megan Meza
last_modified_date: '2016-05-02'
last_modified_by: Stephanie Fillmon
product: Cloud Queues
product_url: cloud-queues
---

Cloud Queues was built to be flexible for a wide variety of messaging
needs. This article explains some common patterns and their possible
variations.

### Task distribution

In the task distribution pattern, customers use Cloud Queues much like
Amazon Simple Queue Service (SQS) to feed worker pools, as follows:

1. A producer pushes a message into a queue.
2. A worker claims the message.
3. A worker processes the message.
4. The worker deletes the message.

Each step in the process can have the following variations:

- **Step 1 - variation 1:** One or more producers push several messages into a queue. The worker
  can claim batches of messages or a single message at a time.

- **Step 2 - variation 1:** The worker does not claim the message before it expires. The
  producer should be adjusted to use a higher TTL value for messages, or
  the worker should poll more frequently.

- **Step 2 - variation 2:** There are no messages to claim, because all messages have been
  consumed by this or other workers. The worker continues to periodically send requests to claim messages until new messages are
  available. Alternatively, a governor process might choose to autoscale the worker pool based on load (which can be checked by using
  GET request to retrieve statistics for the queue, or by monitoring whether individual workers are idle).

- **Step 3 - variation:** The worker crashes after claiming the message, but before processing
  it. The claim on the message will eventually expire, after which the
  message will be made available again to be claimed by another worker.

- **Step 4 - variation:** The worker crashes after processing the message but before deleting
  it. The next worker to claim the message checks whether the message has
  already been processed before proceeding. In some cases,
  double-processing of a message might be acceptable, in which case no
  check is necessary.

### Pub-sub

Pub-Sub stands for Publisher-Subscriber, and it means notifying one or
more consumers or subscribers of an event, as follows:

1. The publisher pushes message X into the Queue
2. Subscriber A lists messages in queue and gets message X.
3. Subscriber B lists messages in queue, gets message X.
4. Subscribers A and B individually process message X.

Step 2 in the process can have the following variations:

- **Step 2 - variation 1:** The subscriber has already listed messages in a previous round. The
  subscriber submits a "next" marker to tell the server what messages it
  has already seen, so that the server returns only new
  messages to the subscriber.

- **Step 2 - variation 2:** The subscriber does not list messages before message X expires. The
  producer should be adjusted to use a higher TTL value when posting
  messages, the subscriber should poll more often, or both.

- **Step 2 - variation 3:** All messages have been listed. The subscriber gets an empty
  response, and continues to periodically list messages using the queue's
  last known marker, until it gets a non-empty response.

- **Step 2 - variation 4:** The subscriber crashes before it can get message X. A process
  monitor would simply restart the subscriber, and the subscriber would be able to get
  message X as long as it is able to poll within the TTL period set by the publisher.

### Point-to-point

In this pattern, each agent gets its own queue. A "queue" resource is
extremely lightweight in Cloud Queues, so users can create hundreds of
thousands of them without problem.

Note that bidirectional communication requires only a single queue.

1. The controller pushes a message into the queue.
2. The agent lists messages in the queue, gets the message.
3. The agent performs the requested action.
4. The agent pushes a result message into the queue.
5. The controller lists messages in the Queue and gets the results
message.

A couple steps in the process can have the following variations:

- **Step 2 - variation 1:** The agent could claim messages, but it is slower than simply listing
  messages, and claiming isn't necessary when only one client will ever
  read from the queue.

- **Step 2 - variation 2:** The agent crashes before getting the message. As soon as the agent
   restarts, it can still get the message if it restarts within the TTL
   period set by the controller.

- **Step 4 - variation 1:** The agent crashes before posting the result message. The controller
  should have a timeout period after which it no longer expects a response
  from its request.

- **Step 4 - variation 2:** If no result is expected, this step and the next step are skipped.

### Auditing

In auditing, users add an additional observer that is constantly listing
and recording messages in a queue. This observer could be a CLI
"tail"-like script, or a passive server process logging everything as it
comes through.

Auditing helps in diagnosing problems or bugs in the message producers.
It can also ensure that messages were processed correctly, for example,
if users were using Cloud Queues as part of a metering solution and they
wanted to audit their records to ensure billable events were all
submitted to the billing system correctly.

However, having the ability to delay messages from being claim-able for
a certain period of time is a feature still needed in order to make
auditing work really well. Such a feature would give the auditor a
chance to list a message before the worker deletes it. Today, workers
can pause a specified number of seconds after claiming a message before
deleting it, but this process will be more graceful after message delays
are implemented.
