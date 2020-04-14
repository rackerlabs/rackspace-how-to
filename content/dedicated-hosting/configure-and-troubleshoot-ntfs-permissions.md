---
permalink: configure-and-troubleshoot-ntfs-permissions/
audit_date:
title: Configure and troubleshoot NTFS permissions
type: article
created_date: '2020-03-06'
created_by: Derek Benson
last_modified_date: '2020-03-09'
last_modified_by: Cat Lookabaugh
product: Dedicated Hosting
product_url: dedicated-hosting
---

*This article applies to the following Windows Server&reg; versions: 2008, 2008 R2, 2012, 2012 R2, 2016, 2019*

This article addresses how to configure and troubleshoot New Technology File System (NTFS) file and folder permissions on Windows&reg; servers.

### NTFS permissions overview

Basic built-in file and folder permission levels allow for easy configuration. The following chart
shows built-in permission levels and the access they provide:

| Permissions                      | Full control | Modify  | Read & execute | List folder contents | Read    | Write   |
| -------------------------------- | ------------ | ------- | -------------- | -------------------- | ------- | ------- |
| *Traverse folder or execute file*| **Yes**      | **Yes** | **Yes**        | **Yes**              | **No**  | **No**  |
| *List folder or read data*	     | **Yes**      | **Yes** | **Yes**        | **Yes**              | **Yes** | **No**  |
| *Read attributes*                | **Yes**      | **Yes** | **Yes**        | **Yes**              | **Yes** | **No**  |
| *Read extended attributes*       | **Yes**      | **Yes** | **Yes**        | **Yes**              | **Yes** | **No**  |
| *Create files or write data*	  | **Yes**      | **Yes** | **No**         | **No**               | **No**  | **Yes** |
| *Create folders or append data*  | **Yes**      | **Yes** | **No**         | **No**               | **No**  | **Yes** |
| *Write attributes*	              | **Yes**      | **Yes** | **No**         | **No**               | **No**  | **Yes** |
| *Write extended attributes*      | **Yes**      | **Yes** | **No**         | **No**               | **No**  | **Yes** |
| *Delete subfolders and files*    | **Yes**      | **No**  | **No**         | **No**               | **No**  | **No**  |
| *Delete*                         | **Yes**      | **Yes** | **No**         | **No**               | **No**  | **No**  |
| *Read permissions*	              | **Yes**      | **Yes** | **Yes**        | **Yes**              | **Yes** | **Yes** |
| *Change permissions*	           | **Yes**      | **No**  | **No**         | **No**               | **No**  | **No**  |
| *Take ownership*	              | **Yes**      | **No**  | **No**         | **No**               | **No**  | **No**  |
| *Synchronize*                    | **Yes**      | **Yes** | **Yes**        | **Yes**              | **Yes** | **Yes** |

<br />

### Configuring permissions for a file or folder

**Note:** When you configure permissions for a file or a folder, log in to the server with a user that
has at least **Full Control** permissions for the object you want to modify. To make sure that you have
appropriate permissions to make the change, log in with a user account that has administrator privileges
on the device. Administrator accounts can typically override permissions for most files and folders.

Follow these steps to configure permissions:

1. Navigate to the parent directory of the desired file or folder for which you want to set permissions.
2. **Right-click** the file or folder and choose **Properties**.
3. Click the **Security** tab.
4. You should see the path and name of the file or folder at the top of the window under **Object name**.
   Ensure this is correct before proceeding.
5. Click **Edit**.
6. Look for the user whose permissions you want to modify in the box labeled **Group or user names**.
   *If the user is listed, move to step 7. If not, use the following instructions to add the user to the list*.
    1. To add a user, click **Add**.
    2. Type in the username in the box marked **Enter the object names to select** and click **Check Names**. 
    3. If you don't see the user, ensure that you listed the correct location in **From this location**.
       If necessary, click **Advanced** to search for the user manually.
    4. When you find the user, it is underlined. Click **Ok**.
7. Click the desired user in **Group or user names**.
8. Check the box under **Allow** in the **Permissions for (username)** section and click **Ok** to save.

### Troubleshooting permissions issues

**Note:** Permissions apply to users in the most restrictive way possible. If there are permissions set
in multiple places, such as permissions for a user group and also specific to the user, the most
restrictive permissions set for that user apply to any given file or folder. Keep this in mind when
troubleshooting.

To troubleshoot permissions issues, follow these steps:

1. Navigate to the parent directory of the problematic file or folder.
2. **Right-click** the file or folder and choose **Properties**.
3. Click the **Security** tab.
4. You should see the path and name of the file or folder at the top of the window under
   **Object name**. Ensure this is correct before proceeding.
5. Click **Advanced**.
6. Click the **Effective Access** tab.
7. Click the link labeled **Select a user**.
8. Type the username in the box marked **Enter the object names to select** and click **Check Names**. 
9. If you don't see the user, ensure that you listed the correct location in **From this location**.
   If necessary, click **Advanced** to search for the user manually.
10. When you find the user, it is underlined. Click **Ok** to see the user listed
    next to **User/Group**.
11. Click **View effective access** to see the list of the user's permissions. The final column
    indicates the policy or group that limits the permission type. This information shows you
    where to make changes to solve the problem.
