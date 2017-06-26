---
permalink: set-up-microsoft-exchange-email-forwarding/
audit_date:
title: Set up Microsoft Exchange email forwarding
type: article
created_date: '2017-06-07'
created_by: William Loy
last_modified_date: '2017-06-09'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

Configure a Microsoft Exchange mailbox to forward to another email address. If you require steps to set up forwarding for a Rackspace Email mailbox please see [Set up forwarding for a Rackspace Email mailbox](/how-to/set-up-rackspace-email-forwarding/)

### Prerequisites

- **Applies to:** Administrator

- **Difficulty:** Moderate

- **Time needed:** Approximately 10 minutes to set forward / Additional 15 minutes for forward to function

- **Tools required:** [Cloud Office Control Panel](https://cp.rackspace.com) access

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).


[**Forward to a mailbox on the same domain**](#forward-a-microsoft-exchange-mailbox-to-a-mailbox-on-the-same-domain)

[**Forward to an external domain's email address**](#forward-a-microsoft-exchange-mailbox-to-an-external-domain's-email-address)

[**Forward to multiple email addresses**](#forward-a-microsoft-exchange-mailbox-to-multiple-email-addresses)




### Forward a Microsoft Exchange mailbox to a mailbox on the same domain

Use these steps to forward email from your Microsoft Exchange address to another address on the same domain.

For example, you want to forward the address **example@yourdomainexample**.com to **forwardexample@yourdomainexample**.com.

Note: These steps apply to Administrators with access to their account's Control Panel.

1.	Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2. Select **Mailboxes** within the **Microsoft Exchange** section.

<!--- add screen shot file HexForwardSC1.png--->

3. If you have multiple domains, select the domain that contains the mailbox you would like to forward.

4. From the mailbox list, click the blue highlighted mailbox name that you would like to forward.

<!--- add screen shot file HexForwardlSC2.png--->

5. Select the **Mail Forwarding** tab.

6. Check the circle for **Forward to an Exchange address within this domain**
    - Select the address you would like to forward email to form the list below **Forward to an Exchange address within this domain**
    - Check the box for **Save copies of forwarded email**
    <!--- add screen shot file HexForwardSC3.png--->

    Warning: If **Save a copy of forwarded email** is not checked, this mailbox WILL NOT store any messages sent to it.

7. Click **Save** in the lower left-hand corner.

Note: Allow at least 15 minutes for the forward to be fully enabled after setting it up.


### Forward a Microsoft Exchange mailbox to an external domain's email address

For example, you want to forward the address **example@yourdomainexample**.com to **myname@externaldomain**.com. In this scenario a Microsoft Exchange contact must be created. The following steps will explain how to create an Exchange contact and how to forward to that contact.

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2. In the **Microsoft Exchange** section, select **Contacts**
<!--- add screen shot file HexForwardContactSC1.png--->

3. If you have multiple domains, select the domain that contains the mailbox you would like to forward.

4. Select the **Add Contact** button.
<!--- add screen shot file HexForwardContactSC2.png--->
5. Fill out the required fields.

    - **First Name and Last Name:** Optional fields where you can include the first and last name of your new contact.
    - **Display Name:** The name that is displayed in the Global Address List.
    - **Username:** This is the **Contact address**. This is not a physical mailbox.
    - **External Email:** This is the actual email address that you wish to forward email to.
<!--- add screen shot file HexForwardContactSC3.png--->
6. Click **Save** to create the contact.

7. Click **Mailboxes** from the red ribbon at the top of the screen.
<!--- add screen shot file HexForwardContactSC4.png--->
8. From the mailbox list, click the blue highlighted mailbox name that you would like to forward.
<!--- add screen shot file HexForwardContactSC5.png--->
9. Select the **Mail Forwarding** tab.

10. Check the circle for **Forward to an Exchange address within this domain**
    - Select the **Contact** address you just created from the list below **Forward to an Exchange address within this domain**
    - Check the box for **Save copies of forwarded email**
    <!--- add screen shot file HexForwardContactSC6.png--->

    Warning: If **Save a copy of forwarded email** is not checked, this mailbox WILL NOT store any messages sent to it.
    Warning: **Forward to an Exchange address within another domain on this account:** will only work if both domains are on the same Exchange server. If you are not sure if both domains are on the same Exchange server, the method of creating a contact will work regardless.

11. Click **Save** in the lower left-hand corner.

Note: Allow at least 15 minutes for the forward to be fully enabled after setting it up.

### Forward a Microsoft Exchange mailbox to multiple email addresses

For example, you want to forward the address **example@yourdomainexample**.com to **address1@externaldomain**.com, **address2@yourdomainexample**.com, and **address3@externaldomain**.com. In this scenario a Microsoft Exchange **Distribution List**  must be created. The following steps will explain how to create an Exchange **Distribution List** and how to forward to that list.

Note: Any address that is not on the domain you are creating the Distribution List under must be created as a contact before it can be added to the Distribution List. See steps 2 - 6 in the section [Forward a Microsoft Exchange mailbox to an external domain's email address](#forward-a-microsoft-exchange-mailbox-to-an-external-domain's email-address).

1. Log in to the [Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel") using your Rackspace Cloud Office admin ID and password.

2. In the **Microsoft Exchange** section, select **Lists**

<!--- add screen shot file HexForwardMultSC1.png--->

3. If you have multiple domains, select the domain that contains the mailbox you would like to forward.

4. Select **Add Distribution List**  

<!--- add screen shot file HexForwardMultSC2.png--->

5. Fill out the required fields under **General**.

    - **Display Name:** The name that is displayed in the Global Address List.
    - **Email Address:** This is the **Distribution List Address**. This is not a physical mailbox. This is the address that we will forward to so that we can forward to multiple addresses.
    - **Members:** The members selected will each receive a copy of email sent to the Distribution List.

<!--- add screen shot file HexForwardMultSC3.png--->

6. Expand **Advanced**, click the button for **Selected addresses on this domain** and select the address you plan to forward.

<!--- add screen shot file HexForwardMultSC4.png--->

7. Select **Create Distribution List**.  You will see the created list on the next screen. From this screen select **Mailboxes** from the red ribbon.

<!--- add screen shot file HexForwardMultSC5.png--->

8. From the mailbox list, click the blue highlighted mailbox name that you would like to forward.
<!--- add screen shot file HexForwardMultSC6.png--->
9. Select the **Mail Forwarding** tab.

10. Check the circle for **Forward to an Exchange address within this domain**
    - Select the **Distribution List** address we just created from the list below **Forward to an Exchange address within this domain**
    - Check the box for **Save copies of forwarded email**

    <!--- add screen shot file HexForwardMultSC7.png--->    

    Warning: If **Save a copy of forwarded email** is not checked, this mailbox WILL NOT store any messages sent to it.
    Warning: **Forward to an Exchange address within another domain on this account:** will only work if both domains are on the same Exchange server. If you are not sure if both domains are on the same Exchange server, the method of creating a contact will work regardless.

11. Click **Save** in the lower left-hand corner.

Note: Allow at least 15 minutes for the forward to be fully enabled after setting it up.



### References

[Cloud Office Control Panel](https://cp.rackspace.com/Login.aspx?ReturnUrl=%2f "Cloud Office Control Panel")

[Cloud Office support terminology](/how-to/cloud-office-support-terminology)

[Cloud Office Email Portal](https://apps.rackspace.com/index.php)

[Set up Rackspace Email forwarding](/how-to/set-up-rackspace-email-forwarding/)
