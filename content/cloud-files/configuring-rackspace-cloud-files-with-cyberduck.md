---
permalink: configuring-rackspace-cloud-files-with-cyberduck/
audit_date:
title: Configure Rackspace Cloud Files with Cyberduck
type: article
created_date: '2012-11-15'
created_by: Rae D. Cabello
last_modified_date: '2017-06-06'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

You can use Cyberduck to manage your Rackspace Cloud Files storage account and the configuration of the Akamai content delivery network (CDN). This article provides instructions for configuring the Cyberduck FTP client to manage Cloud Files.

### Configure Cyberduck (US customers)

1.	Download the Cyberduck FTP client from the [Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles).

2.	Install the FTP client on your system.

3.	Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com) to retrieve your API key.

4.	Follow the instructions in [View and reset your API key](/how-to/view-and-reset-your-api-key) to find your API key.

5.	Open the Cyberduck FTP client.

6.	If you do not have a preconfigured bookmark for Rackspace Cloud, start a new connection by clicking on the **Open Connection** icon and selecting **Rackspace Cloud Files** from the drop-down list of protocols.

    <img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/CyberDuckCFMenuSelectProtocol.png %}" width="941" height="529" border="1" alt=""  />

7.	Enter your Rackspace Cloud username, and paste the API key into the **Password** field.

8.	When the connection is complete, click **Login**.

After you are logged in, you can view, share, and add Cloud Files content through the Cyberduck interface.

Before uploading any files or folders, ensure that your account contains at least one folder (container) in the region where your files should be stored. You can create a folder by using the **New Folder** command from the **File** menu. Without an existing folder as a guide, Cyberduck selects a default region on its own when performing bulk uploads.

### Configure Cyberduck (UK customers)

1.	Download the Cyberduck FTP client from the [Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles).

2.	Install the FTP client on your system.

3.	Log in to the Rackspace [Cloud Control Panel](https://mycloud.rackspace.com) to retrieve your API key.

4.	Follow the instructions in [View and reset your API key](/how-to/view-and-reset-your-api-key) to find your API key.

    **Note:** If you are using an older version of Cyberduck or you are using the API through a command-line interface, you might be asked to enter a value known as the tenant ID. This value is simply your account number, which is listed first in the account menu.

5.	On the Account Settings page, click **Show** next to the **API Key** field to view and copy your API key.

6.	Open the Cyberduck FTP client.

7.	Click the plus symbol (+) in the lower-left corner to add a bookmark.

    <img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/cyberduck_for_UK_1.png %}" width="393" height="319" border="1" alt=""  />

8.	In the popup dialog box, perform the following steps:

    A. Select **Swift (OpenStack Object Storage)** from the drop-down menu.

    B. In the **Server** field, enter **identity.api.rackspacecloud.com**.

    C. In the Username field, enter your Rackspace Cloud username.

	<img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/cyberduck6.png %}" width="299" height="373" border="1" alt=""  />

9.	Close the dialog box, and then double-click on the bookmark.

10. In the popup dialog box, enter your Cloud username, and paste the API key into the **Password** field.

11. When the connection is complete, click **Login**.

After you are logged in, you can view, share, and add Cloud Files content through the Cyberduck interface.

Before uploading any files or folders, ensure that your account contains at least one folder (container) in the region where your files should be stored. You can create a folder by using the **New Folder** command from the File menu. Without an existing folder as a guide, Cyberduck chooses a default region on its own when performing bulk uploads.
