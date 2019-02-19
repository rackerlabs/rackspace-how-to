---
permalink: spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/
audit_date: '2019-02-19'
title: 'Spam Preferences, safelist, and blacklist management for Microsoft Exchange'
type: article
created_date: '2012-05-22'
created_by: Rackspace Support
last_modified_date: '2019-02-19'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

You have the flexibility at Rackspace to set your own Microsoft&reg; Exchange spam
preferences. This includes editing and managing domain-wide spam settings such as safelists, blacklists, and the ability to
override the spam filtering for the entire domain.

### Manage Domain Spam Settings

1. Log into the [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click **Spam Settings** within the **Domain** section.

3. If your account has multiple domains, select the domain for which you would like to edit the spam settings.

3. In the **Spam Settings** section, you are given the following three options under the **Status** section:

    <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/status_options.png %}" />

4. Scroll down to the section labeled **Microsoft Exchange Handling** and make your selections from the following available options:

    <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/exchange_settings.png %}" />


5. In the **Override Options** section, select one of the following options:

- Set preferences **only** for users who have not set their own.

- Override preferences for **all** users regardless of their own preferences.

### Managing safelists

A safelist identifies sources of trusted email and ensure emails from those sources are delivered to the user's Inbox. Safelists do not prevent a message from being flagged as spam.

1. Log into the [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click **Safelists** within the **Domain** section.

3. If your account has multiple domains, select the domain for which you would like to edit the safelist settings.

4. Add a domain name or email address to the safelist by entering the
   domain in the box labeled **Enter a domain or email address** then click the **Add** button.

   <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/safelist_domain.png %}" />

   - Remove a domain or email address by selecting the name in the list, then
   clicking the **Remove** button.

   - Use the **Clear** button to remove all domain
   names or email addresses listed in the window.

   - Add multiple domain names or email addresses to the safelist by using the bulk import option to upload a Comma Separated Values (.CSV) file or a Text (.TXT) file containing the
   information.

5. Add an Internet Protocol (IP) address to the domain-wide safelist by entering the IP address in the box labeled **Enter an IP address(or range)** and then click the **Add** button.

    <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/safelist_ip.png %}" />

   - Remove an IP address by selecting the address in the list then clicking the **Remove** button.

   - Use the **Clear** button to remove all IP addresses listed in the window.

   - Add multiple IP addresses to the safelist by using the bulk import option to upload a Comma Separated Values (.CSV) file or a Text (.TXT) file containing the
   information.

6. Click **Save**.

### Managing blacklists

A blacklist identifies sources of untrusted email. Messages from blacklisted addresses or domains are rejected before being delivered.

1. Log into the [Cloud Office Control Panel](https://cp.rackspace.com).

2. Click **Blacklists** within the **Domain** section.

3. If your account has multiple domains, select the domain for which you would like to edit the blacklist settings.

4. Add a domain name or email address to the blacklist by entering the
   domain in the box labeled **Enter a domain or email address** then click the **Add** button.

   <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/blacklist_domain.png %}" />


   - Remove a domain or email address by selecting the name in the list, then
   clicking the **Remove** button.

   - Use the **Clear** button to remove all domain
   names or email addresses listed in the window.

   - Add multiple domain names or email addresses to the blacklist by using the bulk import option to upload a Comma Separated Values (.CSV) file or a Text (.TXT) file containing the
   information.

5. To add an IP address to the blacklist, enter the IP address (or range)
   box, then select the **Add** button.

   <img src="{% asset_path exchange/spam-preferences-safelist-and-blacklist-management-for-microsoft-exchange/blacklist_ip.png %}" />

   - Remove an IP address by selecting the address in the list then clicking the **Remove** button.

   - Use the **Clear** button to remove all IP addresses listed in the window.

   - Add multiple IP addresses to the blacklist by using the bulk import option to upload a Comma Separated Values (.CSV) file or a Text (.TXT) file containing the information.

6. Click **Save**.
