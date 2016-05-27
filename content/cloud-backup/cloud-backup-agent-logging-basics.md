---
permalink: cloud-backup-agent-logging-basics/
audit_date:
title: Cloud Backup agent logging basics
type: article
created_date: '2014-05-29'
created_by: Ross Diaz
last_modified_date: '2016-04-05'
last_modified_by: Stephanie Fillmon
product: Cloud Backup
product_url: cloud-backup
---

The Rackspace Cloud Backup infrastructure communicates with your servers
through a software-based agent that resides on the system that you have
designated to back up. This agent stores information about which files
and directories you want to back up, and at what frequency. The agent is
also critical for gathering information about how Cloud Backup is
interacting with your server or storage volume, and you can use it for
detailed logging when troubleshooting a problem with Rackspace Support.

### Log configuration file

Your log configuration file is named **log4cxx.xml** and has a format
similar to the following (abbreviated) Windows example:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
    <log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">
      <appender name="FILE" class="org.apache.log4j.FileAppender">
        <param name="File" value="$PROGRAMDATA/driveclient/log/driveclient.log"/>
        <param name="Append" value="false"/>
        <layout class="org.apache.log4j.PatternLayout">
          <param name="ConversionPattern" value="[%d{dd MMM yyyy HH:mm:ss}{GMT+0}|T%t|%-5p|%12.12c|%C::%M(%L)] %m%n"/>
        </layout>
      </appender>
      <root>
        <level value="WARN"/>
        <appender-ref ref="FILE"/>
      </root>
    </log4j:configuration>

### Agent logging operations

Agent logs can store valuable troubleshooting information by outputting
data to a series of log files. When the problem condition occurs, the
logged information is analyzed to diagnose the problem. To ensure the
logs are recording the correct information it is necessary to modify the
configuration file for your agent and set the appropriate *level value*.

The available logging modes are as follows:

-   OFF - Turn logging off.
-   FATAL - Log very severe errors that will cause the application to
    abort.
-   ERROR - Log all error events, even those that might still allow the
    application to continue running.
-   WARN - Log warnings of potentially harmful situations.
-   INFO - Log informational messages that highlight the progress of the
    application.
-   DEBUG - Log fine-grained informational events to assist in
    troubleshooting.
-   TRACE - Log even more fine-grained informational events than DEBUG
    mode.
-   ALL - Turn on all logging.

**Note:** TRACE and ALL are equivalent values for logging.

### Trace-level debugging

When you set the logging level to TRACE, the agent captures more
granular data than when in DEBUG mode. If you activate TRACE debugging
you increase the risk of losing log information because of the large
volume of data written to the logs in this mode. You might need to
increase the size and number of rollover logs.

### Rolling logs

Cloud Backup agent logs are rolling logs, which means they have a
maximum size and that a maximum number of logs are stored on a server.
When logging capacity is reached, the log file rolls over by writing
over the oldest data first.

Sometimes troubleshooting an agent requires running in TRACE log mode
for a long time. When this happens, some information that Rackspace
Support needs might be overwritten before it can be captured. In such cases,
you must increase the values of the `MaxFileSize` and `MaxBackupIndex`
parameters for the agent logs. In the following example **log4cxx.xml**
configuration file, these values are set:

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
    <log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">
      <appender name="ROLLINGFILE" class="org.apache.log4j.RollingFileAppender">
        <param name="File" value="/var/log/driveclient.log"/>
        <param name="MaxFileSize" value="500MB"/>
        <param name="MaxBackupIndex" value="10"/>
        <param name="Append" value="false"/>
        <layout class="org.apache.log4j.PatternLayout">
          <param name="ConversionPattern" value="[%d{dd MMM yyyy HH:mm:ss}{GMT+0}|T%t|%-5p|%12.12c|%C::%M(%L)] %m%n"/>
        </layout>
      </appender>
      <root>
        <level value="DEBUG"/>
        <appender-ref ref="ROLLINGFILE"/>
      </root>
    </log4j:configuration>

The maximum values for these parameters are as follows:

-  `MaxBackupIndex`: 12

-  `MaxFileSize`: Unlimited (500 MB recommended)

After the problem is diagnosed, we recommend that you return these
parameters to their original values to conserve disk space.

### Where to store saved logs

Log files can quickly accumulate a large amount of data in a short
period of time. To keep the file sizes manageable, log files should
*always* be compressed using a zip or archive utility. Even when they
are compressed, log files are still often too large to attach to a
support ticket. In order to make your logs easily available to Rackspace
Support, we recommend that you upload them to your Cloud Files account
in a public container. From there, you copy the download or streaming
links for the log files and paste the links into your support ticket.

### Locations of Cloud Backup agent files

The following section lists the locations of the Cloud Backup agent on
both Linux and Windows servers.

#### Agent file location (Linux)

Assuming a default installation, following are the agent file locations
on Linux systems:

-   Configuration files: **/etc/driveclient**
-   Logs: **/var/log**
-   Startup script: **/etc/init.d**
-   Application: **/usr/local/bin**
-   PID file for running the agent: **/var/run/driveclient.pid**
-   Database: search for a **\*.db** file under **/var/cache/driveclient**

**Note:** If `driveclient` is installed as an individual user, most of
these files are under **~/.driveclient**.

#### Agent file locations (Windows)

Finding the `driveclient` files under various flavors of Windows is a
little more complicated. In general, you can find these files under the
folder to which **CSIDL_COMMON_APPDATA** points.

-   For more information about this location on Windows versions
    starting with Vista, see
    <a href="http://msdn.microsoft.com/en-us/library/windows/desktop/dd378457(v=vs.85).aspx">KNOWNFOLDERID</a>.
-   For more information about this location on earlier versions of
    Windows, see
    <a href="http://msdn.microsoft.com/en-us/library/windows/desktop/bb762494(v=vs.85).aspx">CSIDL</a>.

In a typical installation, the files will be located in these folders:

-   Configuration files: **%ProgramData%\\Driveclient**
-   Logs: **%ProgramData%\\Driveclient\\logs**
-   Application: **%ProgramFiles%\\Driveclient**
-   Database: search for a \*.db file under **%ProgramData%\\Driveclient**

### Disable logging

To disable logging, remove the tag named `appender-ref` from
**log4cxx.xml**.
