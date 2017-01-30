---
permalink: use-cron-to-extract-and-compress-zip-unzip-on-cloud-sites/
audit_date:
title: 'Use cron to extract and compress (zip & unzip) on Cloud Sites'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-21'
last_modified_by: Rose Contreras
product: Cloud Sites
product_url: cloud-sites
---

In Cloud Sites, the general process for extracting and compressing files
through a cron job consists of the following steps:

1.  Creating the script File
2.  Uploading the aforementioned file to the site through FTP.
3.  Scheduling the cron job through the Cloud Sites Control Panel's
    Features tab.

**IMPORTANT:** Please make sure that you set up the cron job
"command type" to be **Perl** to properly execute the shell script (.sh
file). Cron jobs that run over 900 seconds (15 minutes) are
automatically terminated.

### Create the script file

To create the script file, simply open up a text editor on your local
machine and copy/paste the sample code (provided in the examples below)
for the operation you wish to accomplish:

-   Compressing: zip or tar
-   Decompressing: unzip or tar

Once complete, save the file with the **.sh** extension.

### Compressing

Suggested Filename: **compress.sh**

**Note:** For these examples make sure to replace **/SOURCE/DIRECTORY/**
and **/DESTINATION DIRECTORY** with the appropriate Web directories (like
**/mnt/stor1-wc1-dfw1/123456/www.example.com/web/content/archives/**).

#### Zip compression

To compress a directory to zip format add these lines to the script:

    #!/bin/sh
    zip -9pr /DESTINATION/DIRECTORY/file.zip /SOURCE/DIRECTORY/

Where **file.zip** is the name that you assign to the zip file.

The final script should look similar to this:

<img src="{% asset_path cloud-sites/use-cron-to-extract-and-compress-zip-unzip-on-cloud-sites/Zip_script_visual.png %}" alt="" />

**Note:** If you're only compressing a single file the script would be
similar, but would not require the "r" in the options.

For example:

    #!/bin/sh
    zip -9p /DESTINATION/DIRECTORY/file.zip /SOURCE/DIRECTORY/targetfile.txt

#### Tar.gz compression

Put this in the script to archive and compress a directory into a
gzipped tar format:

    #!/bin/sh
    tar -cvzf /DESTINATION/DIRECTORY/file.tar.gz /SOURCE/DIRECTORY/

Where **file.tar.gz** is the name that you assign to the compressed file.

The final script should look similar to this:

<img src="{% asset_path cloud-sites/use-cron-to-extract-and-compress-zip-unzip-on-cloud-sites/Zip_script_visual.png %}" alt="" />

### Extracting

Suggested Filename: **decompress.sh**

#### Zip extraction

Add these lines to decompress from zip format:

    #!/bin/sh
    unzip -o /SOURCE/DIRECTORY/file.zip -d /DESTINATION/DIRECTORY/

Where **file.zip** is the name of the zip file to be uncompressed.

The final script should look similar to this:

<img src="{% asset_path cloud-sites/use-cron-to-extract-and-compress-zip-unzip-on-cloud-sites/Unzip_script_visual_0.png %}" alt="" />

**Note:** The -o option will force unzip to overwrite existing files.

#### Tar.gz extraction

Put this in the script to extract from tar format:

    #!/bin/sh
    tar -xvzf /SOURCE/DIRECTORY/file.tar.gz -C /DESTINATION/DIRECTORY/

Where **file.tar.gz** is the name of the compressed file.

The final script should look similar to this:

<img src="{% asset_path cloud-sites/use-cron-to-extract-and-compress-zip-unzip-on-cloud-sites/Untar_script_visual.png %}" alt="" />

### Cron FAQs:

-  [What is a cron job?](/how-to/cloud-sites-faq)
-  [How do I enable or disable cron?](/how-to/enable-or-disable-a-cloud-sites-scheduled-task-cron-job)
-  [How do I schedule a cron job?](/how-to/how-do-i-schedule-a-cron-job-for-cloud-sites)
