---
permalink: create-and-configure-a-user-in-mssql/
audit_date: '2020-07-27'
title: Create and configure a user in MSSQL
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2020-07-27'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Use the following steps to create and configure a user in MSSQL&reg;:

1. Open the Microsoft &reg; **SQL Server&reg; Management Studio** (SSMS).

2. Connect to SQL Server by using your login information.

3. In the left-hand panel, expand **Security > Logins**.

4. Right-click **Logins** and select **New Login** from the drop-down menu.

5. Assign a login name and select the authentication method and default database or language.

   If you are using SQL authentication, you must enter an initial password and choose the
   enforcement options for password policy and expiration as well as whether or not the user
   needs to change their password when they log in.

   <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin1.PNG %}" alt="ssmsnewlogin1.PNG" />

6. In the left-hand panel, click **Server Roles** to assign any server roles you want
   this user to have, including **bulkadmin**, **dbcreator**, **public**, and so on.

7. In the left-hand panel, click **Securables** and then click **Search**.

   The **Add Objects** dialog box displays, where you can choose specific objects, objects of a
   certain type, or the server itself. Select one and click **OK**.

8. On the **Securables** page, select **Grant**, **With Grant**, or **Deny** as necessary for any of the
   objects in the explicit box.

   **Grant** gives access to the securable, **With Grant** allows the user to grant access to the
   securable, and **Deny** expressly denies permission to the securable no matter what roles or
   permissions the user might have.

   <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin3.PNG %}" alt="ssmsnewlogin3.PNG" />

9. In the left-hand panel, click **Status** to grant or deny permission to the database engine,
   enable or disable the login, and to unlock the account should it get
   locked out.

When you have finished modifying the settings, click **OK** to create the user and exit the new login creation window.
