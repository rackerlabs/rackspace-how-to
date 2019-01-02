---
permalink: manually-configure-android-devices-for-email-hosted-on-exchange-2013/
audit_date: '2016-09-12'
title: Manually configure Android devices for email hosted on Exchange 2013
type: article
created_date: '2014-01-31'
created_by: Mawutor Amesawu
last_modified_date: '2018-12-27'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

This article helps [email
hosting](https://www.rackspace.com/email-hosting/webmail) users to manually
configure Microsoft&reg; Exchange&reg; 2013 on most Android&trade; devices.

**Note:** For personalized user and server information and device-specific
instructions, use the [Email Help Tool](https://emailhelp.rackspace.com/).

### Before you begin

Your administrator must [add an ActiveSync
license](/how-to/add-an-activesync-or-bes-license) and assign it to your email
address.

### Configure your device

Use the following steps to configure your Android device:

1. On your device, tap the system **Settings** icon, as shown in the following
   image:

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/1.%20Settings_2.png %}" width="217" height="386" />

2. Tap **Accounts & sync** (**Accounts** on some devices), as shown in the
   following image:

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/2.%20Accounts%20and%20Sync_2.png %}" width="217" height="386" />

3. Tap **Add**, as shown in the following image:

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/3.%20Add_2.png %}" width="217" height="386" />

4. Tap **Exchange ActiveSync** (**Microsoft Exchange ActiveSync** on some
   devices), as shown in the following image:

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4.%20Exchange%20ActiveSync_2.png %}" width="217" height="386" />

5. Enter your email address and password, and then tap **Manual setup**, as
   shown in the following image:

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/5.%20Manual%20Setup_2.png %}" width="217" height="386" />

6. On the next page, enter information in the following fields, then tap
   **Next**:

   - **Email address**: Your email address (for example, **test@emailcompany.org**).
   - **Server address**: **mex06.emailsrvr.com** or **mex08.emailsrvr.com**.

     **Note:** Use the [Email Help Tool](https://emailhelp.rackspace.com/) to get the correct server address for your device.

   - **Domain**: Leave this field blank.
   - **Username**: Enter your email address again.

      **Note**: Some devices might combine the domain and username
      settings as domain\username. On those devices, precede your email
      address with a backslash (for example, **\test@emailcompany.org**).

   - **Password**: The password associated with your email address.
   - **This server requires an encrypted SSL connection**: Select this option.

7. If you're prompted to enable remote security administration, tap **OK** or
   **Allow**.

    If the device is lost or stolen, this setting enables you to remotely
    perform a factory reset (delete all data) on the device from the Outlook
    Web App (OWA).

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/4_40.png %}" width="217" height="386" />

8. Select the services that you want to synchronize with the Exchange server,
   and specify how often you want to synchronize, as shown in the following
   image. Then, tap **Next**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/7.%20Sync%20Options_2.png %}" width="217" height="386" />

9. Enter a descriptive name for your account as shown in the following image,
   then tap **Finish setup**.

    <img src="{% asset_path exchange/manually-configure-android-devices-for-email-hosted-on-exchange-2013/8.%20Finalize_1.png %}" width="217" height="386" />


<script type="application/ld+json">
  {
    "@context": "http://schema.org/",
    "@type": "HowTo",
    "name":"Manually configure Android devices for email hosted on Exchange 2013",
    "description": "This article helps email hosting users to manually configure Microsoft&reg; Exchange&reg; 2013 on most Android&trade; devices.",
    "step": [
      {
      "@type": "HowToSection",
      "name": "Before you begin",
        "position": "1",
      "itemListElement": "Your administrator must add an ActiveSync license and assign it to your email address."
      },{
      "@type": "HowToSection",
      "name": "Configure your device",
        "position": "2",
        "itemListElement": [
     		{
          "@type": "HowToStep",
          "position": "1",
     		  "text": "On your device, tap the system Settings icon."
     		},{
          "@type": "HowToStep",
          "position": "2",
          "text": "Tap Accounts & sync."
     		},{
          "@type": "HowToStep",
          "position": "3",
          "text": "Tap Add."
          }]
    }]}
</script>
