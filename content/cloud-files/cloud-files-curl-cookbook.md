---
permalink: cloud-files-curl-cookbook/
audit_date:
title: Cloud Files cURL Cookbook
type: article
created_date: '2012-06-25'
created_by: Rackspace Support
last_modified_date: '2016-04-14'
last_modified_by: Stephanie Fillmon
product: Cloud Files
product_url: cloud-files
---

The Rackspace Cloud Files service is offered with a RESTful API
interface, which is useful for integration with existing applications. At times, the interface can be used for directly interacting with the API to perform ad hoc tasks or to troubleshoot Cloud Files itself. A very useful tool for performing these actions from the command line is cURL, which is a generic client that supports several protocols, including HTTP. This article describes how to install cURL, its basic functions, and how to use it with Cloud Files.

### Install cURL

All the major distributions have packages for installing cURL. Following
is an example of how to install cURL on Debian and Ubuntu:

    $ sudo apt-get install curl

Similarly, the following command installs cURL on Fedora, CentOS, and
Red Hat Enterprise Linux:

    $ yum install curl

After cURL is installed, use the following command to verify that it is
ready to use:

    $ curl --version
    curl 7.21.3 (i686-pc-linux-gnu) libcurl/7.21.3 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smtp smtps telnet tftp
    Features: GSS-Negotiate IDN IPv6 Largefile NTLM SSL libz

