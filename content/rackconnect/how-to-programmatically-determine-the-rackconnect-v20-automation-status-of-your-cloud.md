---
node_id: 3071
title: Programmatically determine the RackConnect v2.0 Automation status of your cloud servers
type: article
created_date: '2012-10-02'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v2.0

Programmatically querying the RackConnect Automation status of your
cloud servers can help you determine when a new cloud server build has
completed the RackConnect Automation process and is fully deployed
with RackConnect. RackConnect Automation status and enabled features can
be determined programmatically by using the RackConnect API or the Cloud
Servers API.

### Using the RackConnect API

The RackConnect API can be used to query RackConnect Automation status
from any of your cloud servers. It also allows you to query the
RackConnect Gateway IP, Automation Status, Automation Status Details,
and the Automation Features. If you want to use the
RackConnect API, see [The RackConnect v2.0 API](/how-to/the-rackconnect-v20-api) for more details.

### Using the Next Generation Cloud Servers API to query your cloud servers' metadata

You can also use the Cloud Servers API to query the RackConnect
Automation status of your cloud servers. The benefits of using this
method are that you do not need to query the status from within the same
server you want the status of.

To use this method, query
the Cloud Servers API and look for the metadata key named
`"rackconnect_automation_status"` on any of your cloud servers. The
value of this metadata key will be the
current automation status of your cloud server in RackConnect (accurate
within a few seconds after each change). The automation status is one of the following values: DEPLOYING, DEPLOYED, FAILED, or UNPROCESSABLE.

The ``"metadata"``entries also show what RackConnect Automation Features are
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

#### Obtaining the metadata information via the Next Generation Cloud Servers API (examples)

**Authenticate and obtain an authentication token**

You first need to authenticate and obtain an authentication token. The
following cURL command is one way of accomplishing this. You need
to enter the command with your Rackspace Cloud account's password and
username credentials for `<cloudUserName>` and `<cloudPassword>`:

    curl \
    -s https://identity.api.rackspacecloud.com/v2.0/tokens \
    -X 'POST' -d '{"auth":{"passwordCredentials":{"username":"<cloudUserName>", "password":"<cloudPassword>"}}}' \
    -H "Content-Type: application/json" \
    | python -m json.tool

**Note:** The backslashes (\\) at the end of each line are optional and are
    primarily there to improve readability (they basically mean that you
    are going to continue with this single command on the next line).
    You can place all the lines from a cURL command on a single line.

The results of running this query display a ``"token"`` section, and
you need to copy the ``"id"`` value in that section. The authentication token will look as follows:

    "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"

**Show details for a standard or workload-optimized cloud server to view
the "metadata" values**

Using the authentication token, you can query a cloud server's details, in order
to view the RackConnect metadata keys related to RackConnect. The
following cURL command is one way of accomplishing this. You need
to enter the command with your Cloud account's number, the server ID of
the server you want to query, and the token you obtained in the
previous step. Enter these values for ``<cloudAccountNumber>``, ``<serverID>``, and `xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx`.

    curl \
    -s https://ord.servers.api.rackspacecloud.com/v2/<cloudAccountNumber>/servers/<serverID> \
    -H "X-Auth-Token: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx" \
    | python -m json.tool

**Note**: Do not include the &lt; &gt; brackets when entering your
values.

This is just a brief introduction to get you started on using the Cloud
Servers API to query the RackConnect statuses of your servers. If
you need more information about the Cloud Servers API, see the [Cloud Servers API documentation](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/).

### Using the First Generation Cloud Servers API to query your cloud servers' metadata

You can also use the First Generation Cloud Servers API to query the
RackConnect Automation atatus of First Generation Cloud Servers. The
benefits of using this method are that you do not need to query the
status from within the same server you want the status of.

To use this method, query the First-Generation Cloud Servers API and
look for the metadata key named ``"rackconnect_automation_status"`` on
any of your First Generation Cloud Servers. The value of this metadata key will be the current automation status of your Cloud Server in RackConnect (accurate within a few seconds after each change). The automation status has one of the following values: DEPLOYING, DEPLOYED, or FAILED.

The ``"metadata"`` entries also
show what RackConnect Automation Features are currently enabled on your
account and consist of the following keys:

- ``"rackconnect_automation_feature_configure_network_stack"``
- ``"rackconnect_automation_feature_manage_software_firewall"``
- ``"rackconnect_automation_feature_provison_public_ip"``

