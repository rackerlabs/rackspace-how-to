---
permalink: cloud-sites-ftp-connection-limits/
audit_date:
title: Cloud Sites FTP Connection Limits
type: article
created_date: '2012-11-05'
created_by: Jason Swindle
last_modified_date: '2012-11-09'
last_modified_by: Jered Heeschen
product: Cloud Sites
product_url: cloud-sites
---

In order to protect the performance of the Rackspace Cloud Sites shared
platform and to serve a large user base, the maximum number of client
connections allowed for a single FTP user is ten (10).

You might have run afoul of this limit if you've seen an error message
like:

    530 Sorry, the maximum number of clients (10) for this user are already connected.

There are a few steps you can take to make sure you stay within the
connection limit:

-   If you are using Filezilla or a similar FTP program, lower the
    "Maximum simultaneous transfers" below 10.
-   Restrict the number of users who have access to your FTP username
    and password.
-   Coordinate with other people using your FTP username so they're
    aware of the connection cap and account for it in their FTP
    client settings.


