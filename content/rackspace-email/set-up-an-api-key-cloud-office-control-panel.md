---
permalink: set-up-an-api-key-cloud-office-control-panel/
audit_date: '2019-02-27'
title: Set up an API key in the Cloud Office Control Panel
type: article
created_date: '2014-04-02'
created_by: Mawutor Amesawu
last_modified_date: '2019-02-28'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

The Rackspace Email application programming interface (API) provides most of the functions of the control
panel through a REST-based web API. The API allows you to programmatically administer common tasks by using your own application to perform common tasks such as adding mailboxes and more. You can apply these changes independently of your
application's language or nature. Detailed documentation for using the API is located
at
[http://api-wiki.apps.rackspace.com/api-wiki/index.php/RestAPI](http://api-wiki.apps.rackspace.com/api-wiki/index.php/RestAPI).

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** 5 minutes
- **Tools required:** Super admin access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

To implement the API into your application, you must first generate an
API key. API keys are unique to each administrator. To differentiate
human actions and application actions, consider creating a separate
administrator login for your API. Only super administrators will have
access to the API.

### To generate an API key

Use the following steps to generate an API key:

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com).
2. At the top of the page, click your account name and select **My Profile** from the menu.
3.  Click **Generate API Keys** to create new API keys or **View API Keys** if you have existing API keys. When viewing existing API keys, you have the option to generate new API keys.

    **Warning:** If you are using existing keys, generating new
    keys breaks applications that are using the existing keys.

**Important:** Avoid recording the API key information outside of the control
panel. This information allows unrestricted access to make changes to
your account. Use extreme discretion when using these keys.

No further action is needed in the control panel. You can now develop
applications for your account.
