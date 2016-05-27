---
permalink: cloud-storage-app-for-microsoft-sharepoint-accessing-cloud-files-containers/
audit_date:
title: 'Cloud Storage App for Microsoft SharePoint: Accessing Cloud Files containers'
type: article
created_date: '2013-06-04'
created_by: Rose Contreras
last_modified_date: '2016-01-26'
last_modified_by: Catherine Richardson
product: Microsoft SharePoint
product_url: sharepoint
---

**Previous section:** [Cloud Storage App for Microsoft SharePoint:
Overview](/how-to/cloud-storage-app-for-microsoft-sharepoint-overview)

Rackspace Cloud Files enables you to log in to your Cloud Control Panel
and create containers inside your Cloud Files account. When you create a
container, you must choose a Rackspace data center to host your
container. Currently available data centers are Dallas-Fort Worth
(DFW), <span>Chicago (ORD), Sydney (SYD), Northern Virginia (IAD), or
Hing Kong (HKG). </span>

After you configure and launch Rackspace Cloud Storage App for Microsoft
SharePoint, you access your Cloud Files containers by first selecting a
data center.

<img src="{% asset_path sharepoint/cloud-storage-app-for-microsoft-sharepoint-accessing-cloud-files-containers/HKGSharepointCloudStorageCrop.png %}" width="447" height="210" />

Once a data center has been chosen, the app reaches out via API and gets
a listing of the containers that are hosted within that data center,
along with the number of files in each container and the approximate
size.

<img src="{% asset_path sharepoint/cloud-storage-app-for-microsoft-sharepoint-accessing-cloud-files-containers/Fig%20--%20Select%20Container.jpg %}" width="499" height="164" />

After you select a data center, the app retrieves a list of the files
within that container (as shown in the following figure). On this page,
you can delete and share files, and add files to the selected container.
At any time, you can use the back and forward buttons to navigate to
other pages within the app.

<img src="{% asset_path sharepoint/cloud-storage-app-for-microsoft-sharepoint-accessing-cloud-files-containers/Fig%20--%20Select%20Files.jpg.jpeg %}" width="496" height="223" />

**Where to go from here**

Now that you understand how to access a container inside the app, learn
[how to add and delete files in a
container](/how-to/cloud-storage-app-for-microsoft-sharepoint-how-to-add-and-delete-files-in-a-container).
