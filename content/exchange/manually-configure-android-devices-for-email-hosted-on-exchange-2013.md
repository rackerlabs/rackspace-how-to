---
permalink: manually-configure-android-devices-for-email-hosted-on-exchange-2013/
audit_date:
title: Manually configure Android devices for email hosted on Exchange 2013
type: article
created_date: '2014-01-31'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-27'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

The following steps are required to configure Microsoft Exchange 2013 on
most Android devices:

**Note:** Before you can begin, your administrator must
[Add an ActiveSync license](/how-to/add-an-activesync-or-bes-license)
and assign it to your email address.

1.  Tap on the system **Settings**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/1.%20Settings_2.png %}" width="217" height="386" />


2.  Tap **Accounts and Sync** (**Accounts** on some devices).

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/2.%20Accounts%20and%20Sync_2.png %}" width="217" height="386" />



3.  Tap on **Add**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/3.%20Add_2.png %}" width="217" height="386" />


4.  Select **Exchange ActiveSync **(**Microsoft Exchange ActiveSync** on
    some devices).

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4.%20Exchange%20ActiveSync_2.png %}" width="217" height="386" />

5.  Fill in your email address and password and tap **Manual Setup**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/5.%20Manual%20Setup_2.png %}" width="217" height="386" />


6.  On the next page, add in the rest of the necessary information:

    -   Email address: your email address (for example, **test@example.org**)
    -   Server Address: **mex06.emailsrvr.com**
    -   Domain: (**Leave this blank**)
    -   Username: your email address again.
    -   Some devices may have the settings as domain\\username. On those
        Devices the field should have a "**\\**" before your
        email address. (for example, **test@example.org**)
    -   Select **This server requires an encrypted SSL connection**.

    With the information filled in, click **Next**. You may be prompted
    to Enable Remote Security Administration. Press **Ok** or **Allow**.
    This allows you to remotely perform a factory reset (Delete
    all data) on the device from OWA (Outlook Web App) in the event that
    the phone is lost or stolen and there is sensitive company
    information within the device.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4_40.png %}" width="217" height="386" />

7.  Next select the services you wish to sync with the Exchange server
    and when to sync. Tap **Next**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/7.%20Sync%20Options_2.png %}" width="217" height="386" />

8.  Give your account a descriptive name and tap **Finish Setup**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/8.%20Finalize_1.png %}" width="217" height="386" />
