---
permalink: manually-configure-ios-devices-for-email-hosted-on-exchange-2013/
audit_date:
title: Manually configure iOS devices for email hosted on Exchange 2013
type: article
created_date: '2014-01-16'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-28'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article describes how to configure an Exchange 2013 account on your
Apple iOS device.  The administrator of your account must verify that an
ActiveSync license is attached in your account via the Cloud Control
Panel.  If any Internet connectivity issues prevent you from
successfully setting up Exchange, contact your wireless provider or
ISP.

**Note:**  The images in this article show iPhone 5 running iOS 7.  Though
screens on other iOS devices will differ, the process is the same.

1. On the home screen of your device, tap **Settings &gt;** **Mail,
   Contacts, Calendars** &gt; **Add Account**.

   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/1.PNG %}" width="256" height="454" />
   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/2.PNG %}" width="256" height="454" />
   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/3.PNG %}" width="256" height="454" />

2. Tap **Exchange** and enter your email address , password, and an
   optional description. Tap **Next**.

   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/4.PNG %}" width="256" height="454" />
   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/5.PNG %}" width="256" height="454" />

3. Make your selections and tap **Save**.

   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/6.PNG %}" width="256" height="454" />
   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/7.PNG %}" width="256" height="454" />

   **Note:** If autodiscovery is not configured on your domain, the device
   displays the server settings page. Perform the following steps to
   complete your configuration.

4. On the server settings page, tap the **Server** field and enter
   **mex06.emailsrvr.com**. Leave the **Domain** field blank.
   Then click **Next**.

   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/8.PNG %}" width="256" height="454" />

5. Select the services that you want to synchronize from the Exchange
   server. Then tap **Save**.

   <img src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2013/7.PNG %}" width="256" height="454" />

You have successfully added your Exchange email account on your iOS
device.

**Note:** Depending on how much data is in the mailbox, it might take some
time before your information is completely downloaded into your device.
