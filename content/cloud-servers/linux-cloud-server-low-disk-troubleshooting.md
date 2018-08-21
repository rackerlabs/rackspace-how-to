---
permalink: linux-cloud-server-low-disk-troubleshooting/
audit_date: '2018-08-21'
title: Linux Cloud Server low disk troubleshooting
type: article
created_date: '2018-08-21'
created_by: Kate Dougherty
last_modified_date: '2018-08-21'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

 This article is intended to help customers who have received a low disk space
 warning for a Linux&reg; server by providing remediation steps.

### Check Rackspace status

Before using the following steps, check
[http://status.rackspace.com](http://status.rackspace.com) for open issues
that might be impacting your server instance.

### Process overview

This article describes the following troubleshooting steps in detail:

- Log in to the device.
- Check for open tickets.
- Determine the amount of disk space.
- Clean up the server.
- Verify the new disk space after the cleanup.

### Log in to the device

Log in to your server by opening a remote desktop connection. For instructions,
see [Connect to a server by using SSH on Linux or Mac OS
X](https://support.rackspace.com/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os/).

### Check open support tickets

Check your open support tickets for information about any incidents that might
be affecting the service. To check your open support tickets, log in to the
[Cloud Control Panel](https://mycloud.rackspace.com/) and click **Tickets >
Ticket List** in the top navigation bar.

### Determine the amount of disk space

To determine disk space, enter the following one-line program on the command
line to retrieve information on the server's current status:

      FS='./';resize;clear;echo "== Server Time: ==";date;echo -e "\n== Filesystem Information: ==";df -PTh ${FS} | column -t;echo -e "\n== Inode Information: ==";df -PTi ${FS} | column -t;echo -e "\n== Largest Directories: ==";du -hcx --max-depth=2 ${FS} 2>/dev/null | grep -P '^([0-9]\.*)*G(?!.*(\btotal\b|\./$))' | sort -rnk1,1 | head -10 | column -t;echo -e "\n== Largest Files: ==";find ${FS} -mount -ignore_readdir_race -type f -exec du {} + 2>&1 | sort -rnk1,1 | head -20 | awk 'BEGIN{ CONVFMT="%.2f";}{ $1=( $1 / 1024 )"M"; print;}' | column -t;echo -e "\n== Largest Files Older Than 30 Days: ==";find ${FS} -mount -ignore_readdir_race -type f -mtime +30 -exec du {} + 2>&1 | sort -rnk1,1 | head -20 | awk 'BEGIN{ CONVFMT="%.2f";}{ $1=( $1 / 1024 )"M"; print; }' | column -t;

**Note**: You must `cd` to the alerting file system or change the variable
`FS` at the beginning of the one-line program. For example, the alerting file
system in the ticket might be `/` or `/var/log`. You can also view file system
usage by entering the disk file system command `df -h` on the server.

**Example output**

The following code block shows example output for this command:

      == Filesystem Information: ==
      Filesystem                 Type  Size   Used  Avail  Use%  Mounted on
      /dev/mapper/mint--vg-root  ext4  219G   22G   186G   11%   /


      == Inode Information: ==
      Filesystem                 Type  Inodes    IUsed   IFree     IUse%  Mounted  on
      /dev/mapper/mint--vg-root  ext4  14557184  383516  14173668  3%     /


      == Largest Directories: ==
      11G   ./home
      9.0G  ./home/ian8775
      5.6G  ./usr
      2.7G  ./usr/lib
      2.3G  ./usr/share
      1.5G  ./home/ian
      1.1G  ./var

      == Largest Files: ==
      1193.00M ./home/ian8775/Downloads/CentOS-7-x86_64-LiveGNOME.iso
      1138.43M ./home/ian8775/.thunderbird/dpo71zou.default/ImapMail/webmail.rackspace.com/INBOX
      333.61M ./home/ian8775/Dropbox/2016-02-26T15-04-43-381733000Z.sav
      112.70M ./opt/google/chrome/chrome
      109.83M ./home/ian8775/.config/Rambox/Partitions/outlook365_2/Cache/data_3
      91.88M ./home/ian8775/.config/Slack/Cache/data_3
      88.01M ./home/ian/.config/Slack/Cache/data_3
      85.94M ./home/ian8775/.thunderbird/dpo71zou.default/global-messages-db.sqlite
      83.40M ./usr/share/atom/resources/app.asar
      83.14M ./usr/share/spotify/libcef.so
      80.48M ./home/ian/install_files/atom-amd64.deb
      80.48M ./home/ian8775/install_files/atom-amd64.deb
      79.61M ./opt/Rambox/rambox
      79.61M ./home/ian8775/Downloads/Rambox-0.5.12/rambox
      79.60M ./home/ian8775/Downloads/Rambox-0.5.10/rambox
      76.73M ./usr/lib/slack/slack
      76.01M ./home/ian8775/Dropbox/Ian's Work Computer Docs/.config/Slack/Cache/data_3
      75.96M ./home/ian8775/Dropbox/CompTIA Aplus Training Kit Exam 220-801 And Exam 220-802 V413HAV.pdf
      72.30M ./usr/lib/thunderbird/libxul.so
      71.29M ./opt/zoom/libQt5WebEngineCore.so.5.6.2

      == Largest Files Older Than 30 Days: ==
      1193.00M ./home/ian8775/Downloads/CentOS-7-x86_64-LiveGNOME.iso
      1138.43M ./home/ian8775/.thunderbird/dpo71zou.default/ImapMail/webmail.rackspace.com/INBOX
      333.61M ./home/ian8775/Dropbox/2016-02-26T15-04-43-381733000Z.sav
      112.70M ./opt/google/chrome/chrome
      91.88M ./home/ian8775/.config/Slack/Cache/data_3
      88.01M ./home/ian/.config/Slack/Cache/data_3
      85.94M ./home/ian8775/.thunderbird/dpo71zou.default/global-messages-db.sqlite
      83.40M ./usr/share/atom/resources/app.asar
      83.14M ./usr/share/spotify/libcef.so
      80.48M ./home/ian/install_files/atom-amd64.deb
      80.48M ./home/ian8775/install_files/atom-amd64.deb
      79.61M  ./opt/Rambox/rambox
      79.61M ./home/ian8775/Downloads/Rambox-0.5.12/rambox
      79.60M ./home/ian8775/Downloads/Rambox-0.5.10/rambox
      76.73M ./usr/lib/slack/slack
      76.01M ./home/ian8775/Dropbox/Ian's	Work	Computer	Docs/.config/Slack/Cache/data_3
      75.96M ./home/ian8775/Dropbox/CompTIA	Aplus	Training  Kit	Exam  220-801	And  Exam  220-802  V413HAV.pdf
      72.30M ./usr/lib/thunderbird/libxul.so
      71.29M ./opt/zoom/libQt5WebEngineCore.so.5.6.2
      69.05M ./usr/lib/firefox/libxul.so

The output shows disk space as well as inode usage information because some
low disk alerts have IRs that refer to inodes rather than disk space.

Inodes are the number of directory and files permitted in a file system
(directory entries). If you run out of inodes, the file system behaves in the
same way as a full disk and generates a similar alert. Inode usage of 90% or
more is considered _critical_.

### Clean up the server

Perform the following steps to delete old or unnecessary system files and
folders.

Evaluate the status of the server by comparing the output from the one-line
program to information from any previous related tickets, alerts, and automated
diagnostics.

#### Remove Rackspace installers and other unnecessary data

Remove installers and directories that were created when they were extracted.
These items are not needed after an installation is complete. These files are
typically found in the `/root/.rackspace/` and `/home/rack` directories.

**Note:** To delete a file from the command line, change directory to the
file's location and type `del <file name>`.

The following directories and files can be safely removed:

- `/home/rack/brocade*`
- `/home/rack/bna*`
- `/home/rack/bfa*`
- `/home/rack/.rackspace`
- `/home/rack/cv#/`
- `/root/.rackspace/cv#/`
- `/root/.rackspace/mngd_backup/`
- `/root/.rackspace/mngd_storage/`
- `/root/.rackspace/nimbus-installer/`

If the server is _not_ running on a virtual machine (VM), you can also
delete the following file:

- `/root/.rackspace/nimbusinstallers-*.tar.gz`

**Note**: If the server is running on a virtual machine, do not delete the
file `/root/.rackspace/nimbusinstallers-*.tar.gz`. This file is the Nimbus
installer, which might be used for the cloning process.

#### Remediate an inode usage alert

The method of resolving an inode-related alert is different from resolving a
disk space-related alert. Rather than looking for large, unnecessary files,
look for many small ones and delete them.

### Verify the new disk space after the clean up

To determine disk space, run the same one-line program that you ran earlier.
Make a note of the amount of free space.

### Conclusion

If you follow these troubleshooting steps and disk space is still low,
contact the Rackspace Support team by creating a support ticket. Log in to the
[Cloud Control Panel](https://mycloud.rackspace.com/) and click **Tickets >
Create Ticket** in the top navigation bar.

To expedite the issue, include all of the troubleshooting steps that you have
already taken.
