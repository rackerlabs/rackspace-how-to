---
permalink: set-up-a-static-website-with-cloud-files/
audit_date:
title: Set up a static website with Cloud Files
type: article
created_date: '2016-01-07'
created_by: Nate Archer
last_modified_date: '2016-04-18'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

If you want to host a static website, a site where the content does not
change, you do not have to use a server. Instead, you can use the
Rackspace Cloud Files service.

### Create a Cloud File container to house your site

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2.  At the top of the page, select **Storage > Files**.

3.  On the Cloud Files/Containers page, click **Create Container**.

4.  Type a name for your container and select the region where you want
    to host your site.

5.  Select the **Static Website** option and then click
    **Create Container**.

    **Note**: Selecting the **Static Website** option automates the
    following Cloud Files API operations:
    -   Sets the index page to **index.html** for both the container and
        any pseudo directories within the container.
    -   Sets your container to use CDN, so that users can retrieve your
        content faster.

6.  On the page for your container, click **Upload Files**.

7.  Select the files that contain your website and click **Open**.

    **Note:** Ensure that all of your static website files are included
    in the upload and in their correct folders.

### Access your static website

Now your static website content is uploaded to your Cloud Files
containers. However, to access your static website, you need the CDN
URL.

1.  In the control panel, go the the Cloud Files/Containers list.

2.  Click the gear icon next to the name of your container and select
    **View All Links**.

    <img src="{% asset_path cloud-files/set-up-a-static-website-with-cloud-files/set-up-static-view-all-links.png %}" alt="" />

    **Note**: All of the CDN URLs for your container are displayed. For HTML pages
    and pictures, use the HTTP link to access your static website. If
    you want to be securely connected to your site, use the HTTPS
    link.

### Next Steps

If you want to make the URL of your static website more user friendly,
you can set up a CNAME record with your DNS registrar. In order to do
so, you need to copy the **target (domain)** from your static website
container. To find your target, perform the following steps:

1.  In the Cloud Files/Containers list, click the gear icon next to
    your static website container and select **View Website
    Settings**.

2.  In the drop down menu, copy the string in the **Target (Domain)**
    field.

3.  Go to your DNS registrar and point the CNAME to the domain that
    you copied. For instruction on how to complete this for the most
    popular DNS registrars, go to the following sites:

    - [GoDaddy](https://www.godaddy.com/help/add-a-cname-record-19236)
    - [CloudFlare](https://support.cloudflare.com/hc/en-us/articles/200168706-How-do-I-do-CNAME-setup-)

You can also create your own CNAME using the Rackspace DNS service. For
instructions, see [Create DNS Records for cloud servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).
