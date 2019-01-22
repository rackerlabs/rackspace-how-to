---
permalink: cdn-access-control-allow-origin
audit_date:
title: CDN Access-Control-Allow-Origin
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Rackspace CDN
product_url: rackspace-cdn
---

With Rackspace CDN, all you have to do is set the headers on the files on the Origin server.  These headers, and most custom headers are automatically passed from the Origin to the CDN without an issue.  There are a few exceptions to this, including the Expires header, which is used by the
Setting CORS  headers (which Access-Control-Allow-Origin is part of this), you will need to address it on the Origin web server.  Here is some great documentation for the different web server software that can help.
http://enable-cors.org/server.html

As for Cloud Files CDN, this is a little more in depth.  With Cloud Files CDN, you will do the modifications on the Cloud Files API (storage). 

1.)  Headers that need to be set on the Container level:

1a.) Set Access-Control-Allow-Origin on the 'default' object of the container.  This is used with 'Static Websites' functionality of Cloud Files CDN:
Static WebSites in Cloud Files CDN:
https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#document-static-websites-using-cdn-enabled-containers/index
Set Access-Control-Allow-Origin on default object:
X-Container-Meta-Access-Control-Allow-Origin: *
https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#create-or-update-container-metadata
An Example curl call of this would be:
Set the header:
curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "X-Container-Meta-Access-Control-Allow-Origin: *" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/
Get the headers to verify:
curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

1b.) Expose the Object level headers:
X-Container-Meta-Access-Control-Expose-Headers: Access-Control-Allow-Origin
Get the current headers that are exposed:
curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/
X-Container-Meta-Access-Control-Expose-Headers: etag location x-timestamp x-trans-id
Note that etag, location, x-timestamp, and x-trans-id are already set.  These are used through the control panel and for troubleshooting.  If you have any questions about if you should keep the existing headers, you should keep them to be on the safe side.

Set the header:
curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "X-Container-Meta-Access-Control-Expose-Headers: etag location x-timestamp x-trans-id Access-Control-Allow-Origin" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/
Get the headers to verify:
curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/

2.) Set 'Access-Control-Allow-Origin' on each object you need this on.
Now that we have set, you need to set 'Access-Control-Allow-Origin' on each of the objects you want it on.
curl -si -X POST -H "X-Auth-Token: {AUTHTOKEN}" -H "Access-Control-Allow-Origin: *" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png
Verify:
curl -si -I -H "X-Auth-Token: {AUTHTOKEN}" https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png

3.)  From here, you have to purge, or do a Content Refresh on each of the objects and the Container level.  The container level might be the hardest, as it requires an API call.  If you need help with this, please contact support.
https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#delete-cdn-enabled-object
A Cloud Files CDN Purge deletes the content off of the CDN Edge Nodes, and takes between 7 and 10 minutes to fully complete per call.  This API call allows you to set a email to be notified when the purge completes. You just set the following header on the curl request.
X-Purge-Email: user@domain.com
Example:
curl -si -X DELETE -H "X-Auth-Token:{AUTHTOKEN}" -H "X-Purge-Email: user@domain.com"  https://cdn5.clouddrive.com/v1/MossoCloudFS_{Account UUID}/{CONTAINER}/image.png
**NOTE the different domain name for the request.  Remember that we are using the Cloud Files CDN API to make the Purge request, and not the standard Cloud Files API (Storage).  Please review the ServiceCatalog on the Cloud Identity API call or the Cloud Files CDN Service End-points here:
https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#service-access

INFORMATION:

A.) More about CORS headers supported on the Container level:
https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#document-public-access-to-your-cloud-files-account/cors

B.) I use '-I' with curl to handle the HTTP HEAD requests.  Commonly referred to as '-X HEAD'.  '-X HEAD' does a HTTP GET request, and only returns the Headers, where '-I' only does the HTTP HEAD request.

C.) Above I use a few strings encompassed in "{}".  These are to indicate variables or your own custom strings.
{AUTHTOKEN} :  This is a token generated by the Cloud Identity API.
https://developer.rackspace.com/docs/cloud-identity/v2/developer-guide/#generate-an-authentication-token
{CONTAINER}:  This is just a container you are using.  Please check your naming schemes, and make sure you URL Encode and watch out as it is Case Sensative:
{Account UUID}:  As in https://storage101.iad3.clouddrive.com/v1/MossoCloudFS_{Account UUID}/
This is a Unique identifier for your particular Cloud Account.  Please review the ServiceCatalog returned when generating an Authentication Token from Cloud Identity to find yours.

D.)  Cloud Files CDN allows for 25 purges per day (counter reset at Midnight UTC).  If you are updating all of your files at once, and need to do more than this, please contact support.  They can direct you to the team that can handle cleaning up the CDN Edge for you with a one time Purge All files in a Cloud Files container.
