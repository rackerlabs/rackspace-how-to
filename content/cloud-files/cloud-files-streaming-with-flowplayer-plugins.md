---
permalink: cloud-files-streaming-with-flowplayer-plugins/
audit_date:
title: Cloud Files Streaming with FlowPlayer Plugins
type: article
created_date: '2011-09-13'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This article shows how to upload and stream videos from Cloud Files using the Akamai CDN. Using FlowPlayer as your streaming video player enables you to get the streaming technology and web experience their customers are looking for without having to develop their own Flash players.

You can set up your video for streaming in a few simple steps:

1. Upload your file to Cloud Files via our API or Control panel.  

   If your video file is more than 5GB, simply use our large object support.

2.  Download the [Akamai Advanced FlowPlayer Provider plugin](http://mediapm.edgesuite.net/flow/).

    This is required for your video to play on the Akamai network.

3.  Upload the FlowPlayer plugins to your Cloud Files account, or on a
    server where the internet can access them.

4.  Request your streaming URL, simply by doing a HEAD on your object.

5.  Use your streaming url to serve your content.

The following steps show how to embed your video with FlowPlayer in your website code:

1.  Upload all the FlowPlayer components to a container.
2.  Call the **flowplayer.js** file using a `<script>` tag to include it
    in the HTML.
3.  Link the **flowplayer.css** stylesheet for the Player frame.
4.  Make any config changes to the FlowPlayer object.
5.  Add in the swf player object and the player controls swf object and
    set the source for the video.
