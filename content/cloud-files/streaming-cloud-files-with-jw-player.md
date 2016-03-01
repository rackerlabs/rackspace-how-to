---
node_id: 3230
title: Streaming Cloud Files with JW Player
type: article
created_date: '2012-12-05'
created_by: David Hendler
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

Cloud Files supports the JW Player for streaming video files. We also
support
[FlowPlayer](/how-to/cloud-files-streaming-with-flowplayer-plugins)
and
[OSMF](/how-to/cloud-files-streaming-with-osmf-plugins).

The JW Player has a commercial license, which means you must purchase it
from Longtail video: <http://www.longtailvideo.com/order>.

Supported media formats for JW Player:

Audio:

-   Streaming with ability to jump around: MP4, AAC, and FLV
-   Progressive Download: MP3

Video:

-   Streaming with ability to jump around: MP4, MOV, and FLV



### Upload JW Player 6

1\. Download the JW Player from
[www.longtailvideo.com/jw-player/](http://www.longtailvideo.com/jw-player/ "Get the JW Player").

2\. Unzip the file and upload it to a Cloud Files container.
**Note:** You may choose to upload the player in the container that
holds your media or in another container.

3\. Download the [Akamai Advanced JW Player Provider plugin
files](http://mediapm.edgesuite.net/jw/) for JW Player 6.

4\. Unzip the plugin files and upload them to the same container as the
JW Player.

5\. Confirm that the container that holds your player and plugin are
CDN-Enabled. If it is not, you may enable it through the Cloud Control
Panel or through the API.

From the *Cloud Control Panel*:

1.  Click the gear icon next to the container's name.
2.  Select "Make Public (Enable CDN)".
3.  Click the "Publish to CDN" button to confirm.

From *the API*, see [the API Dev Guide section, "CDN-Enable a
Container"](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#cdn-enabling-the-container-and-setting-a-ttl).



### Add JW Player 6 to Your Web Page

There are three elements you must add to your web page in order to make
JW Player work: a SCRIPT element that points to the player, a DIV that
positions the player, and a SCRIPT that calls the player and the media.

1\. Add a SCRIPT element to the HEAD of your HTML that points to
jwplayer.js file.
For this step, you need the link to the jwplayer.js file you uploaded in
the above instructions. To get the link from *New Cloud Control Panel*:

-   Open the container where you uploaded the plugin (Step 4 above).
-   Locate the jwplayer.js file in the Object List.
-   Click the gear icon next to the plugin file.
-   Click "View All Links".
-   Copy the link makred "HTTP".
-   Replace "/path/to/jwplayer.js" in the text below with the link
     you copied.

 Enter this SCRIPT to the HEAD of your HTML page, substituting in the
link to your jwplayerjs file:

``` {.MsoNormal}
<script type="text/javascript" src="/path/to/jwplayer.js"></script>
```

2\. Add a DIV element to your HTML page with a unique ID attribute value,
such as &ldquo;player&rdquo;. The "Loading the player..." text is whatever text you
would like to display while the player loads.

    <div id="player">Loading the player...</div>

3\. Add a SCRIPT element right below the DIV you created in Step 2. This
adds the JW Player and your media to your page.
This SCRIPT uses the following options:

-   file - The link for the media. Locate your media in a Cloud Filed
    CDN-enabled container, click the gear icon, click "Show Links", and
    use the entire link. For MP3s, using the HTTP link; all others use
    the Streaming link.
-   image - The HTTP link for an image to display in the player. The
    image displays for videos while the file loads or for music, while
    the file plays. Do the same steps for the image as you did for
    the file.
-   provider - The HTTP link to the JW Player. This is the link to the
    container you used in Step 2 in the "Upload JW Player 6"
    instructions above.
-   primary - This sets player rendering mode. The recommended setting
    is 'flash'.

<!-- -->

    <script type="text/javascript">
         jwplayer('player').setup({
             playlist: [{
                file: '/path/to/media/file.mp4',
                image: '/path/to/image.jpg',
                provider: '/path/to/AkamaiAdvancedJWStreamProvider.swf'
            }],
            primary: 'flash'
        });
     </script>
