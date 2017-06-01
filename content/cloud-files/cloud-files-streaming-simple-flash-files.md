---
permalink: cloud-files-streaming-simple-flash-files/
audit_date:
title: Stream simple Flash files from Cloud Files
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

This tutorial describes how to stream media files from Cloud Files to a website. It
assumes that you have a video file uploaded to Cloud Files and that the container it is in
is public. It also uses [Flowplayer](https://flowplayer.org/), which is an open-source Flash video player registered
under the GPL.


### Streaming

Cloud Files containers that are published and marked as public are delivered over the [Akamai Technologies](http://www.akamai.com/) global content delivery network (CDN). For streaming flash files from your Cloud Files, Akamai provides *pseudostreaming*. 

Pseudostreaming works as follows: When a video is initially loaded, the player reads and stores a list of seek points as part of the video's metadata. These seek points are offsets in the video (both in seconds and in bytes) at which a new key frame starts. To accomplish this, Akamai's streaming supports the [HTTP Range header](https://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.35) to identify those seek points. Real Time Messaging Protocol (RTMP) streaming is not supported.

Pseudostreaming differs from what Akamai offers with their iOS streaming. iOS streaming is a form of adaptive streaming. The encoder (or a separate segmented process) produces H.264/AAC content in a sequence of small content segments, in MPEG-2 TS format (.ts). There is also a m3u8 index file that references these segments; in the case of live content, the M3U8 is continuously updated to reflect the latest content.

For more information about pseudostreaming, see [JW6: Pseudo Streaming in Flash](https://support.jwplayer.com/customer/portal/articles/1430518-pseudo-streaming-in-flash).

For more information about iOS streaming, see [Technical Note TN2224](https://developer.apple.com/library/content/technotes/tn2224/_index.html) on the Apple
Developer site.

### Supported streaming formats and codecs

The following formats are supported by Akamai streaming.

Container  | Video codec  | Audio codec  | Comments
--- | --- | --- | ---
FLV  | H.263 <br /> H.264 <br /> VP6 | MP4 <br /> AAC <br /> PCM <br /> Nellymoser | Video-only works as well. For Nellymoser, only the 8 kHz and 16 kHz mono sound formats are supported.
F4V  | H.264  | AAC |  None
MP4 | H.264  | AAC <br /> MP3 | Can be audio-only (AAC) or video-only.
F4F/F4M  | H.264 <br /> VP6  | AAC <br /> MP3 |  None

### Prerequisites

-   A **.flv** video
-   A text editor

### FlowPlayer

1. Go to the [Akamai FlowPlayer](http://mediapm.edgesuite.net/flow/ "http://flowplayer.org") and download the free version of FlowPlayer.
2. Save the zip file to your desktop.
3. Extract the zip file to your desktop.
4. Upload the following files to Cloud Files by using the Cloud Control Panel:
  -   **flowplayer-*version*.swf**
  -   **flowplayer-*version*.min.js**
  -   **flowplayer.controls-*version*.swf**

### Create an XHTML file

Create a simple XHTML file that calls Flowplayer and embeds it onto the page. Use the following code, making the following substitutions:

    <html>
     <head>
      <script type="text/javascript" src="http://c022320192.cdn.cloudfiles.rackspacecloud.com/flowplayer-3.5.min.js"></script>
     </head>
     <body>
      <a
        href="http://c022320192.cdn.cloudfiles.rackspacecloud.com/video.flv"
        style="display:block;width:520px;height:330px"
        id="player">
      </a>
      <script>
       flowplayer("player","http://c022320192.cdn.cloudfiles.rackspacecloud.com/flowplayer-3.5.swf");
      </script>
     </body>
    </html>

- On line 3, replace `http://c022320192.cdn.cloudfiles.rackspacecloud.com/flowplayer-3.5.min.js` with your version of this file.
- On line 7, replace `http://c022320192.cdn.cloudfiles.rackspacecloud.com/video.flv` with the location of your video file.
- On line 12, replace `http://c022320192.cdn.cloudfiles.rackspacecloud.com/flowplayer-3.5.swf` with your version of this file.

Save this XHTML file and run it from your local machine. 

If it is working correctly, the Flash video loads quickly and streams. If not, check your code. If you are still having problems after that, call our Support team or submit a ticket through the Cloud Control Panel.
