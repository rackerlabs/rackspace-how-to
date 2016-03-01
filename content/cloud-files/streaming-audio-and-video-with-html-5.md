---
node_id: 3285
title: Streaming Audio and Video with HTML 5
type: article
created_date: '2013-02-01'
created_by: David Hendler
last_modified_date: '2014-10-14'
last_modified_by: Kyle Laffoon
product: Cloud Files
product_url: cloud-files
---

In addition to the various players, you can stream your media using HTML
5. Most modern web browsers and even mobile phone browsers can stream
audio and video with HTML 5. Other players based on Flash cannot deliver
to such a wide audience. However, not every browser can play the same
file, so we have to offer different formats of the same file in order to
reach the most people. For audio, we can use .mp3 and .ogg, and for
video we can use .mp4, .ogv, and .webm. See the Wikipedia page on[HTML 5
and browser
support](http://en.wikipedia.org/wiki/HTML5_video#Browser_support) for
details on which browsers can use which format.

For these tutorials, you will need to have a CDN-enabled container in
your Cloud Files account.

**CDN-enable a container**

-   Click the action gear next to a container name.
-   Select "Make Public (Enable CDN) from the menu.
-   On the confirmation window, click the "Publish to CDN" button.

Now you are ready to learn about streaming audio and video with HTML5.

### Streaming Audio

We created sample audio and web page files for you to download and play
with. They are wrapped up in [a zip
archive](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_audio.zip "zip archive of audio files")
for simple downloading. HTML5 requires using mp3 and ogg file format to
cover the most platforms. Both formats are included in our zip archive.
When you use your own audio files, you may find
[media.io](http://media.io/ "Media.io") convenient for converting mp3s
into ogg files.

**Instructions:**

1.  Download the zip archive, unzip it on your computer, and upload the
    files into your CDN-enabled container.
2.  Edit the audiotest.html file on your computer.
3.  In Cloud Files, click the action gear for the .mp3 file & Select
    "View All Links". Copy and Paste the HTTP link into the .mp3 file
    link in audiotest.html.
4.  In Cloud Files, click the action gear for the .ogg file & Select
    "View All Links". Copy and Paste the HTTP link into the .ogg file
    link in audiotest.html.
5.  Save audiotest.html and upload it to the CDN-enabled container.
6.  Click the audiotest.html link to view it.

**Sample code:**


    <audio controls>

    <source src="full/link/to/http/mp3/audio/file.mp3" type="audio/mpeg" />

    <source src="full/link/to/http/ogg/audio/file.ogg" type="audio/ogg" />

    <em>Sorry, your browser doesn't support HTML5 audio.</em>

    </audio>

Here is what you should see when it's working:

*Sorry, your browser doesn't support HTML5 audio.*



### Streaming Video

We created sample video and web page files for you to download and play
with. They are wrapped up in [a zip
archive](http://81310752d5730fb4ef3c-221b4998ec12974102282b6d4a8fafbe.r2.cf1.rackcdn.com/streaming_video.zip "zip archive of video files")
for simple downloading. HTML5 video requires three (3) formats, mp4,
.ogv, and .webm, to make sure we cover the most platforms. The .png
image displays is a placeholder before your visitor starts the video.
When you use your own videos, you might find the Miro Video Converter
useful to convert your videos into the alternate formats. You may
download this free utility directly from [the Miro
site](http://www.mirovideoconverter.com/) or from [the Apple iTunes
store](https://itunes.apple.com/us/app/miro-video-converter-mvc/id412699210?mt=12).

**Instructions:**

1.  Download the zip archive, unzip it on your computer, and upload the
    files into your CDN-enabled container.
2.  Edit the videotest.html file on your computer.
3.  In Cloud Files, click the action gear for the .png file & Select
    "View All Links". Copy and Paste the HTTP link into the .png file
    link in videotest.html.
4.  In Cloud Files, click the action gear for the .mp4 file & Select
    "View All Links". Copy and Paste the HTTP link into the .mp4 file
    link in videotest.html.
5.  In Cloud Files, click the action gear for the .ogv file & Select
    "View All Links". Copy and Paste the HTTP link into the .ogv file
    link in videotest.html.
6.  In Cloud Files, click the action gear for the .webm file & Select
    "View All Links". Copy and Paste the HTTP link into the .webm file
    link in videotest.html.
7.  After you have uploaded the files to your Cloud Files account, view
    the links for the CDN-enable content.
8.  Save videotest.html and upload it to the CDN-enabled container.
9.  Click the videotest.html link to view it.



**Sample code:**



    <video width="356" height="200" controls poster="full/http/link/to/image/file.png"  >

    <source src="full/link/to/http/mp4/video/file.mp4" type="video/mp4" />

    <source src="full/link/to/http/ogv/video/file.ogv" type="video/ogg" />

    <source src="full/link/to/http/webm/video/file.wbem" type="video/webm" />

    <em>Sorry, your browser doesn't support HTML5 video.</em>

    </video>

Here is what you should see when it's working:

*Sorry, your browser doesn't support HTML5 video.*
