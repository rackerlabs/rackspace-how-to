---
permalink: public-folder-permissions-for-exchange-2007-and-2010/
audit_date:
title: Public folder permissions for Exchange 2007 and 2010
type: article
created_date: '2016-02-23'
created_by: Stephanie Fillmon
last_modified_date: '2016-02-23'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

When you create a public folder in Exchange 2007 and 2010, you can assign permissions to limit how much access others have to that folder. Following are the different roles available to assign and the permissions granted to that role.

| Role              | Permission           |
|-------------------|----------------------|
| Owner             | Create, read, modify, and delete all items and files. Create subfolders. Change the permission levels that other people have for the folder. |
| Publishing Editor | Create, read, modify, and delete all items and files. Create subfolders. |
| Editor            | Create, read, modify, and delete all items and files.  |
| Publishing Author | Create and read items and files. Create subfolders. Modify and delete items and files that you create. |
| Author            | Create and read items and files. Modify and delete items and files that you create. |
| Nonediting Author | Create and read items and files. Delete items and files that you create. |
| Contributor       | Create items and files only. |
| Reviewer          | Read items and files only. |
| Custom            | Perform activities defined by the folder owner. |
| None              | You have no permission. You cannot open the folder. |

**Note**: You might see several groups on the **Permissions** tab. That is normal. It is important to leave these groups intact so that we can help you if you need it. There are also two special groups called **FolderAdmins** and **FolderUsers**. These groups allow you to set permissions for all of your public folder administrators or users at once.
