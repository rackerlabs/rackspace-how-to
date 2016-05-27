---
permalink: limits-for-cloud-big-data/
audit_date:
title: Limits for Cloud Big Data
type: article
created_date: '2014-03-28'
created_by: Rose Contreras
last_modified_date: '2016-01-21'
last_modified_by: Margaret Eker
product: Cloud Big Data
product_url: cloud-big-data
---

All accounts, by default, have a preconfigured set of thresholds (or
limits) to manage capacity and prevent abuse of the system. The system
recognizes *rate limits* and *absolute limits*. Rate limits are
thresholds that are reset after a certain amount of time passes.
Absolute limits are fixed.

### Rate limits

Rate limits are specified in both a human-readable wildcard URI and a
machine-processable regular expression. The regular expression boundary
matcher `^` takes effect after the root URI path. For example, the
regular expression `^/v1.0/clusters` would match the bold portion of the
following URL:
`https://dfw.bigdata.api.rackspacecloud.com/v1.0/clusters`

The following table specifies the default rate limits for all GET, POST,
PUT, and DELETE API operations for clusters.

| Verb              | URI            | Regular expression    | Default      |
|-------------------|----------------|-----------------------|--------------|
| GET changes-since | \*/clusters/\* | \^/vd+.d+/clusters.\* | 3 per minute |
| POST              | \*/clusters/\* | \^/vd+.d+/clusters.\* | 2 per minute |
| POST clusters     | \*/clusters/\* | \^/vd+.d+/clusters.\* | 50 per day   |
| PUT               | \*/clusters/\* | \^/vd+.d+/clusters.\* | 2 per minute |
| DELETE            | \*/clusters/\* | \^/vd+.d+/clusters.\* | 5 per minute |

Rate limits are applied in order relative to the verb, going from least
to most specific. For example, although the threshold for issuing a POST
request to `/v1.0/*` is 2 per minute, you cannot issue a POST request to
`/v1.0/*` more than 50 times within a single day.

If you exceed the thresholds established for your account, a 413
(OverLimit) HTTP response is returned with a Retry-After header to
notify the client when it can attempt to try again.

#### Absolute limits

The following table describes the absolute limits that are set.

| Name       | Description                                                    | Limit |
|------------|----------------------------------------------------------------|-------|
| Node Count | Maximum number of allowed data notes                           | 5     |
| Disk       | Maximum disk capacity across all data nodes, in gigabytes (GB) | 5120  |
| RAM        | Maximum RAM across all data notes, in gigabytes (GB)           | 40960 |
| VCPUs      | Maximum virtual CPUs across all data nodes                     | 10    |



