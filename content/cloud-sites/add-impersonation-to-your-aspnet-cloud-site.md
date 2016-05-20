---
permalink: add-impersonation-to-your-aspnet-cloud-site/
audit_date:
title: Add impersonation to your ASP.NET cloud site
type: article
created_date: '2011-03-08'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

Adding impersonation to your site allows the web server process to run
as your primary File Transfer Protocol (FTP) user. This means that it
has permission to write to your files, create files, create folders, and
perform other activities that would normally require full read, write,
and execute permissions.

The following steps work only on ASP.NET through a **web.config** file.
If you are not sure what data center your site is deployed in, see
[Rackspace data centers and
regions](/how-to/rackspace-data-centers-and-regions).
Use your Rackspace Cloud account username and password, where indicated
by <username> and <password> in the following command.

For customers whose sites are deployed in our DFW data center, add the
following lines to your **web.config** file:

    <configuration>
       <system.web>
        <identity impersonate="true" userName="dfw\USERNAME" password="PASSWORD" />
       </system.web>
    </configuration>

For customers whose sites are deployed in our ORD data center, add the
following lines to your **web.config** file:

    <configuration>
       <system.web>
        <identity impersonate="true" userName="ord\USERNAME" password="PASSWORD" />
       </system.web>
    </configuration>

**Note:** You *must* use the user name that is configured to be the
primary FTP account for the cloud site that you are working with. If the
site was created under your main account, the credentials are your main
control panel login credentials. If the site was created under a client,
use the client's main account credentials. When in doubt, you can go to
the **Security** tab for a cloud site to confirm the primary FTP
account.

After you make this change, you need to rebuild the application. For
instructions, see [Rebuild an ASP.NET application in Cloud Sites](/how-to/rebuild-an-aspnet-application-in-cloud-sites).
