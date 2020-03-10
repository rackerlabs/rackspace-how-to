---
permalink: add-and-remove-roles-and-features-on-windows-server/
audit_date:
title: 'Add and Remove Roles and Features on Windows Server'
type: article
created_date: '2020-03-10'
created_by: Derek Benson
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

*This article is applicable to the following Windows Server versions: 2012, 2012 R2, 2016, 2019*

This article shows how to install and remove Windows Server Roles and Features using Server Manager.



## Adding Windows roles and features

1. Open **Server Manager** by clicking the **Server Manager** icon in the taskbar or selecting **Server Manager** in the start menu.

2. Click on **Manage** in the upper right hand portion of of the screen and click **Add Roles and Features**.

**Note:** If Server Manager is still loading, you may receive an error when atempting to add Roles and Features. If this happens, wait for a minute and then you should be able to proceed.

3. A wizard will open that will guide you through the process step by step.

4. On the **Before you begin** page, click **Next** to begin. This page may be skipped in the future by checking the box **Skip this page by default**.

5. On the **Select installation type** page, choose **Role-based or feature-based installation** and click **Next**.

6. On the **Server Selection** page, choose the server you wish to add the role or feature to (in most cases this will be the server you are logged into), and click **Next**.

7. Select any desired roles on the **Server Roles** page. As you add roles you will be prompted to add any prerequisite roles and features, if any. Once you have selected the desired roles, click **Next**.

8. Select any desired features on the **Features** page and click **Next**.

9. The next couple of screens with be for initial configuration of features you choose in the previous screens. Complete this configuration as necessary and then click **Next** on each screen.

10. Once initial configuration of chosen features is completed, you will arrive at the **Confirmation** page. A summary of the changes to be made will be listed here. Verify the changes before proceeding. In addition, if the server should restart automatically once installation completes, check the box labeled **Restart the desination server automatically if required**.

11. Click **Install** to begin installing the chosen roles and features.



## Removing Windows roles and features

1. Open **Server Manager** by clicking the **Server Manager** icon in the taskbar or selecting **Server Manager** in the start menu.

2. Click on **Manage** in the upper right hand portion of of the screen and click **Remove Roles and Features**.

**Note:** If Server Manager is still loading, you may receive an error when atempting to remove Roles and Features. If this happens, wait for a minute and then you should be able to proceed.

3. A wizard will open that will guide you through the process step by step.

4. On the **Before you begin** page, click **Next** to begin. This page may be skipped in the future by checking the box **Skip this page by default**.

6. On the **Select Destination Server** page, choose the server you wish to remove the role or feature from (in most cases this will be the server you are logged into), and click **Next**.

7. Select roles for removal on the **Server Roles** page. As you add roles you will be prompted to remove any roles and features that depend on the role you selected for removal, if any. Once you have selected the desired roles, click **Next**.

8. Select any features for removal on the **Features** page and click **Next**.

9. On the **Confirmation** page, a summary of the changes to be made will be listed. Verify the changes before proceeding. In addition, if the server should restart automatically once installation completes, check the box labeled **Restart the desination server automatically if required**.

11. Click **Remove** to begin removing the chosen roles and features.
