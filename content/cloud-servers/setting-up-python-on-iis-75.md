---
permalink: setting-up-python-on-iis-75
audit_date:
title: Setting Up Python on IIS 7.5
created_date: '2019-01-15'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

Install Python
Ensure that IIS CGI is installed through Role Services.
Launch IIS Manager by navigating **Control Panel** -> **Administrative Tools** -> **Internet Information Services (IIS) Manager**.
Click on your website and double-click on **Handler Mappings** in the center panel. 
Click **Add Script Map…** link in the **Actions** box to the right.
In **Add Script Map** window, enter "*.py” as Request Path, and python.exe as Executable. 
Add two parameters (-u %s) the end of the path (ex. C:\Python27\python.exe -u %s). 
Give the mapping a name (such as “Python”) and then click **OK**. 
Create a new Python script in web folder and name it HelloWorld.py. 
**Note** that you’ll need to return a complete HTTP header for your script to work:
print "Status: 200 OK"
print "Content-Ty
pe: text/plain;charset=utf-8"
