---
node_id: 3647
title: Rackspace Monitoring Checks and Alarms
type: article
created_date: '2013-08-16'
created_by: Jim Culbreath
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: cloud-monitoring
---

Rackspace Monitoring has several different types of checks with
corresponding alarms to choose from. A check determines which aspect of
the server you want monitored. The alarm activates based on specific
parameters you set on the server.

Checks determine the system to be monitored. You can get a list of
available checks by looking at your options in the Check Type menu after
clicking the Create Check button in a server's monitoring page.

**NOTE:** With General Purpose servers, Rackspace Monitoring will only
monitor the system disk. The data disk is not monitored.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/checks.png" alt="available checks" width="511" height="388" />

The checks are listed in two separate groups:

-   **Remote service checks:**  These check types test the Internet
    connectivity of the servers from remote data centers in regions
    specified in the check options.
-   **Agent checks:**  These checks are performed by the monitoring
    agent running on your server. They monitor the resource utilization
    of the server. To learn more, read [Install the Rackspace Monitoring
    Agent](/how-to/install-and-configure-the-rackspace-monitoring-agent "Install the Rackspace Monitoring Agent").

### Check and alarm settings


Each check and alarm has selectable options.

-   Check options define what a check will do each time it is executed.
-   Alarm options trigger a notification when a check fails.

The checks are defined below. For the official definitions, see the
Rackspace Monitoring Developer guide [Available Check Types and
Fields.](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-tech-ref-info/check-type-reference)
Please note, only those checks listed below are available through the
control panel. Checks not available in the control panel are noted.

### Remote checks

Remote checks are performed from multiple zones. Default zones can be
changed.

1.  **HTTP check:**  This check monitors the URL or IP you choose for
    specific [HTTP status
    codes](http://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html "Status Codes")
    or for text in the body of the page (body match).
    -   **HTTP alarm:**  The standard alarm for the HTTP check is
        **Connection time and Status Code**. When the criteria of the
        alarm is met a notification is issued.

2.  **TCP check:**  This check monitors a port number on a IP or
    hostname you specify.
    -   **TCP alarm:**  The standard alarm for the TCP check is
        **Connection time**. When the criteria of the alarm is met, a
        notification is issued.

3.  **Ping check:**  This check sends your server a number of ping
    packets that you specify and waits for a response for a set amount
    of time. We recommend that 10 packets be sent.
    -   **Ping alarm:**  The standard alarm for the ping check is **Ping
        packet loss**. You can specify what percentage of packet loss
        must occur for you to be notified.

Remote checks available only in the API or CLI:
[remote.dns](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-dns),
[remote.ftp-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-ftp-banner),
[remote.imap-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-imap-banner),
[remote.mssql-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-mssql-banner),
[remote.mysql-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-mysql-banner),
[remote.ping](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-ping),
[remote.pop3-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-pop3-banner),
[remote.postgresql-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-postgresql-banner),
[remote.smtp-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-smtp-banner),
[remote.smtp](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-smtp),
[remote.ssh](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-ssh),
[remote.telnet-banner](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-telnet-banner).

### Agent checks

Agent checks are performed by the monitoring agent installed on your
server.

1.  **Memory check:**  This check monitors and displays your server's
    memory use (RAM). It also displays your server's historical usage.
    -   **Memory alarm:**  This alarm notifies you when your server
        memory usage goes above the percentage you set in the criteria.

2.  **CPU check:**  This check monitors and displays your server's
    CPU usage. It also displays your server's historical usage.
    -   **CPU alarm:**  This alarm sends a notification when your CPU
        usage average exceeds the set criteria.

3.  **Load average check:**  This check monitors and displays your
    system's load average. This option is most often used with
    Linux machines.
    -   **Load average alarm:**  This alarm sends a notification when
        your system's load exceeds a number you specify for greater than
        **X** number of minutes. **X** is generally set for 5 minutes.

4.  **File system check:**  This check monitors and displays disk usage
    in a directory that you specify.
    -   **File aystem alarm:**  This alarm sends a notification when the
        disk space in your specified directory exceeds the parameter
        you set.

5.  **Network check:**  This check monitors your network receiving and
    transmitting traffic. The unit of value for this alarm is megabits
    per second (Mbit/s). This check also displays your traffic usage.
    Unlike the other alarms in this list, you set the network check
    alarm variable upon network check creation.
    -   **Network alarm:**  This alarm sends a notification when either
        of the **network receive** or the **network transmit rate**
        alarms are triggered.

Agent checks available only in the API or CLI:
[agent.disk](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#agent-disk),
[agent.plugin](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#agent-plugin).
