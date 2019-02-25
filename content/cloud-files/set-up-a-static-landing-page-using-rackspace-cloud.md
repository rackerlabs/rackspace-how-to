---
permalink: set-up-a-static-landing-page-by-using-rackspace-cloud/
audit_date: '2019-01-18'
title: Set up a static landing page by using Rackspace Cloud Files
type: article
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-01-28'
last_modified_by: Kate Dougherty
product: Cloud Files
product_url: cloud-files
---

Use the following steps to set up a static landing page by using Rackspace
Cloud Files:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Click **Storage > Files**.
4. Click **Create Container**.

   **Note**: You need a separate container for each landing page.

   1. In the pop-up box, enter a name for your container in the **Container
      Name** field.

   2. Select a **Region** from the drop-down list (preferably one that is close to
      you geographically).

   3. For **Type**, select **Static Website**.

5. Click **Create Container**.

6. Click **Upload Files**.

   1. Upload the files that are associated with your static site. At a
      minimum, you must include an **index.html** file.

   2. Ensure that all of the necessary files and folders for your site
      (including Cascading Style Sheet (CSS), JavaScript, and other supporting
      files) are included in the upload and in their appropriate folders.

7. To link your Cloud Files container to a branded URL, use the following
   steps to set up a CNAME record with your DNS registrar:

   1. From the list of containers, click the settings cog next to the
      container name.

   2. Click **View Website Settings**.

   3. Copy the value in the **Target Domain** field.

   4. Set up a CNAME record that points to the target domain that you just
      copied. Use the following instructions that correspond to the service
      that you are using:

        - [Rackspace Cloud DNS](https://support.rackspace.com/how-to/using-cnames-with-cloud-files-containers/)

        - [GoDaddy&reg;](https://www.godaddy.com/help/add-a-cname-record-19236)

        - [Cloudflare&reg;](https://support.cloudflare.com/hc/en-us/articles/360020615111-Configuring-a-CNAME-setup)
