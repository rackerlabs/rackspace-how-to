---
permalink: deleting-and-resending-blackberry-service-books-bes/
audit_date:
title: Delete and resend BlackBerry&reg; Service Books - (BES)
type: article
created_date: '2011-04-21'
created_by: Rackspace Support
last_modified_date: '2016-05-17'
last_modified_by: Stephanie Fillmon
product: Microsoft Exchange
product_url: exchange
---

Service books determine which services are available on your BlackBerry&reg; device.  At
times, the service books become corrupt and can cause the Blackberry Enterprise Server (BES)
to fail upon synchronizing updates of PIM data such as calendar or address book entries.
These issues are frequently resolved by deleting and resending the service books to the
device. If this happens to a user, have the user delete all their service books starting
with the "Desktop" from their Blackberry device. After all service books are deleted, resend
the service books from your Cloud Office Control Panel.

### Delete service books

To delete the service books, follow the steps for your model of Blackberry:

#### Blackberry Curve

1. Choose **Device Settings > Options > Advanced Options**.
2. Click **Service Books** and highlight a service book.
3. Press the **Menu** key, click **Delete** and confirm **Delete**.

#### Blackberry Torch

1. On the **Home** screen or in a folder, click the **Options** icon.
2. Click **Device > Advanced System Settings > Service Book**.
3. Highlight a service book and Press the **Menu** key.
4. Click **Delete** and confirm **Delete**.

### Resend service books

After the service books have been removed from the device,
resend them to the device by using the Cloud Office Control Panel:

1. Mouse over the **Go to section** drop-down menu and select
   **Microsoft Exchange**.

   <img src="{% asset_path exchange/deleting-and-resending-blackberry-service-books-bes/eaDeleting&ResendingBBServiceBooks1.png %}" alt="" />

2. In the **Email Accounts** section, click the **Mobile Messaging** link.

   <img src="{% asset_path exchange/deleting-and-resending-blackberry-service-books-bes/eaDeleting&ResendingBBServiceBooks2.png %}" alt="" />

3. If you have multiple domains, select the appropriate domain name.

   To change domains at any time, click the **Change Domain** link.

4. Under **BlackBerry**, click the **View Users** link.

5. Click the user's **Display Name**.

6. Under **Resend Service Books**, click the **Send to Device** button.

   <img src="{% asset_path exchange/deleting-and-resending-blackberry-service-books-bes/eaDeleting&ResendingBBServiceBooks3.png %}" alt="" />

After you resend the service books, you can confirm that they have been received by going
back to the **Options** section of the user's BlackBerry as described above.
