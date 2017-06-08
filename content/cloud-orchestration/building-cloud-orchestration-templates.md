---
permalink: building-cloud-orchestration-templates/
audit_date: '2016-08-30'
title: Building Cloud Orchestration templates
type: article
created_date: '2016-10-09'
created_by: Aaron Mehar
last_modified_date: '2016-08-30'
last_modified_by: Nate Archer
product: Cloud Orchestration
product_url: cloud-orchestration
---

Rackspace Cloud Orchestration is based on the OpenStack® Heat project, which enables infrastructure creation and software deployment from a single template. This is called infrastructure as code (IoC). For Cloud Orchestration, Rackspace provides resources such as cloud servers, cloud networks, and cloud load balancers. Instead of using the Cloud Control Panel or API to build your infrastructure, you create a template that defines the infrastructure, links together each component of that infrastructure, and deploys it.

This article explains the parts of an Orchestration template, and provides Orchestration templates for certain use cases. For more examples of Orchestration templates, read the [Orchestration templates user guide](https://developer.rackspace.com/docs/user-guides/orchestration/).

- [How Heat templates work](#how-heat-templates-work)
- [Heat template format](#heat-template-format)
    - [Template Version](#template-version)
    - [Description](#description)
    - [Parameter groups](#parameter-groups)
    - [Parameters](#parameters)
    - [Outputs and resources](#outputs-and-resources)
    - [Intrinsic functions](#intrinsic-functions)
- [Example templates](#example-templates)
    - [Create a single server](#create-a-single-server)
    - [Create multiple identical servers](#create-multiple-identical-servers)
    - [Boot a server from a volume](#boot-a-server-from-a-volume)
    - [Boot multiple servers from a volume](#boot-multiple-servers-from-a-volume)
    - [Attach a Cloud Block Storage volume](#attach-a-cloud-block-storage-volume)
    - [Attach multiple Cloud Block Storage volumes](#attach-multiple-cloud-block-storage-volumes)
    - [Create a group of Cloud Block Storage volumes and servers](#create-a-group-of-cloud-block-storage-volumes-and-servers)
    - [Create a load balancer](#create-a-load-balancer)
    - [Share IP addresses between load balancers](#share-ip-addresses-between-load-balancers)
    - [Use Cloud Networks](#use-cloud-networks)
    - [Create a cloud database as a service](#create-a-cloud-database-as-a-service)
    - [Create a Cloud Files container](#create-a-cloud-files-container)
    - [Create a domain in Cloud DNS](#create-a-domain-in-cloud-dns)
    - [Create a cloud queue](#create-a-cloud-queue)
    - [Use SSH keys](#use-ssh-keys)


### How Heat templates work

Heat Orchestration Templates (HOT) are written in a [YAML](http://yaml.org/) format. Ansible provides a useful [YAML Syntax guide](http://docs.ansible.com/ansible/YAMLSyntax.html). The template is processed by the Heat engine which validates the template and then sends calls to each appropriate API endpoint in the correct order to complete the launch of your stack.


### Heat template format

Templates are made up of the parts shown in the following example. You can find more information about the template format in the [HOT specification](http://docs.openstack.org/developer/heat/template_guide/hot_spec.html).


    heat_template_version: 2014-10-16
      description:
        # a description of the template
      parameter_groups:
        # a declaration of input parameter groups and order
      parameters:
        # declaration of input parameters
      resources:
        # declaration of template resources
      outputs:
        # declaration of output parameters
      conditions:
        # declaration of conditions


#### Template version

The property `heat_template_version` tells Heat what version of the template to use. Formatting and support features can change with each version, so specifying the version is useful when you want to use a feature only available in  a newer version, or a feature in older versions that has been removed in later version. OpenStack documentation lists features and formatting in the [HOT specification](http://docs.openstack.org/developer/heat/template_guide/hot_spec.html#heat-template-version).


    heat_template_version: 2014-10-16


#### Description

The `description` section provides the purpose of the template. Descriptions with multiple lines should be formatted like the following example:

    description: >
      A description of your template, would go here. It would
      have several lines, and include details of the template
      such 2 LBs, 2 WebServers, 1 DBaaS and Autoscale.

Use a vertical line (\|)or angle bracket (>) to indicate literal blocks with the line breaks preserved. The description for the template is displayed in the template list in the Cloud Control Panel.

Use a vertical line ( &#124; ) or angle bracket (>) to indicate literal blocks with the line breaks preserved. The description for the template is displayed in the template list in the Cloud Control Panel.

Use a vertical line ( \| ) or angle bracket (>) to indicate literal blocks with the line breaks preserved. The description for the template is displayed in the template list in the Cloud Control Panel.

Use a vertical line ( <code>&#124;</code>  ) or angle bracket (>) to indicate literal blocks with the line breaks preserved. The description for the template is displayed in the template list in the Cloud Control Panel.

You can also use the `description` property within the parameters section of the template, as shown in the following example. See the "Parameters" section for more information.

    parameters:
      image:
      label: Operating System
        description: |
          Server image used for all servers that are created as a
          part of this deployment

#### Parameter groups

The `parameter_groups` section specifies how the input parameters are grouped. Each parameter can be part of only one group.

    parameter_groups:
      - label: Server Settings
        parameters:
        - srv_flavour
        - srv_image
        - srv_key

      - label: Database Settings
        parameters:
        - db_flavour
        - db_ram
        - db_version


#### Parameters

The `parameters` section specifies the input parameters used to customize each deployment, such as choosing an image, flavor, and password. In the following example, the `srv_image` parameter is given a label, which is displayed in the Cloud Control Panel, and a description, which can be read by hovering over a small question mark on the control panel. You can also specify the type of parameter, such as a string parameter. You set a default value, and then you set the allowed values.

    parameters:
      srv_image:
       label: Operating System
       description: |
          Server image used for all servers that are created as a part of this
          deployment
        type: string
        default: CentOS 7 (PVHVM) (Orchestration)
      constraints:
        - allowed_values:
          - CentOS 7 (PVHVM) (Orchestration)
          - Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
          description: Must be a supported operating system


#### Outputs and resources

Outputs are how you display information about the stack you created from your Orchestration templates. Output values are typically resolved using an intrinsic function such as the `get_attr` function.

Use the following example to display the IP address of a server and a load balancer, and to display the private SSH key generated in your template.

    outputs:
      instance_ip:
        description: The IP address of the deployed instance
        value: { get_attr: [my_server, accessIPv4] }

      lb_ip_address:
        description: The IP address of the deployed Load Balancer
        value: { get_attr: [load_balancer, PublicIp] }

      ssh_key:
        description: SSH Private Key
        value:
          get_attr: [KeyPair, private_key]

Outputs can also be manipulated by using string replacement, so you can construct URLs. The following output calls the IP address from the `my_server` resource and creates the URL `https://12.34.56.78/admin`. The URL is displayed after the stack is built.


    outputs:
     site_url:
        description: Website URL
        value:
          str_replace:
            template: "http://IP/admin/"
            params:
              IP: { get_attr: [my_server, accessIPv4] }


To get a list of available attributes, see the [list of resource types](http://docs.openstack.org/developer/heat/template_guide/openstack.html)

#### Intrinsic functions

Heat Orchestration provides a set of functions that can be used within a template. For a list of these functions, see the [HOT specification](http://docs.openstack.org/developer/heat/template_guide/hot_spec.html#intrinsic-functions)

### Example templates

This section provides some examples of Heat templates for different use cases. You can use each example to create your own Orchestration templates by copying the example to a text file and then saving the file as a YAML file.

**Note:** For the templates to be usable by the Heat infrastructure, YAML requires that you preserve the indentations in the examples. For more information about YAML, see Ansible’s YAML syntax guide.

#### Create a single server

Use the following template to create a single server infrastructure:


    heat_template_version: 2014-10-16

    resources:
      my_server:
        type: OS::Nova::Server
        properties:
          flavor: 2 GB General Purpose v1
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)


This template specifies `my_server` as the name of the resource and an OpenStack Nova server as the type of resource. Then the template lists the properties of the server. In this case, the properties listed are the server's flavor and image.

**Note:** A `resource` can be specified only once.

#### Create multiple identical servers

Use the following template to create two identical servers:


    heat_template_version: 2014-10-16

    resources:
      multi-server:
        type: OS::Heat::ResourceGroup
        properties:
          count: 2
          resource_def:
            type: OS::Nova::Server
            properties:
              name: node-%index%
              flavor: 2 GB General Purpose v1
              image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)


A resource group named `multi-server` enables the template to set properties for multiple servers. The `count` property indicates the number of servers  Then, you use the `resource_def` section to specify the type and properties of the server, as if you were building only one. You can use an optional variable, `%index%`, to number the server names. The servers created in this example are `node-1` and `node-2`.

#### Boot a server from a volume

Use the following template to boot a server from a Cloud Block Storage volume:

    heat_template_version: 2015-04-30

    resources:
      my_server:
        type: OS::Nova::Server
        properties:
          flavor: 2 GB General Purpose v1
          block_device_mapping_v2:
            - device_name: vda
              delete_on_termination: true
              image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
              volume_size: 50

A few extra properties are needed in order to boot from volume:

- `block_device_mapping_v2` property is used to indicate a boot from volume.
- `device_name` is always set to `vda` when booting from volume.  
- `delete_on_termination` defines whether to delete the volume when the server is deleted.

Lastly, the image and the volume size are specified.

#### Boot multiple servers from a volume

Use the following template to boot multiple servers from the same volume:


    heat_template_version: 2015-04-30

    resources:
      multi-bfv:
        type: OS::Heat::ResourceGroup
        properties:
          count: 2
          resource_def:
            type: OS::Nova::Server
            properties:
              name: node-%index%
              flavor: 2 GB General Purpose v1
              block_device_mapping_v2:
                - device_name: vda
                  delete_on_termination: true
                  image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
                  volume_size: 50


The example combines properties from the single boot from volume template and the multiple servers template.

#### Attach a Cloud Block Storage volume

Use the following template to create a normal server if you have a Cloud Block Storage volume attached as a secondary disk:


    heat_template_version: 2015-04-30

    resources:
      my_server:
        type: OS::Nova::Server
        properties:
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
          flavor: 2 GB General Purpose v1

      cinder_volume:
        type: OS::Cinder::Volume
        properties:
          volume_type: SSD
          size: 50

      volume_attachment:
        type: OS::Cinder::VolumeAttachment
        properties:
          volume_id: { get_resource: cinder_volume }
          instance_uuid: { get_resource: my_server }
          mountpoint: /dev/vdb


The `instance_uuid` property dynamically receives information about a resource, because the UUID of the server that you created is not readily accessible until the server is created. You can use this to send the attachment request.

#### Attach multiple Cloud Block Storage volumes

Use the following template to create several Cloud Block Storage volumes and then attach them to one server by using a resource group. You do not need to have a resource for each CBS volume.


    heat_template_version: 2015-04-30

    resources:
      my_server:
        type: OS::Nova::Server
        properties:
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
          flavor: 2 GB General Purpose v1

      group_of_volumes:
        type: OS::Heat::ResourceGroup
        properties:
          count: 3
          resource_def:
            type: volume_with_attachment.yaml
            properties:
              instance_id: { get_resource: instance }


Each volume requires its own `volume_attachment` resource which requires you to specify a child template, here called `volume_with_attachment.yaml`, in the resource definition. This file can be loaded remotely over HTTP or HTTPS. If you are using the HEAT CLI, then you can use a full path such as `/home/user/heat/volume_with_attachment.yaml`, or a relative path `volume_with_attachment.yaml`.

Use the following example for the `volume_with_attachment.yaml` file:


    heat_template_version: 2015-04-30

    parameters:
      instance_id:
        type: string
        description: Server to attach volume to

    resources:
      volume:
        type: OS::Cinder::Volume
        properties:
          size: 75
          volume_type: SATA
          description: Volume for stack

      volume_attachment:
        type: OS::Cinder::VolumeAttachment
        properties:
          volume_id: { get_resource: volume }
          instance_uuid: { get_param: instance_id }


The  `instance_id` parameter passes from the parent template under property `instance_id: { get_resource: instance }`. No value is defined in the child template because the value (in this case, the server UUID) passes from the parent template to the child template.

#### Create a group of Cloud Block Storage volumes and servers

Use the following template to create one volume per instance, by using the same principles used to attach multiple volumes. In this case, you create a child template called `server_with_volume.yaml`.


    resources:
      my_server_cbs:
        type: OS::Heat::ResourceGroup
        properties:
          count: 5
          resource_def:
            type: servers_with_volume.yaml



Use the following definitions for the child template:


    resources:
      my_volume:
        type: OS::Cinder::Volume
        properties:
          size: 75
          volume_type: SATA

      my_server:
        type: OS::Nova::Server
        properties:
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
          flavor: 2 GB General Purpose v1

      volume_attachment:
        type: OS::Cinder::VolumeAttachment
        properties:
          volume_id: { get_resource: my_volume }
          instance_uuid: { get_resource: my_server }


#### Create a load balancer

Rackspace uses a unique resource type called `Rackspace::Cloud::LoadBalancer` to create cloud load balancers.


    heat_template_version: 2013-05-23

    resources:
      load_balancer:
        type: Rackspace::Cloud::LoadBalancer
        properties:
          name: stack_Load_Balancer
          nodes:
          - addresses: [ 10.181.64.136 ]
            port: 80
            condition: ENABLED  
          port: 80
          protocol: HTTP
          algorithm: ROUND_ROBIN
          contentCaching: ENABLED
          sessionPersistence: HTTP_COOKIE
          virtualIps:
          - type: PUBLIC
            ipVersion: IPV4


`Rackspace::Cloud::LoadBalancer` works similarly to the `my_server` resource, in that where you set the type and its properties. The name of the load balancer is defined, as is the node is behind the load balancer. The IP assigned is a IPv4 public address.

#### Share IP addresses between load balancers

Use the following template to create a load balancer and share that load balancer's IP address with another load balancer. This action is most commonly used for HTTP and HTTPS load balancers. To achieve this in a template, you create your second load balancer and pull in the IP address from the first one by using the `get_attr` parameter.


      load_balancer_2:
        type: Rackspace::Cloud::LoadBalancer
        properties:
          name: stack_Load_Balancer_2
          nodes:
          - addresses: [ 10.181.64.136 ]
            port: 443
            condition: ENABLED  
          port: 443
          protocol: HTTPS
          algorithm: ROUND_ROBIN
          contentCaching: ENABLED
          sessionPersistence: SOURCE_IP
          virtualIps:
          - id: { get_attr: [ load_balancer, virtualIps, 0, id ] }


In this example, an IP address is hard-coded into the load balancer. However, if you are creating nodes in the same template, you would not yet know the IP address for the load balancer. You can compensate for this by using `{ get_attr: [web_server, private_ip] }` which retrieves the private IP address for all the nodes under the `web_server` resource:


      load_balancer_2:
        type: Rackspace::Cloud::LoadBalancer
        properties:
          name: stack_Load_Balancer_2
          nodes:
          - addresses: { get_attr: [web_server, private_ip] }
            port: 443
            condition: ENABLED
          port: 443
          protocol: HTTPS
          algorithm: ROUND_ROBIN
          contentCaching: ENABLED
          sessionPersistence: SOURCE_IP
          virtualIps:
          - id: { get_attr: [ load_balancer, virtualIps, 0, id ] }


#### Use Cloud Networks

Use the following template to orchestrate your deployment with Cloud Networks. Cloud Networks is based on OpenStack Neutron and has three components: the network, the subnet, and the port. Your template must create a network and subnet, and one port per server, as shown in the following example:


    heat_template_version: 2013-05-23

    resources:
      my_network:
        type: OS::Neutron::Net
        properties:
          name: private_net_name

      my_subnet:
        type: OS::Neutron::Subnet
        properties:
          network_id: { get_resource: my_network }
          cidr: 192.168.100.0/24

      my_server_port:
        type: "OS::Neutron::Port"
        properties:
          network_id: { get_resource: my_network }
          fixed_ips:
            - subnet_id: { get_resource: my_subnet }

      my_server:
        type: OS::Nova::Server
        properties:
          name: node
          flavor: 2 GB General Purpose v1
          image: Ubuntu 14.04 LTS (Trusty Tahr) (PVHVM) (Orchestration)
          networks:
            - port: { get_resource: my_server_port }


 This template creates a network called `private_net_name`. The `network_id` property creates one port per server. The `subnet_id` property creates a subnet that is hard-coded with the IP 192.168.134.0/24 and dynamically pulls in the networks UUID. Lastly, `port: { get_resource: my_server_port }` attaches the port to the server called `my_server`.

#### Create a cloud database as a service

Use this example template to create a database as a service (DBaaS) a database, a user for that database, and a database password. The database assignment for the user is a YAML list, so you can give that user access to multiple databases.


    heat_template_version: 2013-05-23

      database:
        type: OS::Trove::Instance
        properties:
          name: db_instance0
          size: 15
          flavor: 2GB Instance
          databases:
          - name: db0
          users:
          - name: db_user
            password: db_password
            databases: [db0]


You specify a password in the template because the password will always be the same. Instead of using a plain text password, you can use Heat to generate a random string of characters of any length, and use that as the password.


    heat_template_version: 2013-05-23

      database:
        type: OS::Trove::Instance
        properties:
          name: db_instance0
          size: 15
          flavor: 2GB Instance
          databases:
          - name: db0
          users:
          - name: db_user
            password: { get_attr: [database_password, value] }
            databases: [db0]

      database_password:
        type: OS::Heat::RandomString
        properties:
          length: 16
          sequence: lettersdigits


#### Create a Cloud Files container

Use the following template to create a Cloud Files container. You specify the Swift resource type, and give the container a name.


    heat_template_version: '2016-10-14'

    resources:
      SwiftContainer:
        type: OS::Swift::Container
        properties:
          name: OrchestrationContainer


You specify the Swift resource type, and give the container a name.

#### Create a domain in Cloud DNS

Use the following template to create a domain in Cloud DNS and create records. Note that this template does not work for existing domains.


    heat_template_version: '2016-10-14'

    resources:
      dns_record:
        type: "Rackspace::Cloud::DNS"
        properties:
          emailAddress: "admin@domain.com"
          name: domain.com
          records: [ {"name": "domain.com", "data": 123.456.78.90 , "type": "A" }, {"name": "www.domain.com", "data": domain.com , "type": "CNAME" } ]


####  Create a cloud queue

Use the following template to create queue a Cloud Queue:


    heat_template_version: 2013-05-23

    resources:
      ZaqarQueue:
        type: OS::Zaqar::Queue
        properties:
          name: OrchestrationCreatedQueue


The `OS::Zaqar::Queue` resource type allows properties to name your queue and add optional metadata for the queue.

#### Use SSH keys

Use the following template if you are using Linux servers and want to use SSH keys:


    heat_template_version: 2013-05-23

    resources:
      KeyPair:
        type: OS::Nova::KeyPair
        properties:
          name: ssh_orchestration_key
          save_private_key: True


The `OS::Nova:KeyPair` resource generates an SSH key pair and places the public key on a server so you can access that server without using passwords.

If you have anymore questions about Cloud Orchestration, contact Rackspace support.
