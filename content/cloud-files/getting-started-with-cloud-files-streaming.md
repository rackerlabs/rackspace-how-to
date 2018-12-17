---
permalink: getting-started-with-cloud-files-streaming/
audit_date: '2018-12-12'
title: Getting started with Cloud Files streaming
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2018-12-13'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

Streaming content through Cloud Files enables you to deliver video content
quickly and easily, without making your users download the content
first. They can begin viewing your content immediately and jump
around the video stream without needing to buffer.

Because Rackspace uses HTTP delivery for streaming content, you can use
the Akamai content delivery network (CDN) to deliver your content. This means
that the performance should be identical to the CDN speeds that customers are
used to.

### CDN-enable the container that holds your streaming content

Before you begin, you must CDN-enable the container that holds your
streaming content. Use the following steps to perform this task:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, select **Product > Rackspace Cloud**.
3. Select **Storage > Files**.
4. Click the gear icon next to the container that holds your streaming
   content, then select **Make Public (Enable CDN)**.

### Get the container's streaming URLs

After your container is CDN-enabled, use the following steps to get the container's streaming URLs:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, select **Product > Rackspace Cloud**.
3. Select **Storage > Files**.
4. Click the gear icon next to the container that holds your streaming
   content, then select **View All Links**.

The following example shows the CDN links that display:

    HTTP: http://cdc4c16471588d4846bf-cc339a649709710bbecd3db1e126ec2b.r3.cf1.rackcdn.com
    HTTPS: https://ac3c779acb946eaf4819-cc339a649709710bbecd3db1e126ec2b.ssl.cf1.rackcdn.com
    Streaming: http://b0c42c537095921be66c-cc339a649709710bbecd3db1e126ec2b.r3.stream.cf1.rackcdn.com
    iOS Streaming: http://09ac235af93af07922d6-cc339a649709710bbecd3db1e126ec2b.iosr.cf1.rackcdn.com

### Tools for streaming your content

The following list includes several different tools that you can use to stream
your content with Cloud Files:

-   [JW Player](/how-to/streaming-cloud-files-with-jw-player)
-   [FlowPlayer](/how-to/cloud-files-streaming-with-flowplayer-plugins)
-   [OSMF (Open Source Media
    Framework)](/how-to/cloud-files-streaming-with-osmf-plugins)
