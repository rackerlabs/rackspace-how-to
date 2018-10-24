---
permalink: cloud-files-streaming-with-flowplayer-plugins/
audit_date:
title: Cloud Files Streaming with FlowPlayer Plugins
type: article
created_date: '2011-09-13'
created_by: Rackspace Support
last_modified_date: '2018-10-23'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

This article shows you how to upload and stream videos from Cloud Files by
using the Akamai Content Delivery Network (CDN). Using FlowPlayer as your
streaming video player enables you to get the streaming technology and web
experience that customers are looking for without having to develop their own
Flash players.

You can set up your video for streaming by using the following steps:

1. Upload your file to Cloud Files through the
   [API](https://developer.rackspace.com/docs/cloud-files/v1/) or the [Cloud
   Control Panel](https://login.rackspace.com/).

    If your video file is more than 5GB, simply use our large object support.

2.  Download the [Akamai Advanced FlowPlayer Provider
    plugin](http://mediapm.edgesuite.net/flow/).

     This plugin is required for your video to play on the Akamai network.

3.  Upload the FlowPlayer plugins to your Cloud Files account, or on a
    server where the internet can access them.

4.  Request your streaming URL by performing a HEAD on your object.

5.  Use your streaming URL to serve your content.

The following steps show you how to embed your video with FlowPlayer in your
website code:

1.  Upload all of the FlowPlayer components to a container.
2.  Call the **flowplayer.js** file by using a `<script>` tag to include it
    in the HTML.
3.  Link the **flowplayer.css** stylesheet for the Player frame.
4.  Make any configuration changes to the FlowPlayer object.
5.  Add in the `.swf` player object so that the player controls the `.swf`
    object and sets the source for the video.
