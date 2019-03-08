---
permalink: transfer-files-using-WinSCP/
audit_date:
title: Transfer files using WinSCP
type: article
created_date: '2019-03-07'
created_by: Chris Moyer
last_modified_date: '2019-03-07'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

WinSCP is an open-source, free sftp and ftp client for Windows. You can use WinSCP to copy and transfer files between local and remote computers.

This article describes how to download, install, and use WinSCP to transfer files between computers. This article also describes how to set permissions and create new files.

### Download and install WinSCP

1. [Download](https://winscp.net/eng/download.php) WinSCP.

2. Double-click WinSCP to begin the installation process.

3. Determine if you want a **Typical** installation or a **Custom** installation.

   A custom installation gives you the option to select the file's destination, the components to be installed, and the features within the WinSCP application, including:

   * Drag & drop shell extension (allows direct downloads, may require restart)
   * Pageant (SSH authentication agent)
   * PuTTYgen (key generator)
   * Translations

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/install-type.png %}" />

4. Choose the interface type with which you want to work.

   The **Commander** interface displays two panes with your local files on the left and remote files  on the right. The **Explorer** style displays only remote files in a single window.

   We recommend starting with the **Commander** interface. You can change the default style later within the **Preferences** menu.
  <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/interface-type.png %}" />

5. Configure `sshd` (the ssh/sftp server) to listen to a port that is different from the default.

   The following example uses port 30000:

   * **SFTP port**: 30000
   * **Username**: demo
   * **IP address**: 123.45.67.89

  **Note**: For the Host Name, enter the IP address of your server and change the Port to match your sshd port.

6. Ensure that the **Connection Type** is set to `sftp`.

7. To save the configuration, click the **Save** button next to the **Login** button.

8. Enter a configuration name that you will remember, for example, **server-ORD-local23**.

   WinSCP stores configurations in **Stored Sessions**. Use a different name for each server.

  **Note**: You can use a private key to log in to a slice. See [Generate RSA keys with SSH by using PuTTYgen](how-to/generating-rsa-keys-with-ssh-puttygen/) for information about setting up public/private keys.

9. If this is the first time you have used WinSCP, and you are sure you've entered the correct configuration details, click **Yes** on the **Warning** dialog box.

  This warning is not shown during subsequent connections to this server.

  <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/accept-key.png %}" />
