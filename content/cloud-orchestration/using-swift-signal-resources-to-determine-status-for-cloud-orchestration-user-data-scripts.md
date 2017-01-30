---
permalink: using-swift-signal-resources-to-determine-status-for-cloud-orchestration-user-data-scripts/
audit_date:
title: Use Swift Signal resources with Cloud Orchestration user data scripts
type: article
created_date: '2015-07-24'
created_by: Mike Asthalter
last_modified_date: '2016-05-02'
last_modified_by: Stephanie
product: Cloud Orchestration
product_url: cloud-orchestration
---

`OS::Heat::SwiftSignal` can be used to coordinate resource creation with
notifications/signals that could be coming from sources external or
internal to the stack. It is often used in conjunction with
`OS::Heat::SwiftSignalHandle` resource.

`SwiftSignalHandle` is used to create a temporary URL, and this URL is
used by applications and scripts to send signals. `SwiftSignal` resource
waits on this URL for a specified number of signals in a given time.

In the following example template, you will set up a single node Linux
server that signals success or failure of `user_data` script execution
at a given URL.

Start by adding the top-level template sections:

    heat_template_version: 2014-10-16

    description: |
      Single node linux server with swift signaling.

    resources:

    outputs:

### Resources section

#### Add a `SwiftSignalHandle` resource

`SwiftSignalHandle` is a resource to create a temporary URL to receive
notification/signals. Note that the temporary URL is created using
Rackspace Cloud Files.

    signal_handle:
      type: "OS::Heat::SwiftSignalHandle"

#### Add `SwiftSignal` resource

The `SwiftSignal` resource waits for a specified number of "SUCCESS"
signals (the number is provided as `count` property) on the given URL
(`handle` property). The stack will be marked as a failure if the
specified number of signals are not received in the given `timeout`, or
if a non "SUCCESS" signal is received such as a "FAILURE". A data string
and a reason string may be attached along with the success or failure
notification. The data string is an attribute that can be displayed as
template output.

    wait_on_server:
      type: OS::Heat::SwiftSignal
      properties:
        handle: {get_resource: signal_handle}
        count: 1
        timeout: 600

Here `SwiftSignal` resource would wait for `600` seconds to receive 1
signal on the `handle`.

#### Add a server resource

Add a Linux server with a bash script in the `user_data` property. At
the end of the script execution, send a success/failure message to the
temporary URL created by the above `SwiftSignalHandle` resource.

    linux_server:
      type: OS::Nova::Server
      properties:
        image: 4b14a92e-84c8-4770-9245-91ecb8501cc2
        flavor: 1 GB Performance
        user_data:
          str_replace:
            template: |
              #!/bin/bash -x
              # assume you are doing a long running operation here
              sleep 300

              # Assuming long running operation completed successfully,
              # notify success signal
              wc_notify --data-binary '{"status": "SUCCESS", "data": "Script execution succeeded"}'

              # Alternatively if operation fails, a FAILURE with reason and data may be sent,
              # notify failure signal example below
              # wc_notify --data-binary '{"status": "FAILURE", "reason":"Operation failed due to xyz error", "data":"Script execution failed"}'

            params:
              # Replace all occurances of "wc_notify" in the script with an
              # appropriate curl PUT request using the "curl_cli" attribute
              # of the SwiftSignalHandle resource
              wc_notify: { get_attr: ['signal_handle', 'curl_cli']

### Outputs section

Add Swift signal URL to the `outputs` section.

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

### Full example template

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
                # assume you are doing a long running operation here
                sleep 300

                # Assuming long running operation completed successfully, notify success signal
                wc_notify --data-binary '{"status": "SUCCESS", "data": "Script execution succeeded"}'

                # Alternatively if operation fails a FAILURE with reason and data may be sent,
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