Following is an example of the metadata keys/values now available for
RackConnect:

    "metadata":{
    "rackconnect_automation_feature_configure_network_stack":"ENABLED",
    "rackconnect_automation_status":"DEPLOYED",
    "rackconnect_automation_feature_provison_public_ip":"ENABLED",
    "rackconnect_automation_feature_manage_software_firewall":"ENABLED"
    }

#### Obtaining the metadata information via the First Generation Cloud Servers API (examples)

**Authenticate and obtain an authentication token**

You first need to authenticate and obtain an authentication token. The
following cURL command is one way of accomplishing this. You need
to enter the command with your Rackspace Cloud account's API key and
username credentials for `<apiKey>` and `<username>`.

    curl -D - -k -H "X-Auth-Key: <apiKey>" -H "X-Auth-User: <username>" https://auth.api.rackspacecloud.com/v1.0

The results from running this query display a `"X-Auth-Token:"`
entry, and you need to copy the value associated with this entry.
The `"X-Auth-Token:"` entry looks as follows:

    X-Auth-Token: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX

For information about how to find your API key, see [View and reset your
API key](/how-to/view-and-reset-your-api-key).

**Show details for a Cloud Server to view the "metadata" values**

Using the X-Auth-Token, you can now query a cloud server's details, in
order to view the metadata keys/values associated with RackConnect. The
following cURL command is one way of accomplishing this. You need
to enter the command with your Cloud Account's number, the server ID of
the server you want to query, and the X-Auth-Token value that you obtained in the
previous step. Enter these values for
`XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX`, `<cloudAccountNumber>`, and
`<serverID>`.

    curl -k -X GET -D - -H "X-Auth-Token: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" https://servers.api.rackspacecloud.com/v1.0/<cloudAccountNumber>/servers/<serverID>

**Note**: Do not include the &lt; &gt; brackets when entering your Cloud
Account's values.

This is just a brief introduction to get you started on using the First
Generation Cloud Servers API to query the RackConnect statuses of your
cloud servers. If you require further information on the Cloud Servers
API, see the [First Generation Cloud Servers API documentation](http://docs.rackspace.com/servers/api/v1.0/cs-devguide/content/API_Operations-d1e1720.html).

### Determining when the Managed Operations post-build automation process is complete

As part of an effort to improve your experience with RackConnect, we
made an automation change that affects RackConnect customers with the
Managed Operations service level. This change is transparent for the
majority of customers&mdash;including those using the MyRackspace Portal or
the Cloud Control Panel to provision servers&mdash;but might require changes
for any customers who performed automated processes or configuration on
their servers immediately after the RackConnect Automation completed.

#### When is this change going to take place?
This change has already been implemented.

#### What was changed?
For RackConnect customers with the Managed Operations service level,
there are two distinct automation routines that run after a cloud server
is built. Previously, automation for Managed Operations ran first,
followed by RackConnect Automation. We reversed the order of automation
so that RackConnect runs first.

#### Why was this change made?
We determined that we can reduce post-build automation failures and
improve your RackConnect experience by making this change. By allowing
RackConnect Automation to run first, we can more quickly and more
reliably deliver a RackConnect cloud server to you.

#### Who does this affect?
This change affected all RackConnect customers with the Managed
Operations service level.

For the limited set of customers who leverage their own configuration
management scripts, please note that RackConnect Automation runs first,
followed by Managed Operations automation. We recommend that you
adjust your post-build configuration management to note when Managed
Operations automation is complete; this will be the new trigger to start
any post-build configuration tasks you want to run.

#### How can I tell when Managed Operations post-build automation is complete?

For Windows cloud servers, upon successful completion, the following file is created:

    C:\windows\temp\rs_managed_cloud_automation_complete.txt

For Linux cloud servers, upon successful completion, the following file is created:

    /tmp/rs_managed_cloud_automation_complete

#### Can I get the Managed Operations post-build automation status via the Cloud Servers API

For standard and workload-optimized cloud servers only, you can also
obtain the Managed Operations post-build automation status via the Cloud
Servers API.

To accomplish this, you follow the same process described in the "Obtaining the metadata information via the Cloud Servers API (examples)" section, but this time, you find the metadata key value `"rax_service_level_automation"`. This metadata key will have a value of Pending, In Progress, Complete, Build Error, or Authentication Error, depending on the current status of the Managed Cloud post-build automation process.

#### Who can I contact if I have any questions?
If you have any questions about RackConnect, Managed Operations, or
this change, contact your Rackspace Support team.
