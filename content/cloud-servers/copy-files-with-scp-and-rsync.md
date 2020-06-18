---
permalink: copy-files-with-scp-and-rsync/
audit_date:
title: 'Copy files with SCP and RSYNC'
type: article
created_date: '2020-06-18'
created_by: Jose Quezada
last_modified_date:
last_modified_by:
product: Cloud Servers
product_url: cloud-servers
---

This guide is intended to provide guidance when you try to transfer a file from/to a remote server.

# Copying files/directories in a remote way to/from your server

There are two different tools to transfer files remotely in an easy way, SSH and RSYNC. The difference between them resides in that SCP uses SSH to copy files or directories indicated by user. RSYNC on the other way the first time is used copy all files/ directories and the further times only copy a delta (files modified, new files or directories), it does not copy all files/directories again.

##### SSH/SCP:
#
Copy a file **"from"** a remote server:
```sh
~$ scp user@IP.address:/path/file_name /local/destination/path/
```
Copy a directory **"from"** a remote server:
```sh
~$ scp -r user@IP.address:/path/directory[/] /local/destination/path/
```
#
Copy a file **"to"** a remote server:
```sh
~$ scp /local/path/file_name user@IP.address:/destination/path/
```
Copy a directory **"to"** a remote server:
```sh
~$ scp  -r /local/path/directory[/]  user@IP.address:/destination/path/
```

##### RSYNC:
#
RSYNC transfer the files in a recursive way so a -r flag is not necesary but you may prefer to transfer the files in an archive and compressed way, for that you can use:

	-a, --archive
	       It is a quick way  of  saying  you  want  recursion  and  want  to preserve  source characteristics (like permissions).
	-v, --verbose
	       This  option shows you more information during the transfer.
	-z, --compress
	       With  this  option, rsync compresses the file data as it is sent to the destination machine.

Copy a file **"from"** a remote server:
```sh
	~$ rsync [-avz] user@IP.address:/path/file_name /local/destination/path/
```
Copy a directory **"from"** a remote server:
```sh
	~$ rsync [-avz] user@IP.address:/path/directory[/] /local/destination/path/
```
#
Copy a file **"to"** a remote server:
```sh
	~$ rsync [-avz] /local/path/file_name user@IP.address:/destination/path/
```
Copy a directory **"to"** a remote server:
```sh
	~$ rsync [-avz] /local/path/directory[/]  user@IP.address:/destination/path/
```


#### Note:
> A  trailing  slash on the source changes the behavior to avoid creating an additional directory level at the destination. With the '/' the directory content will be copied without creating a new folder, without the '/' a new directory will be created with the source directory´s name.
            `
            ~$ rsync [-avz] /local/path/directory  user@IP.address:/destination/path/
            `
            `
            ~$ rsync [-avz] /local/path/directory/  user@IP.address:/destination/path/
            `
