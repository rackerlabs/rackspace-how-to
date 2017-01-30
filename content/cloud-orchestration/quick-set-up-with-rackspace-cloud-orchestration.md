---
permalink: quick-set-up-with-rackspace-cloud-orchestration/
audit_date: '2016-11-10'
title: Get started quickly with Rackspace Cloud Orchestration
type: article
created_date: '2014-09-23'
created_by: Nicole Schwartz
last_modified_date: '2016-05-13'
last_modified_by: Cat Lookabaugh
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration helps you set up projects and servers with just a
few clicks instead of lengthy installations. The setup process usually takes
less than five minutes, depending on the template that you choose and other
factors. Cloud Orchestration provides templates for a LAMP stack (to get your
web server set up and running quickly), a Minecraft server, and a WordPress
blog, just to name a few. For the complete list of options, see
[Available templates for Cloud Orchestration](/how-to/available-templates-for-cloud-orchestration).

### Create a stack

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2. In the top navigation, select **Orchestration** and then select **Stack**
from the Create Resources menu.

3. In the **All Stacks** list, click the description of the template that you
want to launch.

   Some templates provide multiple configurations, such as single server or
   multiple servers, a production stack or a development stack, or
   different types of database options.

4. Click **Create Stack**.  If prompted, select a flavor (configuration), and
then click **Create Stack**.

5. On the Create Stack page, specify a stack name and region, and then specify
the operating system and server size.

6. Specify any other requirements, which vary depending on the template that
you selected and whether you chose single or multiple servers for your stack.

7. To get a price quote, click **Calculate Price** in the right pane under
Stack Summary.

   There is no charge for using the Orchestration feature in the control panel.
   You are only charged for the infrastructure that you use.

8. Click **Create Stack**.

   You can view the status and progress of your stack build on the stack
   details page. All cloud infrastructure is shown in the infrastructure
   section. When the stack displays the green **Up** status, the build is
   complete.

### View stack details

On the stack details page, click **View Credentials** to get any sensitive
information, such as keys or passwords generated with the stack.

The bottom of the stack details page displays additional information about the
application or framework that has been installed. You can use this information
to build additional capabilities into your installed application.

After the stack build is complete, you can use your installed application or
framework. You can also manage your stack and the individual infrastructure
components in their respective locations in the control panel.

### Delete a stack

You can view all servers, load balancers, and databases that are part of your
stack in their respective sections of the control panel. If you choose to
delete an infrastructure component that is part of a stack (such as a server,
load balancer, or database), that stack is likely to become unstable. Exercise
caution when deleting infrastructure components. To delete an entire stack,
perform the stack deletion from the Orchestration section of the control panel
instead of deleting each infrastructure component individually.

1. In the top navigation of the Cloud Control Panel, click
**Orchestration > Stacks** to see a list of your existing stacks.

2. Click the gear icon next to the stack that you want to delete, and select
**Delete Stack**.


### Create or modify a stack template

If you have experience in creating or modifying template code, you modify an
existing template or submit a custom template to create your own custom stack.

1. In the [Cloud Control Panel](https://mycloud.rackspace.com), click
**Orchestration** ib the top navigation bar and then select **Stack** from the
Create Resources menu.

2. To submit a custom template, click **Create Custom Template**. Skip to step
4.

3. To modify an existing template, click the gear icon next to the application
name, select **Copy and Edit Template**, select a flavor (configuration), and
then click **Copy Template**.

4. Specify a name for the template.

5. Paste your template code in the box provided, upload a file, or modify
existing code.

6. Check your template for accuracy by clicking the **Validate Syntax** button.

7. Click **Create Template**.

   To launch a stack directly from this template, click on **Create Template
   and Launch Stack** instead.
