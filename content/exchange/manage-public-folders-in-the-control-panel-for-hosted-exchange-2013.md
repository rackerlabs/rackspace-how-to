---
permalink: manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/
audit_date: '2016-05-12'
title: Manage public folders in the control panel for Hosted Exchange 2013 and 2016
type: article
created_date: '2014-12-14'
created_by: Theresa Kinney
last_modified_date: '2016-02-12'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: exchange
---

You can add public folders to your Hosted Microsoft Exchange 2013 and Hosted Microsoft Exchange 2016
domains. Each is allotted 25 folders, with up to 250 MB
of storage per folder. You can manage your public folders within the
Cloud Office Control Panel. You can create, rename, delete, and
mail-enable folders directly in the control panel.

To begin working with public folders, navigate to the Microsoft Exchange
section of the Cloud Office Control Panel and click **Folders**. If you
do not already have public folders enabled, you are prompted to enable
them.

From the Folders page, you can list public folders, manage public folders,
view and create subfolders, edit mail settings, and manage permissions.

### List public folders

When you click **Folders**, a page that lists all of your public folders
is displayed.

The Folders page displays the following information about the public
folders that you have created:

- Folder name
- Public folder type (Mail, Contact, Calendar, and so on)
- Whether the folders are mail-enabled
- The amount of storage that the folders are using

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/Basic_0.png %}" width="757" height="264" />

### Manage your public folders

To manage your folders, click the gear icon on the Folders page. From the menu, you
can choose to rename folders, edit mail settings, create subfolders, or delete a specific
folder. Additionally, on this page you can bulk delete folders, create new folders, and
manage different components of a folder.

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/Manage_0.png %}" width="740" height="269" />

#### Create a folder

As an admin, you can create a new folder by performing the following
steps:

1. Click **Create Folder**.

2. In the popup dialog box, enter a name for the folder.

   The name will appear in the list of folders.

3. Select the type of folder.

4. To mail-enable the folder, select the **Enabled** check box.

5. If you selected the **Enabled** check box, specify the folder’s display name, email address, and reply-to address. 

8. Click **Save** to create the folder

#### Delete a folder

1. In the list on the **Folders** page, click the gear icon next to the
   folder that you want to delete.

2. From the menu, select **Delete**.

3. In the confirmation popup box, click **Delete Folder** to
   permanently delete the folder.

#### Bulk-delete folders

From the list of public folders, you can delete multiple folders at once
(bulk delete).

1. Select the check box to the left of each folder that you want
   to delete. If you want to delete all the folders in the list, select
   the check box next to the **Folder Name** label at the top of
   the list.

2. Click the gear icon next to the **Folder Name** label at the top of
   the list and select **Delete**.

   <img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/bulk%2520delete2.png %}" width="849" height="317" />

3. In the confirmation popup box, click **Delete Folders** to
   permanently delete the selected folders.

#### Rename a folder

1. In the list of folders on the Folders page, click the gear icon next
   to the folder that you want to rename.

2. Select **Rename**.

3. Enter a new name and then click **Rename**.

### View and create subfolders

To view the subfolders that have been created under a folder, click the
name of the parent folder in the list. All of the subfolders nested
under the parent folder are displayed. The folder path is shown as a
breadcrumb trail along the top of Folders page. The path is listed as
***domain* &gt; root &gt; *parentFolder***, and the page you are on is
the subfolder list. See the following example:

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/childsubfolder_a.png %}" width="753" height="208" />

You can create a subfolder in the following ways:

- From the main (or parent) Folders page.

- By clicking the parent's folder and creating the subfolder from the
  subfolder list page.

#### Create a subfolder from the parent Folders page

1. Click the gear icon next to the folder for which you want to
   create subfolders.
2. Select **Create Subfolder**.
3. Specify all the information for the subfolder, as described in [Create a folder](#create-a-folder).
4. Click **Save**.

#### Create a subfolder from the subfolder list page

1. In the folder list, click the name of the folder for which you want
   to create a subfolder.
   
   The subfolder view is displayed.
   
2. Click **Create Folder**.

3. Specify all the information for the subfolder, as described in [Create a folder](#create-a-folder).

4. Click **Save** to create the folder.

### Search for a specific folder or subfolder

You can find a specific folder in the following ways:

- Follow the folder path to the folder.

- If you know all or part of the folder's name but do not know its
  path (for example, its parent folder's name), you can search for it
  by using the Search Folders box. For example, if you have a
  subfolder caller **Sales Force** but you can recall only that it has
  the word *sales* in it, you can search the term *sales*. The
  application returns all folders with the word *sales* in their
  name.

<img src="{% asset_path exchange/manage-public-folders-in-the-control-panel-for-hosted-exchange-2013/search_0.png %}" width="643" height="169" />

### Edit mail settings

You can edit the mail settings for a folder by performing the following
steps:

1. Click on the gear icon next to the folder name.
2. From the menu, select **Edit Email Settings**.
3. To mail-enable the folder, select the **Enabled** check box and specify the rest of the information in the popup dialog box.
4. To disable email, clear the **Enabled** check box.
5. Click **Save**.

### Manage permissions

Public folders for Hosted Exchange 2013 and 2016 are managed exclusively through
the administrator control panel. Any users who need to manage public
folders must have administrator access.

### Authorization to add, delete, or modify content

Unlike Exchange 2007 and 2010, individual permissions are not
managed through Outlook for Exchange 2013 or 2016. For these versions, your users have the following
permission levels:

- Reviewer:  Allows all users on the domain to view all public folders

- Publishing author: Automatically given to administrators who create public folders in the control panel. Each action applies only the to folders that the administrators create.
