---
permalink: streaming-audio-and-video-with-html-5/
audit_date:
title: Stream Audio and Video with HTML 5
type: article
created_date: '2013-02-01'
created_by: David Hendler
last_modified_date: '2016-04-19'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

In addition to the various players, you can stream your media using HTML5. Most modern web browsers and even mobile phone browsers can stream
audio and video with HTML5. Other players based on Flash cannot deliver
to such a wide audience. However, not every browser can play the same
file, so we have to offer different formats of the same file in order to
reach the most people. For audio, we can use **.mp3** and **.ogg**, and for
video we can use **.mp4**, **.ogv**, and **.webm**. See the Wikipedia page on [HTML 5 and browser support](http://en.wikipedia.org/wiki/HTML5_video#Browser_support) for
details on which browsers can use which format.

For these tutorials, you will need to have a CDN-enabled container in
your Cloud Files account:

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).
2. Click on **Storage > Files**.
3. Click the action gear next to the container that you want to CDN-enable.
4. Select **Make Public (Enable CDN)** from the menu.
5. On the confirmation window, click the **Publish to CDN** button.

Now you are ready to learn about streaming audio and video with HTML5.

### Stream audio

We created sample audio and web page files for you to download and test with. They are wrapped up in [a zip archive](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_audio.zip) for simple downloading.

HTML5 requires using** mp3** and **ogg** file formats to cover the most platforms. Both formats are included in our **zip** archive.
When you use your own audio files, you may find
[media.io](http://media.io/) convenient for converting **mp3s**
into **ogg** files.

1. Download the zip archive and unzip it on your computer.
2. Upload the files into your CDN-enabled container.
3. Open the **audiotest.html** file on your computer and locate the **.mp3** and **.ogg** file links.

  The HTML should look similar to the following:

       ...
       <audio controls>
       <source src="full/link/to/http/mp3/audio/file.mp3" type="audio/mpeg" />
       <source src="full/link/to/http/ogg/audio/file.ogg" type="audio/ogg" />
       <em>Sorry, your browser doesn't support HTML5 audio.</em>
       </audio>
       ...

4. In Cloud Files, click the action gear for the **.mp3** file and select **View All Links**.
5. Copy the HTTP link and paste it as the **.mp3** file link in **audiotest.html**.
6. In Cloud Files, click the action gear for the **.ogg** file and select **View All Links**.
7. Copy the HTTP link and paste it as the **.ogg** file link in **audiotest.html**.
8. Save **audiotest.html** and upload it to the CDN-enabled container.
9. Click the **audiotest.html** link to view the audio files.

### Stream video

We created sample video and web page files for you to download and test
with. They are wrapped up in [a zip archive](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_video.zip "zip archive of video files")
for simple downloading.

HTML5 video requires three (3) formats, **.mp4**, **.ogv**, and **.webm**, to make sure you cover the most platforms. The **.png**
image is a placeholder before your visitor starts the video.
When you use your own videos, you might find the Miro Video Converter
useful to convert your videos into the alternate formats. You may
download this free utility directly from [the Miro site](http://www.mirovideoconverter.com/) or from [the Apple iTunes store](https://itunes.apple.com/us/app/miro-video-converter-mvc/id412699210?mt=12).

1. Download the zip archive and unzip it on your computer.
2. Upload the files into your CDN-enabled container.
3. Open the **videotest.html** file on your computer and locate the **.png**, **.mp4**, **.ogv**, and **.webm** file links.

   The HTML should look similar to the following:

       <video width="356" height="200" controls poster="full/http/link/to/image/file.png"  >
       <source src="full/link/to/http/mp4/video/file.mp4" type="video/mp4" />
       <source src="full/link/to/http/ogv/video/file.ogv" type="video/ogg" />
       <source src="full/link/to/http/webm/video/file.webm" type="video/webm" />
       <em>Sorry, your browser doesn't support HTML5 video.</em>
       </video>

4. In Cloud Files, click the action gear for the **.png** file and select **View All Links**.
5. Copy the HTTP link and paste it as the .**png** file link in **videotest.html**.
6. Copy and paste the HTTP links for the **.mp4**, **.ogv**, and **.webm** file types into **videotest.html**.
7. Save the **videotest.html** file and upload it to the CDN-enabled container.
8. Click the **videotest.html** link to view it.
