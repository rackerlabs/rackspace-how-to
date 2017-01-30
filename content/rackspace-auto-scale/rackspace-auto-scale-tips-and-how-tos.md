---
permalink: rackspace-auto-scale-tips-and-how-tos/
audit_date:
title: "Rackspace Auto Scale tips and how-to's"
type: article
created_date: '2014-01-14'
created_by: Maria Abrahms
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

Read the following tips and how-to sections to help you achieve your
goals with Rackspace Auto Scale.

### How Auto Scale works

Rackspace Auto Scale is written in Python and calls the Rackspace Cloud
Servers, Rackspace Cloud Load Balancers, and Rackspace RackConnect v3
APIs. All Rackspace Cloud Server **create server** configuration
parameters can be used with Auto Scale. For more information, see
the [Rackspace Cloud Servers documentation](http://Developer.rackspace.com/).
For technical details, see the public [Auto Scale GitHub
documentation](https://github.com/rackerlabs/otter/tree/master/doc) and
the public [Auto Scale GitHub
Wiki](https://github.com/rackerlabs/otter/wiki).

### Invalid load balancers can prevent scaling

If you create a scaling group with more than one load balancer and one
of the load balancers is invalid (bad configuration), the scaling group
never scales. Auto Scale goes through the following process:

1.  Create servers.
2.  Add them to the load balancers.
3.  Discover that one of the load balancers is invalid.
4.  Delete the servers.
5.  Remove the node from the valid load balancers.

### Delete scaling groups with missing servers

If you have manually deleted servers outside of Auto Scale, and you have existing servers in the group, perform
the following actions:

1.  Update both the **minEntities** and **maxEntities** values to **0.**
2.  Delete the group.

The following example illustrates those steps:

    PUT v1.0/tenantId/groups/groupId/config
    {"maxEntities": 0, "cooldown": 0, "name": "ready_to_be_deleted", "minEntities": 0, "metadata": {}}
    DELETE v1.0/{tenantId}/groups/{groupId}

### ServiceNet dependency can cause server creation to fail

When you configure your Auto Scale scaling group with a load balancer,
you need to include the Rackspace ServiceNet network as part of the
launch configuration. You cannot have only a private network in the
launch configuration.

In a scale-up operation, Auto Scale tries to retrieve the ServiceNet IP
address of the server that it builds to add it to the load balancer.
If ServiceNet is not part of the configuration, this action fails. To
recover from this failure, Auto Scale deletes the server that it built,
which results in no active servers.

Avoid this problem by adding ServiceNet to the list of networks for
the Auto Scale group.

### Connect Auto Scale to a single Tsvld[svr] monitoring alarm


This tip shows you how to use a webhook to trigger an Auto Scale policy.
It does not explain how to create a check or an Auto Scale group.  For
information about creating checks and alarms, see the *[Rackspace Monitoring
Developer
Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/)*
or the [Rackspace Monitoring Checks and
Alarms](/how-to/rackspace-monitoring-checks-and-alarms)
article.

Modify the example values used for the configurations to meet your
needs. These values use the Auto Scale API to first create a webhook
policy with a desired capacity of 5 servers and a cooldown of 3 minutes,
and then create a webhook named Rackspace Monitoring. In steps 3, 4, and 5,
you use the Rackspace Monitoring API to create a notification by using the
webhook URL created in step 2, a notification plan by using the webhook
ID created in step 3, and an alarm that uses the notification plan
created in step 4. All of these steps, except creating the webhook, can
be done through the [Rackspace
Intelligence](https://intelligence.rackspace.com/) UI.

1.  Create a webhook policy.

        POST/autoscale: v1.0//groups//policies
        [
        {
        "name": "set group to 5 servers",
        "desiredCapacity": 5,
        "cooldown": 1800,
        "type": "webhook"
        }
        }

2.  Create a webhook for Rackspace Monitoring under the webhook policy.

        POST/autoscale: v1.0//groups/policies//webhooks
        [
        {
        "metadata": {},
        "name": "Rackspace Monitoring"
        }
        ]

3.  Create a Rackspace Monitoring notification.

        POST/monitoring: /notifications
        {
        "label": "AutoScale",
        "type": "webhook",
        "details": {
        "url": <webhook_URL_from_AutoScale>
        }
        }

4.  Create a Rackspace Monitoring notification plan.

        POST/monitoring: /notification_plans
        {
        "label": "Notification Plan 1",
        "critical_state": [
        <notification_ID_from_AutoScale>"
        ],

        "warning_state": [
        ],
        }
        "ok_state": [
        ]
        }

5.  Create an alarm in Rackspace Monitoring.

        POST/monitoring: /entities//alarms
        '{
        "check_id": "<check_you_want_to_use>",
        "criteria": "<criteria_you_want_to_use>",
        "notification_plan_id": "<notification_plan_you_just_created>"
        }

### How to add or remove servers quickly


To quickly add servers to or remove servers from a scaling group, send a
request to change the value of the **minEntities** or **maxEntities**
parameter, as documented in the [Update scaling group
configuration](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#update-scaling-group-configuration)
section of the *Rackspace Auto Scale API Developer* *Guide.*

Following is an example request:

    PUT //groups//config
    { "name": "workers",
    "cooldown": 60,
    "minEntities": 5,
    "maxEntities": 100,
    "metadata": {
    "firstkey": "this is a string",
    "secondkey": "1", }
    }

You can remove a specific server from a scaling group by using the
delete server operation. For more information, see the [Delete server
from scaling
group](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#delete-server-from-scaling-group)
section of the *Rackspace Auto Scale API Developer Guide.*

### maxEntities and minEntities settings affect scaling


If the number of active servers (desired capacity) in a scaling group is
equal to the configured **maxEntities** value during a scale-up, or
equal to the configured **minEntities** value during a scale-down, the
call to execute the scaling policy returns a `400 Bad Request` error
response code with the message `No change in servers`.

If the number of active servers in a scaling group is less than
the **maxEntities** value, the call to execute a scale-up policy returns
a `200 OK` response code and increases the number of servers to
the **maxEntities** value or the amount specified.

If the number of active servers in a scaling group is greater than
the **minEntities** value, the call to execute a scale-down policy
returns a `200 OK` response code and reduces the number of servers to
the **minEntities** value or the amount specified.

**Note**: You can change the **minEntities** and **maxEntities** values
for a scaling group by using the [Cloud Control
Panel](https://mycloud.rackspace.com/). To do this, select **Auto
Scale** from the **Servers** menu, select the scaling group, and
then, from the **Actions** menu, select **Edit Min / Max Servers**.

### Create and update the launch configuration setting


All Auto Scale API update requests completely replace all of the
settings of the item being updated. Any parameters that are not
specified in the update request are reset to null or to the default
value. All requests, except update launch configuration operation,
validate that all required fields are provided. A failed launch
configuration update returns a `400 error response` code. The following
examples show how to create and update a launch configuration setting.
Creating uses a POST operation, updating uses a PUT operation.

**Note**: Each user can have multiple SSH key pairs (name and key). The
launch configuration uses the admin user's SSH key pair name, usually
the first admin user found in the tenant. If there are multiple admin
accounts in the tenant, there is no guarantee as to which one is used.
So it is best for there to be one admin user in the tenant. This
restriction cannot be changed currently. There is no option to specify a
user to impersonate.

### Create a scaling group with the launch configuration setting

This example creates a scaling group with load balancers, server
metadata, networks, and personality.

    POST /<tenant_id>/groups
    {
    "launchConfiguration": {
    "args": {
    "loadBalancers": [
    {
    "port": 8080,
    "loadBalancerId": 9099
    }
    ],
    "server": {
    "name": "autoscale_server",
    "imageRef": "0d589460-f177-4b0f-81c1-8ab8903ac7d8",
    "flavorRef": "performance1-2",
    OS-DCF:diskConfig": "AUTO",
    "metadata": {
    "build_config": "core",
    "meta_key_1": "meta_value_1",
    "meta_key_2": "meta_value_2"
    },
    "networks": [
    {
    "uuid": "11111111-1111-1111-1111-111111111111"
    },
    ],
    "uuid": "00000000-0000-0000-0000-000000000000"
    "personality": [
    {
    "path": "/root/.csivh",
    "contents": "VGhpcyBpcyBhIHRlc3QgZmlsZS4="
    }
    ]
    }
    },
    "type": "launch_server"
    },
    "groupConfiguration": {
    "maxEntities": 10,
    "cooldown": 360,
    "name": "testscalinggroup198547",
    "minEntities": 0,
    "metadata": {
    "gc_meta_key_2": "gc_meta_value_2",
    "gc_meta_key_1": "gc_meta_value_1"
    }
    },
    "scalingPolicies": [
    {
    "cooldown": 0,
    "type": "webhook",
    "name": "scale up by 1",
    <"change": 1
    }
    ]
    }

### Update the launch configuration setting successfully

This example shows how to update only the **flavorRef** and **name**
parameters without the remaining fields, and a successful 204 response
code. Note that the update operation overwrites all
launch configuration parameters. Any parameters not specified in
the update are reset to null or the default value.

    PUT /<tenant_id>/groups/<group_id>/launch
    {<
    "type": "launch_server",
    "args": {
    "server": {
    "flavorRef": performance1-4,
    "name": "update_launch_config",
    "imageRef": "0d589460-f177-4b0f-81c1-8ab8903ac7d8"
    }}

Retrieve the launch configuration response. The load balancers, server's
metadata, personality, and networks are overwritten because of the
preceding update.

    GET /{tenant_id}/groups/{group_id}/launch (The load balancers, server's metadata, personality, and networks, are overwritten due to no load balancer, server metadata, personality, or networks, parameters being included in the update request)
    {
    "type": "launch_server",
    "args": {
    "server": {
    "flavorRef": performance1-4,
    "name": "update_launch_config",
    "imageRef": "0d589460-f177-4b0f-81c1-8ab8903ac7d8"
    }}}

### Update the launch configuration eviction policy

When a launch configuration setting is updated, the servers that scale
up after the update use the latest launch configuration settings.

A scale-down that occurs after the launch configuration setting has been
updated first deletes servers with the older launch configuration
setting. The only exception to this is when servers are building. Auto
Scale attempts to first delete servers being built (pending) in a
scale-down policy execution, then servers with the older launch
configuration setting, and lastly any other servers required by the
scale-down policy.

### Delete servers


Deleting servers requires an Auto Scale Python call to the Rackspace
Cloud Servers Nova-based API, and there are a few things about this
process that it is good to understand. Additionally, new functionality
has been added to allow you to delete a specific server from a scaling
group. These topics are discussed in this section.

### About the server "Active" state when deleting servers

When a scale-down policy is being executed, servers in the **Active**
state are deleted immediately because Nova, the software
behind Rackspace Cloud Servers, is aware of those servers. Auto Scale
issues deletes for Pending servers first, but Nova executes deletes for
Active servers first. This is why, for a time, you might see servers in
the Control Panel that you have deleted; the inter-programming
communication and executions cause a lag. For example, if a scale-up
policy is executing to build five servers and, while the servers are
still building, a scale-down policy executes to scale down by two
servers, you might see five servers in the Control Panel until they are
all done building and go into the Active state, immediately after which
two servers will be deleted.

### Delete a specific server from a scaling group

You can remove a specific server from a scaling group by using the
delete server operation. For more information, see the [Delete server
from scaling
group](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#delete-server-from-scaling-group)
section *Rackspace Auto Scale API Developer Guide.*

###Choose the flavor of a server for a scaling group

If you create an image of a server and use that image to create a
scaling group, you must choose a flavor in the scaling group that is
equal to, or greater than, the capacity of the flavor of the server from
which the image was created. For more information about available server
flavors, see
[Flavors](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#flavors)
in the Cloud Servers API documentation.

### Cloud bursting with Auto Scale and RackConnect


Auto Scale and RackConnect allow bursting into the public cloud from
events in a dedicated environment. RackConnect is provisioned by setting
a metadata flag for a RackConnect group in the Auto Scale launch
configuration `metadata` section (see the following example). When that
section is set properly, and Auto Scale scales up a group, the new
server will be modified by RackConnect to have its public interface
disabled and will begin receiving Private Cloud traffic from the
RackConnect load balancer. The following KC article describes this
process in detail: [Cloud Bursting using Auto Scale RackConnect and F5
Load
Balancers](/how-to/cloud-bursting-using-auto-scale-rackconnect-and-f5-load-balancers).

Example RackConnect metadata key and value pair for Auto Scale:

    "metadata": {
    "RackConnectLBPool": "MyRCPoolName"
    }

### Use Auto Scale to change the size of your General Purpose or work-optimized server

General Purpose and work-optimized servers do not resize as simply as Standard servers. You have to go through a process
to resize, detailed in [Upgrading resources for General Purpose or I/O
optimized Cloud
Servers](/how-to/upgrading-resources-for-general-purpose-or-io-optimized-cloud-servers), in
order to resize, and your server does not keep its IP address. You can
use Auto Scale to accomplish server resizing, keeping your IP address,
and have it happen dynamically in response to load. You pay for the
higher-flavor servers (for example, General Purpose and
work-optimized) only when you need them, and when you don't need them,
you can scale back down to lower-flavor servers (for example, Standard) - or keep the higher-flavor servers and
just scale back how many servers are in your group.

When you're ready to set up your scaling system to resize servers
dynamically, use the following guidelines.

1.  Create two scaling groups: one with a lower flavor for the server
    setting in the **launchConfiguration** option, and another with
    higher flavor server setting in the **launchConfiguration** option.
    Configure both scaling groups with same image and load balancer.

2.  Create two policies for each scaling group:

      * One policy with **desiredCapacity**=0

      * One with **desiredCapacity**=2 or 3  (that is, scale up by 2
    or 3)

When you want a higher-flavor server, execute the scale-up policy on
with the higher-flavor scaling group and the **desiredCapacity=0**
policy on the lower-flavor group. Do the opposite when switching from a
higher flavor to a lower flavor.

This technique works well for single-server deployments. In fact, for
smaller deployments, the scale-up policy might just be +1 instead of 2
or 3.

One disadvantage of this technique is being charged for a load balancer
when you don't really need it. However, that cost should be offset by
the scaling down, using lower-flavor (and less expensive) servers when
the load is lighter.
