---
permalink: remove-files-older-than-a-certain-date-in-cloud-sites/
audit_date:
title: Remove files older than a certain date in Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

The UNIX find utility is disabled for performance reasons. To find older
files, such as log and session files, and delete them, you must create a
script that performs similar logic.

This article describes how to perform this task by using a PHP script
and a HTML form, as an alternative to using a cron job.

### Prerequisites

Before implementing your script for deletion of older files, understand
that this is not designed to be used as a cron job. If you want to use a
cron job, perform one of the following tasks:

-   Hard code the arguments passed over `HTML GET`.
-   Pass the arguments on the CLI and use `argv[0]` and `argv[1]`.

**Example 1**

    ex1 $dir = opendir("/mnt/stor1-wc1-dfw1/111111/www.testform.com/web/content/logs") or die("Could not open directory");

**Example 2**

    ex2 $dir  = opendir($argv[0)) or die("Could not open directory");

The HTML form will allow anyone who can access it to delete your
content. Secure it with a
[.htaccess](/how-to/rackspace-cloud-essentials-tips-and-tricks-for-htaccess-and-webconfig)
file. You can also delete the form when you're done with it.

### The HTML form

The HTML form that sends the directory and age to the PHP script is as
follows:

    <html>
         <head></head>
         <body>
             <form action="del_old.php" method="get">

                 Directory: <input type="text" name="dir"><br>
                 Days Old: <input type="text" name="days"><br>

                 <input type="submit">
             </form>
         </body>
    </html>

### The PHP script

The PHP script that takes arguments from the `HTML GET` query string can
be constructed as follows:

    ?php
    /*
      * DISCLAIMER: Use at your own risk. Rackspace claims no responsibility for any loss of data that occurs when using this script.
      * Pass from a HTML form the directory to be searched eg. /mnt/stor1-wc1-dfw1/111111/www.testform.com/web/content/log/
      * Pass from a HTML form the age of files to be deleted in days. eg. "10" is any files that have not been modifed in 10 days
      *
    */

    $dir = opendir($_GET["dir"]) or die("Could not open directory");
    chdir($_GET["dir"]);

    $old = mktime(0,0,0,date("m"),date("d")-$_GET["days"],date("Y"));
    echo "Working in <tt>".$_GET["dir"]."</tt><br>";
    echo "Deleting files created before <tt>".date("F d Y", $old)."</tt><br><br>";

    while(($dirent = readdir($dir)) != false)
    {
         if(is_file($dirent))
         {
             $cur = filemtime($dirent);
             if($cur < $old)
             {
                 if(unlink($dirent))
                     echo "<del><b><tt>$dirent</tt></b></del> modified <b><tt>".date("F d Y H:i:s",$cur)."</tt></b><br>";
                 else
                     echo "Error deleting file <tt><b>$dirent</b></tt><br>";
             }
             else
                 echo "<b><tt>$dirent</tt></b> modified <b><tt>".date("F d Y H:i:s",$cur)."</tt></b><br>";
         }
    }
    closedir($dir);

    ?>
