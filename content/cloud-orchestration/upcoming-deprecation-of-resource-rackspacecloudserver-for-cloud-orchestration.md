---
permalink: upcoming-deprecation-of-resource-rackspacecloudserver-for-cloud-orchestration/
audit_date:
title: 'Deprecated resource Rackspace::Cloud::Server for Cloud Orchestration'
type: article
created_date: '2015-07-24'
created_by: Mike Asthalter
last_modified_date: '2016-05-02'
last_modified_by: Stephanie Fillmon
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace hereby announces the full deprecation of the
Rackspace Cloud Server resource in Cloud Orchestration as of November 1, 2015. As of this date, Rackspace will automatically map references
to Rackspace Cloud Server to refer to OS Nova Server instead. This means
that after deprecation, while the references to Rackspace Cloud Server
are automatically remapped, using Rackspace Cloud Server will be the
same as using OS Nova Server.

In due time, however, the Rackspace Cloud Server resource will be
completely removed. For this reason, it is recommended that you switch
to using OS Nova Server resource in your templates instead of
Rackspace Cloud Server resource as soon as is feasible.

You will not be impacted if you have created stacks using our pre-built
Rackspace templates without modifying the templates. This is because we
have already made the required changes to our pre-built templates.

You may be impacted if you are using custom-built Heat templates, or if
you have modified any of our pre-built Rackspace templates to suit your
needs. Please continue to read this article.

### Why is Rackspace doing this?

Rackspace Cloud Server was intended as a stopgap to accommodate the
initial lack of support for Cloud Init on Rackspace Public Cloud as well
as to accommodate certain provisioning extensions in our Cloud Servers
product. Cloud Init is now supported on Rackspace Public Cloud and other
functionality has been integrated into OS Nova Server. Our overarching
goal has always been to support portability of templates across
OpenStack clouds, and support resources as close to OpenStack trunk as
possible. To this end, by moving away from Rackspace Cloud Server and
adopting OS Nova Server, the service becomes more consistent with this
goal.

### What are the key behavioral changes?

OS::Nova::Server will not provide the following capabilities
that Rackspace Cloud Server provides by default:

1.  The server became active only after user data execution completed.
2.  If user data script execution had a failure, the server create would
    show as failed.
3.  The pre-assigned server admin password could be retrieved without
    any additional instrumentation.

### What do I need to do to accommodate this change? Are there workarounds to mimic past behavior?

If you are already using OS Nova Server successfully in your templates,
and the above three behavioral changes don't impact your use case, you
do not need to make any changes. However, if you need any of these
functionalities, the workarounds are described below.

1.  The server became active only after user data execution completed.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. The server state will turn to active within a
    certain time period, even if user data script execution has
    not completed. To address this functionality, you can include Swift
    Signal resources (OS Heat SwiftSignal and OS Heat SwiftSignalHandle)
    to indicate whether the user data script completed. For detailed
    documentation and examples for using Swift Signal resources, please
    refer to
    this [article](/how-to/using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts).

2.  If user data script execution had a failure, the server create would
    show as failed.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. They will *not* throw an error if user data
    script execution fails. Rather, they will assume that user data
    succeeded. To address this functionality, you can include Swift
    Signal resources (OS Heat SwiftSignal and OS Heat SwiftSignalHandle)
    to indicate whether the user data scripts succeed or failed. For
    detailed documentation and examples on this, please refer to this
    [article](/how-to/using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts).

3.  The pre-assigned server admin password could be retrieved without
    any additional instrumentation.

    After deprecation, Rackspace Cloud Server will be the same
    as OS Nova Server. Cloud Orchestration will not store the admin
    password with the server resource. In order to retrieve the admin
    password in the outputs section, you can specify the password as n
    input parameter or use a resource to generate a password and pass it
    to Server resource. For example, you can use the
    OS Heat RandomString resource (which will create a random string) to
    create the password. An example template snippet of how this would
    work is shown below:

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

The mechanism shown above can be used to set and retrieve the admin
password instead of the way it was used earlier with
Rackspace Cloud Server. As mentioned earlier, the *technique shown below
will not* work after deprecation is complete.

    heat_template_version: '2013-05-23'

           outputs:

              AdminPass:

               description: Value of Admin Password

            value:

                 get_attr: [RackspaceServer, admin_pass]

         resources:

          RackspaceServer:

             properties:

             flavor: ''

            type: Rackspace::Cloud::Server

### Further questions?

Contact Rackspace via normal support channels and ask for help with the
Orchestration service, with using Heat templates, or to voice any
concerns you might have specific to this deprecation notice.
