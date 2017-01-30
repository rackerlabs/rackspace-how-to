---
permalink: set-up-autodiscover-for-outlook/
audit_date:
title: Set up Autodiscover for Outlook
type: article
created_date: '2016-10-25'
created_by: Aaron Medrano
last_modified_date: '2016-11-25'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: exchange
---


In order for certain features on your Exchange account to work with Outlook, you must set up your domain name with a special DNS record that points to the Rackspace Cloud Office Autodiscover server.

**Note:** Autodiscover is not compatible with Outlook 2011, Outlook 2016, or Mac Mail when setting up an email account as POP or IMAP.


### Autodiscover outlook features

You must set up the Autodiscover record for your domain name in order to have the following Exchange features:

- Free/busy information for calendar scheduling

- Out of office setup and management through Outlook

- Offline address book synchronization

- Sharing calendars, contacts, and folders using a sharing invitation within Outlook

- Access to Public Folders in Exchange 2013 and Exchange 2016

- Automatic mapping of shared mailboxes

**Note:** You can use the Outlook Web App to set up automatic out-of-office replies without Autodiscover.

### Set up the Autodiscover DNS record

To set up the Autodiscover DNS record, see [Set up DNS records for Cloud Office email and Skype for Business](https://support.rackspace.com/how-to/set-up-dns-records-for-cloud-office-email-and-skype-for-business/#autodiscover-records).

### Test Autodiscover functionality in Outlook

To determine if the Autodiscover service is configured properly,  use the Test E-mail AutoConfiguration tool in Outlook.

1. While Outlook is running, press and hold down the **CTRL** key, and then right-click the Outlook icon in the system tray or notification area on the lower-right corner of the screen.

2. From the menu, select **Test E-mail AutoConfiguration**.

    <img src="{% asset_path exchange/set-up-autodiscover-for-outlook/autodiscover1.png %}" alt="" />

3. Enter your email address and password.

4. Clear the **Use Guessmart** and **Secure Guessmart Authentication** check boxes.

    Ensure that the Use Autodiscover check box is selected.

5. Click test.

    The result tab shows that Autodiscover is detected.
    <img src="{% asset_path exchange/set-up-autodiscover-for-outlook/autodiscover2.png %}" alt="" />


    You can also click the **Log** tab for the following lines:

      - `Redirect Check`

      - `Autodiscover to https://secure.autodiscover.emailsrvr.com/autodiscover/autodiscover.xml starting`

      - `Autodiscover to https://secure.autodiscover.emailsrvr.com/autodiscover/autodiscover.xml Succeeded (0x00000000)`
