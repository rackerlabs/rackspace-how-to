---
permalink: manually-configure-android-devices-for-email-hosted-on-exchange-2010/
audit_date:
title: Manually configure Android devices for email hosted on Exchange 2010
type: article
created_date: '2013-09-20'
created_by: Marco Salazar
last_modified_date: '2016-01-27'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

The following steps are required to configure Microsoft Exchange 2010 on
most Android devices:

**Note:** Before you can begin, your administrator must
[Add an ActiveSync license](/how-to/add-an-activesync-or-bes-license)
and assign it to your email address.

1. Tap the **Settings** icon, and then tap **Accounts and Sync**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/1.%20Settings.png %}" width="217" height="386" />
   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/2.%20Accounts%20and%20Sync.png %}" width="217" height="386" />

2. Tap the **Add** icon, and then tap **Exchange ActiveSync**.

  <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/3.%20Add.png %}" width="217" height="386" />
  <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/4.%20Exchange%20ActiveSync.png %}" width="217" height="386" />

3. Enter your email address and password, and then tap **Manual
   setup**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/5.%20Manual%20Setup.png %}" width="217" height="386" />

4. On the next page, enter the rest of the necessary information and
   then tap **Next**:

   - **Email address**: Enter your email address (for
     example, **test@example.org**).

   - **Server address**: Enter **connect.emailsrvr.com**.

   - **Domain**: Leave this field blank.

   - **Username**: Enter your email address again.

     Some devices might have the settings as domain\\username. On
     those devices, the field should have a backslash (**\\**) before
     your email address (for example, **\\test@example.org**).

   - **Password**: Enter your password.

   - Select **This server requires an encrypted SSL connection**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/6.%20Server%20Settings%20Exchange.png %}" width="217" height="386" />

5. If you are prompted to enable remote security administration, tap
   **Ok** or **Allow**.
   This allows you to remotely perform a factory reset (delete
   all data) on the device from Outlook Web App if the phone is lost or
   stolen and there is sensitive company information on the device.

6. Select the services that you want to synchronize with the Exchange
   server and when to synchronize. Then, tap **Next**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/7.%20Sync%20Options.png %}" width="217" height="386" />

7. Enter a descriptive name for your account and then tap **Finish
   setup**.

   <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2010/8.%20Finalize.png %}" width="217" height="386" />

Your Android phone and Microsoft Exchange account are now synchronized.
