---
permalink: migrating-from-parse-to-rackspace/
audit_date: '2017-01-26'
title: Migrating From Parse To Rackspace
type: article
created_date: '2016-03-25'
created_by: Amanda Clark
last_modified_date: '2017-01-26'
last_modified_by: Chris Hultin
product: Cloud Servers
product_url: cloud-servers
---

This article provides instructions for migrating your Parse database to Rackspace. It
assumes that you have already migrated your database from Parse to ObjectRocket. If
you have not, you can find more information [on the ObjectRocket website.](https://objectrocket.com/parse)

### Deploy the Parse stack

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. In the top navigation bar, click **Orchestration** > **Stack Templates**.

3. In the All Stacks list, scroll to **Parse** and click **Create Stack**.

4. In the pop-up box, choose the flavor and then click **Create Stack**.

5. On the Create Stack page, enter a name and region for the stack, and enter your Parse site domain and email address. 

6. (Optional) To automatically pull in and install your custom code on the new server, enter GitHub repository information.

7. Click **Create Stack**.

   On the stack details page, a green **Up** status in the Status field indicates when the stack is active. 
 

### Configure the new server

After the stack has been successfully created, configure your database authentication information. Repeat this procedure on all Parse servers created in the stack. These servers are linked from the stack details page, which is displayed after you create the stack. The parse password should be the same for all servers.

1. Log in to the new primary server via SSH either as `root` by using the SSH key provided or as `parse` by using the password provided.

   For more information about logging in to a server, see [Connect to a cloud server](/how-to/connect-to-a-cloud-server/).

2. Edit the **/home/parse/parse.json** configuration file to add the following values:

  - MongoDB Connection String
  - Application ID
  - Master Key

  You can find the MongoDB Connection String value in the ObjectRocket Control Panel, listed as **Connect** under the instance that you plan to use. The Application ID and Master Key values are in your Parse.com account under **App Settings** > **Security and Keys**. Any other application-specific keys are optional. Leave them blank if you aren’t going to use them.

   Following is an example **parse.json** config file:  

	    {
		  "apps" : [{
          "name"        : "parse-wrapper",
          "script"      : "/usr/local/bin/parse-server",
          "watch"       : true,
          "merge_logs"  : true,
          "cwd"         : "/home/parse",
          "env": {
            "PARSE_SERVER_CLOUD_CODE_MAIN": "/home/parse/cloud/main.js",
            "PARSE_SERVER_DATABASE_URI": "mongodb://user:password@ip:27017/db",
            "PARSE_SERVER_APPLICATION_ID": "your_application_id",
            "PARSE_SERVER_MASTER_KEY": "your_master_key",
            "PARSE_SERVER_COLLECTION_PREFIX": "collection_prefix",
            "PARSE_SERVER_CLIENT_KEY": "your_client_key",
            "PARSE_SERVER_REST_API_KEY": "your_rest_key",
            "PARSE_SERVER_DOTNET_KEY": "your_dotnet_key",
            "PARSE_SERVER_JAVASCRIPT_KEY": "your_javascript_key",
            "PARSE_SERVER_FILE_KEY": "your_file_key",
            "PARSE_SERVER_FACEBOOK_APP_IDS": "app1, app2, app3",
            "PARSE_MOUNT": "/1",
            }
          }]
        }

3. Restart Parse by running the following, commands while logged in as the `parse` user:

	    pm2 stop 'Your Application'
	    pm2 start parse.json


You will likely need to modify custom code for it to run successfully. You can find more information about this process on the [Parse website](https://parse.com/migration). The Parse stack already has all of the Cloud Code replacements installed. 

For debugging purposes, you can view the Parse logs at `/home/parse/.pm2/logs/`.


### Install and configure your certificate

After Parse is running, you can configure a valid certificate within NGINX. If you do not
have a valid certificate, you can purchase one through Rackspace if you are hosting a
physical server with us. If you have questions, contact your Account Manager or
Rackspace Support.

1. Modify `/etc/nginx/conf.d/<your_url>.conf`, where `<your_url>` is the URL that you provided when you deployed your Parse stack.

  If you need help installing your SSL certificate, see NGINX's information on [SSL certificate chains](http://nginx.org/en/docs/http/configuring_https_servers.html#chains).

2. Validate your SSL certificate by using the following command:

       nginx -t -c /etc/nginx/nginx.conf


### Configure the Parse dashboard

The Parse stack also comes with a Parse dashboard, which enables you to visualize all
the Parse applications running on your server. The dashboard is configured separately
from the server.

1. Edit the `/home/parse/parse-dashboard-config.json` configuration file and add the Application ID and Master Key values.

  Following is an example `parse-dashboard-config.json` file:

	  {
	   "apps": [
	       {
	         "serverURL": "https://your_api_url/parse",
	         "appId": "your_application_id",
	         "masterKey": "your_master_key",
	         "appName": "Your Application"
	       }
	     ]
	   }

2. Restart the Parse dashboard service by running the following command (as `root`):

       service parse-dashboard restart
