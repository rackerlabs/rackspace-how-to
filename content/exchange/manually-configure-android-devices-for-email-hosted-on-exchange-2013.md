---
permalink: manually-configure-android-devices-for-email-hosted-on-exchange-2013/
audit_date: '2016-09-12'
title: Manually configure Android devices for email hosted on Exchange 2013
type: article
created_date: '2014-01-31'
created_by: Mawutor Amesawu
last_modified_date: '2016-09-13'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article describes how to manually configure Microsoft Exchange 2013 on most Android devices.

**Note:** To get specific user and server information, and specific device instructions, use the [Email Help Tool](https://emailhelp.rackspace.com/).

### Before you begin

Your administrator must [add an ActiveSync license](/how-to/add-an-activesync-or-bes-license) and assign it to your email address.

### Configure your device

1. On your device, tap on the system **Settings** icon.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/1.%20Settings_2.png %}" width="217" height="386" />

2. Tap **Accounts & sync** (**Accounts** on some devices).

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/2.%20Accounts%20and%20Sync_2.png %}" width="217" height="386" />

3. Tap **Add**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/3.%20Add_2.png %}" width="217" height="386" />

4. Tap **Exchange ActiveSync** (**Microsoft Exchange ActiveSync** on some devices).

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4.%20Exchange%20ActiveSync_2.png %}" width="217" height="386" />

5. Enter your email address and password, and then tap **Manual setup**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/5.%20Manual%20Setup_2.png %}" width="217" height="386" />

6. On the next page, enter the rest of the necessary information, and then tap **Next**.

   - Email address: Your email address (for example, **test@emailcompany.org**)
   - Server address: **mex06.emailsrvr.com** or **mex08.emailsrvr.com**.

     **Note:** Use the [Email Help Tool](https://emailhelp.rackspace.com/) to get the correct server address for you device.

   - Domain: Leave this field blank.
   - Username: Your email address again.
   - Some devices might combine the domain and username the settings as domain\username. On those devices, precede your email address with a backslash (for example, **\test@emailcompany.org**).
   - Password: Password for you email address.
   - Select **This server requires an encrypted SSL connection**.

7. If you are prompted to enable remote security administration, tap **OK** or **Allow**.

   This setting enables you to remotely perform a factory reset (delete all data) on the device from the Outlook Web App (OWA) if the device is lost or stolen.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4_40.png %}" width="217" height="386" />

8. Select the services that you want to synchronize with the Exchange server, and specify how often you want to synchronize. Then, tap **Next**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/7.%20Sync%20Options_2.png %}" width="217" height="386" />

9. Enter a descriptive name for your account, and then tap **Finish setup**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/8.%20Finalize_1.png %}" width="217" height="386" />
