---
permalink: speed-up-rsync-when-migrating-a-linux-server-from-the-command-line/
audit_date:
title: Speed up rsync when migrating a Linux server from the command line
type: article
created_date: '2011-06-23'
created_by: Rackspace Support
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

**Note:** This article is intended as a guide and not a step-by-step process. This guide assumes you are familiar with Linux system administration and rsync utility. *Do not run* the commands in this article if you do not understand them, or what they do. In all cases, ensure that you have backed up your data before you following the steps in this guide. Standard bandwidth charges apply.

This guide will help you shorten server migration times. If your server's applications match any of the characteristics highlighted in this how-to, then read on - this article will probably make rsync times shorter and more predictable for you. We'll show you how to cut migration times by taking preventative action before doing it.

### Speed up the rsync process

Rsync times are generally determined by the volume of used disk space on a server. That is, the more data to copy, the longer the job takes. Typically an empty OS rsync takes 10-15 minutes to complete. However, certain server 'personalities' can dramatically extend rsync time.

They are:

1.  Server containing lots of small files, such as Ruby session files, cache files, mail server message files, or web server image thumbnails. Migrating such data using rsync takes longer to complete than you might expect. This means an initial rsync would be longer, but a second pass in rescue mode (with associated downtime) would be short.

2.  Servers containing many files that are being updated during live rsync. Typically these are MySQL MyISAM table files or web servers hosting multiple domains, each configured to log to separate files. The need to update these actively-written files after the rsync's first-pass copy tends to extend downtime from a reboot to complete a second pass of the rsync process.

3.  Servers containing one or more large files that are updated during migration. Examples are MySQL databases using InnoDB format, mail servers with large mail logs and webservers that log to single, large files. The need to update these actively-written files with a second rsync after the first-pass rsync copy can greatly extend associated downtime.

So, the secret to cutting migration (rsync) times is to manage data on your server and to identify any applications that are writing to disk during the live migration. Let's look at these factors more closely to see how we can mitigate each.

### Small files overhead

Although they don't take up much individual disk space, servers hosting many small files force the rsync process to carry out many 'file-open, file-copy, file-check' processes.

As an example, a one-gigabyte data file only requires one file-open, file-copy, file-check process. Contrast that with a one-gigabyte chunk of data spread across 10,000 individual files that requires 10,000 individual file-open, file-copy, and file-checks. That's a lot more system and network overhead.

Check if your applications are among those that are more likely to create many small files and see longer migration preparation times.

They are:

-  Web servers serving many small thumbnails or image files
-  Caching servers that cache on disk with small files
-  Email servers with large 'archives' of undeleted email
-  Ruby/Rails servers - which tend to create lots of small session files and not delete them
-  git repositories
-  Custom application servers that create - but do not delete - session files for each visitor

The 'small files problem' makes the rsync take longer and therefore be less predictable.

#### How to migrate

Check your server applications against our list above. If your applications are on the list, then do what you can to prune unwanted small files before running the actual rsync command. If you are running Ruby/Rails, assume the worst and search community forums for typical session and cache file locations, as well as how to identify which ones you can safely delete. Look into storing session date in MySQL with the command:

    rake db:sessions:create

