---
permalink: add-self-service-password-recovery-to-your-rackspace-email-webmail-site/
audit_date:
title: Add self-service password recovery to your Rackspace Email Webmail site
type: article
created_date: '2014-11-26'
created_by: Brian Hazzard
last_modified_date: '2015-09-14'
last_modified_by: Kelly Holcomb
product: Rackspace Email
product_url: rackspace-email
---

You can enable Rackspace Email users to change their passwords without
contacting an administrator. To do this, you must first [enable mobile
phone collection for your private label Webmail
site](/how-to/enable-and-disable-collection-of-mobile-phone-numbers-in-rackspace-webmail). Then, you follow the steps in this
article to link to the self-service password recovery from your
Rackspace Email Webmail site login page.

### For direct customers

To link to the self-service password recovery, add a line of HTML code
to your private label login page, as follows:

1.  Log in to <https://cp.rackspace.com>.
2.  Click **Rackspace Email**.
3.  Click **Webmail Sites**.
4.  Click **Login/Logout Pages**.
5.  Add the following HMTL code between the `<body>` and `</body>` tags.

        <a href="/forgot-password" id="forgot_password">Forgot Password?</a>

6.  Click **Save**.

### For resellers

To link to the self-service password recovery, add a line of HTML code
to your private label login page, as follows:

1.  Log in to <https://cp.rackspace.com>.
2.  Click **Reseller Tools**.
3.  Click **Webmail Sites**.
4.  Choose a Webmail site and click **Customize**.
5.  Click **Login/Logout Pages**.
6.  Add the following HTML code between the `<body>` and `</body>` tags.

        <a href="/forgot-password" id="forgot_password">Forgot Password?</a>

7.  Click **Save**.
