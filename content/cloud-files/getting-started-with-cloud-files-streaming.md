---
node_id: 6003
title: Getting started with Cloud Files streaming
type: article
created_date: '2016-02-10'
created_by: Stephanie Fillmon
last_modified_date: '2016-02-10'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Streaming content through Cloud Files lets you deliver video content
quickly and easily, without making your users download the content
first. They can begin viewing your content immediately and can jump
around the video stream without needing to buffer.

Because Rackspace uses HTTP delivery for streaming content, you can use
the Akamai CDN network to deliver your content. This means the
performance should be identical to CDN speeds customers are used to.
Before you begin, you must CDN-enable the container that holds your
streaming content. In the Cloud Control Panel, click the gear icon of
the container and select "Make Public (Enable CDN)".

Once your container is CDN-enabled, you will need its Streaming URLs. In
the Cloud Control Panel, click the gear icon for the container and
select "View All Links...". Below is an example of the CDN links that
display:

    HTTP: http://cdc4c16471588d4846bf-cc339a649709710bbecd3db1e126ec2b.r3.cf1.rackcdn.com
    HTTPS: https://ac3c779acb946eaf4819-cc339a649709710bbecd3db1e126ec2b.ssl.cf1.rackcdn.com
    Streaming: http://b0c42c537095921be66c-cc339a649709710bbecd3db1e126ec2b.r3.stream.cf1.rackcdn.com
    iOS Streaming: http://09ac235af93af07922d6-cc339a649709710bbecd3db1e126ec2b.iosr.cf1.rackcdn.com

There are several different ways to stream your content with Cloud
Files. Click a link below to find out more for each approach.

-   [JW Player](/how-to/streaming-cloud-files-with-jw-player)
-   [FlowPlayer](/how-to/cloud-files-streaming-with-flowplayer-plugins)
-   [OSMF (Open Source Media Framework)](/how-to/cloud-files-streaming-with-osmf-plugins), which allows you to build your own player
