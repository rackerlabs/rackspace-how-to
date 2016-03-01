---
node_id: 4131
title: Windows Server security best practices
type: article
created_date: '2014-07-15'
created_by: Rackspace Support
last_modified_date: '2016-01-19'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

**DISCLAIMER FOR MANAGED OPERATIONS CUSTOMERS**

To ensure that we have access to your server when needed, we request
that you do not change these configurations. When connecting to your
server, Rackspace support will log in as the user **rack** using Remote
Desktop Connection to the public IP address over port 3389. In addition,
rebuilding existing servers or building a new server from a snapshot
will require that Administrator logins are enabled and port 445 is not
blocked in the Windows firewall. If you insist on changing these values,
please speak with an administrator at Rackspace to do so in a way that
does not impact our ability to provide you with Fanatical Support.

------

This article provides some very general security tips to remember when
you are setting up a Microsoft Windows server that will be interacting
with the public Internet. These tips can be applied to any server in
general, but this article specifically addresses Rackspace Public Cloud
Servers running Windows.

### Use local firewall rules

For those servers that will be interacting with the public Internet with
no firewall device (by default, the Rackspace Public Cloud Servers do
not come with a firewall device), the Windows firewall is the only
protection that you have between your server resources and your private
data and anybody with access to an Internet connection. Disabling as
many rules as possible means opening the fewest ports that are listening
over the public interface, which means the least amount of exposure to
anyone trying to gain access to your server.

