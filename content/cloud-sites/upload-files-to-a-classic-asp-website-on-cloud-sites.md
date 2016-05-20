---
permalink: upload-files-to-a-classic-asp-website-on-cloud-sites/
audit_date:
title: Upload files to a classic ASP website on Cloud Sites
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

To upload files to a classic ASP site on Cloud Sites, you must have the
following information:

-   The data center location of the website, ORD or DFW. If the website
    test link contains **dfw**, then the site is assigned to DFW;
    otherwise, it is ORD. You can view the test link on the **General
    Settings** tab for the website in the Cloud Sites Control Panel.

-   The web directory into which the files are uploaded. You can view
    the web directory on the **Features** tab for the website in the
    Cloud Sites Control Panel.

After you have this information, use the following two ASP files as
references to upload files. The `USERNAME` and `PASSWORD` in
**UploadScript1.asp** are the same as those used for impersonation (see
[Add impersonation to your ASP.NET site](/how-to/add-impersonation-to-your-aspnet-cloud-site)).

### test1.asp

     <HTML>
     <BODY BGCOLOR="#FFFFFF">

     <FORM METHOD="POST" ENCTYPE="multipart/form-data" ACTION="UploadScript1.asp">
     <INPUT TYPE=FILE SIZE=60 NAME="FILE1"><BR>
     <INPUT TYPE=FILE SIZE=60 NAME="FILE2"><BR>

     <INPUT TYPE=FILE SIZE=60 NAME="FILE3"><BR>
     <INPUT TYPE=SUBMIT VALUE="Upload!"> </FORM>

     </BODY>
     </HTML>


### UploadScript1.asp

     <HTML>
     <BODY>

     <%
      Set Upload = Server.CreateObject("Persits.Upload.1")
      Upload.LogonUser "ord", "USERNAME", "PASSWORD"

      Count = Upload.Save("\\fsvs02\target02\WindowsPathInFeaturesTab\upload")
     %>
     <% = Count %> files uploaded.

     </BODY>
     </HTML>


If the website is located in the DFW data center, the `Upload.LogonUser`
line needs to change as follows:

    Upload.LogonUser "dfw", "USERNAME", "PASSWORD"

**Note:** The credentials that you use must be those of the primary FTP
account. Credentials for secondary FTP accounts do not work.
