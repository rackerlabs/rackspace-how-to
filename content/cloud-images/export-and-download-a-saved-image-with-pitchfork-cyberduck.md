---
permalink: export-and-download-a-saved-image-with-pitchfork-cyberduck
audit_date:
title: Export and Download a Saved Image with Pitchfork/Cyberduck
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
--- 

If you're not the most tech savvy person, exporting and downloading a Saved Image from the Rackspace Cloud can seem a little intimidating. There are multiple articles for each part of the process, CLIs, and tools you've probably never heard of. But, there is an easy way to get this process taken care of as well. The steps and guide below will take you through exporting your Saved Image using our easy Pitchfork tool that interfaces with our API, and then the easy to use and free-to-download Cyberduck software.
The tools you need are the following:

• Cyberduck - https://cyberduck.io/ 
Cyberduck is a tool for managing storage solutions like Rackspace Cloud Files via a simple GUI. It's not Rackspace developed, and the product itself isn't supported by us, so issues with Cyberduck specifically would require you reaching out to them.

• Pitchfork - https://pitchfork.rax.io
Pitchfork is the Rackspace developed tool for interfacing with varying products APIs.

The information you'll need to have ready to perform the export/download are the following:

• mycloud.rackspace.com username

• API Key - (How to find my API key)

• UUID of the image to export

• Name of a cloud files container to export to.

• Region the Image/Container exist in.

NOTE - Windows and Redhat images CANNOT be exported due to licensing restrictions by Microsoft and Redhat.

Let's get started.
1) Once you have all the information listed above, and the tools ready, go to https://pitchfork.rax.io and hit log in on the top right. Enter your username and API Key to log in.

2) Now click the icon for Cloud Images and select your region in the drop down on the left side of the page.

3) Scroll down the list until you fine 'Export Task' and click the 'POST' button. This should bring up a set of blank variables.

4) The variable task_type should be set to 'export' in the drop down, image_id variable should be the uuid of the image you're exporting, and receiving_container should be the name of the container you're sending the image to.

5) Once you've filled out these, variables, you can hit 'SEND API CALL' button to start the export. In the box below you'll find a 'Response Headers' section and within that some output which will contain an 'id' and a long alpha-numeric value. You can use this id and the 'Get Task Details' Pitchfork call to check the status of your export. It will return a status like pending/processing/successful or failed if it did not work.

6) Your container will remain empty in the mycloud.rackspace.com portal for awhile, but eventually you should see lot of 125MB files begin to appear. Once the export is finished, there should be a lot of these files, depending on the size of your image. They name should follow this scheme: uuid_of_the_image_you_exported.vhd-0001 and that number at the tail end will increase by the number of 125MB files there are. When it's finished though there should also be a single file without the -0001 numbering at the end of the .vhd file name.

7) Once the export is finished, open up Cyberduck and click 'Open Connection' in the top left. The drop down on the top should have an option for 'Rackspace Cloud Files (US)' that you can choose. Then just enter your username and API Key, the rest can be left to defaults. It should connect you, and you should see your list of Cloud Files containers.

8) In the container you chose to export your image to, find the file that does ends in .vhd without the additional hyphenated numbering. That file will show as 0B, it is the manifest file, right click it and download just this file. You'll notice it's actually downloading a file much larger than it's claimed 0B. That's because it's gathering all the 125MB files together back into a workable .vhd file.

9) Once it finishes downloading, it should notify you, and you can then use the .vhd file for your own purposes! Note, that because Cyberduck sees the manifest file as being 0B in size, I have seen it claim to error once it's finished downloading. However, if you look in your download location, the file should be there and you can compare the size to the size of the parts to confirm.
