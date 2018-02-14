---
permalink: comparison-of-dedicated-and-cloud-hosting/
audit_date: '2017-12-06'
title: Comparison of dedicated and cloud hosting
type: article
created_date: '2012-02-21'
created_by: Rackspace Support
last_modified_date: '2017-12-06'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace offers both dedicated and cloud hosting solutions. Deciding
which is best for your particular scenario can be difficult. Following
are important features to consider when choosing a hosting solution for
your business.

<table>
  <tr>
    <th>Product or service</th>
    <th>Dedicated</th>
    <th>Cloud Managed Operations</th>
    <th>Cloud Managed Infrastructure</th>
  </tr>
  <tr>
    <td><strong>Support level</strong></td>
    <td>Dedicated hosting includes unlimited ***Fanatical Support***&reg; for all supported products, services, and software.</td>
    <td>The Cloud Managed Operations service level includes support of the data center environment, host server hardware, and Rackspace Cloud APIs.<br><br>Managed Operations support also gives Rackspace employees direct server access to perform troubleshooting and configuration of supported applications for Linux and Windows.</td>
    <td>The Cloud Managed Infrastructure service level includes support of data center environment, host server hardware, and Rackspace Cloud APIs only.<br><br>Rackspace employees are prohibited from logging in to customers' servers to provide systems administration support.</td>
  </tr>
  <tr>
    <td><strong>Firewall</strong></td>
    <td>Dedicated firewalls are available as an option, and are a strongly recommended security precaution. Dedicated
    load balancers can improve performance and fault-tolerance for your application.</td>
    <td>Same options as dedicated, if using RackConnect.</td>
    <td>Same options as dedicated, if using RackConnect.</td>
  </tr>
  <tr>
    <td><strong>Monitoring</strong></td>
    <td>Rackspace Monitoring is included by default, with ping alarms automatically set to create tickets for Rackspace admins.</td>
    <td>Rackspace Monitoring is included by default. Checks are created, but alarms are optional.  Alarms can be set to notify your account and to automatically create tickets for Rackspace admins. </td>
    <td>Rackspace Monitoring is included by default. Checks are created if the optional Rackspace Monitoring Agent is installed on your cloud server, but alarms are optional. Alarms can notify your account but cannot automatically create tickets for Rackspace admins. </td>
  </tr>
  <tr>
    <td><strong>Backups</strong></td>
    <td>Managed Backup is an optional service that captures file-level server images. There is a backup limitation of 1.5 TB per server unless you are using the optional High Capacity Backup service. <br><br>Database and Exchange Backup agents are available for an additional charge. Service extends to database flat file dumps and maintenance plans.</td>
    <td>The file-level Cloud Backup service is available to Managed Operations customers for the price of storage on Cloud Files and any bandwidth used if backup data is sent between regions.<br><br>Cloud server snapshot images are an alternative approach at the system level. Customers should perform database backups before creating an image. Daily snapshot scheduling is not enabled by default but can be manually configured.</td>
    <td>Our file-level Cloud Backup service is available to Cloud Servers for the price of storage on Cloud Files and any bandwidth used if backup data is sent between regions.<br><br>Cloud Server snapshot images are an alternative approach at the system level.<br><br>Daily snapshot scheduling is not enabled by default and can be manually configured when the server is created. Server snapshot images are stored on Cloud Files.</td>
  </tr>
  <tr>
    <td><strong>Bandwidth</strong></td>
    <td>Dedicated servers include a specific amount of bandwidth.<br><br>Additional bandwidth is available at prepaid rates (bandwidth overage rates apply if your subscription is exceeded).</td>
    <td>Outgoing bandwidth is not included unless your solution includes RackConnect. If the server is set up with RackConnect, the cloud servers can consume any available bandwidth included in the dedicated configuration.<br><br>If the server is not set up with RackConnect, you are charged for outgoing bandwidth only.</td>
    <td>Outgoing bandwidth is not included unless your solution includes RackConnect. If the server is set up with RackConnect, the cloud servers can consume any available bandwidth included in the dedicated configuration.<br><br>If the server is not set up with RackConnect, you are charged only for outgoing bandwidth.</td>
  </tr>
  <tr>
    <td><strong>Operating system availability</strong></td>
    <td>Red Hat Enterprise Linux<br>CentOS<br>Debian<br>Ubuntu<br>Windows Server (from 2008 R2 to 2016)</td>
    <td>Same as dedicated
    <td>Please see the following two links for details: <a href="/how-to/cloud-servers-with-managed-operations-support-for-linux">Cloud Servers with Managed Operations support for Linux</a> and <a href="/how-to/cloud-servers-with-managed-operations-support-for-windows">Cloud Servers with Managed Operations support for Windows</a>.</td>
  </tr>
  <tr>
    <td><strong>Ticketing system, control panel</strong></td>
    <td>my.rackspace.com</td>
    <td>Cloud Control Panel and API<br><br>If your server is set up with RackConnect or linked to managed Dedicated services, you should still use my.rackspace.com. However, my.rackspace.com does not replace the Cloud Control Panel for managing Cloud services.</td>
    <td>Cloud Control Panel and API<br><br>If you are using RackConnect, you can also leverage my.rackspace.com to manage your Cloud services.</td>
  </tr>
</table>
