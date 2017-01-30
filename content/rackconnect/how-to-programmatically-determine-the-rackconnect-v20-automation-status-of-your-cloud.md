---
permalink: how-to-programmatically-determine-the-rackconnect-v20-automation-status-of-your-cloud/
audit_date:
title: Programmatically determine the RackConnect v2.0 Automation status of your cloud servers
type: article
created_date: '2012-10-02'
created_by: Juan Perez
last_modified_date: '2016-09-13'
last_modified_by: Kyle Laffoon
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

Programmatically querying the RackConnect Automation status of your cloud servers can help you determine when a new cloud server build has
completed the RackConnect Automation process and is fully deployed with RackConnect. You can programmatically determine RackConnect Automation status and enabled features by using the RackConnect API or the Cloud Servers API.

### Using the RackConnect API

You can use the RackConnect API to query RackConnect Automation status
from any of your cloud servers. You can also use it to query the
RackConnect Gateway IP, automation status, automation status details,
and the automation features. If you want to use the
RackConnect API, see [RackConnect v2.0 API](/how-to/the-rackconnect-v20-api) for more details.

### Using the Cloud Servers API to query your cloud servers’ metadata

You can also use the Cloud Servers API to query the RackConnect
Automation status of your cloud servers. The benefit of using this
method is that you do not need to query the status from the same
server you want the status of.

To use this method, query
the Cloud Servers API and look for the metadata key named
`"rackconnect_automation_status"` on any of your cloud servers. The
value of this metadata key is the
current automation status of your cloud server in RackConnect (accurate
within a few seconds after each change). The automation status is one of the following values: DEPLOYING, DEPLOYED, FAILED, or UNPROCESSABLE.

The ``"metadata"``entries also show what RackConnect Automation features are
currently enabled on your account and consist of the following keys:

- ``"rackconnect_automation_feature_configure_network_stack"``
- ``"rackconnect_automation_feature_manage_software_firewall"``
- ``"rackconnect_automation_feature_provison_public_ip"``

Following is an example of the metadata keys/values now available for
RackConnect:

    "metadata": {
    "rackconnect_automation_feature_configure_network_stack": "ENABLED",
    "rackconnect_automation_feature_manage_software_firewall": "ENABLED",
    "rackconnect_automation_feature_provison_public_ip": "ENABLED",
    "rackconnect_automation_status": "DEPLOYED"
    },

**Note**: The UNPROCESSABLE status normally occurs when you build a
cloud server in a region that does not match your RackConnect
configuration region.

#### Obtaining the metadata information via the Cloud Servers API (examples)

**Authenticate and obtain an authentication token**

You first need to authenticate and obtain an authentication token. The
following cURL command is one way of accomplishing this. You need
to enter the command with your Rackspace cloud account's password and
username credentials for `<cloudUsername>` and `<cloudPassword>`:

    curl \
    -s https://identity.api.rackspacecloud.com/v2.0/tokens \
    -X 'POST' -d '{"auth":{"passwordCredentials":{"username":"<cloudUsername>", "password":"<cloudPassword>"}}}' \
    -H "Content-Type: application/json" \
    | python -m json.tool

**Note:** The backslashes (\\) at the end of each line are optional and are
    primarily there to improve readability (they basically mean that you
    are going to continue with this single command on the next line).
    You can place all the lines of a cURL command on a single line.

The results of running this query display a ``"token"`` section, and
you need to copy the ``"id"`` value in that section. The authentication token will look as follows:

    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"

**Show details for a standard or workload-optimized cloud server to view
the "metadata" values**

Using the authentication token, you can query a cloud server's details
to view the RackConnect metadata keys related to RackConnect. The
following cURL command is one way of accomplishing this. You need
to enter the command with your cloud account's number, the server ID of
the server you want to query, and the token you obtained in the
preceding step. Enter these values for ``<cloudAccountNumber>``, ``<serverID>``, and `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx`.

    curl \
    -s https://ord.servers.api.rackspacecloud.com/v2/<cloudAccountNumber>/servers/<serverID> \
    -H "X-Auth-Token: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx" \
    | python -m json.tool

**Note**: Do not include the &lt; &gt; brackets when entering these values.

This is just a brief introduction to get you started on using the Cloud
Servers API to query the RackConnect statuses of your servers. If
you need more information about the Cloud Servers API, see the [Cloud Servers API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/).

### Determining when the Managed Operations post-build automation process is complete

To improve your experience with RackConnect, we
made an automation change that affects RackConnect customers with the
Managed Operations service level. This change is transparent for the
majority of customers&mdash;including those using the MyRackspace portal or
the Cloud Control Panel to provision servers&mdash;but might require changes
for any customers who performed automated processes or configuration on
their servers immediately after the RackConnect Automation completed.

#### What was changed?
For RackConnect customers with the Managed Operations service level,
there are two distinct automation routines that run after a cloud server
is built. Previously, automation for Managed Operations ran first,
followed by RackConnect Automation. We reversed the order of automation
so that RackConnect runs first.

#### Why was this change made?
We determined that this change could reduce post-build automation failures and
improve your RackConnect experience. By allowing
RackConnect Automation to run first, we can more quickly and more
reliably deliver a RackConnect cloud server to you.

#### Who does this affect?
This change affects all RackConnect customers with the Managed
Operations service level.

For the limited set of customers who leverage their own configuration
management scripts, note that RackConnect Automation runs first,
followed by Managed Operations automation. We recommend that you
adjust your post-build configuration management to note when Managed
Operations automation is complete; this will be the new trigger to start
any post-build configuration tasks that you want to run.

#### How can I tell when Managed Operations post-build automation is complete?

For Windows cloud servers, the following file is created when post-build automation is complete:

`C:\windows\temp\rs_managed_cloud_automation_complete.txt`

For Linux cloud servers, the following file is created when post-build automation is complete:

`/tmp/rs_managed_cloud_automation_complete`

#### Can I get the Managed Operations post-build automation status via the Cloud Servers API

For standard and workload-optimized cloud servers only, you can also
obtain the Managed Operations post-build automation status via the Cloud
Servers API.

To accomplish this, you follow the same process described in the "Obtaining the metadata information via the Cloud Servers API (examples)" section, but this time, you find the metadata key value `"rax_service_level_automation"`. This metadata key will have a value of Pending, In Progress, Complete, Build Error, or Authentication Error, depending on the current status of the Managed Operations post-build automation process.

If you have any questions about RackConnect, Managed Operations, or this change, contact your Rackspace Support team.
