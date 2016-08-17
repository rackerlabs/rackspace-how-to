---
permalink: migrating-from-parse-to-rackspace/
audit_date:
title: Migrating From Parse To Rackspace
type: article
created_date: '2016-03-25'
created_by: Amanda Clark
last_modified_date: '2016-08-17'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article assumes you have already migrated your database from Parse to ObjectRocket. If you have not, you can find more information [here.](https://objectrocket.com/parse)

### Deploy the Parse stack

From the [Cloud Control Panel](https://mycloud.rackspace.com), go to the **Orchestration** tab and click on **Stack Templates**. Select **Parse** from the list, then click **Create Stack**.

Or, [click here](https://mycloud.rackspace.com/cloud/servers#templates/orchestrationTemplates,cloudOrchestrationTemplates/parse/rackspace) to go directly to the Parse template.

On the Create Stack page, enter your Parse site domain and email address. Optionally, you can also add Git repository information and your custom code will be automatically pulled and installed on your server.  

### Configure your new server

After the stack has been successfully created you will need to configure your database authentication information.

1. Log on to the server via SSH either as `root` using the SSH key provided, or as `parse` using the password provided.

   Additional information on the server login process can be found [here](how-to/connecting-to-linux-from-mac-os-x-by-using-terminal) for Mac/Linux users or [here](how-to/connecting-to-linux-from-windows-by-using-putty) for Windows users.

2. After you have logged in to the primary server, modify `/home/parse/ecosystem.json` with your
   - MongoDB Connection String
   - Application ID
   - Master Key

   The MongoDB Connection String can be found in the ObjectRocket Control Panel, listed as **Connect** under the instance you plan to use. The Application ID and Master Key values can be found in your **Parse.com** account under **App Settings > Security and Keys**.  Any other application-specific keys are optional. They should be left blank if not used.  

   Following is an example **ecosystem.json** config file:  

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

3. Parse must be restarted after any changes are made to **ecosystem.json**.  Do so by running the following two commands while logged in as the `Parse` user:

	    pm2 stop parse-wrapper
	    pm2 start ecosystem.json

   Repeat this step on all Parse servers created by this stack. These servers will be linked from the Stack page, which should be displayed after you create your stack. You can also select the **Orchestration** tab in the Cloud Control Panel, click on **Stacks** from the dropdown menu, and the click on the name of your stack. The `parse` password should be the same across all servers.

Custom code will likely need to be modified before it will run successfully. You can find more information about this process [here.](https://github.com/ParsePlatform/parse-server/wiki/Migrating-an-Existing-Parse-App#3-cloud-code). This stack already has all of the Cloud Code replacements installed.  

For debugging purposes, you can view the Parse logs at `/home/parse/.pm2/logs/`.

### Install and configure your certificate

After Parse is running, you can configure a valid certificate within NGINX by modifying `/etc/nginx/conf.d/<your_url>.conf`, where `<your_url>` is replaced with the URL you provided when you deployed your Parse stack.

**Note:** If you need help installing your SSL certificate, see NGINX's information on [SSL certificate chains](http://nginx.org/en/docs/http/configuring_https_servers.html#chains).

Validate your SSL certificate by using the following command:

    nginx -t -c /etc/nginx/nginx.conf

If you do not have a valid certificate, you can purchase one through Rackspace if you are hosting a physical server with us. Please contact your Account Manager or Rackspace Support with further questions.

### Configure your Parse Dashboard

This stack also comes with Parse Dashboard, which enables you to visualize all the Parse applications running on your server. The Dashboard is configured separately from `parse-server`, and the configuration file is located in `/home/parse/parse-dashboard-config.json`. You must configure your Application ID and Master Key in this file in order to use Parse Dashboard.  

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

After you modify this file, you will need to restart the Parse Dashboard service by running the following command:

    service parse-dashboard restart