For those ports that must be opened, you should limit access to the
server by whitelisting IP addresses in those specific rules. It's common
for users to have accounts through their ISPs with dynamic public IP
addresses that change over time. By adding the IP address from your
local home or office computer, you can make changes to the firewall
rules on-the-fly by logging in to the server via the Control Panel at
[mycloud.rackspace.com](http://mycloud.rackspace.com) and logging in
remotely via the console to add a new IP address or as your ISP makes
changes to your dynamically assigned IP address. By limiting access to
the server via IP address whitelisting, you can ensure that those who
need access to the server have it, and those who don't will be blocked
from those open ports. The most typical ports that need to be open in
the Windows firewall for web hosting on a cloud server are as follows:

Port   |  Service  
-------|-----------
80     | HTTP - IIS sites or web application
443 HTTPS | Secure IIS sites or web applications with SSL

We recommend locking down the following ports via IP address
whitelisting on the public interface to limit brute-force attacks or
exploitation attempts against commonly named accounts or services on the server:

Port  | Description
------|------------
3389  | Remote Desktop connectivity, for logging in remotely to the server.
21 FTP | For the secure transfer of data between local geographic locations and the cloud server
990 FTPS (Windows) | For the secure transfer of data between local geographic locations and the cloud server incorporating an SSL certificate
5000-5050 FTP | Passive ports for FTP communication
1433 SQL | Default port used for SQL communication
53 DNS | Default port used for DNS requests

### Be careful what you share

In addition to being aware of how much these servers are exposed to the Internet through open firewall ports, you should consider what data is available to others via file sharing. We do not recommend enabling Windows file sharing because the ports that are opened on the firewall expose the server to unwanted attempts to connect to the server over ports 445 and 139. We have customers who are using their servers to host back-office software such as QuickBooks, PeachTree, Microsoft Office (Outlook for Remote Desktop sessions), or any number of other third-party software solutions. We are often asked to help these customers configure mapped network drives to allow for them to easily move data from their local PCs to their cloud server by way of a drive letter on the local computer. However, we do not recommend this practice. Remember, you are only as secure as your weakest password.

Additionally, be careful of the software that you allow your users to
download and install on your server. Every software package installed
increases the exposure of your server to attack.

### Password policy

Whether you have provisioned a cloud server with or without a hardware
firewall, as previously stated, you are only as secure as your weakest
password. Because our post-build automation processes depend on the
default user account of **Administrator**, we don't recommend changing
this username on your cloud servers running Windows. However, we do
recommend strong passwords of at least 8 to 10 characters that include
uppercase and lowercase letters, numbers, and special characters (such
as !, #, $, and %). Assigning simple passwords can be extremely
dangerous, especially for a cloud server that is available over the
public Internet.

Consider setting an expiration date for each user's password. Although
it is inconvenient to have to remember a new password periodically, this bit of forethought can help to make your data more secure.

Likewise, be careful who has access to the server through the
Administrator account. If multiple users need admin access to the
server, create multiple accounts with admin access. It's easier to track users in the log files by looking for a specific user account than it is to try to decipher multiple log file entries under the Administrator account. Multiple instances of Event Id 4625 in the Security Log or Event Id 1012 in the System Log can mean that someone is trying to hack into your server, because these events are related to failed login attempts. For users logging in over Remote Desktop Connection, ensure that they are logging off the server to free up any used resources instead of simply closing their RDC windows, which leaves the session open on the server.

### Active Directory

We typically discourage running Active Directory on a cloud server
because the only protection from intrusion is the Windows firewall and
Active Directory introduces issues into a cloud server environment.
Active Directory is generally better used in a dedicated server
environment where those servers are placed behind physical firewalls and
can be connected over VPN tunneling through that firewall appliance.
Rackspace supports a VPN only if it is through a hardware firewall in a
solution called RackConnect. It is easier to implement this physical
firewall setup before you have spun up servers because, at the time this
article was written, the process that connects the firewall and the
servers is automated during our build process. Physical firewalls are
not provisioned as quickly as cloud servers and must be requested
through our Hybrid teams. More information on physical firewalls and
RackConnect can be found at
<http://www.rackspace.com/cloud/hybrid/rackconnect/>.

If you do install Active Directory on a cloud server, we recommend that
you run two Domain Controllers in case one fails (imaging is currently
unavailable for Domain Controllers). We also recommend locking down DNS
to prevent DNS amplification attacks.

### SQL Server instances

For those servers running Microsoft SQL Server, it is important to
remember to lock down the SQL port 1433 to listen over the internal
interface only, preferably listening only for connections from a list of
known IP addresses of other servers needing to access SQL Server on the
server. It is also possible to allow SQL port 1433 to listen over the
public interface, but it's imperative that this rule be limited to only
the IP addresses of the computers where the developers are connecting to
the databases on the server. Without limiting these connections to the
server, port 1433 will be exposed and outside hackers *will* attempt to
brute force their way into the server over this port. These types of
attacks cause high network traffic and can slow down the server's
performance and even bring down sites if an important account gets
locked out. By limiting access to this port, these issues are mitigated
before they start. Also, for servers running SQL Server Standard or SQL
Server Web editions, we recommend configuring Maintenance Plans to dump
the data from the live database files into flat files that can be backed
up off the server as well as a cleanup task so the backups do not fill
your hard drive.

### Windows updates

Don't disable Windows updates, and be mindful of the state of your
server -- ensure that your Windows OS is patched. Patch Tuesday, which
occurs on the second Tuesday of each month in North America, is the day
on which Microsoft regularly releases security patches. Each customer
must decide how best to implement a patching strategy that will keep
their server up to date. By default, Rackspace Cloud Servers are set up
to check for updates between 2 a.m. and 4 a.m. every day.

### Server backups

You should have some type of disaster recovery plan in place. We offer
the option for cloud server images to be created nightly and written
into your Cloud Files containers with a default retention of seven days.
This means that a snapshot of the server is taken and the image is
stored in Cloud Files for use in creating new server instances or
rebuilding the existing server from that image.

We also offer file-level backup by way of configuring Cloud Backups. We
don't recommend backing up the entirety of the **C:** drive because
there are some live files that are locked and will cause the backup job
to complete with errors. Furthermore, the Windows system files are
contained in the base images provided by us or in any custom images
taken of the servers; thus, it is not necessary to back up that data on
a daily basis. We do recommend backing up the **C:\\inetpub** (IIS)
directory and any other user data that needs to be backed up.
Additionally, if SQL Server Maintenance Plans have been configured to
dump the live data into flat files for backup purposes, we recommend
that those directories be included in the backup as well.

You should check on these backup jobs to ensure that they are completing
successfully and that the backups are valid. Creating a new server
instance from a Cloud Image is always a good idea to ensure that the
image is good, and restoring a file from Cloud Backups helps to verify
that the data being backed up can be restored.

### Code

The last attack surface exposed to the Internet is the code. You and
your developer must ensure that the code is enforcing proper
authentication and authorization. For example, a web application should
not be executed with administrator-level privileges. File authorization
should be carefully defined and all inputs on the application should
have the best validation possible to prevent hackers from exploiting the
web application and gaining control of the server. A good starting point
for improving the ASP .Net security can be found at the following sites:

-  <http://www.asp.net/web-forms/pluralsight>
-  <http://www.iis.net/configreference/system.webserver/security/requestfiltering>
-   <http://blogs.iis.net/wadeh/archive/2008/12/18/filtering-for-sql-injection-on-iis-7-and-later.aspx>

### Conclusion

Depending on the use case, each customer might have other more specific
needs to address when leveraging our Cloud Servers product to meet their
hosting needs. However, these general recommendations are a good place
to start when considering security while building out Windows servers,
cloud or otherwise.
