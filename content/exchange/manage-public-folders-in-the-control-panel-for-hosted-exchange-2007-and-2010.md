---
permalink: manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/
audit_date:
title: Manage public folders in the control panel for Hosted Exchange 2007 and 2010
type: article
created_date: '2014-12-12'
created_by: Theresa Kinney
last_modified_date: '2016-02-01'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

You can add public folders to your Hosted Microsoft Exchange 2007 or
2010 domain. Each Exchange domain is allotted 25 folders, with up to 250
MB of storage per folder. You can manage your public folders within the
[Cloud Office Control
Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f). You can
create, rename, delete, and mail-enable folders directly in the control
panel.

To begin working with public folders, navigate to the Microsoft Exchange
section of the Cloud Office Control Panel and click **Folders**. If you
do not already have public folders enabled, you are prompted to enable
public folders.

This article provides information and instructions for working with
public folders in the Cloud Office Control Panel:

###List public folders

When you click on **Folders**, a page that lists all of your public
folders is displayed.

The Folders page displays the following information about the public
folders that you have created:

-   Folder name
-   Public folder type (Mail, Contact, Calendar, and so on)
-   Whether the folders are mail-enabled
-   The amount of storage that the folders are using

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/Basic_a.png %}" height="250" />

### Manage public folders

You click the gear icons on the Public Folders page to manage your
folders. Clicking the gear icon displays a menu from which you can
choose to rename folders, edit mail settings, create subfolders, or
delete a specific folder. Additionally, on this page you can bulk delete
folders, create new folders, and manage different components of the
folder.

### Create public folder

As an admin, you can create a new folder by performing the following
steps:

1.  Click **Create Folder**.
    A popup dialog box is displayed.
2.  Name the folder.
    This is the name that will appear in the list of folders.
3.  Select the type of folder.
4.  To mail-enable the folder, select the **Enabled** check box.
5.  Specify or edit the display name.
6.  Specifiy or edit the email address for the folder.
7.  Specify or edit the reply-to address.
8.  Click **Save** to create the folder.
 
    <img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/Create_a.png %}" height="250" />

### Delete public folder

1.  In the list on the **Folders** page, click the gear icon next to the
    folder that you want to delete.
    <img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/delete_a.png %}" height="250" />
2.  From the menu, select **Delete**.
3.  In the confirmation pop up box, click **Delete Folder**, to
    permanently delete the folder.

### Bulk-delete public folders

From the list of public folders, you can delete multiple folders at once
(bulk delete).

1.  Select the check box to the left of each folder that you want
    to delete. If you want to delete all the folders in the list, select
    the check box next to the **Folder Name** label at the top of
    the list.
2.  Click the gear icon next to the **Folder Name** label at the top of
    the list and select **Delete**.
    The delete dialog pops up to confirm that you are about to delete
    the selected folders.
    <img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/bulk%20delete2.png %}" height="250" />
3.  In the confirmation popup box, click **Delete Folders** to
    permanently delete the selected folders.

### Rename public folder

1.  In the list of folders on the Folders page, click the gear icon next
    to the folder that you want to rename.
2.  Select **Rename**, and then enter a new name for the folder.
3.  Click **Rename**.
    <img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/rename_a.png %}" height="250" />

### View and create subfolders (child folders)

The option to expand folders to see their child folders, or
**subfolders**, has changed. To view the subfolders that have been
created under a folder, click the name of the parent folder in the list.
All of the subfolders nested under the parent folder are displayed. The
folder path is shown as a breadcrumb trail along the top of Folders
page. The path is listed as ***domain* &gt; root &gt; *parentFolder***,
and the page you are on is the subfolder list. See the following
example:

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/child%20subfolder.png %}" width="500" />

You can create a subfolder in several ways:

#### Create a subfolder from the parent folder's page

1.  Click the gear icon next to the folder for which you want to
    create subfolders.
2.  Click **Create Subfolder**.
3.  In the **Folder Name** field, specify a name for the subfolder.
4.  Select the type of folder.
5.  To mail-enable the folder, select the **Enabled** check box.
6.  Specify or edit the display name.
7.  Specify or edit the email address for the folder.
8.  Select or edit the reply-to address.
9.  Click **Save** to create the folder.

#### Create a subfolder from the public folder listing page

1.  Click the gear icon.
2.  Click **Create Subfolder**.
3.  In the **Folder Name** field, specify a name for the subfolder.
4.  Select the type of folder.
5.  Select whether or not this will be a mail enabled folder.
6.  Click **Save** to create the folder.

#### Create a subfolder from the subfolder listing page

1.  In the folder list, click the name of the folder for which you want
    to create a subfolder.
    The subfolder view is displayed
2.  Click **Create Subfolder**.
3.  In the **Folder Name** field, specify a name for the subfolder.
4.  Select the type of folder.
5.  To mail-enable the folder, select the **Enabled** check box.
6.  Click **Save** to create the folder.

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/subfolders2_a.png %}" height="250" />

#### Search for a specific folder or subfolder

You can find a specific folder in the following ways:

- Follow the folder path to the folder.
- If you know all or part of the folder's name but do not know its
  path (for example, its parent folder's name), you can search for it
  by using the **Search Folders** box. For example, if you have a
  subfolder called **Sales Force** but you can recall only that it has
  the word *sales* in it, you can search for the term *sales*. The
  application returns all folders with the word *sales* in their name.

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2007-and-2010/search.png %}" width="500" />

### Edit mail settings

You can edit the mail settings for a folder by performing the following
steps.

1.  Click the gear icon next to the folder name.
2.  From the menu, select **Edit Email Settings**.
3.  If you want to mail-enable the folder, select
    the **Enabled** check box.
4.  Specify or edit the display name.
5.  Specify or edit the email address for the folder
6.  Select or edit the reply-to address.
7.  Click **Save**.

### Where to go from here

See [Working with public folders through Outlook for Exchange 2007 and
2010](/how-to/working-with-public-folders-through-outlook-for-exchange-2007-and-2010).
