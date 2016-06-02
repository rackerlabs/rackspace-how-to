---
permalink: enable-or-disable-logging-in-rackspace-cdn/
audit_date:
title: Enable or disable logging in Rackspace CDN
type: article
created_date: '2015-05-11'
created_by: Catherine Richardson
last_modified_date: '2015-05-18'
last_modified_by: Kyle Laffoon
product: Rackspace CDN
product_url: rackspace-cdn
---

To enable or disable logging for a Rackspace CDN service, follow these
steps. By default, logging in is disabled when you create a service.

1. Access Rackspace CDN as described in [Access Rackspace
CDN](/how-to/access-rackspace-cdn).

2. In the list of CDN services, click the name of the service for which
you want to enable or disable logging.

3. In the **Service Details** section, click **Enable Logging**. A popup
dialog box appears. Note the information about managing the data that is
stored.

  <img src="{% asset_path rackspace-cdn/enable-or-disable-logging-in-rackspace-cdn/EnableLogging.png %}" width="468" height="229" />

4. To turn logging on, click the **Enable Logging** button. The
**Service Status** is **Pending** until the value for **Logging**
changes to **Enabled**.

5. After logging is enabled, click **View Logs** to see the logs.
Another instance of the Cloud Control Panel opens. After logging in, you
see the logs in the Cloud Files container, .CDN\_ACCESS\_LOGS.

6. To disable logging, click **Disable Logging** beside **Logging** in
the **Service Details** section of the CDN service page. Then, click
**Disable Logging** again in the dialog box that opens. Note the
information that is displayed in the dialog box about created logs.

   <img src="{% asset_path rackspace-cdn/enable-or-disable-logging-in-rackspace-cdn/DisableLogging.png %}" width="449" height="206" />

### Additional resources

- [Create and manage restrictions in Rackspace CDN](/how-to/create-and-manage-restrictions-in-rackspace-cdn)
- [Rename a Rackspace CDN service](/how-to/rename-a-rackspace-cdn-service)
