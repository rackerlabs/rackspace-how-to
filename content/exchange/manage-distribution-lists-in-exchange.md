---
permalink: manage-distribution-lists-in-exchange/
audit_date:
title: Manage distribution lists in Exchange
type: article
created_date: '2014-11-18'
created_by: Joanna Salazar
last_modified_date: '2016-01-27'
last_modified_by: Rose Coste
product: Microsoft Exchange
product_url: exchange
---

When you create a distribution list in Hosted Microsoft Exchange,
you are creating a group email address.
When someone sends an email to that email address,
the email is automatically sent to all the members of the distribution list.
These members can be mailboxes within the domain,
contacts outside of the domain, or both.

### View all distribution lists

To view all distribution lists, log in to the [Cloud Office Control Panel](https://cp.rackspace.com/) and perform the following steps:

1. Click the **Go to section** menu and select **Microsoft Exchange**.

   <img alt="" height="225" src="{% asset_path exchange/manage-distribution-lists-in-exchange/dl1.png %}" width="195"  />

2. Click the **Lists** tab.

	 <img alt="" height="77" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL6.png %}" width="414"  />

3. If you have multiple domains, select the appropriate domain name.
   To change domains at any time, click the arrow next to the currently selected domain.

   <img alt="" height="164" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL7.png %}" width="409"  />

Starting from the list of distribution lists available in your domain,
you can add, edit, or delete a distribution list.
Follow the instructions below for the action you want to perform.

### Add or edit a distribution list

1. While viewing your distribution lists on the **Lists** tab,
   click on the display name of the list you want to edit.
	 If you are creating a new list, click **Add Distribution List**.

	 <img alt="" height="127" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL11.png %}" width="552"  />

2. On the **General** page, enter or edit the following fields:

    - **Display Name:** Enter a descriptive id for the list.

    - **Email Address:** Enter a unique address ID such as *sales* or *staff*) for the list.

    - **Hide from Global Address List:** To hide the distribution list
		  so that it cannot by viewed by others from the Global Address List,
			select this check box.

3. To add a mailbox as a member of the list, select the check box next to
   the mailbox userid in the **Members** section.
	 Use the search tool to locate specific email addresses.

	 <img alt="" height="318" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL8.png %}" width="433"  />

4. To configure the following optional sections, click **Advanced**:

   - **Members:** Search tool to filter specific users.

   - **Senders:** To designate who can send email to this list,
		 select **Anyone** or **Selected addresses on this domain**.
		 If you select **Selected addresses on this domain**, specify the users.

   - **Email Addresses:** Create alias (or alternative) email addresses for the list.

	 <img alt="" height="447" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL9_0.png %}" width="455"  />

5. Click **Create Distribution List** or **Save Distribution List**.

### Delete a distribution list

1. While viewing your distribution lists on the **Lists** tab,
   select the check box next to each list that you want to delete.
	 To select all lists, select the check box that appears next to the
	 **Delete** button at the bottom of the page.

2. Click **Delete**.

   <img alt="" height="321" src="{% asset_path exchange/manage-distribution-lists-in-exchange/DL10.png %}" width="415"  />

   A pop-up box appears to confirm that you want to delete the list.

3. Click **Delete** n **Distribution List**, where "n" is the number of lists
   that you selected.
