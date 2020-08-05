---
permalink: install-nginx-on-windows/
audit_date: '2020-07-27'
title: Install Nginx on Windows
type: article
created_date: '2020-07-17'
created_by: John Garcia
last_modified_date: '2020-07-27'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

Nginx&reg; is a web-server service, which has gained almost as much market share as Apache&reg; in recent years due
to its excellent performance and flexible feature set. This guide describes how to install Nginx and discusses
the next steps to set up Nginx to serve your site or application.

### Prerequisites:

You need a server running a version of the Windows&reg; Server&reg; operating system.

### Nginx installation on Windows Server

Nginx comes pre-compiled direct from their website, which makes installation as simple as downloading and extracting a file.  

1. Download the latest mainline release from [http://nginx.org/en/download.html](http://nginx.org/en/download.html).

2. Extract the file to the location where you want to install Nginx, such as **C:\nginx**. 

    **Note**: We recommend creating a new directory for Nginx.
      

### Test the installation

Open a CMD prompt and start Nginx with the following command:

      C:\nginx\nginx.exe

**Note**: Replace **C:\nginx\** with the directory location where you installed Nginix.

You should be able to navigate to **http://localhost/** in the server's web browser and see the Nginx default web page.
If you see "Welcome to Nginx," everything is working as intended.

### Useful information

The Nginx project considers the Windows release to be in beta. Functionally, this release is similar to Unix releases, but
some features are missing. For further information, see [nginx for Windows](http://nginx.org/en/docs/windows.html).

### Next steps

If you want to serve more than one site, we recommend that you set up Nginx server blocks to accommodate this need.
