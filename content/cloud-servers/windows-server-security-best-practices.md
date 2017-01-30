---
permalink: windows-server-security-best-practices/
audit_date: '2016-11-28'
title: Windows Server security best practices
type: article
created_date: '2014-07-15'
created_by: Rackspace Support
last_modified_date: '2016-11-11'
last_modified_by: Hounsou Dansou
product: Cloud Servers
product_url: cloud-servers
---

**DISCLAIMER FOR MANAGED OPERATIONS CUSTOMERS**

To ensure that Rackspace has access to your server when needed, we request that you
do not change the following configurations as you consider security best practices:

- When connecting to your server, Rackspace Support logs in as the user **rack** by using Remote Desktop Connection to the public IP address over port 3389. 

- Rebuilding existing servers or building a new server from a snapshot requires that Administrator logins are enabled and port 445 is not blocked in the Windows firewall. 

If you must change these values, contact an administrator at Rackspace to make the
changes in a way that does not impact our ability to provide you with *Fanatical
Support*®.


------

This article provides some general security best practices to consider when you set up a
Microsoft Windows server that interacts with the public Internet. Although these best
practices apply to any server in general, this article specifically addresses Rackspace
Public Cloud Servers running Windows.

### Use local firewall rules

By default, Rackspace Public Cloud Servers do not have a firewall device. For servers that
interact with the public Internet with no firewall device, the Windows firewall is the only
protection between your server resources and your private data and anybody with
access to an Internet connection. 

Disable as many rules on the firewall as possible. Disabling rules means that fewer ports
are open and listening over the public interface, which limits the server’s exposure to
anyone trying to gain access to it.

For those ports that must be open, limit access to the server by whitelisting IP addresses
in those specific rules. Add the IP address from your local home or office computer to
the whitelist, even if your ISP provides dynamic public IP addresses that change over
time. You can make changes to the firewall rules as needed from the Cloud Control
Panel by logging in to the server remotely via the console and adding a new IP address. 

By limiting access to the server via IP address whitelisting, you can ensure that users
who need access to the server have it, but those who don't are blocked from those open
ports. The most typical ports that need to be open in the Windows firewall for web
hosting on a cloud server are as follows:

Port   |  Service
-------|-----------
80     | HTTP - IIS sites or web application
443 HTTPS | Secure IIS sites or web applications with SSL


We recommend locking down the following ports via IP address
whitelisting on the public interface to limit brute-force attacks or
exploitation attempts against commonly named accounts or services on the server:


Port  | Description
------|------------
3389  | Remote Desktop connectivity, for logging in remotely to the server
21 FTP | For the secure transfer of data between local geographic locations and the cloud server
990 FTPS (Windows) | For the secure transfer of data between local geographic locations and the cloud server incorporating an SSL certificate
5000-5050 FTP | Passive ports for FTP communication
1433 SQL | Default port used for SQL communication
53 DNS | Default port used for DNS requests


### Consider what you share

Consider what data is available to others via file sharing. We do not recommend
enabling Windows file sharing because the ports that are opened on the firewall (ports
445 and 139) expose the server to unwanted connection attempts. 

Some customers use their servers to host back-office software such as QuickBooks,
PeachTree, Microsoft Office (Outlook for Remote Desktop sessions), or other third-party
software solutions. Sometimes customers want to configure mapped network drives to
allow them to easily move data from their local computers to their cloud server by way
of a drive letter on the local computer. However, we do not recommend this practice.
Your server is only as secure as the weakest password.

Additionally, be careful about the software that you allow your users to download and
install on your server. Every software package installed increases the exposure of your
server to attack.

### Password policy

Whether or not you have provisioned a cloud server with a hardware firewall, as
previously stated, your server is only as secure as the weakest password that has access
to it. Follow these tips for passwords:

