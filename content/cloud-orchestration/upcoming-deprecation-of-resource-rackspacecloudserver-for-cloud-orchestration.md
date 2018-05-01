---
permalink: upcoming-deprecation-of-resource-rackspacecloudserver-for-cloud-orchestration/
audit_date:
title: 'Deprecated resource Rackspace::Cloud::Server for Cloud Orchestration'
type: article
created_date: '2015-07-24'
created_by: Mike Asthalter
last_modified_date: '2018-05-01'
last_modified_by: Kate Dougherty
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace is announcing the full deprecation of the Rackspace Cloud Server
resource in Cloud Orchestration as of November 1, 2015. As of this date,
Rackspace will automatically map references to Rackspace Cloud Server to refer
to OS Nova Server instead. This means that using Rackspace Cloud Server will
be the same as using OS Nova Server.

However, the Rackspace Cloud Server resource will be completely removed in the
future. For this reason, we recommend that you switch to using OS Nova Server
resource in your templates instead of Rackspace Cloud Server resource as soon
as possible.

You are not impacted if you have created stacks by using our pre-built
Rackspace templates without modifying the templates. We have already made the
required changes to our pre-built templates.

You may be impacted if you are using custom-built Heat templates, or if
you have modified any of our pre-built Rackspace templates.

### Why is Rackspace taking this action?

Rackspace Cloud Server was intended as a stopgap measure to accommodate the
initial lack of support for Cloud Init on Rackspace Public Cloud, as well
as to accommodate certain provisioning extensions in our Cloud Servers
product. Cloud Init is now supported on Rackspace Public Cloud, and other
functionality has been integrated into OS Nova Server. Our overarching
goal has always been to support portability of templates across
OpenStack clouds, and to support resources as close to OpenStack trunk as
possible. Moving away from Rackspace Cloud Server and adopting OS Nova Server
makes the service more consistent with this goal.

### What are the key behavioral changes?

OS::Nova::Server does not provide the following capabilities
that Rackspace Cloud Server provides by default:

1.  The server became active only after user data execution completed.
2.  If user data script execution had a failure, the server create would show
    as failed.
3.  The pre-assigned server admin password could be retrieved without any
    additional instrumentation.

### What do I need to do to accommodate this change? Are there workarounds to mimic past behavior?

If you are already using OS Nova Server successfully in your templates
and the above three behavioral changes don't impact your use case, you
do not need to make any changes. However, if you need any of these
functionalities, the workarounds are described below.

1.  The server became active only after user data execution completed.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. The server state will turn to active within a
    certain time period, even if execution of the user data script has
    not completed. To address this functionality, you can include Swift
    Signal resources such as OS Heat SwiftSignal and OS Heat SwiftSignalHandle
    to indicate whether the user data script has completed. For detailed
    documentation about using Swift Signal resources, see [Use Swift Signal resources with Cloud Orchestration user data scripts](/how-to/using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts).

2.  If user data script execution had a failure, the server create would
    show as failed.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. OS Nova Server will *not* throw an error if execution
    of the user data script fails. Rather, it will assume that user data
    succeeded. To address this functionality, you can include Swift
    Signal resources such as OS Heat SwiftSignal and OS Heat SwiftSignalHandle
    to indicate whether the user data scripts succeed or failed. For detailed
    documentation about using Swift Signal resources, see [Use Swift Signal resources with Cloud Orchestration user data scripts](/how-to/using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts).

3.  The pre-assigned server admin password could be retrieved without
    any additional instrumentation.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. Cloud Orchestration will not store the admin
    password with the server resource. In order to retrieve the admin
    password in the outputs section, you can specify the password as an
    input parameter or use a resource to generate a password and pass it
    to the Server resource. For example, you can use the OS Heat RandomString
    resource to create the password.

    The following example template snippet shows how to implement this
    solution:

    heat_template_version: '2013-05-23'

        outputs:

          AdminPass:

            description: Value of Admin Password

            value:

              get_attr: [OSHeatRandomString, value]

        resources:

          OSHeatRandomString:

            properties: {}

            type: OS::Heat::RandomString

          OSNovaServer:

            properties:

              admin_pass:

                get_attr: [OSHeatRandomString, value]

              flavor: ''

            type: OS::Nova::Server

This approach can be used to set and retrieve the admin
password.

### Request support

If you have further questions or concerns about this change, please contact
Rackspace support.
