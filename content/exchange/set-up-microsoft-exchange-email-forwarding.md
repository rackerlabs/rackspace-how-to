---
permalink: set-up-microsoft-exchange-email-forwarding/
audit_date: '2017-06-28'
title: Set up Microsoft Exchange email forwarding
type: article
created_date: '2017-06-07'
created_by: William Loy
last_modified_date: '2017-06-28'
last_modified_by: Nate Archer
product: Microsoft Exchange
product_url: exchange
---

This article describes how to forward a Microsoft Exchange mailbox to forward to another email address.

If you need to configure forwarding for a Rackspace Email mailbox, see [Set up forwarding for a Rackspace Email mailbox](/how-to/set-up-rackspace-email-forwarding/).

- [Forward to a mailbox on the same domain](#forward-to-a-mailbox-on-the-same-domain)
- [Forward to an external domain's email address](#forward-to-an-external-domains-email-address)
- [Forward to multiple email addresses](#forward-to-multiple-email-addresses)

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 10 minutes to set forward / Additional 15 minutes for forward to enable
- **Tools required:** [Cloud Office Control Panel](https://cp.rackspace.com) access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Forward to a mailbox on the same domain

Use the following steps to forward email from your Exchange address to another address on the same domain.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Mailboxes**.
3. Select the domain that contains the mailbox that you want to forward.
4. In the mailbox list, select the name of the mailbox that you want to forward.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-2.png %}" />

5. Click the **Mail Forwarding** tab. On Mail Forwarding page, select **Forward to an Exchange address within this domain**.
6. Select the address to which you want to forward email from the list.
7. Select the **Save copies of forwarded email** option.

    <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-3.png %}" />

    If **Save a copy of forwarded email** is not checked, this mailbox will _not_ store any messages sent to it.

8. Click **Save**. Allow at least 15 minutes for the forward to enable.

### Forward to an external domain's email address

To forward to a mailbox on an external domain, use the following steps to create a contact for the external domain, and then forward your Exchange mailbox to that contact.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Contacts**.
3. If you have multiple domains, select the domain that contains the mailbox that you want to forward.
4. Click **Add Contact**.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-contact-2.png %}" />

   Fill out the requested information in the fields provided.

    - **First Name and Last Name (optional):** Enter the first and last name of the new contact.
    - **Display Name:** Enter the name that is displayed in the Global Address List.
    - **Username:** Enter the **Contact address**. This is not a physical mailbox.
    - **External Email:** Enter the actual email address to which you want to forward email.

       <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-contact-3.png %}" />

5. Click **Save** to create the contact.
6. Click the **Mailboxes** tab.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-contact-4.png %}" />

7. In the mailbox list, select the name of the mailbox that you want to forward.
8. Click the **Mail Forwarding** tab. On the Mail Forwarding page, select **Forward to an Exchange address within this domain**.

   **Note:** Forwarding to an Exchange address within another domain on this account only works if both domains are on the same Exchange server. If you are not sure if both domains are on the same Exchange server, create a contact for the domain to which you want to forward.

9. Select the **Save copies of forwarded email** option.

    <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-contact-6.png %}" />

    If **Save a copy of forwarded email** is not checked, this mailbox _not_ store any messages sent to it.

10. Click **Save**. Allow at least 15 minutes for the forward to enable.

### Forward to multiple email addresses

Use the following steps to create a *Distribution List*, from which you can forward mail from an Exchange mailbox to multiple email addresses.

**Note**: Any address in your Distribution List that is not on your domain need to be made into a contact before that address can be added to the Distribution List. For instructions, see [the preceding section](#forward-to-an-external-domains-email-address).

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) using your Rackspace Cloud Office admin ID and password.
2. In the **Microsoft Exchange** section, click **Lists**.
3. Select the domain that contains the mailbox that you want to forward.
4. Click **Add Distribution List**.  

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-2.png %}" />

5. Fill out the required fields under **General**.

    - **Display Name:** Enter the name that is displayed in the Global Address List.
    - **Email Address:** Enter the **Distribution List Address**. This is not a physical mailbox. This is used forward to multiple email addresses inside the selected **Distribution List**.
    - **Members:** Enter the members that you want receive a copy of email sent to the Distribution List.

    <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-3.png %}" />

6. In the **Advanced** section, click **Selected addresses on this domain** and select the addresses you want to forward.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-4.png %}" />

7. Click **Create Distribution List**. The created list displays on the next page.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-5.png %}" />

8. Click the **Mailboxes** tab.

9. In the mailbox list, click the mailbox name that you want to forward.

   <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-6.png %}" />

10. Click the **Mail Forwarding** tab. On the Mail Forwarding page, select **Forward to an Exchange address within this domain**.

    **Note:** Forwarding to an Exchange address within another domain on this account works only if both domains are on the same Exchange server. If you are not sure if both domains are on the same Exchange server, create a contact for the domain to which you want to forward.

11. Select the Distribution List Address that you created.

12. Select the **Save copies of forwarded email** option.

    <img src="{% asset_path exchange/set-up-microsoft-exchange-email-forwarding/hex-forward-multi-7.png %}" />

    If **Save a copy of forwarded email** is not checked, this mailbox _not_ store any messages sent to it.

13. Click **Save**. Allow at least 15 minutes for the forward to enable.

### References

- [Cloud Office Control Panel](https://cp.rackspace.com/)
- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)
- [Cloud Office Email Portal](https://apps.rackspace.com/index.php)
- [Set up Rackspace Email forwarding](/how-to/set-up-rackspace-email-forwarding/)
