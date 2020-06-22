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

This artile describes how to transfer a file from and to a remote server.

# Copying files/directories in a remote way to/from your server

You can use either SSH or RSYNC to transfer files to a remote server. SCP uses SSH to copy only files or directories selected by the user. On first use, RSYNC copies all files and directories and then only copies files and directories that you have changed. RSYNC does not copy all files and directories again.

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
Because RSYNC transfers files recursively, you do not need to add the -r flag. You can use the following commands to transfer the files in an archived and compressed way:

	-a, --archive
	       Like recursion, this option preserves source characteristics (for example, permissions).
	-v, --verbose
	       This option shows you more information during the transfer.
	-z, --compress
	       With this option, RSYNC compresses the file data sent to the destination machine.

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
> A  trailing  slash on the source changes the transfer behavior to avoid creating an additional directory level at the destination. With the '/', the directory content is copied without creating a new folder. Without the '/', a new directory is created with the source directory´s name.
            `
            ~$ rsync [-avz] /local/path/directory  user@IP.address:/destination/path/
            `
            `
            ~$ rsync [-avz] /local/path/directory/  user@IP.address:/destination/path/
            `
