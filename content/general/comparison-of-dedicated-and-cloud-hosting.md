---
permalink: comparison-of-dedicated-and-cloud-hosting/
audit_date: '2017-12-02'
title: Comparison of dedicated and cloud hosting
type: article
created_date: '2012-02-21'
created_by: Rackspace Support
last_modified_date: '2017-12-02'
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
    <td>The Cloud Managed Operations service level includes support of the data center environment, host server hardware, and Internet connectivity.<br><br>Managed Operations support also gives Rackspace employees direct server access to perform troubleshooting and configuration of supported applications for Linux and Windows.</td>
    <td>The Cloud Managed Infrastructure service level includes support of data center environment, host server hardware, and Internet connectivity only.<br><br>Rackspace employees are prohibited from logging in to customers' servers to provide systems administration support.</td>
  </tr>
  <tr>
    <td><strong>Firewall</strong></td>
    <td>Dedicated firewalls are available as an option, and are a strongly recommended security precaution.</td>
    <td>Optional dedicated firewall if using RackConnect.</td>
    <td>Optional dedicated firewall if using RackConnect.</td>
  </tr>
  <tr>
    <td><strong>Monitoring</strong></td>
    <td>RackWatch monitoring is included and is enabled by default for PING service checks. Upon request, six additional service checks and one free URL monitor can be configured.</td>
    <td>Managed Operations includes several checks and alerts through the Cloud Monitoring service. Support helps you with the creation and configuration of monitoring checks.</td>
    <td>Monitoring is not preconfigured for Managed Infrastructure, but Cloud Monitoring can be manually set up after server creation. There is no charge for the Cloud Monitoring service.<br><br>Without a third-party monitoring solution or use of the Cloud Monitoring service, you are not notified when individual services on your cloud server stop working. You are notified only if the host server where your cloud server is located is impacted.</td>
  </tr>
  <tr>
    <td><strong>Backups</strong></td>
    <td>Managed Backup is an optional service that captures file-level server images. There is a backup limitation of 1.5 TB per server unless you are using the optional High Capacity Backup service. <br><br>Database and Exchange Backup agents are available for an additional charge. Service extends to database flat file dumps and maintenance plans.</td>
    <td>The file-level Cloud Backup service is available to Managed Operations customers for the price of storage on Cloud Files and any bandwidth used if backup data is sent between regions.<br><br>Snapshots are an alternative backup approach at the system level. Daily snapshot scheduling is not enabled by default but can be manually configured. Customers should perform database backups before creating an image.</td>
    <td>Our file-level Cloud Backup service is available to Cloud Servers for the price of storage on Cloud Files and any bandwidth used if backup data is sent between regions.<br><br>Cloud Server snapshot images are an alternative approach at the system level. Customers should perform database backups before creating an image.<br><br>Daily snapshot scheduling is not enabled by default and can be manually configured when the server is created. Server snapshot images are stored on Cloud Files.</td>
  </tr>
  <tr>
    <td><strong>Bandwidth</strong></td>
    <td>Dedicated servers include a specific amount of bandwidth.<br><br>Additional bandwidth is available at prepaid rates (bandwidth overage rates apply if your subscription is exceeded).</td>
    <td>Outgoing bandwidth is not included unless your solution includes RackConnect. If the server is set up with RackConnect, the cloud servers can consume any available bandwidth included in the dedicated configuration.<br><br>If the server is not set up with RackConnect, you are charged for outgoing bandwidth only.</td>
    <td>Outgoing bandwidth is not included unless your solution includes RackConnect. If the server is set up with RackConnect, the cloud servers can consume any available bandwidth included in the dedicated configuration.<br><br>If the server is not set up with RackConnect, you are charged only for outgoing bandwidth.</td>
  </tr>
  <tr>
    <td><strong>Operating system avilability</strong></td>
    <td>Red Hat Enterprise Linux<br>CentOS<br>Windows Server</td>
    <td> Please see <a href="/how-to/supported-operating-systems/">Supported Operating Systems</a> on cloud server</td>
    <td>Please see the following two links for details: <a href="/how-to/cloud-servers-with-managed-operations-support-for-linux">Cloud Servers with Managed Operations support for Linux</a> and <a href="/how-to/cloud-servers-with-managed-operations-support-for-windows">Cloud Servers with Managed Operations support for Windows</a></td>
  </tr>
  <tr>
    <td><strong>Ticketing system, control panel</strong></td>
    <td>my.rackspace.com</td>
    <td>Cloud Control Panel and API<br><br>If your server is set up with RackConnect or linked to managed Dedicated services, you still use my.rackspace.com. However, my.rackspace.com does not replace the Cloud Control Panel for managing Cloud services.</td>
    <td>Cloud Control Panel and API<br><br>If you are using RackConnect, you can also leverage my.rackspace.com to manage your Cloud services.</td>
  </tr>
</table>
