---
node_id: 4463
title: Manage public folders in the control panel for Hosted Exchange 2013
type: article
created_date: '2014-12-14'
created_by: Theresa Kinney
last_modified_date: '2016-01-27'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

You can add public folders to your Hosted Microsoft Exchange 2013
domain. Each Exchange 2013 domain is allotted 25 folders, with up to 250MB
of storage per folder. You can manage your public folders within the
Cloud Office Control Panel. You can create, rename, delete, and
mail-enable folders directly in the control panel.

To begin working with public folders, navigate to the Microsoft Exchange
section of the Cloud Office Control Panel and click **Folders**. If you
do not already have public folders enabled, you are prompted to enable
public folders.

From **Folders**, you can list public folders, manage public folders,
view and create subfolders, edit mail settings, and manage permissions.

### List public folders

When you click **Folders**, a page that lists all of your public folders
is displayed.

The **Folders** page displays the following information about the public
folders that you have created:

- Folder name
- Public folder type (Mail, Contact, Calendar, and so on)
- Whether the folders are mail-enabled
- The amount of storage that the folders are using

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Basic_0.png" width="757" height="264" />

### Manage your public folders

To manage your folders, click the gear icon on the **Public Folders** page.
Clicking the gear icon displays a menu from which you can
choose to rename folders, edit mail settings, create subfolders, or
delete a specific folder. Additionally, on this page you can bulk delete
folders, create new folders, and manage different components of the
folder.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/Manage_0.png" width="740" height="269" />

#### Create a folder

As an admin, you can create a new folder by performing the following
steps:

1. Click **Create Folder**.

   A popup dialog box is displayed.

2. Name the folder.

   This is the name that will appear in the list of folders.

3. Select the type of folder.

4. To mail-enable the folder, select the **Enabled** check box.

5. Specify or edit the display name.

6. Specify or edit the email address for the folder.

7. Select or edit the reply-to address.

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

   <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/bulk%2520delete2.png" width="849" height="317" />

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

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/childsubfolder_a.png" width="753" height="208" />

You can create a subfolder in the following ways:

- From the main (or parent) **Folders** page.

- By clicking the parent&rsquo;s folder and creating the subfolder from the
  subfolder list page.

#### Create a subfolder from the parent Folders page

1. Click the gear icon next to the folder for which you want to
   create subfolders.
2. Select **Create Subfolder**.
3. In the **Folder Name** field, specify a name for the subfolder.
4. Select the type of folder.
5. To mail-enable the folder, select the **Enabled** check box.
6. Specify or edit the display name.
7. Specify or edit the email address for the folder.
8. Select or edit the reply-to address.
9. Click **Save** to create the subfolder.

#### Create a subfolder from the subfolder list page

1. In the folder list, click the name of the folder for which you want
   to create a subfolder.
   The subfolder view is displayed.
2. Click **Create Folder**.
3. In the **Folder Name** field specify a name for the subfolder.
4. Select the type of folder.
5. To mail-enable the folder, select the **Enabled** check box.
6. Specify or edit the display name.
7. Specify or edit the email address for the folder.
8. Select or edit the reply-to address.
9. Click **Save** to create the folder.

### Search for a specific folder or subfolder

You can find a specific folder in the following ways:

- Follow the folder path to the folder.

- If you know all or part of the folder&rsquo;s name but do not know its
  path (for example, its parent folder&rsquo;s name), you can search for it
  by using the Search Folders box. For example, if you have a
  subfolder caller **Sales Force** but you can recall only that it has
  the word *sales* in it, you can search the term *sales*. The
  application returns all folders with the word *sales* in their
  name.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/search_0.png" width="643" height="169" />

### Edit mail settings

You can edit the mail settings for a folder by performing the following
steps:

1. Click on the gear icon next to the folder name.
2. From the menu, select **Edit Email Settings**.
3. If you want to mail-enable the folder, select the **Enabled**
   check box.
4. Specify or edit the display name.
5. Specify or edit the email address for the folder.
6. Select or edit the reply-to address.
7. Click **Save**.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/cupcakesandkittens_a.png" width="583" height="315" />

### Manage permissions

Public folders for Hosted Exchange 2013 are managed exclusively through
the administrator control panel. Any users who need to manage public
folders must have administrator access.

### Authorization to add, delete, or modify content

Unlike Exchange 2007 and 2010, individual permissions are not
managed through Outlook for Exchange 2013.  We are working on a release
that will allow you to assign different levels of permissions for each
user.  For the current release, your users have the following
permission levels:

- Any user on the domain can create and delete their own items only,
  but they cannot modify any items.
- Public folder administrators can add, delete, and modify any content by any
  user.
