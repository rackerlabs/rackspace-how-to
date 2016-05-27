---
permalink: creating-and-configuring-a-user-in-mssql/
audit_date:
title: Create and Configure a User in MSSQL
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

This article will show you how to create and configure a user in MSSQL.

1. Open SQL Server Management Studio (SSMS).

2. Connect to SQL Server using the proper credentials.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsconnect.PNG %}" alt="ssmsconnect.PNG" />

3. Expand Security and Logins.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmslogins.PNG %}" alt="ssmslogins.PNG" />

4. Right click **Logins** and select **New Login**.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin.PNG %}" alt="ssmsnewlogin.PNG" />

5. On this page you assign a Login name and select the authentication
method and default database/language. (Note only Domains can use Windows
Authentication) If you are using SQL authentication you will need to
enter an initial password and choose the enforcement options for
password policy and expiration as well as whether or not the user will
need to change their password when they log in.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin1.PNG %}" alt="ssmsnewlogin1.PNG" />

6. Click on **Server Roles** and you can assign any sever roles you want
this user to have.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin2.PNG %}" alt="ssmsnewlogin2.PNG" />

7. Click on **Securables** and then click the **Search** button. This will bring
up the Add Objects dialog box where you can choose specific objects,
objects of a certain type or the server itself. Select one and click Ok.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsaddobjects.PNG %}" alt="ssmsaddobjects.PNG" />

8. Select **Grant**, **With Grant** or **Deny** as necessary for any/all of the
objects in the explicit box. (Grant will grant access to the securable,
with grant will allow the user to grant access to the securable and deny
will expressly deny permission to the securable no matter what roles or
permissions the user may have).

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin3.PNG %}" alt="ssmsnewlogin3.PNG" />

9. Click on **status** to grant or deny permission to the Database Engine,
enable or disable the login and to unlock the account should it get
locked out. When all this is done click on **OK** to create the user.

  <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin4.PNG %}" alt="ssmsnewlogin4.PNG" />
