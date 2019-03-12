---
permalink: transfer-files-by-using-WinSCP/
audit_date: '2019-03-12'
title: Transfer files by using WinSCP
type: article
created_date: '2019-03-12'
created_by: Rackspace Community
last_modified_date: '2019-03-12'
last_modified_by: Chris Moyer
product: Cloud Servers
product_url: cloud-servers
---

WinSCP is an open-source, free Secure File Transfer Protocol (sftp) and File Transfer Protocol (ftp) client for Microsoft® Windows®. You can use WinSCP to securely transfer files between your local Microsoft Windows machine and a remote server.

This article describes how to download, install, and use WinSCP to transfer files between computers. This article also describes how to create files and folders, and set permissions.

### Download and install WinSCP

1. [Download](https://winscp.net/eng/download.php) WinSCP.

2. Double-click the WinSCP executable to begin the installation process.

3. Select **Typical** installation or **Custom** installation for the **Setup** type and click **Next**.

    A custom installation provides the option to select the file's destination, the components to install, and the features within the WinSCP application including:

    * The drag&drop shell extension (allows direct downloads and might require restart)
    * Pageant (SSH authentication agent)
    * PuTTYgen (key generator)
    * Translations

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/install-type.png %}" />

4. Choose the interface type with which you want to work and click **Next**.

    The **Commander** interface displays two panes with your local files on the left and remote files  on the right. The **Explorer** style displays only remote files in a single window.

    We recommend starting with the **Commander** interface. You can change the default style later in the **Preferences** menu.

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/interface-type.png %}" />

5. Configure `sshd` (the ssh/sftp server) to listen to a port that is different from the default.

    The following example uses port 30000:

    * **SFTP port**: 30000
    * **Username**: demo
    * **IP address**: 123.45.67.89

    **Note**: For the host name, enter the Internet Protocol (IP) address of your server and change the port to match your `sshd` port.

6. Ensure that the **Connection Type** is set to `sftp`.

7. To save the configuration, click the **Save** button next to the **Login** button.

8. Enter a configuration name that is easy for you to remember, for example, **server-ORD-local23**.

    WinSCP stores configurations in **Stored Sessions**. Use a different name for each server.

    **Note**: You can use a private key to log in to the cloud server. See [Generate RSA keys with SSH by using PuTTYgen](/how-to/generating-rsa-keys-with-ssh-puttygen) for information about setting up public and private keys.

9. If this is the first time you have used WinSCP, and you are sure you've entered the correct configuration details, click **Yes** on the **Warning** dialog box.

    This warning is not shown during subsequent connections to this server.

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/accept-key.png %}" />

### Transfer files

1. Launch WinSCP.

2. To transfer files, drag and drop files from your local machine that is shown in the left pane, to the server file system that is shown in the right pane.

    If you don't have permission to write to the server file system, an **Error** dialog box appears.

    **Note**: The lock on the lower right side of the **Commander** window indicates that the connection is secure. If you double-click the icon, you see the security features of your connection, such as the encryption algorithm used by `sftp`.

    If you use WinSCP to connect an ftp server, the lock icon does not appear because ftp doesn't provide secure (encrypted) communication.

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/transfer-files.png %}" />

### Create files and directories

1. To create a file, click **File > New** and select **File**.

2. Enter a file name and click **OK**.

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/file-name.png %}" />

3. In the text editor, enter the contents of the new file and click the **Save** icon.

    When you save the remote file, WinSCP begins the upload process.

    **Note**: If you want to use a more sophisticated text editor, you can select a different editor in the **Preferences** menu.

4. To create a folder, click **File > New** and select **Folder**.

5. Enter a folder name.

6. To set permissions, select **Set permissions** and change the permissions for the new directory by selecting **R**, **W**, and **X** (for read, write, and execute) for each user profile.

    You can also see the equivalent octal value for your settings. The user you used to login via sftp owns new directory.

    <img src="{% asset_path cloud-servers/transfer-files-using-WinSCP/permissions.png %}" />

7. To change permissions, right-click the file or directory and select **Properties**.
