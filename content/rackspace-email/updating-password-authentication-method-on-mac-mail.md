---
permalink: updating-password-authentication-method-on-mac-mail/
audit_date:
title: Update the password authentication method for Mac Mail
type: article
created_date: '2013-05-29'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-18'
last_modified_by: Kyle Laffoon
product: Rackspace Email
product_url: rackspace-email
---

To ensure that the settings for Mac Mail are correctly configured, perform the following steps:

1. In Mac Mail, go to **Mail &gt; Preferences**.

    <img src="{% asset_path rackspace-email/updating-password-authentication-method-on-mac-mail/1_49.png %}" width="268" height="236" />

2. Click the **Accounts** tab.  
3. Under **Account Information**, click the drop-down button next to **Outgoing Mail Server** and select **Edit SMTP Server List**.

    <img src="{% asset_path rackspace-email/updating-password-authentication-method-on-mac-mail/2_46.png %}" width="549" height="572" />

4. Click the **Advanced** tab.

5. For **Authentication**, ensure **Password** is selected rather than **MD5 Challenge-Response**.

    <img src="{% asset_path rackspace-email/updating-password-authentication-method-on-mac-mail/3_44.png %}" width="551" height="570" />

6. Click **OK** to close the SMTP window, and then click **OK** again to close Preferences.

    <img src="{% asset_path rackspace-email/updating-password-authentication-method-on-mac-mail/4_37.png %}" width="552" height="568" />