You can also install cURL on Microsoft Windows. To do so, visit
the [cURL homepage](http://www.curl.com/) and download the executable
from the [Downloads page](http://www.curl.com/download/). The Windows
binary will require installation of some Microsoft Visual C++ libraries
to work correctly.

### cURL basics

cURL is a command line tool that offers a means of communicating with
various services at a protocol level. In particular, cURL supports
HTTP(S) communication, which means that you can use it to query the
HTTP-based API service endpoints and issue API operations with a fine
level of detail.

This section provides some basic information about how to use cURL with
HTTP.

#### Perform an HTTP GET operation

A HTTP GET operation is what browsers typically perform to download web
pages and images whenever you go to a website. In the same manner, you
can use cURL to issue an HTTP GET operation on a URL to get back the web
page data.

Running the following command with your favorite website URL returns the
HTML markup.

    $ curl http://www.example.com

By default, cURL sends the response body returned by the server directly
to the terminal. You can also capture the output and send it directly to
a file, which is effectively "downloading" the file or page. You can do
this either by using the `-o` flag to specify an output file or by using
the Linux redirection operator to capture the output, as shown in the
following example:

    $ curl -o index.html http://www.example.com
    $ curl http://www.example.com > index.html

#### Perform an HTTP POST operation

You can also use cURL to perform an HTTP POST operation, which is what
most HTML-based forms use to send data to a remote server. There are a
few ways to tell cURL what data to send when doing a POST operation, but
this article describes how to use the file-based method because many of
the POST operations of the Rackspace Cloud API involve sending JSON or
XML documents. To post an XML or JSON file, you need to specify the
`Content-Type` appropriately so that the receiving server knows what to
expect, as shown in the following examples:

    $ curl -X POST -d @mydocument.xml -H "Content-Type: application/xml" http://www.example.com/form
    $ curl -X POST -d @mydocument.json -H "Content-Type: application/json" http://www.example.com/form

You can also specify the data as a quoted string, but this can be
unwieldy when done from the command line.

#### Perform an HTTP PUT operation

The HTTP PUT operation is similar to the HTTP POST operation, except PUT
operations normally imply some sort of storage request. For example,
uploading a object to a container is done using a PUT operation. When
performing a PUT operation, it is important to specify the HTTP
`Content-Type` header of the object that is being uploaded so that the
receiving server knows what kind of file it is. cURL automatically
passes through the required `Content-Length` headers to ensure that the
file is uploaded in a standard fashion. The syntax is as follows:

    $ curl -X PUT -T myobject.jpg -H "Content-Type: image/jpeg" http://www.example.com/upload

#### View the HTTP headers

Many operations do not return a response body, just response headers.
Much of the usefulness of the API result is in the headers, which
contain useful information such as the HTTP response code. To view the
HTTP response headers, use the `-I` option, as shown in the following
example. This option is the equivalent of an HTTP HEAD request (X HEAD):

    $ curl -I http://www.example.com
    HTTP/1.0 302 Found
    Location: http://www.iana.org/domains/example/
    Server: BigIP
    Connection: Keep-Alive
    Content-Length: 0

#### View more HTTP debug information

At times, it is useful to view the full HTTP request/response
transaction. You can do this by using the verbose (`-v`) flag, which prints out
practically all the HTTP data that is sent back and forth, including the
request headers. This flag is quite useful for debugging purposes.

    $ curl -v http://www.example.com
    * About to connect() to www.example.com port 80 (#0)
    * Trying 192.0.43.10... connected
    * Connected to www.example.com (192.0.43.10) port 80 (#0)
    > GET / HTTP/1.1
    ...

#### Send HTTP Headers

When sending an HTTP request, it is sometimes useful to specify
additional headers to give the server more information about the request
you are making. A useful header to specify is the `Accept` header to
indicate the type of response that you want back, either JSON or XML.

    $ curl -v -H "Accept: application/xml" www.example.com
    * About to connect() to www.example.com port 80 (#0)
    * Trying 192.0.43.10... connected
    * Connected to www.example.com (192.0.43.10) port 80 (#0)
    > GET / HTTP/1.1
    > User-Agent: curl/7.21.3 (i686-pc-linux-gnu) libcurl/7.21.3 OpenSSL/0.9.8o zlib/1.2.3.4 libidn/1.18
    > Host: www.example.com
    > Accept: application/xml
    >
    ...

### Authenticate with the API

Before you can use any of the Rackspace Cloud APIs, you must first
authenticate yourself to receive an authentication token. The token is
an ID string that is required when you make calls to the various
Rackspace Cloud APIs. The typical lifetime of a token is 24 hours, and
you will always get the same token while it is still valid.

**Note:** Your token is crucial to your cloud service security, so keep it
secret. If another user gets your token, that user might get full access
to your cloud-based services.

To authenticate you need to query the Cloud Identity API. Version 1.1 of
the Identity API service is used in the following example. To query the
service, you need your Rackspace Cloud account username and API key.
Instructions for locating these credentials are documented in [View and Reset your API Key](/how-to/view-and-reset-your-api-key).

Authenticating requires sending a POST request to the Identity service
with a document that contains your Cloud credentials. You can submit XML
or JSON documents to the Rackspace Cloud APIs, but the remainder of the
examples in this article will use XML documents because they are more
descriptive. Following is an example XML document saved as **auth.xml**:

    <?xml version="1.0" encoding="UTF-8"?>
    <credentials xmlns="http://docs.rackspacecloud.com/auth/api/v1.1"
    username="johndoe"
    key="4e229b2e0789d9070e8411c9beee1c13"/>

After the XML document is ready, you can use cURL to send a POST request
with the document to the API endpoint. The service endpoint that you use
depends on whether you have a US-based or UK-based Cloud account:

-   US customers: https://auth.api.rackspacecloud.com/v1.1/auth
-   UK customers: https://lon.auth.api.rackspacecloud.com/v1.1/auth

The request will look like the following one for the user johndoe who is
a US-based customer:

US customers: https://auth.api.rackspacecloud.com/v1.1/auth

UK customers: https://lon.auth.api.rackspacecloud.com/v1.1/auth

The curl based call will look like the following for johndoe who is a US
based customer:

    $ curl -X POST -d @auth.xml -H "Content-Type: application/xml" -H "Accept: application/xml"     https://auth.api.rackspacecloud.com/v1.1/auth

The following examples shows the response to the authentication request:

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <auth xmlns="http://docs.rackspacecloud.com/auth/api/v1.1">
    <token expires="2012-01-17T03:52:09.000-06:00" id="3c5c8187-2569-47e0-8a11-edadd384e12b"/>
    <serviceCatalog>
    <service name="cloudFilesCDN">
    <endpoint publicURL="https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b" v1Default="true" region="ORD"/>
    </service>
     <service name="cloudServers">
    <endpoint publicURL="https://servers.api.rackspacecloud.com/v1.0/123456" v1Default="true"/>
    </service>
    <service name="cloudFiles">
    <endpoint internalURL="https://snet-storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b" publicURL="https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b" v1Default="true" region="ORD"/>
    </service>
    </serviceCatalog>
    </auth>

In the preceding response, note the following information that you will
need when using the Cloud Files API:

-   API token
-   Cloud Files public endpoint URL
-   Cloud Files CDN (internal) endpoint URL

If you intend to access Cloud Files from a Cloud Server in the same
data center, use the Cloud Files internal endpoint URL instead of the
public one. Using this URL allows the API calls to go directly to the
Cloud Files servers over the data center's ServiceNet private network.
The benefit of using ServiceNet are that the Cloud Server does not incur
bandwidth costs and the throughput rates to and from the Cloud Files
storage servers are better.

### Cloud Files cURL recipes

This section contains cURL based recipes that you can use with Cloud
Files API to quickly and easily do various Cloud Files related
operations. The recipes are divided into two parts: storage operations
and the CDN specific operations. To be able to make any of the following
API calls, the authentication token needs to be passed along with the
request. The following authentication token will be used in the below
recipes: `3c5c8187-2569-47e0-8a11-edadd384e12b`. We will also assume that
we will be submitting and receiving only XML documents.

#### Storage recipes

The storage recipes require the use of the Cloud Files service endpoint
URL that was returned as part of the authentication process. The
following recipes use the following example URL:

    https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b

When you use the recipes, be sure to substitute your own endpoint URL.

**List containers**

Querying the Cloud Files storage endpoint returns a simple list of
available containers, each on a new line.

    $ curl -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/
    backup
    cloudservers
    images
    static

You can also list the containers with more details, including
information such as the container, size and the number of objects within
the container by passing the format parameter:

    $ curl -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/?format=xml
    <?xml version="1.0" encoding="UTF-8"?>
    <account name="MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b">
    <container>
    <name>backup</name>
    <count>1</count>
    <bytes>54770176</bytes>
    </container>
    <container>
    <name>cloudservers</name>
    ...

##### Create a container

Creating a container requires sending a PUT request to the storage URL
and including a name for the container as part of the URL. The following
example shows the request to create a new container called newcontainer:

    $ curl -X PUT -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/newcontainer
    202 Accepted

The request is accepted for processing.

##### Delete a Container

You can delete a container by issuing a DELETE request, but remember
that only empty containers can be deleted. If a container currently has
objects within it, then those objects must first be deleted. No content
body is returned as part of this request, so it is useful to also
include the verbose flag to determine if the deletion was successful by
verifying that an HTTP 204 response is returned.

    $ curl -v -X DELETE -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/newcontainer
    ...
    < HTTP/1.1 204 No Content
    < Content-Length: 0
    < Content-Type: text/html; charset=UTF-8
    < X-Trans-Id: tx6eeb58f3dfa44f2e892505b711e8aefa
    < Date: Wed, 01 Feb 2012 13:05:00 GMT

**List objects**

Querying a container returns a simple list of objects within that
container. By default only the first 10,000 objects are returned. The
following example lists the objects of a container called images:

    $ curl -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images
    banner.jpg
    cloud.png
    rackspace.jpg

You can also use the format parameter to get more detailed information
about objects, such as size and content type.

    $ curl -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images?format=xml
    <?xml version="1.0" encoding="UTF-8"?>
    <container name="images">
    <object>
    <name>banner.jpg</name>
    <hash>9ed61f72b1f3777ff01b7ce128a67244</hash>
    <bytes>26326</bytes>
    ...

You can list more than 10,000 objects or to filter by specific objects
by passing some additional URL parameter options. For more detailed
information about the available parameters and how they work, see the
Cloud Files Developer Guide.

##### Download an object

Send a GET request on the full path to an object causes curl to
effectively download the content. By default, the content goes straight
to the terminal. It is possible to pipe the data printed to the terminal
for processing or to simply redirect the data to a file to effectively
save the contents. The following example downloads the **cloud.png** object
from the images container to a local file of the same name by using the
cURL `-o` option to save the HTTP response body to a file:

    $ curl -o cloud.png -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images/cloud.png

##### Upload an object

To upload a new object to a container, simply perform a PUT request of
the file to be uploaded along with any additional options that you want
such as file content-type headers. The following example uploads a file
called `style.css` to a container called static with a content-type of
**text/css**.

**Note:** Setting the correct content-type is important depending on where
the object will be used. In the case of CSS files, for example, having
an improper content type could cause web browsers to not parse the CSS
when it served from the CDN, resulting in an unstyled web page.

    $ curl -X PUT -T style.css -H "Content-Type: text/css" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/static/style.css
    <html>
    <head>
    <title>201 Created</title>
    </head>
    <body>
    <h1>201 Created</h1>
    <br /><br />
    </body>
    </html>

You can also to upload an object to make it appear as if the object is
part of a directory structure. You do this by naming the object with the
full path including the directory components. This is useful when
publishing containers to the CDN as the resulting CDN URL will appear as
if it was part of a directory structure and is generally more organized.
The following example repeats the preceding example but names the
**style.css** object so that it becomes **css/style.css**:

    $ curl -X PUT -T style.css -H "Content-Type: text/css" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/static/css/style.css
    <html>
    <head>
    <title>201 Created</title>
    </head>
    <body>
    <h1>201 Created</h1>
    <br /><br />
    </body>
    </html>

##### Delete an object

To delete an object requires sending a DELETE request to the object to
be deleted. It is useful to provide the verbose (`-v`) flag because the call
does not return anything by default. An HTTP 204 No Content response
code indicates a successful deletion.

    $ curl -v -X DELETE -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/static/style.css ...
    < HTTP/1.1 204 No Content
    < Content-Length: 0
    < Content-Type: text/html; charset=UTF-8
    < X-Trans-Id: tx08e07264230f46cea4bdbaf998e301c0
    < Date: Wed, 08 Feb 2012 19:24:17 GMT
    <
    * Connection #0 to host storage101.ord1.clouddrive.com left intact
    * Closing connection #0 * SSLv3, TLS alert, Client hello (1):

##### Perform a server side copy

To copy an existing object to a new storage location without incurring
the expense of performing the data upload from the client side;
particularly for very large files. By combining server-side copies with
object deletion, you can perform object moves and rename operations by
first copying the object to the new location or name and then performing
a deletion of the original. Copying is not restricted to a single
container. The following example copies the **rackspace.jpg** file to a new
name of **rackspace.jpeg** as named in the Destination header:

    $ curl -X COPY -H "Destination: images/rackspace.jpeg" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images/rackspace.jpg
    <html>
    <head>
    <title>201 Created</title>
    </head>
    <body>
    <h1>201 Created</h1>
    <br /><br />
    </body>
    </html>

##### Update object headers

You can update certain HTTP headers that correspond to an object by
performing an HTTP POST operation to the object path with the updated
header. This function is most useful for correcting an incorrectly set
`Content-Type` header. Other headers that you can set include the `CORS` and
`Content-Disposition` headers.

**Note:** You can also update the headers by performing a server-side copy
and passing in the new header. To do this requires setting the
destination of the copy to be the same as the source.

Following is an example of how to update the `Content-Type` of an image to
**image/jpeg** by using the POST operation:

    $ curl -X POST -H "Content-Type: image/jpeg" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images/rackspace.jpg
    <html>
    <head>
    <title>202 Accepted</title>
    </head>
    <body>
    <h1>202 Accepted</h1> The request is accepted for processing.<br /><br />
    </body>
    </html>

#### CDN Recipes

Cloud Files maintains a separate CDN API web service endpoint
specifically for CDN-related operations. This URL is returned as part of
the authentication process. The following recipes will use the following
URL:
    https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b.

When you use the recipes, be sure to substitute your own endpoint URL.

##### List CDN-enabled containers

Performing a GET request on the CDN API URL returns a list of containers
that have been CDN-enabled at some point. Containers that have never
been CDN-enabled do not appear on this list. The following request lists
all CDN-enabled containers:

    $ curl -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12" https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b
    files
    static

##### CDN-enable a container

Before a container can have CDN operations performed on it, the
container needs to be CDN enabled. You do this operation by performing a
HTTP PUT to the CDN URL and naming the container in question. You can
pass along additional CDN-related headers to initialize the content to
certain CDN attributes such as container TTL and whether CDN logging
should be enabled. If no additional CDN headers are passed along, the
container is enabled with the default values.

**Note:** Making a container CDN enabled is not the same as publishing a
container. CDN enabling container simply makes it CDN aware so that it
can be used with the CDN. By default, making a container CDN-enabled also
publishes it.

The following request enables and publishes the images container:

    $ curl -X PUT -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12b" https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images
    ...
    HTTP/1.1 204 No Content Date: Wed, 15 Feb 2012 20:28:29 GMT
    Server: Apache
    X-CDN-URI: http://c12345.r49.cf2.rackcdn.com
    X-CDN-SSL-URI: https://c12345.ssl.cf2.rackcdn.com X-CDN-STREAMING-URI: http://c12345.r49.stream.cf2.rackcdn.com
    X-CDN-Enabled: True
    X-TTL: 259200
    X-Log-Retention: False
    Connection: close
    Content-Type: text/plain; charset=UTF-8

##### View a container's CDN details

To view a container's CDN properties requires sending an HTTP HEAD
request to the API CDN URL. Viewable information includes whether the
container is CDN enabled, if CDN logging is turned on, and the currently
set TTL, as well as the various CDN domain names that can be used to
reference content within the container.

The following request lists the CDN details of the images container:

    $ curl -I -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12" https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images
    HTTP/1.1 204 No
    Content Date: Mon, 20 Feb 2012 19:39:41 GMT
    Server: Apache
    X-CDN-URI: http://c4965949.r49.cf2.rackcdn.com
    X-CDN-SSL-URI: https://c4965949.ssl.cf2.rackcdn.com
    X-CDN-STREAMING-URI: http://c4965949.r49.stream.cf2.rackcdn.com
    X-CDN-Enabled: True
    X-TTL: 259200
    X-Log-Retention: False
    Connection: close
    Content-Type: text/plain; charset=UTF-8

##### Update a container's CDN attributes

You can update the CDN attributes of a CDN-enabled container by sending
an HTTP POST request to the API CDN URL naming the container to be
updated and passing along one or more of the attribute headers. Trying
to perform an update of a container that has never been CDN-enabled
results in an `HTTP 404` error. Because no response body is returned, use
the verbose option to determine if the request was accepted.

Following is a list of CDN attributes that may be updated:

-   `X-CDN-Enabled` - indicates whether the container should be published
    or not, an unpublished container will not be publicly visible. Note
    that any existing content cached within the network will still be
    accessible using the CDN URL until the content's TTL expires and it
    is removed from the network. Accepts a value of True or False.
-   `X-TTL` - indicates the container's TTL value in seconds. This setting
    is applied to the container itself and all objects within and
    controls how long the content is cached within the CDN. It is not
    possible to have per object TTL values. There is a minimum limit of
    15 minutes and a maximum limit of 50 years.
-   `X-Log-Retention` - indicates whether the container has CDN
    logging enabled. These are W3C style HTTP logs for all CDN content
    requests for the particular container. Accepts a value of True
    or False.

The following example request unpublishes a container called images:

    $ curl -v -X POST -H "X-CDN-Enabled: False" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12" https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images ...
    < HTTP/1.1 202 Accepted
    < Date: Mon, 20 Feb 2012 19:33:33 GMT
    < Server: Apache
    < X-CDN-URI: http://c4965949.r49.cf2.rackcdn.com
    < X-CDN-SSL-URI: https://c4965949.ssl.cf2.rackcdn.com
    < X-CDN-STREAMING-URI: http://c4965949.r49.stream.cf2.rackcdn.com
    < Content-Length: 0
    < Connection: close
    < Content-Type: text/plain; charset=UTF-8
    <

##### Purge an object

You can force the removal of content from the CDN by issuing a CDN purge
request through an HTTP DELETE operation to the content to be purged.
The purge request can be done only on a per object basis. The purge
request schedules a job with Akamai to have the indicated content
removed from all member nodes of the CDN and can take some time to
complete. You can pass through the `X-Purge-Email` header together with a
comma-separated list of email addresses so that a notification will be
sent when the purge is completed. Currently only 25 purges can be
performed per account per day.

If you need to perform a container level purge, contact support via a
ticket and name the container to be purged. Support can perform this
purge for you. If a notification email is required,  also tell support
the email addresses to use.

**Note:** Attempting to perform multiple purges on the same content while a
previous purge is still running results in an HTTP 400 error.

The following operation performs a CDN purge of the **rackspace.png** file
from the images container with a notification email set to
**user@example.com**. (Use the verbose (`-v`) option because no response body is returned.)

    $ curl -v -X DELETE -H "X-Purge-Email: user@example.com" -H "X-Auth-Token: 3c5c8187-2569-47e0-8a11-edadd384e12" https://cdn2.clouddrive.com/v1/MossoCloudFS_c4f83243-7537-4600-a94d-ab7065f0a27b/images/rackspace.png
    ...
    >
    < HTTP/1.1 204 No Content
    < Date: Mon, 20 Feb 2012 20:10:18 GMT
    < Server: Apache
    < Content-Length: 0
    < Connection: close
    < Content-Type: text/plain; charset=UTF-8
    <
    * Closing connection #0
    * SSLv3, TLS alert, Client hello (1):

### Summary

This article is meant to serve as a quick reference to the more common
Cloud Files API requests and how to use them with cURL. For more
information about other features that the Cloud Files API offers, see
the Cloud Files API documentation. The cURL techniques discussed in this
article can also be used with other Rackspace Cloud based APIs and more
generally for debugging HTTP and HTTPS based applications and web
servers.
