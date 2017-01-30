---
permalink: getting-started-with-cloud-sites-ftpsshfsftp-clients/
audit_date:
title: 'Getting Started With Cloud Sites, FTP/SSHFS/FTP Clients'
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2015-12-29'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

**Note:** This article is written for our [Cloud Sites Control Panel](https://manage.rackspacecloud.com/). You can get to it from the [Cloud Control Panel](https://mycloud.rackspace.com) by clicking **Rackspace Cloud** in the upper-left corner and selecting **Cloud Sites**. You can also navigate directly to <https://manage.rackspacecloud.com/>.

### Previous section

[Cloud Sites introduction](/how-to/cloud-sites)

In this article, we will take a look at FTP, SSHFS
and some of the popular FTP Clients. Because Cloud
Sites does not offer full SSH access to the web servers, the other
recommendations would be to use FTP, or you could use SSHFS (SSH
Filesystem).

**File Transfer Protocol (FTP)** is a method for adding content to your
website. As its name indicates, FTP is a means for transferring files
from one computer to another, or from a local computer to a remote
server.

For any website you set up, we will automatically create an FTP address. However, due to the nature of DNS
propagation, your custom ftp address may not work during the initial 48
hour period after DNS for the site has been set up. If you experience
any issues using your custom ftp address (ftp.yourdomain.com) during
this time, you should use the universal ftp address,
**ftp1.ftptoyoursite.com**. This universal ftp address will allow you to
add content to your site before DNS has fully propagated to The
Rackspace Cloud.

<img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/ftpserver2.png %}" alt="" />

### Tasks frequently needed with FTP

**What is my FTP password?**

You can find your FTP password in the Rackspace Cloud Control Panel

-   Log into the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com)
-   Navigate to **Hosting > Cloud Sites**
-   **Select a website** from the list of active domains
-   Your FTP information can be found in the **Viewing and Editing**
    section of the initial page

<img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/ftpsettings.png %}" alt="" />

**How can I add additional FTP users?**

You can create multiple FTP user accounts through your control panel.
You can the option to restrict that user to a specified directory in a
site and create several users.

To create FTP users:

-   Log into the [Rackspace Cloud Control Panel](http://manage.rackspacecloud.com)
-   Navigate to **Hosting > Cloud Sites**
-   Click on the **domain** you want to add another FTP user to
-   Click on the **Security** tab

<img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/securitytab.png %}" alt="" />

1. In the **Permissions For Editing Your Website** section, click on **Add A User**.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/addauser.png %}" alt="" />

2. **Create** the new FTP user's username and password.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/ftpnewuserpass.png %}" alt="" />

3. Choose the directory level to which the new FTP user will have access.

   <img src="{% asset_path cloud-sites/getting-started-with-cloud-sites-ftpsshfsftp-clients/ftppermissions.png %}" alt="" />

4. Click **Save** to finish adding the new FTP user.


### SSHFS

