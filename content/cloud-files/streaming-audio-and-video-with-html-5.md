---
permalink: streaming-audio-and-video-with-html-5/
audit_date: '2018-12-13'
title: Stream audio and video with HTML 5
type: article
created_date: '2013-02-01'
created_by: David Hendler
last_modified_date: '2018-12-13'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

In addition to media players, you can stream your media by using HTML5.
Most modern web browsers and even mobile phone browsers can stream
audio and video with HTML5. Other players that are based on Adobe&reg;
Flash&reg; can't deliver to such a wide audience. However, not every browser
can play the same file. As a result, content providers offer different
formats of the same file to reach the most people. For audio, you can use
files in **.mp3** and **.ogg** file formats. For  video, you can use the
**.mp4**, **.ogv**, and **.webm** file formats. For details about the formats
that browsers support, see [HTML 5 and browser
support](http://en.wikipedia.org/wiki/HTML5_video#Browser_support).

### CDN-enable a container

To complete the tutorials in this article, you need to have a CDN-enabled
container in your Cloud Files account. Use the following steps to CDN-enable
a Cloud Files container:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Select **Storage > Files**.
4. Click the action gear next to the container that you want to CDN-enable.
5. Select **Make Public (Enable CDN)** from the menu.
6. On the confirmation window, click **Publish to CDN**.

After you complete these steps, you're ready to learn about streaming audio
and video with HTML5.

### Stream audio

This section describes how to use [sample audio and web page
files](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_audio.zip)
to download and test audio streaming functionality.

HTML5 requires you to use both the **mp3** and **ogg** file formats to maximize
the number of platforms on which your media can be played. Both formats are
included in the **zip** archive of sample files. When you use your own audio
files, you might find [media.io](http://media.io/) convenient for converting
**mp3** files into **ogg** files.

Use the following steps to download and test audio streaming functionality:

1. Download the [zip archive](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_audio.zip) and
   unzip it on your computer.
2. Upload the files into your CDN-enabled container.
3. Open the **audiotest.html** file on your computer and locate the **.mp3**
   and **.ogg** file links.

    The HTML should look similar to the following example:

       ...
       <audio controls>
       <source src="full/link/to/http/mp3/audio/file.mp3" type="audio/mpeg" />
       <source src="full/link/to/http/ogg/audio/file.ogg" type="audio/ogg" />
       <em>Sorry, your browser doesn't support HTML5 audio.</em>
       </audio>
       ...

4. In Cloud Files, click the action gear for the **.mp3** file and select
   **View All Links**.
5. Open **audiotest.html** in a text editor. Copy the HTTP link and paste it
   as the **.mp3** file link in **audiotest.html**.
6. In Cloud Files, click the action gear for the **.ogg** file and select
   **View All Links**.
7. Copy the HTTP link and paste it as the **.ogg** file link in
   **audiotest.html**.
8. Save **audiotest.html** and upload it to the CDN-enabled container.
9. Click the **audiotest.html** link to view the audio files.

### Stream video

This section describes how to use [sample video and web page
files](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_video.zip) (a zip
archive of video files) to download and test video streaming functionality.

HTML5 video requires you to use the following three file formats to maximize
the number of platforms on which your media can be played:

- **.mp4**
- **.ogv**
- **.webm**

The image in **.png** format acts as a placeholder that appears before a user
starts the video. When you use your own videos, you might find the Miro Video
Converter useful for converting your videos into alternate formats. You can
download this free utility directly from [the Miro
site](http://www.mirovideoconverter.com/) or from the [Apple&reg; iTunes&reg;
store](https://itunes.apple.com/us/app/miro-video-converter-mvc/id412699210?mt=12).

Use the following steps to test video streaming functionality:

1. Download the zip archive and unzip it on your computer.
2. Upload the files into your CDN-enabled container.
3. Open the **videotest.html** file in a text editor on your computer and
   locate the links for the **.png**, **.mp4**, **.ogv**, and **.webm** files.

   The HTML should look similar to the following example:

       <video width="356" height="200" controls poster="full/http/link/to/image/file.png"  >
       <source src="full/link/to/http/mp4/video/file.mp4" type="video/mp4" />
       <source src="full/link/to/http/ogv/video/file.ogv" type="video/ogg" />
       <source src="full/link/to/http/webm/video/file.webm" type="video/webm" />
       <em>Sorry, your browser doesn't support HTML5 video.</em>
       </video>

4. In Cloud Files, click the action gear for the **.png** file and select
   **View All Links**.
5. Copy the HTTP link and paste it as the .**png** file link in
   **videotest.html**.
6. Copy and paste the HTTP links for the **.mp4**, **.ogv**, and **.webm**
   file types into **videotest.html**.
7. Save the **videotest.html** file and upload it to the CDN-enabled container.
8. Click the **videotest.html** link to view it.
