---
permalink: troubleshooting-alerts/
audit_date: '2016-11-01'
title: Troubleshooting alerts
type: article
created_date: '2012-09-04'
created_by: Susan Million
last_modified_date: '2016-10-28'
last_modified_by: Nate Archer
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

When a monitoring check reaches or passes a specific threshold or value,
an alert is triggered and you receive a Warning or Critical email
notification for the monitored resource. This article describes some
simple troubleshooting steps that can help you diagnose the problem.

### Ping checks

Ping checks typically monitor a server. If your ping check triggers an alert immediately try to contact your server by using the
**ping** command.

Issue the following command from an OS X Terminal window, Windows
Command Prompt, or a Linux shell:

    ping <targetHostnameorIpaddress>

If the host returns a result of `O packets received`, you might be experiencing network connection issues. Use the `traceroute` networking to diagnose any network issues. For more information about using ping and traceroute for network troubleshooting, see [Common network troubleshooting tools](/how-to/common-network-troubleshooting-tools/).

### HTTP checks

HTTPs check are used to check websites. If you receive a notification
from an HTTP check, try the following preliminary troubleshooting steps:

1.  Open the website in a browser to verify that the website is
    actually responding.
    
2.  If you are checking for specific content with a body match, verify
    that the content of the body match actually exists on the page that
    you are viewing.

    Your browser returns the page or it might return another error saying that the site was unreachable or an error code from the web server. Following are common error codes:

    -   404, which means that the page was not found
    -   503, which means that the web server is denying access to the
        content that you are trying to view

### Advanced troubleshooting for HTTP checks

Run cURL, a common command-line web page utility, against the website
that you are checking to return the contents of the web page to your
terminal or shell window. You can explore cURL's options to get more
specific information, but a useful option is `-I`. This option returns
the target web page's headers and the response code from the web server.

For example, enter the following command in your terminal or shell
window, replacing `yourDomain` with your actual domain:

    curl -I http://www.yourDomain.com

The output should look something like this:

    HTTP/1.1 200 OK
    Content-Type: text/html; charset=UTF-8
    Last-Modified: Tue, 04 Sep 2012 20:00:05 GMT
    P3P: CP="ALL DSP COR CUR ADMo DEVo TAIo PSAo PSDo IVAo CONi OTPi OUR NOR UNI"
    Server: Apache Date: Tue, 04 Sep 2012 20:33:51 GMT
    Connection: keep-alive Set-Cookie: target=us; path=/; domain=.your_domain.com Expires: Tue, 04 Sep 2012 21:00:00 GMT

### TCP checks

TCP checks monitor ports. If an alert is triggered for a TCP check, use Telnet to try to communicate with the target or scan your target for the open port.

**Note**: Ensure that you are authorized to scan the target. Many
network security groups view this type of scan as an attack on the open
port.

Alternatively, try to directly access the service that is running on
that port. For example, if the service is an SSH server, try to open an
**ssh** session to the target host. If the service is running MySQL or
Microsoft SQL Server, try to connect to the database. 

Following is an
example of how to use Telnet to communicate with the default port
(3306) for MySQL:

    telnet mysql.myhost.com 3306

To exit Telnet, type `Ctrl  \]`, press the **Enter** key, and then type `quit`.

### Other resources

If you're unable to solve the problem by using the steps outlined in this
article, review the information in the following documents:

- [Rackspace Monitoring API status code reference](https://developer.rackspace.com/docs/rackspace-monitoring/v1/tech-ref-info/check-type-reference/#check-status-codes)

- [Rackspace Monitoring Checks and Alarms](/how-to/rackspace-monitoring-checks-and-alarms/)

If you need more assistance, contact [Rackspace Support](https://www.rackspace.com/support).
