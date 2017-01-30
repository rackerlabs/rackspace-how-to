---
permalink: ftp-snapshot/
audit_date:
title: FTP Snapshot
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

### What is an FTP Snapshot?

For Cloud Sites, an FTP snapshot is a read-only image of your FTP data,
taken during specific time intervals.

Snapshots are taken every 4 hours and go back 32 hours.

**Note:** Snapshots ONLY include your FTP / Website content;
they do not include your databases.

Retrieving data from FTP Snapshots is an emergency-recovery method, and
is not intended to be used for general backup purposes. We strongly
recommend that you utilize your own backup process using a cron script.
For more information on using cron scripts, see [Create a cron job to back up a Cloud Sites SQL Server database](/how-to/create-a-cron-job-to-back-up-a-cloud-sites-sql-server-database).

### How Do I Recover My FTP Snapshot Data?

In order to view your FTP content snapshots you must first login to your
site via FTP.  For help with this, please refer to our article
on [Uploading content to a website using FTP](/how-to/getting-started-with-cloud-sites-uploading-your-content)

Once you are logged in to your FTP site, please go to the path of the
file(s) / folder(s) you want to attempt to recover.

Add `/.snapshot` to the end of the FTP path within your FTP
application. This will allow you the opportunity to view the snapshots
for the site.

**Note:** You may need to execute a manual change directory command to
.snapshot if you are not able to view and modify the current FTP path.

<img src="{% asset_path cloud-sites/ftp-snapshot/FTPSnapshot.png %}" alt="" />

You should see the following sub-directories if successful:

    ..
    hourly.0 -> (contains most recent hourly snapshot data)
    hourly.1
    hourly.2
    hourly.3
    hourly.4
    hourly.5
    hourly.6
    hourly.7
    hourly.8 -> (contains the oldest snapshot data available)

**Note:** The "hourly" reference here refers to the 4th hour of the
individual 4 hour block captured.)

Navigate to the appropriate folder(s) that contain the data from the
relevant period of time you are looking for. You will see an exact
duplicate of the parent folder's data at the time the snapshot was
taken. The snapshot data is read-only and you will need to download the
files you need to access, and re-upload them if needed.
