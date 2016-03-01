---
node_id: 4254
title: Quick set up with Rackspace Cloud Orchestration
type: article
created_date: '2014-09-23'
created_by: Nicole Schwartz
last_modified_date: '2016-01-27'
last_modified_by: Catherine Richardson
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration helps you set up projects and servers with just a few clicks instead of lengthy installations. You can usually be up and running in less than five minutes, depending on the template that you choose and other factors. Cloud Orchestration provides templates for a LAMP stack to get your web server up and running quickly, a Minecraft server, and a WordPress blog, just to name a few. For the complete list of options, see [Available Templates for Cloud Orchestration](/how-to/available-templates-for-cloud-orchestration).

### Create a stack

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/) and select the Orchestration menu.

    To create a stack in the Create Resources menu, select **Stack**.

	<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/1560-3549-newimage_0.png" width="481" height="134" border="1" alt=""  />

	To create a stack in the Servers menu, click **Create Stack** from the Cloud Servers page where you would create a new server.

	<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/1560-3549-newimage2_0.png" width="771" height="204" border="1" alt=""  />

2. Enter a name and select the region for your stack.

    Select a template and version to launch. To see information about a template, click the application name and flavor, and read the description. The template versions enable you to choose from different types of templates, ranging from single to multiple server, and to choose different types of database options.

    Click **Next Step**.

3. On the Create Stack page, specify the operating system and server size. You will have other requirements to select, and these will vary depending on the template you selected and whether you chose single or multiple servers for your stack.

4. To get a price quote, click **Calculate Price** in the right pane under Stack Summary. There is no charge for using the Orchestration feature in the portal. You are only charged for the infrastructure that you use.

5. Click **Create Stack**.

6. You can view the status and progress of your stack build on the stack details page. All cloud infrastructure is shown in the infrastructure section. When the stack is in the **Up** status, the build is complete.

### View stack details

On the stack details page, click **View Credentials** to get any sensitive information such as keys or passwords generated with the stack.

The bottom of the stack details page displays additional information about the application or framework that has been installed. You can use this information to build in additional capabilities into your installed application.

<img alt="" border="1" height="439" src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/3549createstack5.png" width="567" />

After the stack build is complete, you can use your installed application or framework. You can also manage your stack and the individual infrastructure in their respective locations in the control panel.


### Delete a stack

1. In the **Servers** tab, click **Orchestration** to see a list of your existing stacks.

2. Click the action cog next to the stack that you want to delete and click **Delete Stack**.

	**Note**: You can view all servers, load balancers, and databases that are part of your stack in their respective sections of the control panel. If you choose to delete an infrastructure component (such as a server, load balancer, or database) that is part of a stack, that stack is likely to become unstable. Exercise caution when deleting infrastructure components. To delete an entire stack, perform the stack deletion from the Orchestration section of the control panel instead of deleting each infrastructure component individually.

### Scale a stack up or down

If you are an advanced users, you can use the custom template section to modify an existing template. You can also submit a custom template to create your own custom stack. For either method, click **Next Step** and then **Create Stack** to create the stack.


1. Click **Orchestration**.

2. In the Create Resources menu, select **Stack** and then click **Custom Template**.

3. You can modify a template with one of the following options available on the Stack Details page:

 -  **Paste or Upload a Template**

 -  **Paste template below or upload a file into the editor**.

 -  **Not sure where to start? Try copying and editing a Rackspace Template**. Choose this option and select the template you want to modify, then click **Customize Template**. The template text will appear in the text editor where you can modify it.

 - **Link to a template** - Link a template in a Github or other repository in a YAML or JSON formats. Enter the link in the URL field.

4. Click **Next Step**.

<p>&nbsp;</p>
