---
permalink: rackspace-email-protection-from-external-images-in-webmail/
audit_date:
title: Protection from external images in Webmail
type: article
created_date: '2015-10-19'
created_by: Beau Bailey
last_modified_date: '2015-10-29'
last_modified_by: Renee Rendon
product: Rackspace Email
product_url: rackspace-email
---

Email can contain links that are hosted on a separate server from your
email. To display one of these images, your email client makes a request
to the image server. This request can include your IP address, browser
version, and any cookies that the image server has set. Taken together,
the server can use this information to track your online behavior.

To provide protection against this common practice, you can control
external image tracking in Webmail. When you read an email that links to
images hosted on a separate server from your email, the images are not
displayed by default. Instead, a caution bar is displayed at the top of
the email (as shown in the following screenshot), and you can click that
bar to display the images.

<img src="{% asset_path rackspace-email/rackspace-email-protection-from-external-images-in-webmail/Image%20Protection-1_0.jpg %}" width="600" height="429" />

If you understand the risks and would prefer to have images always
loaded by default, you can disable the blocking in Webmail Settings.

1.  In the Settings dialog box, click **General Settings**.
2.  On the **Email Options** tab, clear the **Block external images**
    check box.
3.  Click **Save**.

<img src="{% asset_path rackspace-email/rackspace-email-protection-from-external-images-in-webmail/ImageProtectionWebmail.png %}" width="594" height="273" />

You can re-enable external image blocking at any time.
