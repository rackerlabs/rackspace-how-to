---
permalink: email-issue-on-android-phones/
audit_date: '2018-01-16'
title: Email issue on Android phones
type: article
created_date: '2015-03-31'
created_by: Rose Contreras
last_modified_date: '2018-01-16'
last_modified_by: Nate Archer
product: Rackspace Email
product_url: rackspace-email
---

If you are an Android mobile phone user, you might sometimes experience problems sending or receiving email.  Attempts to receive email might be faster than normal (such as when a connection is successful, but no new email is found).  Attempts to connect to the outgoing server might fail without error or result in the following error message:

`Unable to connect to email server to verify you account information. No response from server.`

The procedure in this article was created by the Rackspace Technical Community team as a temporary solution to this issue. A more permamnent solution is being investigated.

**Note:** The procedure might be different for each Android mobile phone. The instructions in this article were created using a Galaxy Note 3.

### Access Point Name

The Access Point Name (APN) is a gateway between a GPRS, 3G, or 4G mobile network and another computer network that runs on many Android devices. The outgoing email problem on Android phones occurs because the APN, which for T-Mobile is `fast.t-mobile.com`, is set to use IPv6 only and does not allow the outbound email server to respond. This in turn keeps emails on Android phones in the outbox until it connects to a Wi-Fi network. The default APN doesn't roll back to IPv4, so the SMTP connection cannot be made. The way to fix this is to add a new APN that does roll back to IPv4.

**Note:** You might experience no problems when accessing the default APN for other uses, such as browsing websites or using network-connected apps. 

### Before you add a new APN

Ensure that your Android mobile phone meets the following requirements:

- It has the latest Android OS using POP3.
- The SMTP server, security type, and port are all entered correctly.
- It can establish a connection with the incoming server.

Additionally, confirm that the email settings on your Android phone match the following settings:

- **Incoming:** secure.emailsrvr.com. Use SSL port 995.

- **Require Auth:** Username (Full Email Address) and password.

- **Outgoing:** secure.emailsrvr.com. Use SSL port 465.

- **Require Auth:** Username (Full Email Address) and password.

### Add a new APN

1. On your phone, navigate to **Settings > More Networks**.

    <img src="{% asset_path rackspace-email/outgoing-email-issue-on-android-phones/1710-4631_1_2.png %}" width="270" height="283" border="1" alt=""  />

2. Go to **Mobile Networks > Access Point Names**.

    <img src="{% asset_path rackspace-email/outgoing-email-issue-on-android-phones/1710-4631_2_1.png %}" width="268" height="268" border="1" alt=""  />

    Only one APN should be listed.

    <img src="{% asset_path rackspace-email/outgoing-email-issue-on-android-phones/1710-4631_3_1.png %}" width="270" height="114" border="1" alt=""  />

3. To add another APN, tap the **&#43;** symbol and specify the following settings only:

    - **Name:** Fast

    - **APN:** fast.t-mobile.com

    - **APN Protocol:** IPv4/IPv6

4. Select the new APN.

    <img src="{% asset_path rackspace-email/outgoing-email-issue-on-android-phones/1710-4631_4_1.png %}" width="268" height="128" border="1" alt=""  />

5. Restart your phone.

### Additional suggestions

You can also try a different email client. Several Rackspace customers and colleagues have reported success with [CloudMagic](https://cloudmagic.com).

If you've tried these solutions and are still having problems sending email from your mobile phone, the Rackspace Cloud Office support team will work with you to resolve your specific account and configuration issues. Contact them at 1 888 850 3994.
