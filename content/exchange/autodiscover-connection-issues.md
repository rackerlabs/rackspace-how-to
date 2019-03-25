---
permalink: autodiscover-connection-issues/
audit_date: '2019-03-25'
title: Autodiscover connection issues
type: article
created_date: '2019-03-25'
created_by: William Loy
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

#### Understanding issues with Autodiscover and Outlook

If you are prompted with the error `cannot connect to server automatically` when using Outlook, that means that Outlook is unable to automatically configure an Exchange mail account using Autodiscover.

When Outlook sends a request to the server for email, it checks for open connections in the following order:
1. It checks for an internal server on your network.
2. It checks the website server for the domain and check the following URL's:

    https://yourdomain/autodiscover/autodiscover.xml
    https://autodiscover.yourdomain/autodiscover.xml

3. It checks your Domain Name Services (DNS) for an Autodiscover record.

In order for Outlook to successfully connect to your Exchange account, it must fail to connect on steps 1 and 2 to proceed on to step 3. See [Outlook 2016 implementation of autodiscover](https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover) to learn more about the full path that Autodiscover takes with Outlook 2016 and later.


#### Identifying issues with connecting with autodiscover

Enter ```https://yourdomain/autodiscover/autodiscover.xml```
https://autodiscover.yourdomain/autodiscover.xmlof the following URLs into a web browser search bar to test for

Error Codes may include but are not limited to:
“This site can’t be reached: ERR_CONNECTION_TIMED_OUT”
"Autodiscover and Autoconfig support is disabled."
“This site can’t be reached DOMAIN.com took too long to respond.”

Outlook receives the response and since it does, it will not look any further for the server and will keep communicating the username and password to that server - which is not where your email is- causing it to error out on the mail client side as well.




For Autodiscover to work properly, these URLs must be set to receive a standard 404, which essentially means you get no results at all (sometime referred to as a ‘hard failure’). Once these URLs are setup correctly, the browser should say something like "404: this page doesn't exist" or "server cannot be found" with no additional information on the page. At this point, Autodiscover will fail (which is what we want) and move to the next step in the process, then move on to find the CNAME entry in your public DNS.

To be certain that this is the cause, please perform an Auto-config test with your username & password from the affected machine to confirm the path that Outlook is taking from your machine to find these automatic settings.
Outlook Auto-Config Test (Under “Test Autodiscover functionality in Outlook”)
https://support.rackspace.com/how-to/set-up-autodiscover-for-outlook/
Reach out to your website host to configure these URLs to 404. Please let us know if you have any questions. Thank you!

_____________________________________________

Caveats:

1.	GoDaddy cPanel Users may see something like this when accessing wither of the URLs above in step 2



Resolution: We've had other customers in the past with similar Outlook issues, and the change that worked for our customers using the GoDaddy cPanel, at least, was to change their Email Routing from Local to Remote Mail Exchanger. Here's a link from GoDaddy showing how exactly to make that change:

https://www.godaddy.com/help/changing-your-email-destination-with-cpanel-shared-hosting-12380

Again, this is article is for GoDaddy cPanel users ONLY.

2. Certificate Errors:

If you go to these URLs & get a reference to a certificate error, this is another ‘response’ that is preventing Autodiscover from moving along its path. Certificate Errors will have to addressed by your Web Host as well.

___________________________________

FAQ:

What does my email have to do with my website/web host?
Your email uses Autodiscover if you have an exchange mailbox on Outlook 2016 or later. Autodiscover is a process that checks a few different areas in order to configure your account settings automatically in 11 total Steps. If you are seeing issues as prescribed above, you may be having hang-ups during that process.

See the full process here: https://support.microsoft.com/en-us/help/3211279/outlook-2016-implementation-of-autodiscover

Priority is given to URLS which are managed by your Web Host. If those URLs are misconfigured, the process stops & will never reach the proper server checks in order to configure your email properly.

Can’t Rackspace do this for me? You are my Email Host, right?
Rackspace cannot help with this website URL issue. We may serve as your Email Host, but where you build your website and configure its settings/URLs will be with your Web Host.

This seems like a Rackspace issue, not an Outlook Issue. How can I tell?
Setup the same mailbox on a different mail client such as Thunderbird or Mac Mail for Apple iOS. If your mailbox can be configured there, or on an older version of Outlook with the option to add the account manually (Outlook 2013 or earlier) then the issue lies with Outlook 2016/2019.

I can’t contact my Web Host currently. How can I just access my email?
We always have your mail available server side in the Outlook Web Application at apps.rackspace.com. You may also try setting up the mailbox on another mail client per instructions at our email help tool: https://emailhelp.rackspace.com/

Why can’t I just set it up manually, like on Outlook 2013?
Outlook 2016 requires Autodiscover. Please see this article: https://blogs.technet.microsoft.com/exchange/2015/11/19/outlook-2016-what-exchange-admins-need-to-know/
