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
"text":"Manually configure Android devices for email hosted on Exchange 2013",
"description": "This article helps email hosting users to manually configure Microsoft® Exchange® 2013 on most Android™ devices.",
"step": [{
	"@type": "HowToStep",
	"text": "On your device, tap the system Settings icon",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/1.%2520Settings_2-64b16cf54ec7d0ccd084d67bb469496e8eb084a558f7275e3d7a7bf728b5d77d.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "Tap Accounts & sync (Accounts on some devices)",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/2.%2520Accounts%2520and%2520Sync_2-905591f06054d66b76dabe9f500324aa42f62e659444b42603d1b6051782e163.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "Tap Add",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/3.%2520Add_2-e1f28f13676dbddf257a19092e62a4aee0cf1287c97ba09d22c896216cdb25ad.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "Tap Exchange ActiveSync (Microsoft Exchange ActiveSync on some devices)",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/4.%2520Exchange%2520ActiveSync_2-e1b6999cdbd102cef427b9efc41156c1acbe2a2f9544b6e6e60878ce81e96bb7.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "Enter your email address and password, and then tap Manual setup",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/5.%2520Manual%2520Setup_2-71c55dbdf63a55ffe48e19d5f7bf7c683686b3ee0b6f20782352b10a85d290f3.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "On the next page, enter information in the following fields, then tap Next",
	"itemListElement": [{
		"@type": "HowToDirection",
		"text": "Email address: Your email address (for example, test@emailcompany.org)."
		},{
		"@type": "HowToDirection",
		"text": "Server address: mex06.emailsrvr.com or mex08.emailsrvr.com."
		},{
		"@type": "HowToTip",
		"text": "Use the Email Help Tool to get the correct server address for your device."
		},{
		"@type": "HowToDirection",
		"text": "Domain: Leave this field blank."
		},{
		"@type": "HowToDirection",
		"text": "Username: Enter your email address again."
		},{
		"@type": "HowToTip",
		"text": "Some devices might combine the domain and username settings as domain\\username. On those devices, precede your email address with a backslash (for example, \\test@emailcompany.org)."
		},{
		"@type": "HowToDirection",
		"text": "Password: The password associated with your email address."
		},{
		"@type": "HowToDirection",
		"text": "This server requires an encrypted SSL connection: Select this option."
	}]},{
	"@type": "HowToStep",
	"text": "If you’re prompted to enable remote security administration, tap OK or Allow.",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/4_40-862b7fcac44e386d3a34ebda05af1b976afe25cdb07843916d17b9518898e4eb.png",
		"height": "386",
		"width": "217"
	},
	"itemListElement": [{
		"@type": "HowToTip",
		"text": "If the device is lost or stolen, this setting enables you to remotely perform a factory reset (delete all data) on the device from the Outlook Web App (OWA)."
	}]},{
	"@type": "HowToStep",
	"text": "Select the services that you want to synchronize with the Exchange server, and specify how often you want to synchronize, as shown in the following image. Then, tap Next.",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/7.%2520Sync%2520Options_2-e044a45cec024e00bf6fd4fc9e0fcf862fd8a67d13c8b7e14ae2c7fb374ba7ba.png",
		"height": "386",
		"width": "217"
	}},{
	"@type": "HowToStep",
	"text": "Enter a descriptive name for your account as shown in the following image, then tap Finish setup.",
	"image": {
		"@type": "ImageObject",
		"url": "https://657cea1304d5d92ee105-33ee89321dddef28209b83f19f06774f.ssl.cf1.rackcdn.com/8.%2520Finalize_1-58e510177b823ebaad7720278fa41feeca56bb57308d099ec65458c3058f8a46.png",
		"height": "386",
		"width": "217"
}}]}
