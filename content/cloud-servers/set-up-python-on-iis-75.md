---
permalink: set-up-python-on-iis-75/
audit_date:
title: Set up Python on IIS 7.5
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

Use the following steps to install and set up Python on Internet Information Services (IIS) 7.5:

1. Ensure that IIS Common Gateway Interface (CGI) is installed through role services.
2. Launch IIS Manager by selecting **Control Panel > Administrative Tools > 
   Internet Information Services (IIS) Manager**.
3. Click on your website and double-click on **Handler Mappings** in the center panel. 
4. Click **Add Script Map** in the **Actions** box to the right.
5. In the **Add Script Map** window, enter `*.py` as the **Request Path**, and **python.exe** as the **Executable**. 
6. Add the following two parameters at the end of the path:

   **-u %s**
       
   The path should have the following format:
   
   **C:\Python27\python.exe -u %s**

7. Give the mapping a name (such as **Python**) and click **OK**. 
8. Create a new Python script in your web folder and name it **HelloWorld.py**.

**Note**: You need to return a complete HTTP header for your script to work, as shown in the following example:

    print "Status: 200 OK"
    print "Content-Ty
    pe: text/plain;charset=utf-8"
