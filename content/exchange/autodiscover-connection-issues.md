---
permalink: autodiscover-connection-issues/
audit_date: '2019-03-25'
title: Autodiscover connection issues
type: article
created_date: '2019-03-25'
created_by: Ari Antwine
last_modified_date: '2019-03-25'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

If you are having issues setting up Microsoft Exchange&reg; mailboxes on your domain in Outlook&reg; 2016 or later, you might be experiencing issues related to your [Autodiscover](/how-to/dns-record-definitions/#cname-record) record. This article outlines the symptoms or this problem and suggested solutions.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time needed:** Approximately 24-48 hours to propagate
- **Tools Required:** Web host administrator access

### Understanding issues with Autodiscover and Outlook

If you are prompted with the error `cannot connect to server automatically` when using Outlook, that means that Outlook is unable to automatically configure an Exchange mail account using Autodiscover.

When Outlook sends a request to the server for email, it checks for open connections in the following order:

1. It checks for an internal server on your network.
2. It checks the website server for the domain and then checks the following URL's:

     https://yourdomain/autodiscover/autodiscover.xml
     https://autodiscover.yourdomain/autodiscover.xml

3. It checks your Domain Name Services (DNS) for an Autodiscover record.

In order for Outlook to successfully connect to your Exchange account, it must fail to connect on steps 1 and 2 to proceed on to step 3. See [Outlook 2016 implementation of autodiscover](https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover) to learn more about the full path that Autodiscover takes with Outlook 2016 and later.

To verify that Autodiscover is the root cause of this issue, perform an Auto-configuration from the affected computer. This test can be used to confirm the path that Outlook is taking from your computer to your Exchange server is not obstructed.
See [Outlook Auto-Config Test](https://support.rackspace.com/how-to/set-up-autodiscover-for-outlook/) for details on performing the Auto-configuration test.


### Identifying issues connecting Outlook using autodiscover

Replace `yourdomain` in `https://yourdomain/autodiscover/autodiscover.xml` and
`https://autodiscover.yourdomain/autodiscover.xml` with your domain, and enter the URLs sequentially into a web browser search bar to test for any of the following errors:

    This site can’t be reached: ERR_CONNECTION_TIMED_OUT
    Autodiscover and Autoconfig support is disabled.
    This site can’t be reached DOMAIN.com took too long to respond.

    **Important:** You must test both URLs for errors as Autodiscover performs a lookup on both of them.


When Outlook receives the responses listed above, it has established a connection with that server and will not progress to the server that your Exchange mailbox is hosted on. This in turn causes Outlook to produce the error `cannot connect to server automatically`. To summarize, Outlook is not able to retrieve your mail because there is something blocking it's path to your Exchange server.

Both `https://yourdomain/autodiscover/autodiscover.xml` and `https://autodiscover.yourdomain/autodiscover.xml` must be set to produce a standard `404` error for Autodiscover to establish the correct connection to your Exchange server.  This means that Outlook gets no response at all when Autodiscover attempts a connection to those servers. Once these URLs are setup correctly, the browser should say something like `404: this page doesn't exist` or `server cannot be found` with no additional information on the page. Once Autodiscover has failed to connect to those servers, it proceeds to the next steps in the process, and then finds the CNAME entry in your public DNS.

To resolve this issue you must reach out to your website host and request they configure both `https://yourdomain/autodiscover/autodiscover.xml` and `https://autodiscover.yourdomain/autodiscover.xml` to produce a `404` error.

#### Certificate errors

If `https://yourdomain/autodiscover/autodiscover.xml` or `https://autodiscover.yourdomain/autodiscover.xml` produce a certificate error, this response also prevents Autodiscover from continuing along the path to connect to your Exchange server. Certificate errors must be addressed by your Web Host as well.


#### GoDaddy cPanel user issues connecting with Autodiscover

GoDaddy cPanel Users may see the following error when attempting a connection to `https://yourdomain/autodiscover/autodiscover.xml` or `https://autodiscover.yourdomain/autodiscover.xml`:

    autodiscovery must be provided a valid email address

Mutual GoDaddy&reg; cPanel customers have been able to resolve this issue by changing their Email Routing from Local to Remote Mail Exchanger. See the following instructions from GoDaddy to make that change: [Changing your email destination with cpanel shared hosting](https://www.godaddy.com/help/changing-your-email-destination-with-cpanel-shared-hosting-12380)


### Frequently asked questions

What does my email have to do with my website or web host?

  - Your email uses Autodiscover if you have an exchange mailbox on Outlook 2016 or later. Autodiscover is a process that checks a   few different areas in order to configure your account settings automatically in 11 total Steps. If you are seeing issues as prescribed above, you may be having hang-ups during that process. Priority is given to URLS which are managed by your Web Host. If those URLs are misconfigured, the process stops & will never reach the proper server checks in order to configure your email properly.

Why can't Rackspace do this for me?

  - Rackspace cannot help with this website URL issue. We may serve as your Email Host, but where you build your website and configure its settings will be with your Web Host.

I can’t contact my Web Host currently. How can I just access my email?

  - We always have your mail available server side in the Outlook Web Application at [apps.rackspace.com](https://apps.rackspace.com).

Why can’t I just set it up manually, like on Outlook 2013?

Outlook 2016 requires Autodiscover. Please see this article for a detailed explanation from Microsoft&reg;: [Outlook 2016 what Exchange admins need to know](https://blogs.technet.microsoft.com/exchange/2015/11/19/outlook-2016-what-exchange-admins-need-to-know/)
