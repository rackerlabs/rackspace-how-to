---
permalink: add-multiple-contacts-to-exchange/
audit_date:
title: Add multiple contacts to Exchange
type: article
created_date: '2011-03-18'
created_by: Rackspace Support
last_modified_date: '2017-05-31'
last_modified_by: Cory Aldrich
product: Microsoft Exchange
product_url: exchange
---

Exchange only allows internal addresses for email forwarding and
distribution lists. To use an external address for either of these
functions, it must be set up as a contact. A contact is simply an
Exchange alias that points to a real mailbox outside of your domain.

1. Log in to the [Cloud Office control panel](https://apps.rackspace.com/?cp).

2. In the Microsoft Exchange section, click the **Contacts** link.

   <img src="{% asset_path exchange/add-multiple-contacts-to-exchange/microsoft-exchange-contacts-link.png %}" alt="Contacts link highlighted." />

3. If you have multiple domains, select the appropriate domain name.
   Or, to change domains, click the **Change Domain** link.

4. Click the **Add Multiple Contacts** button.

5. Create a CSV or Excel file, containing the information detailed in
   the **Data Format** section:

   Use the following column headers:

   - Username (**Required**. It is used for the email address, such as **username@example.com**.)
   - DisplayName (**Required.**)
   - ExternalEmail (**Required.**)
   - VisibleToGAL (**Required.**. 1=Visible, 0=Hidden)
   - Last Name
   - First Name
   - Title
   - Company
   - Department
   - Phone Number
   - Street
   - City
   - State
   - Postal Code
   - Country
   - Notes

   Or, to download a template, click the **CSV template** or **Excel
   template** link.

6. In the **Import File** section, click the **Browse** button.

7.  Locate and select the CSV or Excel file created in Step 5.

8.  Click the **Open** button.

9.  Click the **Import** button. Any errors that occur will be detailed
    in the import summary, which will appear after the import
    is complete.
