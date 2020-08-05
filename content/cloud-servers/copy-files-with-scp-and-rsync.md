---
permalink: copy-files-with-scp-and-rsync/
audit_date: '2020-08-05'
title: 'Copy files with scp and rsync'
type: article
created_date: '2020-06-18'
created_by: Jose Quezada
last_modified_date: '2020-08-05'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to transfer a file from and to a remote server.

You can use either SSH or rsync to transfer files to a remote server. Secure Copy
(scp) uses SSH to copy only the files or directories that you select. On first
use, rsync copies all files and directories and then only copies files and
directories that you have changed. rsync does not copy all the files and
directories again.

### SSH and scp

The following commands use SSH and scp to copy a file or a
directory **from** a remote server:

**File**

    ~$ scp user@IP.address:/path/file_name /local/destination/path/

**Directory**

    ~$ scp -r user@IP.address:/path/directory[/] /local/destination/path/

The following commands copy a file or directory **to** a remote server:

**File**

    ~$ scp /local/path/file_name user@IP.address:/destination/path/

**Directory**

    ~$ scp  -r /local/path/directory[/]  user@IP.address:/destination/path/


### rsync

Because rsync transfers files recursively, you do not need to add the `-r` flag. You 
can use the following options to transfer the files in an archived and compressed way:

    -a, --archive
	 Like recursion, this option preserves source characteristics (for example, permissions).
    -v, --verbose
	 This option shows you more information during the transfer.
    -z, --compress
	 With this option, RSYNC compresses the file data sent to the destination machine.

The following commands use rsync to copy a file or directory **from** a
remote server:

**File**
 
    ~$ rsync [-avz] user@IP.address:/path/file_name /local/destination/path/

**Directory**

    ~$ rsync [-avz] user@IP.address:/path/directory[/] /local/destination/path/

The following commands use rsync to copy a file or directory **to** a
remote server:

**File**

    ~$ rsync [-avz] /local/path/file_name user@IP.address:/destination/path/

**Directory**

    ~$ rsync [-avz] /local/path/directory[/]  user@IP.address:/destination/path/


**Note:** A  trailing  slash ( / ) on the source changes the transfer behavior
to avoid creating an additional directory level at the destination. With
the slash, the directory content is copied without creating a new
folder. Without the slash, a new directory is created with the source
directory´s name. Following are examples without and with the slash:
    
    ~$ rsync [-avz] /local/path/directory  user@IP.address:/destination/path/
    ~$ rsync [-avz] /local/path/directory/  user@IP.address:/destination/path/
