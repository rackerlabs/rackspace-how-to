---
node_id: 2097
title: Troubleshooting Alarms
type: article
created_date: '2012-09-04'
created_by: Susan Million
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: cloud-monitoring
---

When a monitoring check reaches or passes a specific threshold or value,
an alarm is triggered and you'll receive a Warning or Critical email
notification for the monitored resource. This article describes some
simple troubleshooting steps that can help you diagnose the problem.

### Ping checks


Ping checks typically monitor a server. If your ping check alarm is
triggered, you should immediately try to contact your server using the
**ping** command.

Issue the following command from an OS X Terminal window, Windows
Command Prompt, or a Linux shell:

    ping <target_hostname or ip_address>

The following ehow article provides some helpful information about how
to read the results of a ping test: [How to Read Ping Test
Results](http://www.ehow.com/how_8241153_read-ping-test-results.html).

###HTTP checks


The HTTP check is used to check websites. If you receive a notification
from an HTTP check, try the following preliminary troubleshooting steps:

1.  Open the website in a browser to verify that the website is
    actually responding.
2.  If you are checking for specific content with a body match, verify
    that the content of the body match actually exists on the page that
    you are viewing.

    Your browser returns the page or it might return another error
    saying that the site was unreachable or an error code from the
    web server. Common error codes include the following ones:

    -   404, which means that the page was not found.
    -   503, which means that the web server is denying access to the
        content that you are trying to view.

### Advanced troubleshooting for HTTP checks

Run cURL, a common command-line web page utility, against the website
that you are checking. This returns the contents of the web page to your
terminal or shell window. You can explore cURL's options to get more
specific information, but a useful option is -I. This command returns
the target web page's headers and the response code from the web server.
For example, enter the following command in your terminal or shell
window, replacing your\_domain with your actual domain:

    curl -I http://www.your_domain.com

The output should look something like this:

    HTTP/1.1 200 OK
    Content-Type: text/html; charset=UTF-8
    Last-Modified: Tue, 04 Sep 2012 20:00:05 GMT
    P3P: CP="ALL DSP COR CUR ADMo DEVo TAIo PSAo PSDo IVAo CONi OTPi OUR NOR UNI"
    Server: Apache Date: Tue, 04 Sep 2012 20:33:51 GMT
    Connection: keep-alive Set-Cookie: target=us; path=/; domain=.your_domain.com Expires: Tue, 04 Sep 2012 21:00:00 GMT

### TCP checks


TCP checks monitor ports. If an alarm is triggered for a TCP check, try
to use Telnetto communicate with the target or scan your target for the
open port.

**Note**: Ensure that you are authorized to scan the target. Many
network security groups view this type of san as an attack on the open
port.

Alternatively, try to directly access the service that is running on
that port. For example, if the service is an SSH server, try to open an
**ssh** session to the target host. If the service is running MYSQL or
Microsoft SQL Server, try to connect to the database. Following is an
example of how to use Telenet to communicate with the default port
(3306) for MySQL:

    telnet mysql.myhost.com 3306

To exit telnet, type `Ctrl  \]`, press the **Enter** key, and then type `quit`.

### Contact Rackspace Technical Support


If you're unable to solve the problem using the steps outlined in this
article, contact Rackspace Technical Support by using the Cloud Control
Panel. Your options for contacting Rackspace are as follows:

-   Open a Support Ticket
-   Use Live Chat
-   Call the toll free number for your area
