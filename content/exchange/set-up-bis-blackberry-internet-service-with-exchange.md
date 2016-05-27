---
permalink: set-up-bis-blackberry-internet-service-with-exchange/
audit_date:
title: 'Set up BIS (Blackberry Internet Service) with Exchange'
type: article
created_date: '2013-08-29'
created_by: Mawutor Amesawu
last_modified_date: '2016-01-29'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

This article describes the setup process for users who have an Exchange mailbox
but do not have a
BlackBerry Enterprise Service (BES) license and
want to use Blackberry Internet Service (BIS) instead.

A BES license allows maximum
Exchange functionality on the BlackBerry, including contacts and
calendar. Setting up a BES license is done by an administrator,
as described at [Add an ActiveSync or BES license](/how-to/email-migration-services).

**Note:** Support for email accounts and email setup may vary by service
provider.

To associate your BlackBerry Internet Service (BIS) account with Outlook
Web Access (OWA), perform the following steps:

1. Log into your User Control Panel at <https://admin.emailsrvr.com/usercp>.

2. Under the Client Setup section, click the **Entourage 2008**
link. This will open the **Setting Up Entourage 2008** window. Though
BIS is not based on Entourage, the addresses and the user name are the
same. You will need this information to set up the account.

3. Log into the BIS website for your carrier.
   Links to some major carriers' sites are listed below:

- Alltel:
  <http://www.alltel.blackberry.com/>
- AT&T / Cingular:
  <http://bis.na.blackberry.com/html?brand=mycingular>
- Nextel / Sprint:
  <http://sprint.blackberry.com>
- Rogers:
  [https://bis.na.blackberry.com/html?brand=rogers](https://bis.na.blackberry.com/html?brand=rogers%20)
- Telus:
  [https://bis.na.blackberry.com/html?brand=telus](https://bis.na.blackberry.com/html?brand=telus%20)
- T-Mobile (U.K):
  [http://www.instantemail.t-mobile.co.uk/](http://www.instantemail.t-mobile.co.uk/%20)
- T-Mobile (U.S):
  [https://my.t-mobile.com/Login/Default.aspx](https://my.t-mobile.com/Login/Default.aspx%20)
- Verizon:
  <https://bis.na.blackberry.com/html?brand=vzw>

4. Click the **Set Up Account** button.

5. Enter your email address (for example, myname@example.com).

6. Enter and confirm password.

7. Click the **Next** button.

8. Click the **I will provide the settings to add this email account**
   option button.

9. Click the **Next** button.

10. Click the **This is my work email account** option button.

11. Click the **Next** button.

12. Click the **I can access my email account using a Web Browser
    (Outlook&reg; Web Access)** option button.

13. Enter the following information in the fields provided:

   -   Outlook Web Access URL - From the **Setting Up Entourage 2008** window, enter the **EWS Server** without **/ews/exchange.asmx**.

   -   User name - Enter the **Domain Name** followed by a backslash and the **Account ID** (for example, mex03b.mlsrvr.com\\myname\_example.com).

      **Note:** The **Account ID** is not your email address.

   -   Password - Enter the password associated with your email account.

   -   Email Address - Enter your entire email address, using all lowercase letters (for example, myname@example.com).

   -   Mailbox name - Enter your entire email address, using all lowercase letters (for example, myname@example.com).

14. Click the **Next** button.

After setup is complete, you will see your email address on the main screen.
You should begin receiving new messages in approximately 20 minutes.
