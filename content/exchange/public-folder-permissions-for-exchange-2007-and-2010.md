---
permalink: public-folder-permissions-for-exchange-2007-and-2010/
audit_date: '2017-01-10'
title: Public folder permissions for Exchange 2007 and 2010
type: article
created_date: '2016-02-23'
created_by: Stephanie Fillmon
last_modified_date: '2017-01-10'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: exchange
---

When you create a public folder in Exchange 2007 and 2010, you can specify how much access others have to that folder by assigning roles. Following are the different roles that you can assign and the permissions that are granted to each role.

**Note:** For Exchange 2013 and 2016, only administrators can manage public folders for Exchange 2013 and 2016. For more information, see [Manage public folders in the control panel for Hosted Exchange 2013 and 2016](/how-to/https://support.rackspace.com/how-to/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/).

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
| None              | No permissions are granted. The user cannot open the folder. |

**Note**: Several groups might be listed on the **Permissions** tab. Leave these groups intact so that Rackspace Support can help you if you need it. Two special groups called **FolderAdmins** and **FolderUsers**, allow you to set permissions for all of your public folder administrators or users at once.

### Related articles

- [Manage public folders in the control panel for Hosted Exchange 2007 and 2010](/how-to/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/)

- [Work with public folders through Outlook for Exchange 2007 and 2010](/how-to/working-with-public-folders-through-outlook-for-exchange-2007-and-2010/)
