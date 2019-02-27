---
permalink: windows-patches-for-cloud-servers-with-a-managed-operations-service-level/
audit_date: '2019-02-07'
title: Windows patches for cloud servers with a Managed Operations service level
type: article
created_date: '2011-04-04'
created_by: Rackspace Support
last_modified_date: '2018-02-08'
last_modified_by: Kate Dougherty
product: Managed Operations
product_url: managed-operations
---

All Windows&reg; patches for cloud servers within the Rackspace Managed
Operations service level are released by Microsoft&reg; to the public on the
second Tuesday of every month (known as _Patch Tuesday_). Rackspace tests
these patches against our server builds before we include them in updates to
your production servers.

We deploy the patches to your servers three weeks after Microsoft releases
them. Our Windows Server&reg; images are configured to check our Windows Server
Update Services (WSUS) server daily for updates by default, but we release
approved patches through our WSUS servers only once a month.

If you opted in to the Rackspace Managed Windows Patching service, you can
manually install any software or updates that have been released by Microsoft,
but are not yet available on our WSUS servers.

Use the **Windows Update** command located in the **Start** menu on your
server to check for these patches directly from Microsoft. You can download
most of these patches manually by going to the Microsoft knowledge base
article for the patch. You can also contact Rackspace Support to request
assistance with manually installing non-Rackspace approved patches on to your
server. However, we cannot be held responsible for any issues that might arise
from manually installing these patches before they are approved and released
for update from our WSUS servers.

### WSUS endpoints

The following regions have WSUS servers:

| Region | Data Center | WSUS endpoint |
| ------ | ----------- | ------------- |
| Dallas | DFW	 | http://microsoftupdate.dfw1.rackspace.com |
| Chicago	 | ORD | http://microsoftupdate.ord1.rackspace.com |
| North Virginia | IAD | http://microsoftupdate.iad1.rackspace.com |
| Hong Kong | HKG | http://microsoftupdate.hkg1.rackspace.com |
| Sydney | SYD | http://microsoftupdate.syd1.rackspace.com |
| London | LON | http://microsoftupdate.lon1.rackspace.com |

**Note**: We recommend that you get updates from the closest WSUS server.

The following table provides additional information:

<table>
  <tr>
    <th>Distribution</th>
    <th>Patching</th>
    <th>Mechanism</th>
    <th>Patching servers</th>
    <th>Frequency</th>
  </tr>
  <tr>
    <td>Windows Server 2008 R2</td>
    <td>WSUS</td>
    <td>microsoftupdate.[dc].rackspace.com</td>
    <td>
      Nightly between 1 AM and 5 AM in the time zone in which your server is located:<br>
      <ul>
	<br />
	<li><strong>IAD</strong>: EST</li>
        <li><strong>DFW</strong>: CST</li>
        <li><strong>SYD</strong>: AET</li>
        <li><strong>HKG</strong>: HKT</li>
        <li><strong>ORD</strong>: CST</li>
      </ul>
    </td>
    <td>Windows Patching Portal</td>
  </tr>
  <tr>
    <td>Windows Server 2012 WSUS</td>
    <td>microsoftupdate.[dc].rackspace.com</td>
    <td>
      Nightly between 1 AM and 5 AM in the time zone in which your server is located:<br>
      <ul>
	<br />
        <li><strong>IAD</strong>: EST</li>
        <li><strong>DFW</strong>: CST</li>
        <li><strong>SYD</strong>: AET</li>
        <li><strong>HKG</strong>: HKT</li>
        <li><strong>ORD</strong>: CST</li>
      </ul>
    </td>
    <td>Windows Patching Portal</td>
    <td></td>
  </tr>
  <tr>
    <td>Windows Server 2012 R2</td>
    <td>WSUS</td>
    <td>microsoftupdate.[dc].rackspace.com</td>
    <td>
      Nightly between 1 AM and 5 AM in the time zone in which your server is located:<br>
      <ul>
	<br />
        <li><strong>IAD</strong>: EST</li>
        <li><strong>DFW</strong>: CST</li>
        <li><strong>SYD</strong>: AET</li>
        <li><strong>HKG</strong>: HKT</li>
        <li><strong>ORD</strong>: CST</li>
      </ul>
    </td>
    <td>Windows Patching Portal</td>
  </tr>
</table>

### WSUS settings

If you have opted in to the Rackspace Managed Windows Patching service, the
following registry setting are configured on the Managed Windows Server:

    [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\windows\WindowsUpdate]
    "AcceptTrustedPublisherCerts"=dword:00000001
    "WUServer"="http://microsoftupdate.dfw1.rackspace.com"
    "WUStatusServer"="http://microsoftupdate.dfw1.rackspace.com"

    [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\windows\WindowsUpdate\AU]
    "AUOptions"=dword:00000004 "AutoInstallMinorUpdates"=dword:00000000
    "DetectionFrequency"=dword:00000016 "DetectionFrequencyEnabled"=dword:00000001
    "NoAutoRebootWithLoggedOnUsers"=dword:00000000 "NoAutoUpdate"=dword:00000000
    "RackSpaceDefaults"=dword:00000001
    "ScheduledInstallDay"=dword:00000000
    "ScheduledInstallTime"=dword:00000002 "UseWUServer"=dword:00000001

You must set the Windows Updates service (`wuauserv`) to automatically start
by performing the following steps:

1.	Open a PowerShell command prompt and run the following commands:

		    Setting wuauserv Service to Auto

		    Set-Service -Name wuauserv -StartupType Automatic

2.	Ensure that the `wuauserv` service is running by running the following
    commands:

		    Restart-Service -Name wuauserv

3.	Apply all of the changes by running the following command:

		    gpupdate.exe /force

You can find additional information in the [Microsoft Security Update
Guide](https://portal.msrc.microsoft.com/en-us/).
