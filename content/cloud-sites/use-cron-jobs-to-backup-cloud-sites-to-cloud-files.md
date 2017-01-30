---
permalink: use-cron-jobs-to-backup-cloud-sites-to-cloud-files/
audit_date:
title: Use cron jobs to backup Cloud Sites to Cloud Files
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

**Note:** The library used by this script is **no longer supported**. We suggest Cloud Sites customers [use the Zipit tool](/how-to/scheduled-backup-cloud-sites-to-cloud-files)
to run scheduled backups through cron instead.

Before using the scripts in this article, consider [this more comprehensive script](/how-to/scheduled-backup-cloud-sites-to-cloud-files)
that can be installed for your site. While the scripts in this article
serve as a simple example, [the other script](/how-to/scheduled-backup-cloud-sites-to-cloud-files)
offers more robust logging and error checking for long-term use.

In order to backup Cloud Sites to Cloud Files using this example, you
will need to create two cron jobs. One cron job will backup the cloud
site and database and the second cron job will upload the backup to
Cloud Files. This is a very simple example and should not be used for
extremely large sites and databases to backup to Cloud Files.

### Set up a cron job to back up your site

For the first cron, create a file called backup.sh. This file should be
placed in the root of your domain. You will want to place the following
code inside of it:

    #!/bin/sh

    #Set information specific to your site
    webroot="YOUR WEBROOT"
    db_host="YOUR DB HOST"
    db_user="YOUR DB USERNAME"
    db_password="YOUR DB PASSWORD"
    db_name="YOUR DB NAME"

    #Set the date and name for the backup files
    date=`date '+%F-%H-%M'`
    backupname="backup.$date.tar.gz"

    #Dump the mysql database

    mysqldump -h $db_host -u $db_user --password="$db_password" $db_name > $webroot/db_backup.sql

    #Backup Site
    tar -czpvf $webroot/sitebackup.tar.gz $webroot/web/content/

    #Compress DB and Site backup into one file
    tar --exclude 'sitebackup' --remove-files -czpvf $webroot/$backupname $webroot/sitebackup.tar.gz $webroot/db_backup.sql

    #Upload your files to cloud files.
    #First argument is the location of the backup file, second argument is the name to be used when uploaded
    php $webroot/cloudfiles_backup.php $webroot/$backupname $backupname

    #After your backup has been uploaded, remove the tar ball from the filesystem.
    rm $webroot/$backupname

In the above script, you will need to replace the portions in ALL CAPS
with your actual information as follows:

-  **YOUR WEBROOT** - This is the absolute path to your files. You can find
this path by clicking on Hosting, Cloud Sites, Features, and scrolling
down. This will be the "Linux Path" listed there. An example would be:
/mnt/target02/123456/www.domain.com (Note, the /web/content is not
included in that path)

-  **YOUR DB HOST** - Database Host an example would be mysql5-9.wc1 or
mysql50-78.wc1.dfw1.stabletransit.com

-  **YOUR DB PASSWORD** - the password on this database (note the single
quotes and that there is no space between the -p and the single quote)

-  **YOUR DB USER** - the database username (e.g.: 12345_username)

-  **YOUR DB NAME** - the name of the database you are backing up (e.g.:
12345_database_name). Note that there is no parameter for this option
unlike the previous examples (-h -p and -u respectively).

Place this file in your web root.

### Connect to Cloud Files

For this step, you will need to have access to Cloud Files. If you are
not sure or have not set up Cloud Files on your account, please visit
[Getting Started with Cloud Files](/how-to/cloud-files)
for more information on setting up your Cloud Files account. Also,
please note that you may incur any charges associated with using Cloud
Files. For more information regarding Cloud Files costs please visit: <http://www.rackspacecloud.com/cloud_hosting_products/files/pricing/>

Now obtain and set up the PHP API. To download the PHP API documentation
and files, click [here](https://github.com/rackerlabs/php-cloudfiles).
If you click the "Downloads" button you can then download the files in a
zip archive.

Once you download the archive, unpack it. Then go to your site root and
create a directory named "cloudfiles". Upload the files that were in
the PHP API archive into the new "cloudfiles" directory. 

Next you will need to create a simple PHP script to connect to Cloud
Files and upload the backup you are creating. We'll call it
"cloudfiles_backup.php" and put it in the same location as the shell
script (your web root directory). This file will be called by the shell
script we wrote earlier, so if you change that name make sure to find
its reference in the shell script and change it there too.

Here are the contents of the script:

    <?php

    // include the API - note we must use the absolute server path because this script will be executed through php technology and not http
    require("/YOUR WEBROOT/cloudfiles/cloudfiles.php");

    // cloud info
    $username = "YOUR USERNAME"; // username
    $key = "YOUR API KEY"; // api key
    $containername = "YOUR CONTAINER NAME";  // container name

    // backup file name from command-line argument
    $backup = $argv[1];

    // Name to use for file once uploaded
    $uploadname = $argv[2];

    // Connect to Rackspace
    $auth = new CF_Authentication($username, $key);
    $auth->authenticate();
    $conn = new CF_Connection($auth);

    // Get the container we want to use
    $container = $conn->get_container($containername);

    // upload file to Rackspace
    $object = $container->create_object($uploadname);
    $object->load_from_filename($backup);
    ?>

Like the first script, in the above script you will need to replace the
portions in ALL CAPS with your proper values. This includes:

-  **YOUR WEBROOT** - As it was before, this is your Linux path, as
specified under the "Features" tab for your site.

-  **YOUR USERNAME** - Your Rackspace Cloud Files user name (the one you
use to log into the control panel).

-  **YOUR API KEY** - Your Cloud Files API key.  You can get the API key in
the control panel in the "Your Account" section in the sidebar, under
"API Access".

-  **YOUR CONTAINER NAME** - The name of the container you're using on
Cloud Files to hold the backup file.

### Set up the cron job to upload to Cloud Files

The final step is to automate all of this by setting up the actual cron
job within your control panel.

The task we create will execute the backup.sh script we created during
step 1. The following screen shows a sample of the setup process in the
Classic Cloud Control Panel for this task. Please note that the date,
time and frequency can be modified to best suite your needs.

In the above example we chose "Perl" as the scripting language (the
"Perl" option is used to run shell scripts as well) and scheduled the
task to run daily at 6:45 AM Central time.

Now you have created a method to backup your Cloud Site to your Cloud
Files account. Using our cron system will allow you to regulate how
often you would like to create and upload your backups.

### Related articles

-  [What is a Cloud Sites cron job?](/how-to/cloud-sites-faq)
-  [Enable or disable a Cloud Sites scheduled task (cron job)](/how-to/enable-or-disable-a-cloud-sites-scheduled-task-cron-job)
-  [How do I schedule a cron job for Cloud Sites?](/how-to/how-do-i-schedule-a-cron-job-for-cloud-sites)
-  [Cloud Files support](/how-to/cloud-files)

The Rackspace Cloud is not able to provide code support for your Cloud
Sites and web applications. This article is designed to offer a very
simple script that will backup your Cloud Site to your Cloud Files
account. You are welcome to modify any part of these scripts to meet
your own needs.
