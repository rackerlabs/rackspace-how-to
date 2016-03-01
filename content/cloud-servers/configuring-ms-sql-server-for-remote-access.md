---
node_id: 1184
title: Configuring MS SQL Server for Remote Access
type: article
created_date: '2011-08-16'
created_by: Rackspace Support
last_modified_date: '2015-12-31'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

### Problem

A Microsoft SQL instance cannot be accessed remotely through ODBC,
Visual Studio, or SQL Server Management Studio connection.

### Resolution

**(applies to MS SQL 2005, 2008, 2008 R2, and 2012)**

The Windows firewall is usually the culprit in these scenarios. Open TCP
port 1433 for the service itself, and 1434 if you need to use the SQL
Browser service.

1.  Open **cliconfg** from a RUN prompt and make sure TCP/IP is an
    enabled protocol.

    **For SQL 2005/2008/2008 R2:** Check the Services tool,
    **Start > Administrative Tools > Services**, to
    see that the service named **SQL Server (MSSQLSERVER)** is started.

    **For MS SQL 2012:** Use the Windows key or hover over the left
    lower corner of the desktop and select **Administrative Tools > Services** to see that the service named **SQL Server**
    (**MSSQLSERVER**) is started.

2.  Ensure that you are using the correct credentials to authenticate.
    The default SQL administrator account is named **sa** and if you
    built the server from one of our server images with MSSQL
    pre-installed, the password will be in a text file on the root of
    the C partition.
3.  Use **netstat -an** from the command prompt to verify that the
    server is listening for SQL traffic on the correct ports.
4.  If the server is not listening for SQL traffic on the correct ports,
    use SQL Server Configuration Manager to change the ports.
    -   For MS SQL 2005/2008/2008 R2, go to **Start > All
        Programs > Microsoft SQL Server 2005 (or 2008/2008
        R2) > Configuration Tools > SQL Server
        Configuration Manager**.

        For MS SQL 2012: Use the Windows key or hover over the left
        lower corner of the desktop and select **All Programs > Microsoft SQL Server 2012 > Configuration Tools > SQL Server Configuration Manager**.

    -   Open the **+** next to SQL Server Network Configuration.
    -   Right-click **TCP/IP** and select **Properties**.
    -   Select **IP Addresses**.
    -   All TCP ports mentioned on all interfaces should be 1433. Change
        this to reflect the correct port number and restart the
        SQL services.

5.  If you are using named instances when installing SQL,  giving you
    the ability to host multiple SQL versions or service types, you will
    have to specify the name of the SQL instance when connecting rather
    than just using the server's name or IP.  If you have created a
    named instance, you will need to access it by appending the name to
    the server's name or IP, following a backslash (e.g.
    12.34.56.78\\SQLINSTANCENAME or SQLSERVERNAME\\SQLINSTANCENAME).
