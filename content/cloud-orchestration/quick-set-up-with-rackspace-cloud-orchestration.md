---
permalink: quick-set-up-with-rackspace-cloud-orchestration/
audit_date:
title: Quick set up with Rackspace Cloud Orchestration
type: article
created_date: '2014-09-23'
created_by: Nicole Schwartz
last_modified_date: '2016-05-13'
last_modified_by: Kyle Laffoon
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration helps you set up projects and servers with just a few clicks instead of lengthy installations. You can usually be up and running in less than five minutes, depending on the template that you choose and other factors. Cloud Orchestration provides templates for a LAMP stack to get your web server up and running quickly, a Minecraft server, and a WordPress blog, just to name a few. For the complete list of options, see [Available Templates for Cloud Orchestration](/how-to/available-templates-for-cloud-orchestration).

### Create a stack

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. In the top navigation, select **Orchestration** and then **Stack** in the Create Resources section.

3. Enter a name and select the region for your stack.
   
   Select a template and version to launch. To see information about a template, click the application name and flavor, and read the description. The template versions enable you to choose from different types of templates, ranging from single to multiple server, and to choose different types of database options.

4. Click **Next Step**.

5. On the Create Stack page, specify the operating system and server size.
   
   You will have other requirements to select, and these will vary depending on the template you selected and whether you chose single or multiple servers for your stack.

6. To get a price quote, click **Calculate Price** in the right pane under Stack Summary.
   
   There is no charge for using the Orchestration feature in the portal. You are only charged for the infrastructure that you use.

7. Click **Create Stack**.
   
   You can view the status and progress of your stack build on the stack details page. All cloud infrastructure is shown in the infrastructure section. When the stack displays the green **Up** status, the build is complete.

### View stack details

On the stack details page, click **View Credentials** to get any sensitive information such as keys or passwords generated with the stack.

The bottom of the stack details page displays additional information about the application or framework that has been installed. You can use this information to build in additional capabilities into your installed application.

After the stack build is complete, you can use your installed application or framework. You can also manage your stack and the individual infrastructure in their respective locations in the control panel.

### Delete a stack

1. In the top navigation in the Cloud Control panel, click **Orchestration > Stacks** to see a list of your existing stacks.

2. Click the gear icon next to the stack that you want to delete and click **Delete Stack**.

   **Note**: You can view all servers, load balancers, and databases that are part of your stack in their respective sections of the control panel. If you choose to delete an infrastructure component (such as a server, load balancer, or database) that is part of a stack, that stack is likely to become unstable. Exercise caution when deleting infrastructure components. To delete an entire stack, perform the stack deletion from the Orchestration section of the control panel instead of deleting each infrastructure component individually.

### Create or modify a stack template

If you are an advanced user, you can use the custom template section to modify an existing template. You can also submit a custom template to create your own custom stack.

1. In the [Cloud Control Panel](https://mycloud.rackspace.com), click on **Orchestration** and then **Stack** in the Create Resources section.

2. Under All Stacks, click on the **Create Custom Template** button.

3. Choose a name for the template.

4. Paste your template in the box provided or drag and drop a file to upload.
   
   You can check your template for accuracy by clicking the **Validate Syntax** button.

5. Click **Create Template**.
   
   To launch a stack directly from this template, click on **Create Template and Launch Stack** instead.
