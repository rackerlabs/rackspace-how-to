---
permalink: migrate-a-first-generation-server-to-a-next-generation-server-with-minimal-downtime/
audit_date:
title: Migrate a First Gen server to a Next Gen server with minimal downtime
type: article
created_date: '2015-08-10'
created_by: Rackspace Support
last_modified_date: '2016-07-07'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article describes the process of migrating an existing First Generation (First Gen) cloud server to a Next Generation (Next Gen) cloud server with little to no downtime by using Cloud Load Balancers and server imaging. To learn more about the Next Generation Cloud Servers platform and the migration process, see [Next-Generation Cloud Servers migration considerations and options](/how-to/next-generation-cloud-servers-migration-considerations-and-options).

**Note:** This article assumes that you host your cloud servers and DNS with Rackspace. However, if you host DNS elsewhere, you will need to perform the steps in the  [Repoint your DNS to the load balancer](### Repoint your DNS to the load balancer) section of this article by using the DNS portal where the DNS is hosted.

### Create a load balancer

The load balancer makes a seamless migration from First Gen server to a Next Gen server possible. You use it to update your DNS entries by having your stale DNS entry traffic continue to reach your cloud server while allowing the updated traffic to pass through the load balancer.

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Networking > Load Balancers**.

3. Click **Create Load Balancer**.

4. In the **Identification** section, enter a name and select the same region that your server is in.

5. In the **Configuration** section, select **Accessible on the Public Internet** for **Virtual IP**.

6. Click **Create Load Balancer**.

### Configure the load balancer

1.	On the main Load Balancers page of the control panel, click the name of the load balancer that you just created.

2.	On the load balancer details page, go to the Nodes section, click Add Cloud Servers, and add the First Gen server to the load balancer.

**Note:** If you have SSL termination on your server, you will need additional configuration. Enable SSL termination through the load balancer or have two load balancers sharing the same IP address to direct HTTP and HTTPS traffic to your server.

### Repoint your DNS to the load balancer

1. At the top of the [Cloud Control Panel](https://mycloud.rackspace.com/), select **Networking > Cloud DNS**.

2. Select the domain that is currently pointing to your First Gen server.

3. On the domain details page, click the gear icon next to your A record and select **Modify Record**.

4. In the pop-up dialog box, enter the IP address of the load balancer in the **Target** field.

5. Type the load balancer's IP address in to your browser's address bar to verify your website is loading correctly.

### Create a Next Gen server image

Follow the steps in this section to create an image of the First Gen server that you will then use to create a Next Gen server.

**Note:** If you are on a Linux server with under 40 GB of disk in use, you can resize down to a 1 GB flavor before taking the image. When you create the new Next Gen server from the image, you can choose any flavor that will allow you to boot the server from a volume, as described in the [Boot a server from a Cloud Block Storage volume](/how-to/boot-a-server-from-a-cloud-block-storage-volume) article.

1. On the Cloud Servers page of the Cloud Control Panel, click the gear icon next to the First Gen server that you are imaging and select **Create Image**.

2. In the pop-up dialog box, enter a name for the image in the **Saved Image Name** field.

3. Select the **Next Generation Cloud Server Image** option.

4. Click **Create Image**.

### Create a Next Gen server

Follow these steps to create a Next Gen server for the First Gen server image.

1. In the top navigation bar of the [Cloud Control Panel](https://mycloud.rackspace.com), select **Servers > Saved Images**.

2. Click the gear icon next to the image you created in the previous section and select **Create Server with Image**.

3. Name your server and choose your preferred flavor.

4. Click **Create Server** at the bottom of the page.

### Switch the servers

After the server has been created, attach it to your load balancer by performing the following steps.

1. Go to the details page for the load balancer.

2. Under **Nodes**, click **Add Cloud Servers**.

3. Select the server that you created in the previous section and then click **Add Selected Servers**.

4. Use the following steps to remove the First Gen server that you added previously from the load balancer:

   **Note:** You can remove the First Gen server by using the Edit Node Condition feature instead. With this option, anyone currently on the server will be unaffected by the transition but will not be allowed to start new connections.

   a. Click the gear icon next to the First Gen server and select **Edit Node Condition**.

   b. In the pop-up dialog box, select **Draining Connections**.

   c. Click **Save Condition**.

   Your server traffic will now use your Next Gen server.

### Delete the Load Balancer

At this time you can delete the load balancer but you must update the DNS. Optionally, you can keep the load balancer and add a second copy of the server behind it to increase your availability. For more information, see [Tiered configuration using Cloud Load Balancers](https://support.rackspace.com/how-to/tiered-configuration-using-cloud-load-balancers/).

### Optional synchronization tools

FTP is the recommended tool for synchronizing data on a Windows server.
