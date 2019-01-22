---
permalink: download-all-cdn-access-logs-for-cloud-files-container
audit_date:
title: Download All CDN Access Logs for Cloud Files Container
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Files
product_url: cloud-files
---

The CDN access logs are stored within cloud files container named ".CDN_ACCESS_LOGS". They are separated into pseudo hierarchical folders following this naming method:

container_name/year/month/day/hour/uuid.log.gz

For example:

test/2014/02/11/11/33af9e076803ab27a1e6084c53992a07.log.gz
test/2014/02/11/11/4443542e7d9c2ee4eecd47bedd83f3b2.log.gz
test/2014/02/11/11/98e840887c74f41cfe2e90838c122407.log.gz
test/2014/04/06/20/307505be14b71e4220ca8466305682f5.log.gz
test/2014/05/22/07/17dfd34740a20e7600cc1b1db3324b00.log.gz
test/2014/05/22/07/d07c56e876a896653790922f2adca1f4.log.gz
test/2014/06/30/15/628c23ed0cc009fd5865a458bb2ad7eb.log.gz
test/2014/08/04/08/f8d313fb775ed3200de5ea8be395ed59.log.gz
Downloading them manually and extracting them can be a bit of a pain, this is why I prepared below bash one liner to download all the log files and merge them into single file that would make it easier to review access.

First you need to set some basic variables to set your credentials:
USERNAME=yourAccountName
APIKEY=yourAPIkey
Next variables are to obtain your API Token:
TOKEN=`curl -sX POST https://identity.api.rackspacecloud.com/v2.0/tokens -d '{ "auth":{ "RAX-KSKEY:apiKeyCredentials":{ "username":"'$USERNAME'", "apiKey":"'$APIKEY'" } } }' -H "Content-type: application/json" | python -mjson.tool | grep -A5 token | grep id | cut -d '"' -f4`

This will obtain full authentication response from identity service and extract just the token from it.

The one below is following the same scheme in order to get the Cloud Files Mosso ID.
CFLINK=`curl -sX POST https://identity.api.rackspacecloud.com/v2.0/tokens -d '{ "auth":{ "RAX-KSKEY:apiKeyCredentials":{ "username":"'$USERNAME'", "apiKey":"'$APIKEY'" } } }' -H "Content-type: application/json" | python -mjson.tool | grep -E 'tenantId.*Mosso' | head -1 | cut -d '"' -f4`

This variable is to set the name of the container for which you want to obtain the CDN logs.
CONTAINER=containerName

Now when these are set we're ready to get our logs. What these combos will do is to download each single log file and put its contents into one combined log file

For ServiceNet communication from RS Cloud Servers:
for i in `curl -s -H "X-Auth-Token: $TOKEN" -X GET https://snet-storage101.lon3.clouddrive.com/v1/$CFLINK/.CDN_ACCESS_LOGS?prefix=$CONTAINER`; do FILE=$(echo "$i" | cut -d '/' -f6); `curl -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -X GET https://snet-storage101.lon3.clouddrive.com/v1/$CFLINK/.CDN_ACCESS_LOGS/$i -o $FILE`;zcat $FILE >> $CONTAINER-cdn.log; rm -f $FILE; done

For communication through internet (outside of RS Cloud):
for i in `curl -s -H "X-Auth-Token: $TOKEN" -X GET https://storage101.lon3.clouddrive.com/v1/$CFLINK/.CDN_ACCESS_LOGS?prefix=$CONTAINER`; do FILE=$(echo "$i" | cut -d '/' -f6); `curl -H "X-Auth-Token: $TOKEN" -H "Content-type: application/json" -X GET https://storage101.lon3.clouddrive.com/v1/$CFLINK/.CDN_ACCESS_LOGS/$i -o $FILE`;zcat $FILE >> $CONTAINER-cdn.log; rm -f $FILE; done


All the API documentation used for this is available here:

http://docs.rackspace.com/auth/api/v2.0/auth-client-devguide/content/Sample_Request_Response-d1e64.html
http://docs.rackspace.com/files/api/v1/cf-devguide/content/GET_listcontainerobjects_v1__account___container__containerServicesOperations_d1e000.html


