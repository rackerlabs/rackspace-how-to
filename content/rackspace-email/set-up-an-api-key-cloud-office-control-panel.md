---
permalink: set-up-an-api-key-cloud-office-control-panel/
audit_date:
title: Set up an API key in the Cloud Office Control Panel
type: article
created_date: '2014-04-02'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

The Rackspace Email API provides most of the functions of the control
panel through a REST-based web API. Whether you are adding a new
customer account (for resellers), adding mailboxes, or using any of the
other supported features, the API allows your application to administer
the changes. These changes can be applied independent of your
application's language or nature. Documentation for the API is located
at:
[http://api-wiki.apps.rackspace.com/api-wiki/index.php/RestAPI](http://api-wiki.apps.rackspace.com/api-wiki/index.php/RestAPI).

To implement the API into your application, you must first generate an
API key. API keys are unique to each administrator. To differentiate
human actions and application actions, consider creating a separate
administrator login for your API. Only super administrators will have
access to the API.

### To generate an API key

1. [Log in to the Cloud Office Control Panel](https://cp.rackspace.com).
1.  At the top of the page, click your account name and select **Admins & Contacts** from the menu.
1.  On the **Admins & Contacts** tab, click **API Keys**.
1.  Click **Generate New Keys** to create new API keys.

    **Warning:** If existing keys are being used, generating new
    keys will break applications that are using the existing keys.

**Note**: Avoid recording the API key information outside of the control
panel. This information allows unrestricted access to make changes to
your account. Use extreme discretion when using these keys.

No further action is needed in the control panel. You can now develop
applications for your account.
