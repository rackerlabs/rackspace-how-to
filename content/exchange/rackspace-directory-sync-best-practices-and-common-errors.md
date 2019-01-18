---
permalink: rackspace-directory-sync-best-practices-and-common-errors/
audit_date:
title: 'Rackspace Directory Sync best practices and common errors'
type: article
created_date: '2019-01-17'
created_by: Aaron Medrano
last_modified_date: '2019-01-18'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---


This guide discusses best practices while using Rackspace Directory Sync with Rackspace Hosted Email services and also outlines common errors and solutions.

### Directory Sync installation and setup best practices

1. Create a new Email Control Panel **Admin ID** to use for the Directory Sync Service.

2. Create a new administrator on the **Domain Controller** to manage the **Directory Sync Service**.

    **Note:**  This admin should be created with at least domain admin level permissions.

3. Create a new **Security Group** to synchronize with the Cloud Office mailboxes.

  **Note:**  If synchronizing both  Microsoft&reg; Exchange and Rackspace Email, create a **Security Group** for each service.

#### Additional best practices

- For Hosted Exchange, create and synchronize all users to mailboxes before creating and synchronizing Distribution Lists.

- Do not use nested groups to create or synchronize users.

- Ensure that your Active Directory user or group has a valid email address set for the mail attribute.

### Directory Sync common errors and solutions

This section describes common errors and their solutions.

- Unable to Sync User - **The value '' specified in the mail attribute for user '[USER]' is invalid.**

    **Sync Error:** The value '' specified in the mail attribute for user '[USER]' is invalid.

    **Cause:** This error occurs because the **Email Address** field for the specific user is not set.

    **Solution:** Within the Active Directory, set the desired email address, including the domain, to be associated with the user.


- Unable to Sync User – **Mailbox Limit Exceeded.**

    **Sync Error:** Performed action 'Create' for user 'User Name'. Mailbox limit exceeded.

    **Cause:** Directory Sync cannot create a new mailbox because all the purchased mailboxes are in use.

    **Solution:**
    Use one of the following solutions:

    - Add additional mailbox licenses through the Cloud Office Control Panel.

    - Verify that the User is subscribed to the correct security group.

- Unable to Sync User – **User already Exists in Another Service in Control Panel.**

    **Sync Error:** An error occurred when provisioning user 'User-Name' for Hosted Exchange Mailboxes. Please check that the user does not already exist in another service in control panel.

    **Cause:** This error occurs when a user who already has a mailbox is subscribed to a security group for the wrong email service. For example, the user has a Rackspace Email mailbox but is added to the Hosted Exchange security group.

    **Solution:** Reassign the user to the correct security group.

- Unable to Sync User - **Received Unauthorized error.**

    **Sync Error:** Performed action 'Create' for user 'User-Name' on domain 'Domain'. Not authorized

    **Cause:** This error occurs because the domain used in the email address attribute does not match a hosted domain associated with your Cloud Office account.

    **Solution:** Correct the domain within the email address attribute to match a domain associated with your Cloud Office account.

- Unable to Sync Distribution List – **Group Already Exists.**

    **Sync Error:** Performed action 'Update' for group 'Security Group'. Error occurred when provisioning group 'Security Group' for Hosted Exchange Distribution List: Check that the group does not already exist in another service in control panel.

    **Cause:** This message is generated because the email address of the distribution list already exists within the Control Panel as a mailbox, alias, contact, group list,  or distribution list.

    **Solution:**

    Use one of the following solutions:

    - Remove the mailbox within the control that matches the email address attribute of the Security Group in your Active Directory.

    - Create a new email address for the distribution list within the Active Directory that is currently not in use.

- Unable to Sync User - **The alternate address was not in the primary domain or any of the alternate domains.**

    **Cause:** This error occurs because the domain used in the proxyAddress attribute does not exist in our environment as an accepted domain or exists in another attribute such as the mail attribute.
    The proxyAddresses attribute is used to create alternate email addresses for our Exchange environment. Those alternate email addresses are aliases specific to that user's mailbox. Any address that begins with SMTP: tries to create an alternate email address associated to the user's mailbox.

    **Solution:**  

    Use one of the following solutions:

    - Check the proxyAddress within the **Attribute Editor** tab of the user object in the Active Directory Users and Computers (ADUC). You will need to have **Advanced Features** enabled in view settings to see this tab.

    - You can also use the ADSI Edit Window to view the user's attributes from properties. Ensure this value does not contain any existing email address that might exist in the mail or proxyAddress attributes of another user or include a domain that is listed as a domain alias.

    - The domains that work in the proxyAddresses attribute are the primary domain and accepted domains.

    - Ensure this attribute does not already exist in the mail or proxyAddress attributes of another user.

- Unable to Sync Contacts - **The value '' specified in the otherMailBox attribute for contact 'CN=Contact,CN=Users,DC=aaron,DC=local' is invalid.**

    **Sync Error:** The value '' specified in the otherMailBox attribute for contact 'CN=Gmail Aaron Medrano,CN=Users,DC=aaron,DC=local' is invalid.

    **Cause:** This error is generated because the Directory Sync needs to specify which domain to create the contact in. With accounts that host multiple domains, the attribute otherMailbox is used to specify this domain. If you only have one domain on your account, this attribute does not need to be specified.

    **Solution:** Go to the Attribute Editor of the Contact object in Active Directory and specify the domain to synchronize in the otherMailbox attribute. This attribute only requires the domain name.

- **The Service ID specified in the mail attribute for user 'CN=User' has changed from 'userA' to 'userB'. Directory Sync cannot change the Service ID for an object.**

    **Sync Error:** The Service ID specified in the mail attribute for user 'CN=User' has changed from 'userA' to 'userB'. Directory Sync cannot change the Service ID for an object.

    **Cause:** This error is generated when the username of the email address in Active Directory is changed.

    **Solution:** Create a ticket with your Cloud Office Support team to perform a mailbox rename of the user's email address.

- **There was an error writing to the pipe: The pipe is being closed. (232, 0xe8)**

    **Cause:** This error occurs during a manual synchronization. Recognized changes are not provisioned because the WCF application connection is inactive. This error displays in the Sync History section of the user interface.

    **Solution:** Rerunning the manual synchronization again performs a successful sync.