- Use strong passwords of at least 8 to 10 characters that include uppercase and lowercase letters, numbers, and special characters (such as !, #, $, and %). Assigning simple passwords can be extremely dangerous, especially for a cloud server that is available over the public Internet.

- Set an expiration date for each user's password. Although it is inconvenient to have to remember a new password periodically, this practice can make your data more secure.

Because our post-build automation processes depend on the default user account
of Administrator, we do not recommend changing this username on your cloud servers
running Windows.

Be careful who has access to the server through the Administrator account. If multiple
users need admin access to the server, create multiple accounts with admin access. It's
easier to track users in the log files by looking for a specific user account than it is to try
to decipher multiple log file entries under the Administrator account.

Multiple instances of `Event Id 4625` in the Security Log or `Event Id 1012` in the System
Log can mean that someone is trying to hack into your server, because these events are
related to failed login attempts.

For users logging in over Remote Desktop Connection, ensure that they are logging off
the server to free any used resources instead of simply closing their RDC windows,
which leaves the session open on the server.

### Active Directory

We typically discourage running Active Directory on a cloud server because the only
protection from intrusion is the Windows firewall and Active Directory introduces issues
into a cloud server environment. Active Directory is generally better used in a dedicated
server environment where servers are placed behind physical firewalls and can be
connected over VPN tunneling through that firewall appliance. 

Rackspace supports a VPN only if it is through a hardware firewall in a solution called
RackConnect. It is easier to implement this physical firewall setup before you create
servers because, at the time this article was written, the process that connects the
firewall and the servers is automated during the build process. Physical firewalls are not
provisioned as quickly as cloud servers and must be requested through our Hybrid
teams. For more information about physical firewalls and RackConnect, see
<http://www.rackspace.com/cloud/hybrid/rackconnect/>.

If you do install Active Directory on a cloud server, we recommend that
you run two Domain Controllers in case one fails (imaging is currently
unavailable for Domain Controllers). We also recommend locking down DNS
to prevent DNS amplification attacks.

### SQL Server instances

For servers running Microsoft SQL Server, lock down the SQL port 1433 to listen over
the internal interface only, preferably listening only for connections from a list of known
IP addresses of other servers needing to access SQL Server on the server. You can allow
SQL port 1433 to listen over the public interface, but this rule must be limited to only
the IP addresses of the computers where the developers are connecting to the
databases on the server. 

If you don’t limit these connections to the server, port 1433 will be exposed and outside
hackers *will* attempt a brute-force attack on the server over this port. These types of
attacks cause high network traffic, slow the server's performance, and even bring down
sites if an important account gets locked out. By limiting access to this port, these issues
are mitigated before they start. 

For servers running SQL Server Standard or SQL Server Web editions, we recommend
configuring maintenance plans to dump the data from the live database files into flat
files that can be backed up off the server and to clean up the backups so they do not fill
your hard drive

### Windows updates

Ensure that Windows updates are enabled, and be mindful of the state of your server --
ensure that your Windows OS is patched. Patch Tuesday, which occurs on the second
Tuesday of each month in North America, is the day on which Microsoft regularly
releases security patches. Customers must decide how best to implement a patching
strategy that keep their servers up-to-date. By default, Rackspace Cloud Servers check
for updates between 2 a.m. and 4 a.m. every day.

### Server backups

Set up some type of disaster recovery plan. One option that we offer is to create cloud
server images nightly and write them to your Cloud Files containers with a default
retention of seven days. A snapshot of the server is taken, and the image is stored in
Cloud Files for use in creating new server instances or rebuilding the existing server
from that image.

We also offer file-level backup through Cloud Backups. We don't recommend backing
up the entirety of the **C:** drive because live files that are locked cause the backup job to
complete with errors. Furthermore, the Windows system files are contained in the base
images provided by us or in any custom images taken of the servers, so you don’t need to back up that data on a daily basis. 
We do recommend backing up the **C:\inetpub** (IIS) directory and any other user data that needs to be backed up.
Additionally, if SQL Server maintenance plans have been configured to dump the live data into flat files for
backups, we recommend that you also include those directories in the backup.

Check backup jobs to ensure that they complete successfully and that the backups are
valid. Create a new server instance from an image to ensure that the image is valid, and
restore a file from Cloud Backups to verify that the data being backed up can be
restored.

### Code 

The last attack surface exposed to the Internet is the code. You and
your developers must ensure that the code is enforcing proper
authentication and authorization. For example, a web application should
not be executed with administrator-level privileges. File authorization
should be carefully defined and all inputs on the application should
have the best validation possible to prevent hackers from exploiting the
web application and gaining control of the server. 

The following sites provide information about improving ASP .Net security:

-  <http://www.asp.net/web-forms/pluralsight>
-  <http://www.iis.net/configreference/system.webserver/security/requestfiltering>
-   <http://blogs.iis.net/wadeh/archive/2008/12/18/filtering-for-sql-injection-on-iis-7-and-later.aspx>

### Conclusion

Depending on the use case, customers might have other more specific
needs to address when leveraging our Cloud Servers product to meet their
hosting needs. However, these general recommendations are a good start when considering security while creating Windows servers,
cloud or otherwise.
