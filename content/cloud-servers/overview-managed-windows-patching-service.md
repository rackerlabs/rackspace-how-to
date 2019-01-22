---
permalink: overview-managed-windows-patching-service
audit_date:
title:  Overview of Managed Windows Patching Service
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---
Microsoft releases patches every Tuesday on the second week of every month. After we receive these patches, we begin the process of determining which updates that we will approve or not.
 
We approve:

* Updates that apply to the Windows OS itself. This includes anything that is installed by default or is an available add-on role/service (i.e. Internet Explorer or IIS security updates).
* Security updates for the .NET Framework.
* Non-security updates if support determines a specific need that applies to our customer base as a whole, (i.e. cumulative time zone updates).
* The latest definitions for Windows Defender each week during monthly patching. 
 
We do not approve:

* Windows service packs
* New Internet Explorer versions
* Non-security related .NET Framework updates -- support only installs .NET Framework releases and service packs on customer request
* Microsoft Office updates -- Customers use Microsoft Office both as a client application on servers and also use its libraries in some web applications. We cannot update this software without the potential for breaking a custom application.
* Any add-on Microsoft products other than the core OS, and any third-party software
  
Please note that even if you are opted in to our Managed Windows Patching service, that you could still install any software and updates that you wished by visiting the Windows Update website, or by downloading the software directly from Microsoft. You may also request that we assist you with some of the patches that we did not approve of, but the key point here is that you would need to request any patches that we do not approve of, and you would be responsible for any issues that could potential arise with their installation.

After the our patching approval process takes place we release the approved patches during three intervals:

1. Early release week - The first week after Microsoft's patch Tuesday

2. Default release week - The second week after Microsoft's patch Tuesday

3. Delayed release week - The third week after Microsoft's patch Tuesday
 
As a customer with a dedicated Windows server you have the choice of one of these weeks, along with the choice of a specific day and time that these patches will be installed on your server. If any of these updates require a server reboot then that will be done during this time as well.
Basically, by using our Managed Windows Patching service, you will know exactly which week, day of that week, and the time ... every month when Windows updates are being installed on your server.
