---
permalink: backing-up-your-files-with-rsync/
audit_date: '2018-11-01'
title: Back up your files with rsync
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2018-11-01'
last_modified_by: Cat lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Backing up files on a regular basis is an integral part of administering your server.

Although you could download every individual file when you want to save them, using `rsync` makes the task of backing up easier because it downloads only the files that have changed, saving time and bandwidth.

### Install rsync

`rsync` is available on most Linux distributions by default. If you need to install it manually, however, you can do so by using your distribution's package manager. For example, the following commands are some common Linux&reg; `rsync` installation commands:

    Ubuntu: sudo aptitude install rsync
    Gentoo: sudo emerge rsync
    CentOS: sudo yum install rsync

**Note:** If you are downloading files to another system, both systems must have `rsync` installed.

### Use SSH with rsync

To keep your files and system secure, be sure to use encryption when uploading or downloading files. The following example uses the Secure Shell (SSH) protocol with `rsync` to keep your data secure. If you prefer not to use SSH, you will be prompted for a password each time you run `rsync`.

If you use `rsync` to automate your backups, ensure that the destination server (where the backup directory
is located) has access to the originating server.

To back up your files from one server to another, run the following command on the destination server:

    rsync -e 'ssh -p 30000' -avlP --delete --stats demo@123.45.67.890:/home/demo /backup

The following explanation covers each part of the command:

-  `-e 'ssh -p 30000'` 
    
    Ensures that `rsync` uses the SSH protocol and sets the port.

-  `-avl` 
   
   A shortcut that contains the following options:

    -  `-a` 
      
       **Archive**. Saves the permission settings for the files.
       
    -  `-v` 
    
       **Verbose**. Returns more information about what `rsync` is doing. You can change how much information `rsync` returns by eliminating `-v`, or you can request more information with `-vv` or `-vvv`. Setting verbose mode with `-vvv` returns all information about the `rsync` process.
       
    -  `-l` 
    
       **Links**. Preserves any symbolic links (symlinks) that you created on the source server.
       
    -  `-P` 
    
       **Progress**. Displays the progress of each file transfer.

-  `--delete` 

   Deletes files from the destination folder that are no longer required (that is, they have been deleted from the originating folders). Typically, you delete files to save space, but if you think you might need it later, ensure that you have a backed-up copy before deleting it.

-  `--stats` 

   Adds more output regarding the file transfer status.

-  `demo@123.45.67.890:/home/demo` 

   The originating folders to back up.

   **Note:** `rsync` differentiates between `/home/demo` and `/home/demo/`. With the trailing slash, `rsync` copies the contents of the directory, but doesn't recreate the directory. This example backs up a folder from one system to another, so omitting the trailing slash replicates the entire directory structure.

-  `/backup/` 

   Identifies the folder on the backup server in which to place the files.

Your output should look similar to the following example:

    receiving file list ...
    31345 files to consider
    ./
    tuning-primer.sh
           42596 100%  533.30kB/s    0:00:00 (xfer#2, to-check=31331/31345)
    bin/
    bin/Backup
             618 100%    7.74kB/s    0:00:00 (xfer#3, to-check=31310/31345)
    bin/Search
             455 100%    5.70kB/s    0:00:00 (xfer#4, to-check=31309/31345)
    configs/
    configs/php.ini
             114 100%    1.43kB/s    0:00:00 (xfer#5, to-check=31307/31345)
    public_html/
    ...
    ...

In the preceding example, `rsync` receives a list of 31,345 files and, because this is the first time `rsync` has been run, downloads them all. When `rsync` runs again, only files that have changed since the last backup are synchronized to the backup folder.

