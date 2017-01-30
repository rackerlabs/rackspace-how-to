---
permalink: add-impersonation-for-aspupload-on-cloud-sites/
audit_date:
title: Add impersonation for ASPUpload on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

We provide an ASP component installed on all the web servers that allows
uploading files using classic asp. This component is called Persits
AspUpload. If you want to upload files without giving public write, you
can impersonate with your ftp account. The following below is an example
that will display 3 fields to browse and select files to upload using
your ftp account. This is more secure as public now does not have write
access to your specific folder where your files will be uploaded at.

Create a file called uploads.asp and save the following text below in
it.

    <HTML>

    <BODY BGCOLOR="#FFFFFF">

    <FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="UploadScript1.asp">
    <INPUT TYPE=FILE SIZE=60 NAME="FILE1"><BR>

    <INPUT TYPE=FILE SIZE=60 NAME="FILE2"><BR>
    <INPUT TYPE=FILE SIZE=60 NAME="FILE3"><BR>
    <INPUT TYPE=SUBMIT VALUE="Upload!"> </FORM>

    </BODY>
    </HTML>

Create another file called **UploadScript1.asp**. Then, copy the the following text
into the file.

**Note:** The **domain** is the data center your website is
located at. It will either be **DFW**, or **ORD**.

    <HTML>
    <BODY>

    <%

    Set Upload = Server.CreateObject("Persits.Upload.1")
    Upload.LogonUser "domain", "ftpUserName", "ftpPassword"

    Count = Upload.Save("\\location\where\I\want\my\files\uploaded\at")

    %>
    <% = Count %> files uploaded.

    </BODY>
    </HTML>

You can browse to your url `www.mydomain.com/uploads.asp` to upload the files.

Here's a working example of the above scripts, hosted on Cloud Sites.

For more examples and documentation, see the [AspUpload website](http://www.aspupload.com/).