and truncating log files in **log/** to zero bytes with the command:

    rake log:clear

If you are running a caching server that caches to disk (as opposed to RAM), identify its file-storage directory and prune with vigor. Check your filesystem for small session and cache files created by custom applications. Again, prune with vigor. If migrating an email server that has a Mail Delivery Agent (MDA) such as Dovecot installed, have your email users clean their email archives of old email first.

### Constantly changing files

Files that change between, the start of an rsync and the end of an rsync, have to be copied again with a follow-up rsync for a thorough server migration. This will extend the migration completion time.

Database servers are the most frequent culprits that change large files of data between the start and end of a migration. These changes force the system to copy the entire database file again in a second rsync process that you might perform in a migration.

Some combinations of database structure and type tend to exacerbate this kind of problem. For example, if you have a MySQL multi-table MyISAM database with many table files that are all updated within single SQL transactions, then many or all of the table files may need to be copied again during the second rescue mode rsync operation.

Given that database files can be many gigabytes in size, the implications of these updates for migration time become clear. It also illustrates how difficult it is to predict accurately how long a migration rsync will take - after all, how can we predict what and how many SQL updates will occur between migration start and finish?

#### How to migrate

If your database contains a lot of obsolete data it may pay to archive that data and then prune it from the live database before migrating your server. MySQL, for example, allows you to archive data using the `mysqldump` script, after which you can delete obsolete data in the live database. The large `mysqldump` output file containing the obsolete data will not extend a second rsync because it won't have changed since the first pass.

Another option if you have applications writing to many files during resize is to set the application into read-only mode immediately before doing rsync command. Databases can usually be set into temporary read-only mode. With other applications your mileage may vary. You can also prevent writes to multiple files by turning applications off, but setting applications to read-only mode is usually the preferred option.

### Large, constantly updating files

Very large files that are being updated during an rsync pose similar problems for migration time as smaller, constantly-updated files — but on steroids. If your server hosts files that are frequently written to and which are larger than 10Gb, this section is for you.

These large, constantly updating files will need to be completely re-copied during a second rsync to capture any updates made since a migration or resize process began. This will extend migration time considerably due to the size of that second rsync copy.

MySQL database servers that use the InnoDB data-file format write data to a single file that can — and will — grow very large indeed. Similarly, MySQL in InnoDB mode usually logs to a single very large log file.

An update to a large InnoDB MySQL data or log file (/var/lib/mysql/ibdata1, etc) forces the rsync process to re-copy the entire file in a second pass. If these files are large then the re-copy can take some time, which keeps the database offline.

Another source of large files are application logs, especially logs produced by mail servers and some web servers. Apache can easily produce log files that are 16Gb or larger so it's not safe to assume that Apache's default logging will help you avoid this large-file issue.

MySQL transaction logs can also grow large if you have turned on transaction logging. It's rare that people do, and it's even rarer that they turn on transaction logging without running out of disk space shortly afterwards! Still, it's wise to keep an eye out for this possibility.

#### How to migrate

As described above, pruning databases of cruft may help reduce the total rsync time. Archive and delete old or obsolete databases before attempting migration.

Again, turning off database writes, if possible, will reduce migration time. Turning off logging may also help in the case of InnoDB databases.

If you have turned on MySQL transaction logging and the transaction log file is large, it's worth turning it off and archiving then deleting it on the slice before starting a rsync migration.

On mail servers, check the size of **/var/log/mail.log** or **/var/log/maillog** before migration. Consider turning the mail server off before migration (you have a secondary 'backup' mail server to pick up the load, right?).

Similarly, check how Apache is logging. If it is logging all requests to one file, check the size of that file and consider archiving and deleting it or turning Apache off prior to starting the migration process. The same advice applies to any other application that you know is writing to a large log file.

For the above applications and any others, review your `logrotate` policy (if you have one) to check that it is keeping a check on your log file sizes. This will save you downtime during migration and and make life with any Linux server easier.

### Pack your toolbag

Of course, it is difficult to track what files have been created after a server has been set up. That is especially true for applications that create session files. It pays to find - and cull - these large collections of little files.

You can identify the ten largest directories and files quite easily by issuing this command as root:

    du -a / | sort -n -r | head -n 10

Change that final '10' to any other number to alter how many files and directories the search returns. This command is a good middle-ground tool for identifying large directories of small files and large files. If you only want to look for large files, try this large file finder (as root):

    find ~/ -mount -type f -ls|sort -rnk7 |head -30|awk '{printf "%10d MB\t%s\n",($7/1024)/1024,$NF}'

And if you want to find large directories only, try this large directory finder (as root):

    du -x --max-depth=4 ~/|sort -rn|head -n30|awk '{printf "%10d MB\t%s\n",$1/1024,$2}'

### Technical details

If your server does not match any of the common types we have examined above, you may be able to assess how its migration time might look if you consider your applications with an understanding of how the migration (rsync) process works.

The typical first stage of a migration is a live rsync which is basically a copy of the server's entire file system. All applications are left running during this stage.

Here's where predicting migration time runs into its first uncertainty. Without detailed knowledge of your usage of your server's file-system, you won't be able to accurately predict how long the 'file copying' stage of an rsync will take to complete.

This unpredictability is particularly true for the final directory on Linux file systems: the **/var/** directory. It's called 'var' because the size of the data it holds is 'variable' in size and likely to change while the server's applications are running.

The second uncertainty is that the final phase of a migration includes a rescue mode (downtime) component during which any files updated since the live rsync first phase began, are copied again. The length of the downtime depends on the size and number of updated files. Again, the rsync process cannot tell in advance how many updates applications like MySQL are writing to data files so it’s hard to predict how long this final 'rescue-mode rsync' copy will take.

The above applies to a typical manual migration process, which is similar to resizing a server on our first-generation Rackspace Cloud. Our Cloud changes the resize process to bring the server down for a single rsync, increasing downtime but also increasing the reliability of the sync.

### Summary

If you know how your applications are using disk space and writing to files you may be able to judge how much time a migration will take longer than you would like and make preparations accordingly. At the very least, you should be able to use your new-found migration knowledge to better schedule migration to fit your timing requirements.
