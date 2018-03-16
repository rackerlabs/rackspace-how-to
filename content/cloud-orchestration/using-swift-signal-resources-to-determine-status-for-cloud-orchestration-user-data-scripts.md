---
permalink: using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts/
audit_date: '2018-03-16'
title: Use Swift Signal resources with Cloud Orchestration user data scripts
type: article
created_date: '2015-07-24'
created_by: Mike Asthalter
last_modified_date: '2018-03-16'
last_modified_by: Kate Dougherty
product: Cloud Orchestration
product_url: cloud-orchestration
---

### Introduction

Cloud Orchestration users can implement Swift signal resources that will help
determine the status of user data scripts. For example, implementing the following Swift signal resources will add functionality that indicates whether a user data script completed, and if so, whether it has succeeded or failed.

The `OS::Heat::SwiftSignal` resource can be used to coordinate resource creation with signals coming from sources that are external or internal to the stack. This resource is often used in conjunction with the
`OS::Heat::SwiftSignalHandle` resource.

The `SwiftSignalHandle` resource is used to create a temporary URL that is
used by applications and scripts to send signals. The `SwiftSignal` resource
waits on this URL for a specified number of `SUCCESS` signals within a
specified amount of time. The temporary URL is created using Rackspace Cloud
Files.

The following tutorial will walk you through the process of setting up a
single-node Linux server that signals success or failure of `user_data` script
execution at a given URL.

### Add the top-level template sections

Add the following information at the top of the template:

    heat_template_version: 2014-10-16

    description: |
      A single-node linux server with swift signaling.

    resources:

    outputs:

#### Add a `SwiftSignalHandle` resource

In the resources section, add a `SwiftSignalHandle` resource. The following
code example shows how to add this resource:

    signal_handle:
      type: "OS::Heat::SwiftSignalHandle"

#### Add a `SwiftSignal` resource

In the resources section, add a `SwiftSignal` resource.

The URL is provided in the `handle` property, and the number of signals is
provided in the `count` property.

The following example shows how to add a `SwiftSignal` resource that waits for
`600` seconds to receive one signal on the `handle`.

    wait_on_server:
      type: OS::Heat::SwiftSignal
      properties:
        handle: {get_resource: signal_handle}
        count: 1
        timeout: 600

The stack will be marked as a failure if the specified number of signals is
not received within the amount of time specified in the `timeout` property, or
if a signal other than `SUCCESS` is received. A data string and a reason
string may be attached to the success or failure notification. The data string
is an attribute that can be displayed as template output.

#### Add a server resource

Add a Linux server. In the `user_data` property, include a bash script. At
the end of the script execution, send a `SUCCESS` or `FAILURE` message to the
temporary URL created by the `SwiftSignalHandle` resource you added earlier.

    linux_server:
      type: OS::Nova::Server
      properties:
        image: 4b14a92e-84c8-4770-9245-91ecb8501cc2
        flavor: 1 GB Performance
        user_data:
          str_replace:
            template: |
              #!/bin/bash -x
              # assume you are doing a long-running operation here
              sleep 300

              # Assuming the long-running operation completed successfully,
              # notify success signal
              wc_notify --data-binary '{"status": "SUCCESS", "data": "Script execution succeeded"}'

              # Alternatively, if operation fails, a FAILURE with reason and data may be sent,
              # notify failure signal example below
              # wc_notify --data-binary '{"status": "FAILURE", "reason":"Operation failed due to xyz error", "data":"Script execution failed"}'

            params:
              # Replace all occurrences of "wc_notify" in the script with an
              # appropriate curl PUT request using the "curl_cli" attribute
              # of the SwiftSignalHandle resource
              wc_notify: { get_attr: ['signal_handle', 'curl_cli']

### Add the Swift signal URL to the `outputs` section

The following example shows how to add the Swift signal URL to the `outputs` section:

    #Get the signal URL which contains all information passed to the signal handle
    signal_url:
      value: { get_attr: ['wait_handle', 'curl_cli'] }
      description: Swift signal URL

    #Obtain data describing script results. If nothing is passed, this value will be NULL
    signal_data:
      value: { get_attr: ['wait_on_server', 'data'] }
      description: Data describing script results

    #Obtain IPv4 address of server
    server_public_ip:
      value:{ get_attr: [ linux_server, accessIPv4 ] }
      description: Linux server public IP

### View the full template

The following code shows what the complete example template looks like:

    heat_template_version: 2014-10-16

    description: |
      Single node linux server with swift signaling.

    resources:

      signal_handle:
        type: "OS::Heat::SwiftSignalHandle"

      wait_on_server:
        type: OS::Heat::SwiftSignal
        properties:
          handle: {get_resource: signal_handle}
          count: 1
          timeout: 600

      linux_server:
        type: OS::Nova::Server
        properties:
          image: 4b14a92e-84c8-4770-9245-91ecb8501cc2
          flavor: 1 GB Performance
          user_data:
            str_replace:
              template: |
                #!/bin/bash -x
                # assume you are doing a long-running operation here
                sleep 300

                # Assuming long-running operation completed successfully, notify success signal
                wc_notify --data-binary '{"status": "SUCCESS", "data": "Script execution succeeded"}'

                # Alternatively, if operation fails, a FAILURE with reason and data may be sent,
                # notify failure signal example below
                # wc_notify --data-binary '{"status": "FAILURE", "reason":"Operation failed due to xyz error", "data":"Script execution failed"}'

              params:
                wc_notify: { get_attr: ['signal_handle', 'curl_cli'] }

    outputs:
      #Get the signal URL which contains all information passed to the signal handle
      signal_url:
        value: { get_attr: ['signal_handle', 'curl_cli'] }
        description: Swift signal URL

      #Obtain data describing script results. If nothing is passed, this value will be NULL
      signal_data:
        value: { get_attr: ['wait_on_server', 'data'] }
        description: Data describing script results

      #Obtain IPv4 address of server
      server_public_ip:
        value: { get_attr: [ linux_server, accessIPv4 ] }
        description: Linux server public IP