According to [Wikipedia](http://en.wikipedia.org/wiki/SSHFS):

**"SSHFS** (**SSH Filesystem**) is
a [filesystem](http://en.wikipedia.org/wiki/Filesystem "Filesystem") client
to [mount](http://en.wikipedia.org/wiki/Mount_(computing) "Mount (computing)") and
interact
with [directories](http://en.wikipedia.org/wiki/Directory_(file_systems) "Directory (file systems)") and [files](http://en.wikipedia.org/wiki/Computer_file "Computer file") located
on a
remote [server](http://en.wikipedia.org/wiki/Server_(computing) "Server (computing)") or [workstation](http://en.wikipedia.org/wiki/Workstation "Workstation"). The
client interacts with the remote file system via the [SSH File Transfer
Protocol](http://en.wikipedia.org/wiki/SSH_File_Transfer_Protocol "SSH File Transfer Protocol") (SFTP), a [network
protocol](http://en.wikipedia.org/wiki/Network_protocol "Network protocol") providing [file
access](http://en.wikipedia.org/wiki/File_access "File access"), [file
transfer](http://en.wikipedia.org/wiki/File_transfer "File transfer"),
and [file
management](http://en.wikipedia.org/wiki/File_management "File management") functionality
over any reliable [data
stream](http://en.wikipedia.org/wiki/Data_stream "Data stream") that was
designed as an extension of the [Secure
Shell](http://en.wikipedia.org/wiki/Secure_Shell "Secure Shell") protocol
(SSH) version 2.0."

**Note:** *In order to use SSHFS, you will need to install it on a Mac
or a Linux machine. SSHFS cannot be used on a Windows machine.*

Although full ssh access is not available, you can mount your ftp
location in Linux using SSHFS. Windows Mac users see footnote.

Here are the common methods for installing SSHFS:

- For Debian: `apt-get install fuse-utils sshfs`

- For Ubuntu: `sudo apt-get install fuse-utils sshfs`

- For Fedora and CentOS: `yum install fuse-utils sshfs`

  **Note:**  To install on CentOS, you will need to set your machine up to
[include the EPEL repository](/how-to/install-epel-and-additional-repositories-on-centos-and-red-hat)
first.

- For Mandriva: urpmi: `urpmi fuse-utils sshfs`

Choose and make a directory to which you will mount the ftp
storage location. In this example we use **/mnt/remote**:

    sudo mkdir /mnt/remote
    sudo chown [system-user]:[your-group] /mnt/remote/

Next, add yourself to the fuse group:

    sudo adduser [system-user] fuse

Connect and mount the ftp storage location:

    sshfs ftp-user@ftp.domain.com: /mnt/remote/

**Note:** ftp.domain.com will be either ftp1.ftptoyoursite.com,
ftp2.ftptoyoursite.com or ftp.domain.com depending on how you connect to
ftp.

Additionally, you can specify a remote path to mount such as
**www.domain.com/web/content**.

    sshfs ftp-user@ftp.domain.com:www.domain.com/web/content/ /mnt/remote/

You will now be asked to accept the key from our system and then for
your ftp user password.

Once mounted, you can cd to your mounted directory and perform many basic
commands that do not require root access, including but not limited to:

    tar     gzip     gunzip     zip     unzip     chmod

You may also want to update the **/etc/fuse.conf** file to include a line
like the one below to ensure that you do not lose connection while working:

    ServerAliveInterval = 300

**Note:** Windows and Mac users can also
use [ExpanDrive](http://www.expandrive.com/ "http://www.expandrive.com") to
map your FTP storage location as a local drive.

**FTP Clients**

We don't have a recommended File Transfer Protocol (FTP) client, but
following is a list of the more popular FTP clients.

Commercial

-   [ExpanDrive](http://www.expandrive.com/ "http://www.expandrive.com") (Mac/Windows)
-   [IP Switch](http://www.ipswitch.com/ "http://www.ipswitch.com/") (Windows)
-   [Transmit](http://www.panic.com/ "http://www.panic.com/") (Mac)
-   [CuteFTP](http://www.cuteftp.com/ "http://www.cuteftp.com") (Mac/Windows)

Free

-   [SmartFTP](http://www.smartftp.com/ "http://www.smartftp.com/") (Windows)
-   [Fetch](http://www.fetchsoftworks.com/ "http://www.fetchsoftworks.com/") (Mac)
-   [Cyberduck](http://cyberduck.ch/ "http://cyberduck.ch/") (Mac)
-   [FileZilla](http://filezilla-project.org/ "http://filezilla-project.org/") (Mac/Windows/Linux)
-   [FireFTP](http://fireftp.mozdev.org/ "http://fireftp.mozdev.org/") (Firefox Extension - Mac/Windows/Linux)
-   [WinSCP](http://winscp.net/ "http://winscp.net/") (Windows)
-   [Net2FTP](http://www.net2ftp.com/ "http://www.net2ftp.com") (Web Based)
