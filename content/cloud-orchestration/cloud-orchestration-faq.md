---
permalink: cloud-orchestration-faq/
audit_date:
title: Cloud Orchestration FAQ
type: article
created_date: '2015-12-09'
created_by: Stephanie Fillmon
last_modified_date: '2016-01-27'
last_modified_by: Catherine Richardson
product: Cloud Orchestration
product_url: cloud-orchestration
---

### General

#### What is Cloud Orchestration?

Cloud Orchestration is a service that allows you to create, update and
manage groups of cloud resources and their software components as a
single unit and then deploy them in an automated, repeatable fashion via
a template. Cloud Orchestration is based off the OpenStack Heat project.
Our service runs upstream OpenStack Heat code with only a few slight
modifications to ensure a positive customer experience on our cloud.

Using the [Cloud Control Panel](http://mycloud.rackspace.com) UI, API or
the CLI you can create, edit, update and delete full stack
configurations. In addition to this service, Orchestration also provide
"Rackspace Templates" section in the Control Panel. This include several
pre-built templates that incorporate industry best practices and allow
customers to quickly deploy specific application and platform stacks
such as WordPress, LAMP, PHP, etc.

Cloud Orchestration API currently supports declaration and configuration
of:

-   Cloud Servers
-   Cloud Load Balancers
-   Cloud Databases
-   Cloud Block Storage
-   Cloud DNS
-   Auto Scaling
-   Bash scripts, and
-   Chef Cookbooks and Berkshelf

#### Can I access Cloud Orchestration API using a command-line client?

Yes. Rackspace does not currently provide a Rackspace specific
command-line client for Cloud Orchestration, however we recommend you
use the open source Heat python client developed by the OpenStack
community. The Python Heat Client is compatible with Rackspace's Cloud
Orchestration Service. Instructions on obtaining and installing the
command line client can be found in the Orchestration [Getting Started
Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/#document-getting-started).

The Heat python client provides command-line access to the orchestration
API operations. We recommend that you use this client to run simple
commands that make API calls. You can specify a --debug parameter on any
command to show the underlying API request for the command. This is a
good way to become familiar with the API requests.

#### Can I access Cloud Orchestration through the Cloud Control Panel?

Yes. Log in to the [Cloud Control Panel](http://mycloud.rackspace.com)
and click on the **Orchestration** tab.

#### Is Orchestration a Platform as a Service (PaaS)?

No. Although Orchestration does contain much of the structure of a PaaS,
it has additional transparency and control that a PaaS does not usually
offer. Orchestration has capabilities similar to a PaaS, such as
application launch on various platforms, but differs from a formal PaaS
in that it deploys full instances of servers, load balancers, and
databases. Orchestration gives you the additional control of knowing
exactly what resources are used and what software is installed.
Orchestration provides the convenience of automating the resource stack,
and gives you full knowledge and additional control beyond what many
PaaS solutions offer.

------------------------------------------------------------------------

### Billing and Account

#### Where can I find pricing and service level information for Cloud Orchestration?

The Cloud Orchestration service is offered at no cost, and you pay
standard charges for cloud resources instantiated and consumed, and any
applicable software license fees.

Cloud Orchestration is a Non-Standard Rackspace Service. Applicable SLAs
for the underlying infrastructures apply for successfully launched cloud
products.

#### Is there a cost associated with the Orchestration service?

There is no cost for using the Orchestration service, but any
infrastructure components such as Cloud Servers, Cloud Databases, and
Cloud Load Balancers used in a stack are billed at standard pricing.

------------------------------------------------------------------------

### Support

#### How do I recover application passwords?

Recovering passwords for applications is different from recovering
server passwords. Some passwords might be available in configuration
files or in databases on your server. Other passwords might need to be
reset using a series of steps defined by that application vendor. Check
documentation and FAQ information with the application vendor for the
specific steps to reset application or user passwords. Remember that you
might also need to change configured passwords in client or other
applications that use the credentials that you are resetting.

#### How do I recover my server password?

After your stack has completed, you are provided with private keys and
passwords for your cloud resources. To reset your server passwords, use
the [Change
Password](/how-to/how-to-change-your-server-rootadmin-password-from-your-account)
function.

#### How do I log in to my servers?

After your stack has completed, you are provided with the credentials to
your servers. If you are not sure how to log in with those credentials,
see the
/how-to/connect-to-a-cloud-server
article.

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
the Orchestration service, submit your request through [Rackspace
Product Feedback](https://feedback.rackspace.com/).

#### What do I do if an error occurs when creating a stack?

If you receive an error, you have the following options:

-   You can delete the stack and start a new one. Many times trying
    again results in a successful stack.
-   You can submit a support ticket to get help with the error state.
    The support team can assist in completing the stack on your behalf.

#### What is the service level agreement for the Orchestration service?

The Orchestration service is offered as a convenience feature to
customers. It interacts with an assortment of cloud resources and
automates a large number of tasks. The risk of failure is increased
because of the number of tasks. We are aware of this and are constantly
working to improve the success rates and build times of orchestration.
At this time there is always a potential for failure in the stack setup
process. As a result, Rackspace does not provide a service level
agreement(SLA) for this Control Panel feature, nor does Rackspace
guarantee a successful completion of a stack within a specified period
of time. Any stack that does not complete should be deleted to avoid
possible usage fees. After the stack is completed successfully, the SLA
for the deployed cloud resources applies. Any problem that occurs after
stack should be directed to your support team.

#### Do I need my own domain?

It depends on the application that you want to run. Most templates
require a domain name and provide an explanation of how the domain is
used. In some cases, the domain name is for setting host names; in other
cases, it is used to set up a web server and application to run from
that domain. For any web-based application, it is best to use your own
domain.

#### How do I enable monitoring on the servers?

Information about how to configure monitoring on the servers in your
stack is located in the [Cloud Monitoring Getting Started
Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/#document-getting-started).

------------------------------------------------------------------------

### Features

#### Does deleting a stack remove all infrastructure?

Yes. Deleting a stack removes all servers, databases, load balancers,
and any other resources that were created when the stack was built. You
no longer see any associated resources in the lists of servers,
databases, and so on.

You can choose to delete these resources individually through the Cloud
Control Panel, but be aware that deleting one or more of the resources
within a stack will likely make the stack unstable and possibly
inoperable.

#### Can the Orchestration service deploy a hybrid cloud or dedicated infrastructure?

Not at this time. Orchestration deploys only Rackspace Cloud resources.
However, customers with RackConnect accounts can still use Orchestration
to deploy cloud resources and then connect those resources to a hybrid
environment.

#### Can a template be applied on top of an existing stack?

Yes. You can use the update operation in the Orchestration API to apply
a template to an existing stack.

**WARNING**: The template might rebuild all the existing resources and
cause you to lose your data if it is unable to detect your existing
software. Back up your data before you begin this task.

#### Can a Rackspace template be installed on existing deployed infrastructure?

Yes. You can use the adopt stack operation in the Cloud Orchestration
API to use existing cloud resources in a new stack. Read more about the
operation in the [Cloud Orchestration Developer
Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/).

#### Does Orchestration manage the stack after creation?

The Orchestration service does not include automatic maintenance of the
stack, such as updating software. Depending on your managed service
level, your support team can tell you how they can help you manage your
stack.

#### How long does it take to create a stack?

The time that it takes to create a completed stack depends on several
infrastructure services and also depends on the level of traffic in a
specific data center at the time of the build.

#### How do I know when the stack is complete?

All infrastructure resources show an active status, and the stack
changes from the yellow

#### What are the different build states?

-   Build
-   Up
-   Error

#### What happens during the build of a stack?

1.  The Orchestration engine plans and executes a series of tasks that
    build and configure cloud resources.
2.  The applications are loaded and configured.
3.  The Orchestration service ensures that everything works as expected.
    If any issues occur during the build, the status is updated to
    reflect this.

You can see the status of the stack and resources on the Stack page.

------------------------------------------------------------------------

### OpenStack

#### Can I re-use heat templates that I created on Rackspace Cloud Orchestration on other OpenStack heat based service offerings?

Since Rackspace Cloud Orchestration is built from OpenStack Heat, the
thumb rule is yes, you can re-use templates on other Open Stack Heat
based offerings. The major exceptions to this thumb rule would be the
use of Rackspace resources (resource names beginning with Rackspace) or
if the alternate OpenStack Heat service is running an older version of
resources versus newer versions used in your template.

#### Does Cloud Orchestration support the CFN template format from Amazon?

Yes, but with the following caveats. Although OpenStack Heat
documentation claims support for a subset of this format, there are a
variety of nuances and underlying compatibility tools that must be run
on the service provider's cloud to support that format. Rackspace
supports the CFN template format and is slowly adding support for
individual resources. Currently, the server and loadbalancer resources
are supported implying that customers can re-use CFN templates with
these. However, if the existing CFN template contains syntax that
invokes resources (AutoScale group for example), it will need to be
tweaked before use. Customers are encouraged to provide feedback and
request new features. This helps us prioritize our roadmap.

#### Can I take my heat template from another OpenStack service provider and deploy it at Rackspace?

Yes, since Rackspace Cloud Orchestration is based off OpenStack Heat, in
general, you will be able to easily deploy your existing Heat template
on Rackspace Cloud. The only exception is that the template must use
resources that are in the [Orchestration Resource
Reference](https://developer.rackspace.com/docs/cloud-orchestration/v1/resources-reference/).

The latest list of resources can be obtained by listing them out via
CLI.

#### Are there any differences between Cloud Orchestration and OpenStack heat?

Yes. There are two main differences to note:

1.  Additional support for custom defined "Rackspace" resources While
    Cloud Orchestration is based off the OpenStack Heat project, each
    service provider running Heat can choose which cloud resource
    plug-ins to support. In an effort to provide our customers breadth
    of orchestration support for our public cloud, we run some custom
    resource plug-ins that other service providers may choose not to run
    or may not be compatible with other service provider clouds.
    Templates that use these custom resources may need modification in
    order to work properly on other service provider or private
    OpenStack installations.

    Rackspace specific resources are clearly marked in our documentation
    and begin with Rackspace." For a full list of supported resource
    types, please refer to our Orchestration documentation to see
    instructions for how to [list resource
    types](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/#list-resource-types).

    **Note**: The "OS:Heat:ChefSolo" resource in this list is a
    Rackspace contributed resource that is incorrectly labeled as Heat.
    This will be corrected in subsequent updates.

2.  Our Service's version of Heat is often ahead of the last official
    OpenStack version At Rackspace, we strive to provide our customers
    with reliable community developed features of Heat as often
    as possible. However, to ensure a positive customer experience, our
    Cloud Orchestration service may at times run newer or older feature
    code from that developed in the open community. We do this because
    we employ Test Driven Development methodologies and automation,
    which allows us to quickly deploy the latest and greatest features
    ahead of the official OpenStack six-month release cycle. We may lag
    in supporting an upstream feature in order to ensure we
    appropriately test all scenarios that could affect our customers.
    Both Heat and our Orchestration service have versioned APIs and DSL
    syntax so you can compare our service versions against other
    installations of Heat.

------------------------------------------------------------------------

### Software

#### What software does the template install?

The software that is installed is detailed in the description column of
the template selector. As part of your template configuration, you have
the option to select the operating system and other software. All
software listed in the description column, in addition to dependencies,
is installed automatically. In some cases, you can specify additional
software packages to install.

#### What if there is a security vulnerability in the verstion of software installed by Orchestration?

Orchestration installs software versions that, in many cases, are the
most commonly used and have the most popular features, but some versions
of these applications might be vulnerable to security exploits. Although
Rackspace does not intentionally choose to offer software with known
vulnerabilities, this might occur. Customers should always use
appropriate security precautions when accessing and using any software,
even when deployed with the Rackspace Orchestration service. Always
update those versions when security vulnerabilities are identified by
the application provider or community.

#### Does Rackspace support the software that is installed using the Orchestration service?

The stack is supported at the system level with the Managed Operations
Service Level of support. Only the software in our [Spheres of
Support](/how-to/linux-spheres-of-support-for-dedicated-and-managed-ops)
is supported. Software installed on top of a web server or database
server (like WordPress or Drupal) is not directly supported, but the
underlying system, web server, and database server are supported.

The underlying structure of the stack is supported at all service
levels.

#### What are the license files or the GPL for the installed software?

These licenses are installed on the server where the software is
installed. The location varies depending on the software.

------------------------------------------------------------------------

### Templates

#### How are Cloud Orchestration templates different from Chef or Puppet?

Cloud Orchestration is not a replacement for server configuration tools
such as Puppet and Chef. Cloud Orchestration is very complementary with
Chef or Puppet. You will continue to use Chef and Puppet to
"template-ize" your server software configurations, while Cloud
Orchestration templates will help you create a full stack that includes
all the infrastructure resources required for your stack. Cloud
Orchestration allows you to quickly bootstrap your preferred software
configuration management solution on to your servers. With Chef, we have
gone several steps further and provide direct support to specify the
cookbooks and Berksfile you want deployed.

#### Where can I find example templates for Cloud Orchestration?

Cloud Orchestration template examples are currently located on Github in
the
[rackspace-orchestration-templates](https://github.com/rackspace-orchestration-templates)
organization.

#### What is a Cloud Orchestration template?

A Cloud Orchestration template is a text file that declares what
resources you want as part of a stack and how to configure those
resources, including references to any installation scripts or software
configuration management artifacts needed to install appropriate
applications. Templates are written using the HOT (Heat Orchestration
Template) syntax (currently written in YAML). Documentation on how to
write templates can be found under the Orchestration topic at
<https://developer.rackspace.com/docs/>.

#### What is the difference between Rackspace templates and Custom Templates?

Cloud Orchestration allows customers to deploy their own custom
templates (via UI, API, CLI) or leverage pre-built pre-tested templates.

If a customer has built or wants to build their own template, the
"Custom Templates" tab in Orchestration section in Control Panel can be
used to create stacks via UI.

If a customer wants to save time and effort and take advantage of
industry best practices, the "Rackspace templates" section provides
several pre-built pre-tested options that allow fully configured stacks
to be spun up in quickly. This includes initial software configuration
as well as orchestrating the requisite cloud resources.

#### Which Rackspace template should I choose?

The Orchestration service enables you to select the template that is
appropriate for your needs. Each template has a simple description or
flavor, and a detailed description that you can access when you select a
template on the Cloud Control Panel. Follow these recommended guidelines
to select the right type of stack:

-   Single-server template: All-in-one orchestration in which the
    database, application, and all other resources are on the same
    compute instance. Single-server orchestration are useful for testing
    or low-traffic situations where there is no intention of
    increasing capacity. If you think you will need greater capacity,
    then deploy a load-balanced multi-server template with a dedicated
    back-end database instead. Not all applications are offered with the
    single-server template.
-   Multiple-server template: Orchestration based on a
    multiple-tier architecture. Multiple-server templates generally
    include load-balanced servers and a dedicated back-end
    database service. Multiple-server templates are ready for production
    traffic and scale more easily.
-   Rackspace Cloud Databases or Cloud Servers with MySQL: Back-end
    choice is based on your needs. Cloud Databases offers a high,
    consistent level of performance. However, Cloud Databases does not
    currently offer replication or automated backups, although both
    features are currently in development.
