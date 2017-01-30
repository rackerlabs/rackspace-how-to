---
permalink: creating-and-configuring-a-user-in-mssql/
audit_date:
title: Create and Configure a User in MSSQL
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article will show you how to create and configure a user in MSSQL.

1. Open SQL Server Management Studio (SSMS).

2. Connect to SQL Server using your log in information.

3. In the left-hand panel, expand **Security > Logins**.

4. Right click **Logins** and select **New Login** from the drop-down menu.

5. Assign a Login name and select the authentication method and default database/language.

   **Note:** Only Domains can use Windows Authentication.

   If you are using SQL authentication you will need to enter an initial password and choose the enforcement options for password policy and expiration as well as whether or not the user will need to change their password when they log in.

   <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin1.PNG %}" alt="ssmsnewlogin1.PNG" />

6. In the left-hand panel, click **Server Roles** to assign any server roles you want
this user to have, including **bulkadmin**, **dbcreator**, **public**, and so on.

7. In the left-hand panel, click **Securables** and then click **Search**.

   The Add Objects dialog box displays, where you can choose specific objects, objects of a certain type or the server itself. Select one and click **OK**.

8. On the **Securables** page, select **Grant**, **With Grant** or **Deny** as necessary for any/all of the
objects in the explicit box.

   Grant will grant access to the securable, with grant will allow the user to grant access to the securable and deny will expressly deny permission to the securable no matter what roles or permissions the user may have.

   <img src="{% asset_path cloud-servers/creating-and-configuring-a-user-in-mssql/ssmsnewlogin3.PNG %}" alt="ssmsnewlogin3.PNG" />

9. In the left-hand panel, click **Status** to grant or deny permission to the Database Engine,
enable or disable the login and to unlock the account should it get
locked out.

When you have finished modifying the settings, click **OK** to create the user and exit the new login creation window.
