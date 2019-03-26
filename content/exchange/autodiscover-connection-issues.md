---
permalink: autodiscover-connection-issues/
audit_date: '2019-03-25'
title: Autodiscover connection issues
type: article
created_date: '2019-03-25'
created_by: Ari Antwine
last_modified_date: '2019-03-26'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

If you are having issues setting up Microsoft&reg; Exchange mailboxes on your domain in Outlook&reg; 2016 or later, you might be experiencing issues related to your [Autodiscover](/how-to/dns-record-definitions/#cname-record) record. This article outlines the symptoms for this problem and suggested solutions.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 24 to 48 hours to propagate
- **Tools Required:** Web host administrator access

### Understanding issues with Autodiscover and Outlook

If Outlook prompts you with the error `cannot connect to server automatically`, Outlook is unable to automatically configure an Exchange mail account by using Autodiscover.

When Outlook sends a request to the server for email, it checks for open connections in the following order:

1. It checks for an internal server on your network.
2. It checks the website server for the domain and then checks the following URL's:

     - `https://yourdomain/autodiscover/autodiscover.xml`

     - `https://autodiscover.yourdomain/autodiscover/autodiscover.xml`

3. It checks your Domain Name Services(DNS) for an Autodiscover record.

For Outlook to successfully connect to your Exchange account, it must fail to connect on steps 1 and 2, to proceed to step 3. See [Outlook 2016 implementation of Autodiscover](https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover) to learn more about the full path that Autodiscover takes with Outlook 2016 and later.

To verify that Autodiscover is the root cause of this issue, perform an auto-configuration from the affected computer. You can use this test to confirm the path that Outlook is taking from your computer to your Exchange server is not obstructed.
See [Test Autodiscover functionality in Outlook](https://support.rackspace.com/how-to/set-up-autodiscover-for-outlook/) for details about performing the auto-configuration test.


### Identifying issues connecting Outlook using autodiscover

Replace** `yourdomain` in `https://yourdomain/autodiscover/autodiscover.xml` and
`https://autodiscover.yourdomain/autodiscover/autodiscover.xml` with your domain, and enter the URLs sequentially into a web browser search bar to test for any of the following errors:

  - `This site can’t be reached: ERR_CONNECTION_TIMED_OUT`
  - `Autodiscover and Autoconfig support is disabled.`
  - `This site can’t be reached DOMAIN.com took too long to respond.`


 **Important:** You must test both URLs for errors because Autodiscover performs a lookup on both of them. Additionally, the errors you can receive that are not the required `404` are not limited to those examples.


When Outlook receives the responses listed above, it has established a connection with that server but does not progress to the server that your Exchange mailbox is hosted on. This situation causes Outlook to produce the error `cannot connect to server automatically`. To summarize, Outlook is not able to retrieve your mail because something is blocking its path to your Exchange server.

Both `https://yourdomain/autodiscover/autodiscover.xml` and `https://autodiscover.yourdomain/autodiscover/autodiscover.xml` must produce a standard `404` error for Autodiscover to establish the correct connection to your Exchange server, which means that Outlook gets no response when Autodiscover attempts a connection to those servers. After you have set up these URLs correctly, the browser says something like `404: this page doesn't exist` or `server cannot be found` with no additional information on the page. After Autodiscover failed to connect to those servers, it proceeds to the next steps in the process, and then finds the CNAME entry in your public DNS.

To resolve this issue, you must reach out to your website host and request they configure both `https://yourdomain/autodiscover/autodiscover.xml` and `https://autodiscover.yourdomain/autodiscover/autodiscover.xml` to produce a `404` error.

#### Certificate errors

If `https://yourdomain/autodiscover/autodiscover.xml` or `https://autodiscover.yourdomain/autodiscover/autodiscover.xml` produce a certificate error, this response also prevents Autodiscover from connecting to your Exchange server. Your website host must address certificate errors.


#### GoDaddy cPanel user issues connecting with Autodiscover

GoDaddy&reg; cPanel users may see the following error when attempting a connection to `https://yourdomain/autodiscover/autodiscover.xml` or `https://autodiscover.yourdomain/autodiscover/autodiscover.xml`:

    autodiscovery must be provided a valid email address

GoDaddy cPanel customers have resolved this issue by changing their email routing from Local to Remote Mail Exchanger. See the following instructions from GoDaddy to make that change at: [Changing your email destination with cpanel Shared Hosting](https://www.godaddy.com/help/changing-your-email-destination-with-cpanel-shared-hosting-12380)


### Frequently asked questions

What does my email have to do with my website or web host?

  - Your email uses Autodiscover if you have an Exchange mailbox on Outlook 2016 or later. Autodiscover is a process that checks a few different areas to configure your account settings automatically in eleven total Steps. If you are seeing issues as described earlier in this article, you may be having hang-ups during that process. Priority is given to URLS that are managed by your web host. If those URLs are misconfigured, the process stops and never reaches the proper server checks in order to configure your email properly.

Why can't Rackspace do this for me?

  - Rackspace cannot help with this website URL issue. We serve as your Email Host, but where you build your website and configure its settings is the responsibility of your web host.

I can’t contact my web host currently. How can I just access my email?

  - We always have your mail available server side in the Outlook Web Application at [apps.rackspace.com](https://apps.rackspace.com).

Why can’t I just set it up manually, like on Outlook 2013?

  - Outlook 2016 requires Autodiscover. See this article for a detailed explanation from Microsoft&reg;: [Outlook 2016 What Exchange admins need to know](https://blogs.technet.microsoft.com/exchange/2015/11/19/outlook-2016-what-exchange-admins-need-to-know/)
