---
permalink: enabling-the-root-user-on-cloud-databases
audit_date: '2019-03-06'
title: Enabling the root user on Cloud Databases
created_date: '2019-01-18'
created_by: Rackspace Community
last_modified_date: '2019-03-06'
last_modified_by: Stephanie Fillmon
product: Cloud Databases
product_url: cloud-databases
---

Enabling the root user for a Cloud Databases instance can cause unpredictable behavior. Changes that
you make as a root user might cause detrimental effects to the database instance and
unpredictable behavior for API operations. 

**Warning**: When you enable the root user, you accept the possibility that Rackspace cannot
support your database instance. While enabling root does not prevent Rackspace from a “best effort” approach
to helping you if something goes wrong with your instance, we cannot ensure that we can assist
you if you change core MySQL&reg; settings. These changes can be (but are not limited to) turning off
binary logs (binlogs), removing users that we use to access your instance, and so forth. An additional aspect to
keep in mind is that you cannot disable the root user.

Use the cURL commands in the following steps to enable the root user for a Cloud Databases instance in the ORD data center.
Your Cloud Databases instances might be in another data center and you need to modify the URLs to the
appropriate data center in the following sample code.

1. Authenticate to obtain an authentication token:

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

2. List databases to obtain your ID:

       http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/Database_Instances.html
       curl -i \
       -H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
       -H 'Content-Type: application/json' \
       'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances'

   The output provides a list of all your Cloud Databases. Note the ID reference
   related to the Cloud Databases instance for which you want to enable the root user.

3. Enable the root user:

       http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/POST_createRoot__version___accountId__instances__instanceId__root_.html
       curl -X POST -i \
       -H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
       -H 'Content-Type: application/json' \
       'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances/YOUR_INSTANCE_ID/root'

   The root password is provided in the response and looks similar to the following example:

       {
           "user": {
              "name": "root", 
              "password": "984641c8-bd4b-4Qda-9f95-89bcf2c995b9"
           }
       }

**Note**: You can reset the root password by running the command again.

4. Confirm that the root user is enabled:

       http://docs.rackspace.com/cdb/api/v1.0/cdb-devguide/content/GET_isRootEnabled__version___accountId__instances__instanceId__root_.html
       curl -i \
       -H 'X-Auth-Token: YOUR_AUTH_TOKEN' \
       -H 'Content-Type: application/json' \
       'https://ord.databases.api.rackspacecloud.com/v1.0/YOUR_ACCOUNT_ID/instances/YOUR_INSTANCE_ID/root'

   If the root user is enabled, you see the following output:

       {
           "rootEnabled": true
       }

   **Note**: The primary difference between step 3 and 4 is that enabling the root user is done with
   a POST request and confirmation is done with a GET request.

The final step of this process is to connect to your Cloud Databases instance with the root credentials and then
to set the `max-connections` value of your choosing. Keep in mind that this setting does not carry forward
when you restart your Cloud Databases instance.

