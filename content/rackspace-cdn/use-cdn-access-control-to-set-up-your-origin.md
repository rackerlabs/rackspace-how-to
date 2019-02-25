---
permalink: use-cdn-access-control-to-set-up-your-origin/
audit_date: '2019-01-22'
title: Use CDN access control to set up your origin
type: article
created_date: '2019-02-12'
created_by: Rackspace Community
last_modified_date: '2019-02-12'
last_modified_by: Kate Dougherty
product: Rackspace CDN
product_url: rackspace-cdn
---

An _origin_ is an address (Internet Protocol (IP) or domain) from which a 
Content Delivery Network (CDN) pulls content. Because that content comes from 
a different domain, you need to _allow_ your CDN to pull it for
security reasons. This article shows you how to use CDN access control to
allow [Rackspace CDN and Cloud Files
CDN](/how-to/differences-between-rackspace-cdn-and-rackspace-cloud-files/)
to pull content from your origin.

### Overview for Rackspace CDN

With Rackspace CDN, all you need to do is set Cross-Origin Resource Sharing
(CORS) headers on the origin web server that hosts your content. These headers
are automatically passed from the origin to the CDN. To view instructions for
different web server software packages, see [I want to add CORS support to my
server](https://enable-cors.org/server.html).

### Overview for Cloud Files CDN

The process for Cloud Files CDN is more involved, and you make the modifications 
by using the [Cloud Files Storage
API](https://developer.rackspace.com/docs/cloud-files/v1/storage-api-reference/#storage-api-reference) and the 
[Cloud Files CDN API](https://developer.rackspace.com/docs/cloud-files/v1/cdn-api-reference/). 
This section shows you how to perform this task.

#### Set headers on containers

You need to set the headers in this section at the container level.

##### Access-Control-Allow-Origin

First, you need to set the `Access-Control-Allow-Origin` header on the
`default` object of the container. This header specifies a list of origins that are
allowed to make cross-origin requests. Ensure that you separate each origin by
using spaces.

You use this header with the [Static
Websites](https://developer.rackspace.com/docs/cloud-files/v1/use-cases/static-websites-using-cdn-enabled-containers/) functionality of Cloud Files CDN.

For detailed instructions, see the [Create or update container metadata](https://developer.rackspace.com/docs/cloud-files/v1/storage-api-reference/container-services-operations/#create-or-update-container-metadata) section of the Cloud Files Developer Guide.

The following code shows an example cURL request that sets the
`X-Container-Meta-Access-Control-Allow-Origin` header on the default object:

    curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "X-Container-Meta-Access-Control-Allow-Origin: *" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

**Note**: The asterisk (`*`) indicates the default object.

The preceding example uses the following placeholders:

- `AUTHTOKEN`: The token that the Identity API generates when you
  [make an authentication request](https://developer.rackspace.com/docs/cloud-identity/v2/getting-started/send-request-ovw/).

- `Account UUID`: The unique identifier for your cloud account. You can find
  this identifier in the service catalog that is returned when you generate
  an authentication token.

- `CONTAINER`: The name of the container that you are using. Check your naming
  schemes, and ensure that you URL encode them. This parameter is case
  sensitive.

Next, use the following cURL request to retrieve the headers and verify that
the `X-Container-Meta-Access-Control-Allow-Origin` header that you just added
appears:

    curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

##### Expose the object-level headers

Get the current headers that are exposed by using the following cURL request:

    curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/
    X-Container-Meta-Access-Control-Expose-Headers: etag location x-timestamp x-trans-id

Note that the `etag`, `location`, `x-timestamp`, and `x-trans-id` headers are
already set. These headers are used in the Cloud Control Panel and for
troubleshooting. If you are unsure if you should keep the existing headers,
keep them.

Set the header by using the following cURL request:

    curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "X-Container-Meta-Access-Control-Expose-Headers: etag location x-timestamp x-trans-id Access-Control-Allow-Origin" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

Next, use the following cURL request to retrieve the headers and verify that
the new header exists:

    curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

#### Set the Access-Control-Allow-Origin header on each object

Next, you need to set the `Access-Control-Allow-Origin` header on each of the
objects to which you want it to apply. Send the following example request,
replacing `image.png` with the object on which you want to set the header:

    curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "Access-Control-Allow-Origin: *" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png

Verify that the new header exists by using the following cURL request:

    curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png

#### Purge objects

Next, you need to purge (perform a content refresh on) each object. You must
also perform this action at the container level.

A Cloud Files CDN purge deletes the content from the CDN edge nodes, and takes
between 7 and 10 minutes to complete. The following example
shows how to use the `X-Purge-Email` header to include your email address:

    X-Purge-Email: user@domain.com

The following code shows an example purge request:

    curl -si -X DELETE -H "X-Auth-Token:{AUTHTOKEN}" -H "X-Purge-Email: user@domain.com"  https://cdn5.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png

Note that the domain name is different in this request. This difference occurs
because you are using the Cloud Files CDN API to make the purge request, and
not the standard Cloud Files Storage API. To see a list of Cloud Files CDN
endpoints, see [Service access endpoints](https://developer.rackspace.com/docs/cloud-files/v1/general-api-info/service-access/#service-access-endpoints).

For more information about performing purges on CDN-enabled objects by using
the Cloud Files CDN API, see the [Delete CDN-enabled
object](https://developer.rackspace.com/docs/cloud-files/v1/cdn-api-reference/cdn-object-services-operations/#delete-cdn-enabled-object) section of the
Cloud Files API Developer Guide.

### Additional information

We recommend that you use the `-I` flag with cURL to handle HTTP HEAD
requests (`-X HEAD`). Using this flag includes the HTTP header in the output.

Cloud Files CDN allows you to purge 25 objects per day. The counter resets at
Midnight UTC. If you are updating all of your files at one time and need to
purge more than 25 objects, contact Rackspace Support.
