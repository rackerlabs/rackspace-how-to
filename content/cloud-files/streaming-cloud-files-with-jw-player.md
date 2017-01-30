---
permalink: streaming-cloud-files-with-jw-player/
audit_date:
title: Stream Cloud Files with JW Player
type: article
created_date: '2012-12-05'
created_by: David Hendler
last_modified_date: '2016-04-19'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

Cloud Files supports the JW Player for streaming video files. It also supports
[FlowPlayer](/how-to/cloud-files-streaming-with-flowplayer-plugins)
and [OSMF](/how-to/cloud-files-streaming-with-osmf-plugins).

The JW Player has a commercial license, which means you must purchase it
from [Longtail Video](http://www.longtailvideo.com/order).

Supported media formats for JW Player:

Audio:

- Streaming with ability to jump around: MP4, AAC, and FLV
- Progressive Download: MP3

Video:

- Streaming with ability to jump around: MP4, MOV, and FLV

### Upload JW Player 6 to Cloud Files

1. [Download the JW Player](http://www.longtailvideo.com/jw-player/).

2. Unzip the file and upload it to a Cloud Files container.

  **Note:** You can upload the player to the container that holds your media or to another container.

3. Download the [Akamai Advanced JW Player Provider plugin files](http://mediapm.edgesuite.net/jw/) for JW Player 6.

4. Unzip the plugin files and upload them to the same container as the
JW Player.

5. Confirm that the container that holds your player and plugin are
CDN-Enabled. If it is not, you may enable it through the Cloud Control
Panel or through the API.

  From the *Cloud Control Panel*:

    1.  Click the gear icon next to the container's name.
    2.  Select **Make Public (Enable CDN)**.
    3.  Click the **Publish to CDN** button to confirm.

  From *the API*, see [the API Dev Guide section, "CDN-Enable a Container"](https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#cdn-enabling-the-container-and-setting-a-ttl).

### Add JW Player 6 to your web page

There are three HTML elements that you must add to your web page for JW Player to work:
  - A `script` element that points to the player
  - A `div` that positions the player
  - A `script` that calls the player and the media

1. Add a `script` element to the `head` of your HTML that points to the **jwplayer.js** file.

  For this step, you need the link to the **jwplayer.js** file you uploaded to the Cloud Files container. To get the link from the Cloud Control Panel:

    1. Open the container where you uploaded the plugin.
    2. Locate the **jwplayer.js** file in the Object List.
    3. Click the gear icon next to the plugin file.
    4. Click **View All Links**.
    5. Copy the HTTP link.
    6. Replace **/path/to/jwplayer.js** in the text below with the link
     you copied.

  Use the following `script` element, substituting in the link to your **jwplayer.js** file:

          <script type="text/javascript" src="/path/to/jwplayer.js"></script>

2. Add a `div` element to your HTML page with a unique ID attribute value,
such as "player".

  The "Loading the player..." text can be whatever text you would like to display while the player loads.

       <div id="player">Loading the player...</div>

3. Add a `script` element right below the `div` you created in Step 2. This
adds the JW Player and your media to your page.

  This `script` uses the following attributes:

    - `file` - The link for the media. Locate your media in a Cloud Files CDN-enabled container, click the gear icon, click "Show Links", and use the entire link. For MP3s, use the HTTP link; all other file types use the Streaming link.
    - `image` - The HTTP link for an image to display in the player. The image displays for videos while the file loads or for music, while the file plays. Perform the same steps for the image as you did for the file.
    - `provider` - The HTTP link to the JW Player. This is the link to the container you used in Step 2 in the "Upload JW Player 6" instructions above.
    - `primary` - This sets player rendering mode. The recommended setting is 'flash'.

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
