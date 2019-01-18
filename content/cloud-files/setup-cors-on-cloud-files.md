---
permalink: setup-cors-on-cloud-files
audit_date:
title: Setup CORS on Cloud Files
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

A question that comes up frequently is why Cloud Files not loading up inside a web page.  Usually this is using AJAX or embedding some fonts. The problem goes back to Cross-origin resource sharing (CORS). It's a security feature to prevent malignant content to be loaded up onto a web page by default.

This is how to change headers in Cloud Files with curl (replace XXXXX with your endpoint and YYYYY with your token):

1. Set the 'X-Container-Meta-Access-Control-Allow-Origin' header on a container called mycontainer:

  $ curl -i -X POST https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/ -H "X-Auth-Token: YYYYY" -H "X-Container-Meta-Access-Control-Allow-Origin: *"

2. Check the container mycontainer:

  $ curl -I -X HEAD https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/ -H "X-Auth-Token: YYYYY"

3. Upload a file called cup.jpg to the container with the required headers:

  $ curl -v -H 'X-Auth-Token: YYYYY' -X PUT -T cup.jpg -H 'Content-Type: image/jpeg' -H 'Content-Length: 0' -H 'Access-Control-Expose-Headers: Access-Control-Allow-Origin' -H 'Access-Control-Allow-Origin: *' https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/cup.jpg

4. Check the cup.jpg object:

  $ curl -I -X HEAD https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/cup.jpg -H "X-Auth-Token: YYYYY"
Example output:

HTTP/1.1 200 OK
Content-Length: 0
Access-Control-Expose-Headers: Access-Control-Allow-Origin
Accept-Ranges: bytes
Last-Modified: Mon, 16 Jun 2014 17:01:20 GMT
Etag: d23wqfqe300b204e9800998ecf8427e
X-Timestamp: 8079.74691
Access-Control-Allow-Origin: *
Content-Type: image/jpeg
X-Trans-Id: 2355eb60sdf323c82919-00539f22f8lon3
Date: Mon, 16 Jun 2014 17:01:45 GMT
