---
permalink: manually-configure-ios-devices-for-email-hosted-on-exchange-2010/
audit_date:
title: Manually configure iOS devices for email hosted on Exchange 2010
type: article
created_date: '2013-11-20'
created_by: Mawutor Amesawu
last_modified_date: '2015-03-05'
last_modified_by: Rose Contreras
product: Microsoft Exchange
product_url: exchange
---

Use the procedure in this article to configure a Microsoft Exchange 2010 account on your Apple iOS device. The administrator of your account must add an ActiveSync license to your mailbox through the [Administrative Control Panel](https://cp.rackspace.com/Login.aspx). Check with your wireless provider or Internet service provider to troubleshoot any Internet connectivity issues that prevent you from completing this setup.

**Note:** The images in this article are from an iPhone 5s running iOS 7. Although the screens on other iOS devices differ in appearance, the process is the same.

1.	Log in to the [User Control Panel](https://admin.emailsrvr.com/usercp/Login).

2.	Select **ActiveSync**.

    The popup box shows the server settings for your email account that you need to configure your iOS device.

3.	On the home screen of your phone, tap **Settings**.


    <img alt="" border="1" height="332" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0016.PNG %}" width="221" />

4. Tap **Mail, Contacts, Calendars**.

    <img alt="" border="1" height="331" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0017.PNG %}" width="220" />

5. **Add Account**.

	<img alt="" border="1" height="331" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0018.PNG %}" width="220" />

6. Tap **Exchange**.

7. Enter your email address and password, and add a description of the account you are setting up. Then, tap **Next**.

    <img alt="" border="1" height="330" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0038.PNG %}" width="220" />&nbsp; <img alt="" height="330" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0027_1.PNG %}" width="219" />

    **Note:** The device verifies the account. If you receive a message stating `Unable to verify account information`, disregard the message and tap **OK**.

8.	On the server settings page, enter the following information if it is not already present:
    - **Email** - Enter your email address.

    - **Server** - Enter connect.emailsrvr.com.

    - **Domain** - Leave this field blank.

    - **Username** - Verify that your user name is exactly the same as your full email address.

    - **Password** - Enter your email account password.

    - **Description** - Enter a description of the account that you are setting up. This can be anything that helps you identify your account.


    <img alt="" border="1" height="330" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/mex05_0.PNG %}" width="221" />

9. Tap **Save**.

10.	Tap **Next**.

    Your device creates a secure (SSL) connection to the Exchange server. When the device is connected, check marks appear confirming that your settings have been verified.

11.	Select the services that you want to sync with the Exchange Server by swiping the **ON/OFF** buttons next to each service. Tap **Save** when you are done.

    <img alt="" border="1" height="330" src="{% asset_path exchange/manually-configure-ios-devices-for-email-hosted-on-exchange-2010/IMG_0034_1.PNG %}" width="220" />

    You have successfully added your Exchange email account on your iOS device.

**Note:** Depending on how much data is in the mailbox, it might take some time before your information is completely downloaded to your device.

<p>&nbsp;</p>
