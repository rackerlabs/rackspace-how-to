---
permalink: configure-rackspace-cloud-files-with-cyberduck/
audit_date: '2019-02-18'
title: Configure Rackspace Cloud Files with Cyberduck
type: article
created_date: '2019-02-18'
created_by: Rackspace Community
last_modified_date: '2019-02-18'
last_modified_by: Cat Lookabaugh
product: Cloud Files
product_url: cloud-files
---

You can use Cyberduck&reg; to manage your Rackspace Cloud Files storage account
and to configure the Akamai&reg; content delivery network (CDN). This article
shows you how to configure the Cyberduck File Transfer Protocol (FTP) client to
manage Cloud Files.

### Initial Cyberduck configuration

Perform the following steps to start the Cyberduck configuration:

1.	Download the Cyberduck FTP client from the [
Cyberduck website](https://trac.cyberduck.io/wiki/help/en/howto/cloudfiles).

2.	Install the FTP client on your system.

3.	Log in to the Rackspace [Cloud Control Panel](https://login.rackspace.com)
to retrieve your API key.

4.	Follow the instructions in
[View and reset your API key](/how-to/view-and-reset-your-api-key) to find your
API key.

5.	Open the Cyberduck FTP client.

### Complete Cyberduck configuration (US customers)

US customers should perform the following steps to finish the Cyberduck
configuration:

1.	If you do not have a preconfigured bookmark for the Rackspace Cloud, start a
new connection by clicking on the **Open Connection** icon and selecting
**Rackspace Cloud Files** from the drop-down list of protocols.

    <img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/CyberDuckCFMenuSelectProtocol.png %}" width="941" height="529" border="1" alt=""  />

2.	Enter your Rackspace Cloud username and paste the API key into the **Password**
field.

3.	When the connection is complete, click **Login**.

### Complete Cyberduck configuration (UK customers)

UK customers should perform the following steps to finish the Cyberduck
configuration:

1.	Click the plus symbol (+) in the lower-left corner to add a bookmark.

    <img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/cyberduck_for_UK_1.png %}" width="393" height="319" border="1" alt=""  />

2.	In the pop-up dialog box, perform the following steps:

    A. Select **Swift (OpenStack Object Storage)** from the drop-down menu.

    B. In the **Server** field, enter **identity.api.rackspacecloud.com**.

    C. In the **Username** field, enter your Rackspace Cloud username.

	<img src="{% asset_path cloud-files/configuring-rackspace-cloud-files-with-cyberduck/cyberduck6.png %}" width="299" height="373" border="1" alt=""  />

3.	Close the dialog box, and then double-click on the bookmark.

4. In the pop-up dialog box, enter your Cloud username and paste the API key
into the **Password** field.

5. When the connection is complete, click **Login**.

### After you are logged in to Cyberduck

After you are logged in, you can view, share, and add Cloud Files content through
the Cyberduck interface.

Before uploading any files or folders, ensure that your account contains at least
one folder (container) in the region where you plan to store your files. You can
create a folder by using the **New Folder** command from the **File** menu. Without
an existing folder as a guide, Cyberduck chooses a default region on its own
when performing bulk uploads.

