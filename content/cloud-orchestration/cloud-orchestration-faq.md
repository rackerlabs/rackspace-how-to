---
permalink: cloud-orchestration-faq/
audit_date:
title: Cloud Orchestration FAQ
type: article
created_date: '2015-12-09'
created_by: Stephanie Fillmon
last_modified_date: '2018-03-15'
last_modified_by: Kate Dougherty
product: Cloud Orchestration
product_url: cloud-orchestration
---

### General

#### What is Cloud Orchestration?

Cloud Orchestration is a service that enables you to create, update, and
manage groups of cloud resources and their software components as a
single unit, and then deploy them in an automated, repeatable fashion through
a template. Cloud Orchestration is based on the OpenStack Heat project.
Our service runs upstream OpenStack Heat code with only a few slight
modifications to ensure a positive customer experience on our cloud.

You can create, edit, update, and delete full stack configurations by using
the [Cloud Control Panel](http://mycloud.rackspace.com), the [Cloud Orchestration API](https://developer.rackspace.com/docs/cloud-orchestration/v1/?&_ga=2.260382863.302649394.1521129640-20219293.1519936242#document-getting-started), or a
command-line interface (CLI). The Cloud Control panel includes a **Rackspace
Templates** area that provides access to pre-built templates. These templates
incorporate industry best practices and enable you to quickly deploy specific
application and platform stacks including WordPress, LAMP, and PHP.

The Cloud Orchestration API currently supports declaration and configuration
of the following elements:

-   Cloud Servers
-   Cloud Load Balancers
-   Cloud Databases
-   Cloud Block Storage
-   Cloud DNS
-   Auto Scaling
-   Bash scripts
-   Chef Cookbooks and Berkshelf

#### Can I access the Cloud Orchestration API using a command-line client?

Yes. While Rackspace does not currently provide a Rackspace specific
command-line client for Cloud Orchestration, we recommend that you
use the open source Heat Python client developed by the OpenStack
community. The Python Heat Client is compatible with Rackspace's Cloud
Orchestration Service. You can find instructions for obtaining and installing
the command-line client can be found in the Cloud Orchestration [Getting Started Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/#document-getting-started).

The Heat Python client provides command-line access to Cloud Orchestration
API operations. We recommend that you use this client to run simple
commands that make API calls. You can specify a `--debug` parameter on any
command to show the underlying API request for the command. Using this parameter is a good way to become familiar with the API requests.

#### Can I access the Cloud Orchestration service through the Cloud Control Panel?

Yes. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com)
and click the **Orchestration** tab.

#### Is Cloud Orchestration a Platform as a Service (PaaS)?

No. Although Cloud Orchestration does contain much of the structure of a PaaS,
it has additional transparency and control that a PaaS does not usually
offer. Cloud Orchestration has capabilities similar to a PaaS, such as
application launch on various platforms, but differs from a formal PaaS
in that it deploys full instances of servers, load balancers, and
databases. Cloud Orchestration gives you the additional control of knowing
exactly what resources are used and what software is installed.
Cloud Orchestration provides the convenience of automating the resource stack,
and gives you full knowledge and additional control beyond what many
PaaS solutions offer.

------------------------------------------------------------------------

### Billing and Account

#### Is there a cost associated with the Cloud Orchestration service?

There is no cost for using the Cloud Orchestration service. However,
infrastructure components such as cloud servers, cloud databases, and
cloud load balancers used in a stack are billed at standard pricing.

------------------------------------------------------------------------

### Support

#### How do I recover application passwords?

Recovering passwords for applications is different from recovering
server passwords. Some passwords might be available in configuration
files or in databases on your server. Other passwords might need to be
reset using a series of steps defined by that application vendor. To find the
the specific steps for resetting application or user passwords, check the
documentation and FAQ from the application vendor. Remember that you
might also need to change configured passwords in client or other
applications that use the credentials that you are resetting.

#### How do I recover my server password?

After your stack has completed, you are provided with private keys and
passwords for your cloud resources. To reset your server passwords, see
[Change your server root/admin password from your account](/how-to/how-to-change-your-server-rootadmin-password-from-your-account).

#### How do I log in to my servers?

After your stack has completed, you are provided with the credentials for
your servers. If you aren't sure how to log in with those credentials,
see [Connect to a cloud server](/how-to/connect-to-a-cloud-server).

#### How do I access my application?

It depends on the application. After a stack is complete, you are
provided with the necessary passwords, keys, and URLs to log in to your
servers and newly deployed application.

#### Can I create a stack with different versions of an application?

We are working to add a number of common application templates to our
catalog. There are thousands of different versions of applications,
frameworks, databases, and support software. While we attempt to offer
the latest versions, offering multiple versions of applications might
not always be possible. If you have specific requests for additions to
the Cloud Orchestration service, submit your request through [Rackspace
Product Feedback](https://feedback.rackspace.com/).

#### What do I do if an error occurs when creating a stack?

If you receive an error, you have the following options:

-   Delete the stack and start a new one. Trying again often results in a
    successful stack.
-   Submit a support ticket to get help with the error state.
    The support team can help you complete the stack.

#### What is the service level agreement for the Cloud Orchestration service?

Cloud Orchestration is a non-standard Rackspace service offered to customers
as a convenience feature. The service interacts with an assortment of cloud
resources and automates a large number of tasks. The number of tasks involved
increases the risk of failure. We are aware of this risk and are continually
working to improve success rates and build times for orchestration.

Due to the risk of failure, Rackspace does not provide a service level
agreement (SLA) for Cloud Orchestration. Rackspace also does not guarantee
successful completion of a stack within a specified period of time. Any stack
that does not complete should be deleted to avoid possible usage fees. After
the stack completes successfully, the service level agreements (SLA) for the
underlying cloud resources apply. Issues that occur after the stack completes
should be directed to your support team.

#### Do I need my own domain?

It depends on the application that you want to run. Most templates
require a domain name and provide an explanation of how the domain is
used. In some cases, the domain name is for setting host names. In other
cases, it is used to set up a web server and application to run from that
domain. For web-based applications, it is best to use your own
domain.

#### How do I enable monitoring on the servers?

Information about how to configure monitoring on the servers in your
stack is available in the [Cloud Monitoring Getting Started
Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/#document-getting-started).

------------------------------------------------------------------------

### Features

#### Does deleting a stack remove all of the underlying infrastructure?

Yes. Deleting a stack removes all servers, databases, load balancers,
and other resources that were created when the stack was built. You
no longer see any associated resources in the lists of servers,
databases, and other resources.

Alternatively, you can choose to delete these resources individually through
the Cloud Control Panel. However, be aware that deleting one or more of the
resources within a stack will likely make the stack unstable and possibly
inoperable.

#### Can the Cloud Orchestration service deploy a hybrid cloud or dedicated infrastructure?

Not at this time. Orchestration only deploys Rackspace Cloud resources.
However, customers with RackConnect accounts can still use the Cloud
Orchestration service to deploy cloud resources and then connect those
resources to a hybrid environment.

#### Can a template be applied on top of an existing stack?

Yes. You can use the [update stack](https://developer.rackspace.com/docs/cloud-orchestration/v1/api-reference/stack-operations/#update-stack) operation in the Cloud Orchestration API to
apply a template to an existing stack.

**WARNING**: If the template is unable to detect your existing
software, it might rebuild all of the existing resources and cause you to lose
your data. Back up your data before you begin this task.

#### Can a Rackspace template be installed on existing deployed infrastructure?

Yes. You can use the [adopt stack](https://developer.rackspace.com/docs/cloud-orchestration/v1/api-reference/stack-operations/#adopt-stack) operation in the Cloud Orchestration
API to use existing cloud resources in a new stack.

#### Does the Cloud Orchestration service manage the stack after it has been created?

The Cloud Orchestration service does not include automatic maintenance of the
stack, such as updating software. Depending on your managed service
level, your support team can tell you how they can help you manage your
stack.

#### How long does it take to create a stack?

The time that it takes to create a completed stack depends on several
infrastructure services, as well as the level of traffic in a
specific data center at the time of the build.

#### How do I know when the stack is complete?

All of the infrastructure resources show an active status, and the stack
changes from the yellow

#### What are the different build states?

The Cloud Orchestration service has the following build states:

-   Build
-   Up
-   Error

#### What happens during the build of a stack?

The following steps occur during the build of a stack:

1.  The Cloud Orchestration engine plans and executes a series of tasks that
    build and configure cloud resources.
2.  The applications are loaded and configured.
3.  The Cloud Orchestration service ensures that everything works as expected.
    If any issues occur during the build, the status is updated to
    reflect that there is an issue.

You can see the status of the stack and resources on the Stack page.

------------------------------------------------------------------------

### OpenStack

#### Can I reuse Heat templates that I created on Rackspace Cloud Orchestration on other OpenStack, Heat-based service offerings?

Yes. Because Rackspace Cloud Orchestration is based on OpenStack Heat, you can
reuse templates on other OpenStack Heat-based offerings. However, there are
some exceptions.

For example, templates that include Rackspace resources cannot be reused.
Rackspace resources are resources that have names that begin with
**Rackspace**. In addition, a template cannot be reused on an alternate
OpenStack Heat service that is running older versions of the resources.

#### Does Cloud Orchestration support the CFN template format from Amazon?

Yes, but with some caveats. In order to support the CFN format, there are a
variety of underlying compatibility tools that must be run on the service
provider's cloud.

Rackspace supports the CFN template format and is slowly adding support for
individual resources. We currently support server and load balancer resources.
However, if the existing CFN template contains syntax that invokes other
resources, it will need to be tweaked before use. We encourage you to provide
feedback and request new features, which will help us prioritize our roadmap.

#### Can I deploy my Heat template from another OpenStack service provider at Rackspace?

Yes. Because Rackspace Cloud Orchestration is based on OpenStack Heat, you can
easily deploy your existing Heat template on Rackspace Cloud. However, the
template must use resources that are in the [Orchestration Resource
Reference](https://developer.rackspace.com/docs/cloud-orchestration/v1/resources-reference/).

You can obtain a current list of resources through a CLI.

#### Are there any differences between Cloud Orchestration and OpenStack Heat?

Yes. There are two main differences:

1.  We provide additional support for custom-defined “Rackspace” resources.
    While Cloud Orchestration is based on the OpenStack Heat project, each
    service provider running Heat can choose the cloud resource
    plug-ins they want to support. To provide customers with broad  
    orchestration support for our public cloud, we run custom
    resource plug-ins that other service providers may choose not to run,
    or that may not be compatible with other service provider clouds.
    Templates that use these custom resources may need modification in
    order to work properly on other service provider installations or private
    OpenStack installations.

    Rackspace-specific resources are clearly marked in our documentation
    and begin with the word **Rackspace**. For a full list of supported
    resource types, please see [List resources](https://developer.rackspace.com/docs/cloud-orchestration/v1/api-reference/stack-resources/#list-resources).

    **Note**: The **OS:Heat:ChefSolo** resource in this list is a
    Rackspace-contributed resource that is incorrectly labeled as Heat.
    This will be corrected in subsequent updates.

2.  The Cloud Orchestration service's version of Heat is often ahead of the
    official version of OpenStack. At Rackspace, we strive to provide our
    customers with reliable, community-developed Heat features as often
    as possible. However, to ensure a positive customer experience, our
    Cloud Orchestration service may at times run newer or older feature
    code than that developed by the open community. We do this because
    we employ test-driven development methodologies and automation,
    which enable us to quickly deploy the latest and greatest features
    ahead of the official OpenStack six-month release cycle. We may lag
    in supporting an upstream feature in order to ensure that we
    appropriately test all scenarios that could affect our customers.
    Both Heat and our Cloud Orchestration service have versioned APIs and DSL
    syntax so that you can compare our service versions against other
    installations of Heat.

------------------------------------------------------------------------

### Software

#### What software does the template install?

The software that is installed is detailed in the description column of
the template selector. As part of your template configuration, you have
the option to select the operating system and other software. All of the
software and dependencies that are listed in the description column are
automatically installed. In some cases, you can specify additional
software packages to install.

#### What if there's a security vulnerability in the version of the software that the Cloud Orchestration service installs?

Cloud Orchestration typically installs software versions that are the
most commonly used and that have the most popular features.

However, some software versions might have vulnerabilities. Although Rackspace
does not intentionally offer software with known vulnerabilities, this
situation might occur. You should always use appropriate security precautions
when accessing and using any software, even when it is deployed through the
Rackspace Cloud Orchestration service. Always update software versions when
security vulnerabilities are identified by the application provider or
community.

#### Does Rackspace support the software that is installed through the Orchestration service?

Rackspace supports the stack at the system level with the Managed Operations
Service Level of support. Only the software in our [Linux Spheres of Support for Dedicated and Managed Operations](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops)
is supported. Software installed on top of a web server or database
server is not directly supported. (Some examples of this type of software are
WordPress and Drupal.) However, the underlying system, web server, and
database server are supported.

The underlying structure of the stack is supported at all service
levels.

#### Where are the license files or the general public license (GPL) for the installed software?

These licenses are installed on the server where the software is
installed. The location varies depending on the software.

------------------------------------------------------------------------

### Templates

#### What is a Cloud Orchestration template?

A Cloud Orchestration template is a text file that declares what
resources you want as part of a stack and how to configure those
resources, including references to any installation scripts or software
configuration management artifacts needed to install appropriate
applications. Templates are written using the HOT (Heat Orchestration
Template) syntax (currently written in YAML). Documentation on how to
write templates can be found under the Orchestration topic at the [Developer Docs](https://developer.rackspace.com/docs/ landing page.

#### How are Cloud Orchestration templates different from Chef or Puppet?

Cloud Orchestration is not a replacement for server configuration tools
such as Puppet and Chef. Cloud Orchestration complements these tools. You will
continue to use Chef and Puppet to create templates for your server software
configurations, while Cloud Orchestration templates will help you create a
full stack that includes all of the infrastructure resources your stack
requires. Cloud Orchestration enables you to quickly bootstrap your preferred
software configuration management solution onto your servers. With Chef, we
have gone several steps further and provide direct support to specify the
cookbooks and Berksfile that you want to deploy.

#### Where can I find example templates for Cloud Orchestration?

Cloud Orchestration template examples are currently located in
the [Rackspace Orchestration Templates](https://github.com/rackspace-orchestration-templates)
organization on GitHub.

#### What's the difference between Rackspace templates and Custom Templates?

The Cloud Orchestration service enables you to deploy your own custom
templates or leverage pre-built and pre-tested templates.

To use your own template, log in to the Cloud Control Panel and click
**Orchestration > Custom Template**.

To save time and effort and take advantage of industry best practices, go to
**Orchestration > Stack Templates**. The pre-built and pre-tested templates in
this area enable you to quickly spin up fully-configured stacks. The templates
orchestrate the requisite cloud resources and perform initial software
configuration.

#### Which Rackspace template should I choose?

The Orchestration service enables you to select the template that is
appropriate for your needs. Each template has a simple description or
flavor, as well as a detailed description that you can access when you select a
template in the Cloud Control Panel. The following guidelines will help you
select the right type of stack:

-   Single-server template: This template offers all-in-one orchestration in
    which the database, application, and all other resources are on the same
    compute instance. Single-server orchestration is useful for testing
    and other low-traffic situations where there is no intention of
    increasing capacity. If you think you will need greater capacity,
    then deploy a load-balanced, multi-server template with a dedicated
    back-end database instead. Some applications are not available with the
    single-server template.
-   Multiple-server template: This template offers orchestration based on a
    multiple-tier architecture. Multiple-server templates generally
    include load-balanced servers and a dedicated back-end
    database service. Multiple-server templates are ready for production
    traffic and scale more easily.
-   Rackspace Cloud Databases or Cloud Servers with MySQL: This back-end
    choice is based on your needs. Cloud Databases offers a consistently high
    level of performance. However, Cloud Databases does not currently offer
    replication or automated backups. Both of these features are currently in
    development.
