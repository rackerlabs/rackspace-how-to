---
node_id: 4231
title: Getting started with the RackConnect v3.0 API
type: article
created_date: '2014-09-10'
created_by: Juan Perez
last_modified_date: '2016-01-21'
last_modified_by: Kelly Holcomb
product: RackConnect
product_url: rackconnect
---

**Applies to**: RackConnect v3.0

RackConnect v3.0 includes a new enhanced API that enables you to
seamlessly add and remove cloud servers from your load balancer pools,
add and remove public IP addresses from your cloud servers, and list
cloud networks associated with your RackConnect v3.0 configuration.
Additionally, RackConnect v3.0 no longer uses the Cloud Servers API
metadata options that were necessary to accomplish certain tasks with
RackConnect v2.0.

**Note:** To view the full range of API operations available with the
RackConnect v3.0 API, including sample requests and responses, visit the
official [RackConnect v3.0 Public API reference
documentation](http://docs.rcv3.apiary.io/) site. This site displays
code samples for the RackConnect v3.0 API calls in multiple languages.


<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/RCv3_apiary_show_code_sample.png" alt="RackConnect v3.0 apiary show code sample" width="700" />

To help you take full advantage of the RackConnect v3.0 API, this
article walks you through the process of using the API to add and remove
public IP addresses from your RackConnect v3.0 cloud servers. As you go
through this example, remember that these public IP addresses are being
allocated out of your *dedicated* environment's assigned public IP
blocks. Also, after your RackConnect v3.0 cloud servers are built and
active, you can use the RackConnect v3.0 API to add and remove public IP
addresses from them at any time.

**Note:** This walkthrough uses cURL commands to make the API calls.
cURL is installed by default on many Linux distributions. If it is not
already installed on your computer, you can download and install it &mdash;
versions are available for most operating systems.

### Use Cloud Identity to obtain an authentication token

The first step is to obtain a valid authentication token ID number for
your RackConnect v3.0-enabled cloud account from the Rackspace Cloud
Identity Service API. This authentication token is required for all
RackConnect v3.0 API operations. Your authentication token ID is how the
RackConnect v3.0 API validates that you have access to make API calls
against your RackConnect v3.0 environment.

Your authentication token ID is sent within an `X-Auth-Token` header in
your API calls. Details about obtaining your authentication token ID are
located in the "Quick Start" section of the [Cloud Identity Client
Developer
Guide](https://developer.rackspace.com/docs/cloud-identity/v2/developer-guide/).

You can use either one of the following combinations of credentials to
obtain your authentication token ID:

-   Your Rackspace Cloud account user name and API key. (For information
    about how to find your API key, see [View and reset your API
    key](/how-to/view-and-reset-your-api-key).)
-   Your Rackspace Cloud account user name and password.

Insert your cloud account's values in the following requests where
placeholders are shown. For example, if your cloud account's user name
is ExampleCloudAccountUserName, replace the ``<yourUserName>``
placeholder in the requests with ``"ExampleCloudAccountUserName"`` (be sure
to retain the quotation marks).

#### Cloud Identity Service request for an auth token ID using your cloud account's API key

    $ curl \
    --request POST \
    --header "Content-Type: application/json" \
    --data '{ "auth": { "RAX-KSKEY:apiKeyCredentials": { "username":"<yourUserName>", "apiKey":"<yourAPIKey>" } } }' \
    https://identity.api.rackspacecloud.com/v2.0/tokens \
    | python -m json.tool

#### Cloud Identity Service request for an authentication token ID using your cloud account's password

    $ curl \
    --request POST \
    --header "Content-Type: application/json" \
    --data '{ "auth": { "passwordCredentials": { "username":"<yourUserName>", "password":"<yourPassword>" } } }' \
    https://identity.api.rackspacecloud.com/v2.0/tokens \
    | python -m json.tool

Note the following important points about the preceding API requests:

-   The backslashes (\\) at the end of each line are optional and are
    primarily there to improve readability (they basically mean that you
    are going to continue with this single command on the next line).
    You can place all the lines from a cURL command on a single line.
-   The final line of ``| python -m json.tool`` is also optional, but it
    does help to improve the readability of the JSON responses. It also
    requires that Python be installed on the system from which you are
    making the API calls. If you do not have Python installed, you can
    safely remove the final line.
-   The examples use the Cloud Identity Service API US endpoint of
    ``https://identity.api.rackspacecloud.com/v2.0/``, but if your
    RackConnect v3.0 environment and cloud account are located in the
    LON region, you should use the UK endpoint
    of ``https://lon.identity.api.rackspacecloud.com/v2.0/``.

The API calls return JSON responses similar to the following example,
and you should copy the authentication token ID value returned in the
``access:token:id`` section and the tenant ID value listed in the
`access:token:tenant:id` section. The authentication token ID consists
of 32 alphanumeric characters, while the tenant ID consists of a series
of numeric values. You need these values when you make RackConnect v3.0
API calls.

#### Example JSON response to a Cloud Identity Service request

    { "access":
    ...
    ...
    ...
            "token": {
                "RAX-AUTH:authenticatedBy": [
                    "APIKEY"
                ],
                "expires": "2014-09-11T13:30:01.894Z",
                "id": "NNNaaNNaNNaaaaNNaNaNNNNaaNaNaaaa",
                "tenant": {
                    "id": "NNNNNNN",
                    "name": "NNNNNNN"
                }
    ...
    ...
    ...

### Manage IP addresses using the API

Now that you have the RackConnect v3.0 cloud account's authentication
token ID and tenant ID, you can make your first RackConnect v3.0 API
call. The API endpoint takes the following form, and you must replace
the ``<region>`` and ``<tenantID>`` placeholders with the region where your cloud servers are located and your cloud account's tenant ID number.

#### RackConnect v3.0 endpoint

    https://<region>.rackconnect.api.rackspacecloud.com/v3/<tenantId>/

Using the authentication token ID that you previously gathered, you can
now list the public IP address currently assigned to your RackConnect
v3.0 cloud server with the following request:

#### List public IP address for a cloud server API request

    curl --include \
    --request GET \
    --header "X-Auth-Token: authTokenId" \
    --header "Content-Type: application/json" \
    https://region.rackconnect.api.rackspacecloud.com/v3/tenantId/public_ips?cloud_server_id=serverUuid

Note the following important points:

-   You can obtain the UUID (universally unique identifier) of your
    cloud server from within its server details page in the [Cloud
    Control Panel](https://mycloud.rackspace.com) or via the [Cloud
    Servers API&mdash;Get Server   Details](https://developer.rackspace.com/docs/cloud-servers/v2/developer-guide/#show-server-details)
    operation. The UUID is a 32-character entry with four hyphens in the
    **ID** or **id** section of the server details page.
-   The ``--include`` option is used so that the HTTP response status code
    will be displayed in the response. Status code 200 should be
    returned upon a successful request of this operation. If a cloud
    server does not have a public IP address, the operation does not
    return any JSON data. When no JSON data is returned, the ``| python -m
    json.tool`` option used in previous operations does not work because
    there is no data for it to process. In such cases, you can use the
    ``--include`` option to verify that a proper response code was
    received for the call.
-   In an operation, use only the ``--include`` option or the ``| python -m
    json.tool`` option. Use only one of these options in a single
    operation to avoid errors.

The following example response is the type of response you would see if
the cloud server has a public IP address assigned to it already. In the
example, the public IP address assigned to the cloud server and the UUID
associated with this public IP address are highlighted.

#### Example response from list public IP address for a cloud server API request

    [
        {
            "cloud_server": {
                "cloud_network": {
                    "created": "2014-04-24T19:03:40.887",
                    "id": "NNNNNNNa-Naaa-NaNN-aNaN-NNNaaNaNaNNN",
                    "name": "RC-CLOUD-NETWORK",
                    "private_ip_v4": "192.0.2.11",
                    "updated": "2014-04-24T19:06:55.393"
                },
                "created": "2014-09-12T13:26:54.153",
                "id": "aaaNNNNNa-aaaa-NNNN-aNaN-aNNaaNaNaNaa",
                "name": "rc-cloud-server",
                "updated": "2014-09-12T13:26:54.45"
            },
            "created": "2014-09-12T14:24:58.713",
            "id": "NaNaNNNaa-NaNa-aNaN-aNaN-NaNaNNaaaaNa",
            "public_ip_v4": "203.0.113.102",
            "status": "ACTIVE",
            "updated": "2014-09-12T14:25:07.783"
        }
    ]

### Add a public IP address using the API

Use the following operation to add a public IP address to your
RackConnect v3.0 cloud server.

#### Add or provision a public IP address to a cloud server API request

    curl \
    --request POST \
    --header "X-Auth-Token: authTokenId" \
    --header "Content-Type: application/json" \
    --data '{ "cloud_server": { "id": "serverUuid" } }' \
    https://region.rackconnect.api.rackspacecloud.com/v3/tenantId/public_ips \
    | python -m json.tool

Following is an example of the type of response expected after sending
the preceding request.

#### Example response to the add or provision a public IP address to a cloud server API request

    {
        "cloud_server": {
            "cloud_network": {
                "created": "2014-04-24T19:03:40.887",
                "id": "NNNNNNNa-Naaa-NaNN-aNaN-NNNaaNaNaNNN",
                "name": "RC-CLOUD-NETWORK",
                "private_ip_v4": "192.0.2.11",
                "updated": "2014-04-24T19:06:55.393"
            },
            "created": "2014-09-12T13:26:54.153",
            "id": "aaaNNNNNa-aaaa-NNNN-aNaN-aNNaaNaNaNaa",
            "name": "rc-cloud-server",
            "updated": "2014-09-12T13:26:54.45"
        },
        "created": "2014-09-12T14:24:58.713",
        "id": "NaNaNNNaa-NaNa-aNaN-aNaN-NaNaNNaaaaNa",
        "public_ip_v4": null,
        "status": "ADDING",
        "updated": null
    }

When you run this operation, the `public_ip_v4` address initially
returns a value of `null`. This value is returned because the
RackConnect v3.0 API does not have enough time to allocate a public IP
address to the cloud server before returning the response. To see the
public IP address that is ultimately assigned to the cloud server, you
can run the operation to list the public IP address for a cloud
server described previously.

### Remove a public IP address using the API

Use the following operation to remove a public IP address from a cloud
server.

#### Remove a public IP address from a cloud server API request

    curl --include \
    --request DELETE \
    --header "X-Auth-Token: authTokenId" \
    --header "Content-Type: application/json" \
    https://region.rackconnect.api.rackspacecloud.com/v3/tenantId/public_ips/serverPublicIPv4Uuid

When removing a public IP address, you have to provide the cloud
server's public IP v4 UUID. This value was listed as the `id` entry just
above the `public_ip_v4` entry in the operations to list and add
public IP addresses. This UUID is a 32-character entry with four
hyphens, and in the preceding example operations it was listed as
`NaNaNNNaa-NaNa-aNaN-aNaN-NaNaNNaaaaNa`. This call does not return any
JSON data&mdash;only an HTTP response code&mdash;so you use the ``--include`` option with the request. A 204 response code signifies that the public IP
address was successfully removed from the cloud server.

#### Example 204 response to the remove a public IP address from a cloud server API request

    HTTP/1.1 204 No Content
    Server: Apache-Coyote/1.1
    cache-control: no-cache
    via: 1.1 Repose (Repose/3.0.1)
    expires: -1
    date: Thu, 13 Sep 2014 14:48:58 GMT
    pragma: no-cache

### Examples with sample data

The preceding sections explained how to use the RackConnect v3.0 API to
list, add, and remove cloud server public IP addresses. To help clarify
the information that has been covered, this section provides a final
example that uses sample data instead of placeholders in the operation to list
public IP addresses.

#### List public IP address for a cloud server API request with sample data

    curl --include \
    --request GET \
    --header "X-Auth-Token: NNNaaNNaNNaaaaNNaNaNNNNaaNaNaaaa" \
    --header "Content-Type: application/json" \
    https://iad.rackconnect.api.rackspacecloud.com/v3/NNNNNNN/public_ips?cloud_server_id=aaaNNNNNa-aaaa-NNNN-aNaN-aNNaaNaNaNaa

Sample data entries for this example are as follows:

-   Authentication Token ID = NNNaaNNaNNaaaaNNaNaNNNNaaNaNaaaa
-   Region = iad
-   Tenant ID = NNNNNNN
-   Cloud Server UUID = aaaNNNNNa-aaaa-NNNN-aNaN-aNNaaNaNaNaa

For information about the many other API calls available with the
RackConnect v3.0 API, visit <http://docs.rcv3.apiary.io/>.

If you have any questions, reach out to us. Contact information is
available on the [Contact Us](/how-to/support) page.
