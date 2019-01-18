---
permalink: enabling-the-root-user-on-cloud-databases
audit_date:
title: Enabling the Root User on Cloud Databases
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Databases
product_url: cloud-databases
---

Enabling the root user for a Cloud Database instance can cause unpredictable behavior.

**Note**: Changes you make as a root user may cause detrimental effects to the database instance and unpredictable behavior for API operations. When you enable the root user, you accept the possibility that we will not be able to support your database instance. While enabling root does not prevent us from a “best effort” approach to helping you if something goes wrong with your instance, we cannot ensure that we will be able to assist you if you change core MySQL settings. These changes can be (but are not limited to) turning off binlogs, removing users that we use to access your instance, and so forth.
An additional aspect to keep in mind, the root user cannot be disabled.
Here are the steps to enable the root user for a Cloud Database instance in ORD.  It is also important to identify that your Cloud Database could be in another data center and the URLs that you use below need to be modified to use the appropriate data center.

1) Authenticate to obtain an auth token:
http://docs.rackspace.com/cdb/api/v1.0/cdb-getting-started/content/Generating_Auth_Token.html
curl -i -d \
'{
"auth":
{
"RAX-KSKEY:apiKeyCredentials":
{
"username": "YOUR_USERNAME",
"apiKey": "YOUR_API_KEY"}
}
}' \
-H 'Content-Type: application/json' \
'https://identity.api.rackspacecloud.com/v2.0/tokens'

2) List databases to obtain your id:
http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/Database_Instances.html
curl -i \
-H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
-H 'Content-Type: application/json' \
'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances'
The output from this will provide you a listing of all your Cloud Databases and you are looking for the id reference related to whichever Cloud Database you would like to enable the root user.

3) Enable the root user:
http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/POST_createRoot__version___accountId__instances__instanceId__root_.html
curl -X POST -i \
-H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
-H 'Content-Type: application/json' \
'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances/YOUR_INSTANCE_ID/root'
NOTE: the root password will be provided in the response and will look as follows:
{
    "user": {
        "name": "root", 
        "password": "984641c8-bd4b-4Qda-9f95-89bcf2c995b9"
    }
}
NOTE: You can reset the root password by running the command again.

4) Confirm that the root user is enabled:
http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/GET_isRootEnabled__version___accountId__instances__instanceId__root_.html
curl -i \
-H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
-H 'Content-Type: application/json' \
'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances/YOUR_INSTANCE_ID/root'
You are looking for the following:
{
    "rootEnabled": true
}

**NOTE**: The primary difference between step 3 and 4 is that enabling the root user is done with a POST request and confirmation is done with a GET request.
The final step of this process would be to connect to your Cloud Database with the root credentials and then to set the max-connections value of your choosing.  Please keep in mind that this setting will not traverse a restart of your Cloud Database instance.
Lastly, for good measure, please read the text in red again:
Changes you make as a root user may cause detrimental effects to the database instance and unpredictable behavior for API operations. When you enable the root user, you accept the possibility that we will not be able to support your database instance. While enabling root does not prevent us from a “best effort” approach to helping you if something goes wrong with your instance, we cannot ensure that we will be able to assist you if you change core MySQL settings. These changes can be (but are not limited to) turning off binlogs, removing users that we use to access your instance, and so forth.
