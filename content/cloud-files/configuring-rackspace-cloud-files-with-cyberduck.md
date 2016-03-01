---
node_id: 3203
title: Configuring Rackspace Cloud Files with Cyberduck
type: article
created_date: '2012-11-15'
created_by: Rae D. Cabello
last_modified_date: '2016-01-21'
last_modified_by: Catherine Richardson
product: Cloud Files
product_url: cloud-files
---

You can use Cyberduck to manage your Rackspace Cloud Files storage account and the configuration of the Akamai content delivery network (CDN). This article provides instructions for configuring the Cyberduck FTP client to manage Cloud Files.

### Configure Cyberduck (US customers)<a name="USA"></a>

1.	Download the Cyberduck FTP client from the [Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles).

2.	Install the FTP client on your system.

3.	Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com) to retrieve your API key. (For information about viewing your API key, see [View and reset your API key](/how-to/view-and-reset-your-api-key).)

4.	In the upper-right corner of the control panel, click the **Account:** ***yourAccountName*** menu and then select **Account Settings**.

    **Note:** If you are using an older version of Cyberduck or you are using the API through a command-line interface, you might be asked to enter a value known as the tenant ID. This value is simply your account number, which is listed first in the **Account:** ***yourAccountName*** menu.

    <img alt="" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/3203.png" width="469" height="137" border="1" />

5.	On the Account Settings page, click Show next to the API Key field to view and copy your API key.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/cpapientry.png" width="205" height="29" border="1" alt=""  />

6.	Open the Cyberduck FTP client.

7.	If you do not have a preconfigured bookmark for Rackspace Cloud, start a new connection by clicking on the **Open Connection** icon <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CyberduckOpenConnection.png" width="67" height="34" alt=""  /> and selecting **Rackspace Cloud Files** from the drop-down list of protocols.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CyberDuckCFMenuSelectProtocol.png" width="941" height="529" border="1" alt=""  />

8.	Enter your Rackspace Cloud username and paste the API key into the **Password** field.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/CyberDuckCloudFiles.png" width="627" height="352" border="1" alt=""  />

9.	When the connection is complete, click **Login**.

After you are logged in, you can view, share, and add Cloud Files content through the Cyberduck interface.

Before uploading any files or folders, ensure that your account contains at least one folder (container) in the region where your files should be stored. You can create a folder by using the **New Folder** command from the **File** menu. Without an existing folder as a guide, Cyberduck selects a default region on its own when performing bulk uploads.

### Configure Cyberduck (UK customers) <a name="UK"></a>

1.	Download the Cyberduck FTP client from the [Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles).

2.	Install the FTP client on your system.

3.	Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com) to retrieve your API key.

4.	In the upper-right corner of the control panel, click the **Account:** ***yourAccountName*** menu and then select **Account Settings**.

    **Note:** If you are using an older version of Cyberduck or you are using the API through a command-line interface, you might be asked to enter a value known as the tenant ID. This value is simply your account number, which is listed first in the **Account:** ***yourAccountName*** menu.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/3203.png" width="703" height="206" border="1" alt=""  />

5.	On the Account Settings page, click **Show** next to the **API Key** field to view and copy your API key.

6.	Open the Cyberduck FTP client.

7.	Click the plus symbol (+) in the lower-left corner to add a bookmark.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/cyberduck_for_UK_1.png" width="393" height="319" border="1" alt=""  />

8.	In the popup dialog box, perform the following steps:

    A.	Select **Swift (OpenStack Object Storage)** from the drop-down menu.

    B.	In the **Server** field, enter **identity.api.rackspacecloud.com**.

    C. In the Username field, enter your Rackspace Cloud username.

	<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/cyberduck6.png" width="299" height="373" border="1" alt=""  />

9.	Close the dialog box and then double-click on the bookmark.

10.	In the popup dialog box, enter your Cloud username and paste the API key into the **Password** field.

11.	When the connection is complete, click **Login**.

After you are logged in, you can view, share, and add Cloud Files content through the Cyberduck interface.

Before uploading any files or folders, ensure that your account contains at least one folder (container) in the region where your files should be stored. You can create a folder by using the **New Folder** command from the File menu. Without an existing folder as a guide, Cyberduck chooses a default region on its own when performing bulk uploads.
