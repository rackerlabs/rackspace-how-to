---
permalink: set-up-cors-on-cloud-files/
audit_date: '2019-01-18'
title: Set up CORS on Cloud Files
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-22'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

If content in your Cloud Files account isn't loading on your website, it might
be due to Cross-Origin Resource Sharing (CORS), a security feature designed to
prevent malicious content from loading in a web page by default. If your files
load Asynchronous JavaScript and XML (AJAX) or embed fonts, CORS might prevent them from loading.

You can correct this issue by using the following steps to change the headers
in your Cloud Files with cURL (replacing `XXXXX` with your endpoint and
`YYYYY` with your token):

1. Set the `X-Container-Meta-Access-Control-Allow-Origin` header on a
   container named `mycontainer` by running the following command:

       $ curl -i -X POST https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/ -H "X-Auth-Token: YYYYY" -H "X-Container-Meta-Access-Control-Allow-Origin: *"

2. Check `mycontainer` by running the following command:

       $ curl -I -X HEAD https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/ -H "X-Auth-Token: YYYYY"

3. Upload a file named `cup.jpg` to the container with the required headers by
   running the following command:

       $ curl -v -H 'X-Auth-Token: YYYYY' -X PUT -T cup.jpg -H 'Content-Type: image/jpeg' -H 'Content-Length: 0' -H 'Access-Control-Expose-Headers: Access-Control-Allow-Origin' -H 'Access-Control-Allow-Origin: *' https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/cup.jpg

4. Check the `cup.jpg` object by running the following command:

       $ curl -I -X HEAD https://storage101.lon3.clouddrive.com/v1/MossoCloudFS_XXXXX/mycontainer/cup.jpg -H "X-Auth-Token: YYYYY"

   The output should be similar to the following example:

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
