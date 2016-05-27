---
permalink: cloud-orchestration-support-for-rackconnect-v30/
audit_date:
title: Cloud Orchestration support for RackConnect v3.0
type: article
created_date: '2015-02-11'
created_by: Juan Perez
last_modified_date: '2016-01-04'
last_modified_by: Constanze Kratel
product: RackConnect
product_url: rackconnect
---

Rackspace Cloud Orchestration support for RackConnect v3.0 enables you
to build a stack of RackConnect v3.0 cloud servers and have them
automatically provisioned on your RackConnect v3.0 cloud network,
assigned public IP addresses, and automatically added to your
dedicated load balancer pools. When you use Cloud Orchestration, the
RackConnect v3.0 API calls needed to assign a public IP address to a cloud
server and add it to a load balancer pool are handled by Cloud
Orchestration.

**Note:** Managed Operations customers must
provide ServiceNet along with the RackConnect
network.

More details about Cloud Orchestration are available in the following documents:

-   [Rackspace Cloud Orchestration API v1 Developer Guide](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/)
-   [Rackspace Cloud Orchestration API v1 Templates User Guide](https://developer.rackspace.com/docs/user-guides/orchestration/)
-   [Cloud Orchestration FAQ](/how-to/cloud-orchestration-faq)

Although an official RackConnect v3.0 heat template has not been
released yet, an in-development template is available on GitHub at
<https://github.com/rackerlabs/heat-ci/blob/master/dev/rackconnect.template>.

If you have the [heat
client](https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/#using-the-heat-client)
installed, you can also get more details about the RackConnect specific
resources available with Cloud Orchestration by running the
`resource-type-show` commands as follows:

    heat resource-type-show "Rackspace::RackConnect::PoolNode"
    heat resource-type-show "Rackspace::RackConnect::PublicIP"

Following is an example of the parameter and resource entries that you
can use to create a RackConnect v3.0 heat template. These entries create
a cloud server on a RackConnect v3.0 cloud network, add that cloud
server to a dedicated load balancer pool, and allocate a public IP
address to the cloud server.

    parameters:

      rcnet:
        type: string
        description: The uuid of the RackConnect network to use
        constraints:
        - custom_constraint: "rackconnect.network"
        default: "<RCv3_NETWORK_UUID>"

      rcpool:
        type: string
        description: The uuid or name of the RackConnect load balancer pool to use
        constraints:
        - custom_constraint: "rackconnect.pool"
        default: <LB_POOL_NAME_OR_UUID>

    resources:

      # Attaches the server to the configured RackConnect load balancer pool
      pool_node:
        type: Rackspace::RackConnect::PoolNode
        properties:
          server_id: { get_resource: server }
          pool: { get_param: rcpool }

      # Attaches a RackConnected public IP to the server
      public_ip:
        type: Rackspace::RackConnect::PublicIP
        properties:
          server_id: { get_resource: server }

      # Cloud server attached to a RackConnect network
      server:
        type: OS::Nova::Server
        properties:
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM)
          flavor: 1 GB Performance
          name:
            str_replace:
              template: stack-server
              params:
                stack: { get_param: "OS::stack_name" }
          networks:
          # Can only assign the server to a RackConnect network
          # and optionally ServiceNet. Cannot assign to the
          # PublicNet
          - uuid: { get_param: rcnet }
          metadata:
            rax-heat: { get_param: "OS::stack_id" }
            stack-name: { get_param: "OS::stack_name" }

If you have any questions, reach out to us. Our contact information is available on the [Contact Us](/how-to/support)
page.
