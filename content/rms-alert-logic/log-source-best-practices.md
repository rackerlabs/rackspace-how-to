---
permalink: log-source-best-practices/
title: Log source best practices
type: article
audit_date: '2020-02-03'
created_date: '2020-02-03'
created_by: RMS Network Defense
last_modified_date: '2020-02-03'
last_modified_by: Stephanie Fillmon
product: Alert Logic Security Solutions
product_url: rms-alert-logic
---

A well-defined log management process enables organizations to deal with large volumes of computer-generated log messages. By collecting, aggregating, parsing and analyzing these messages, organizations can better understand what’s happening with systems in their IT environment and extract real value from the information for performance, security, compliance and other purposes.

The purpose of this article is to discuss typical log sources required for common compliance and security use. The reports and configuration examples used in this paper are from Alert Logic&reg; Log Manager. Alert Logic Log Manager is a software-as-a-service based log management solution that collects, parses, and normalizes the millions of data points embedded in application and IT infrastructure logs.

### Best practice reports available in Alert Logic Log Manager

Alert Logic Log Manger provides the following reports:

#### Microsoft&reg; Active Directory&reg; (AD)

**Active Directory Global Catalog Change** – The Microsoft Active Directory Global Catalog provides information about every object controlled within your AD forest. Additionally, it provides the ability to search across multiple domains without being required to access the AD for each domain directly. This report details all changes to the AD Global Catalog that are recorded as log messages.

**Active Directory Global Catalog Demotion** – The Microsoft Active Directory Global Catalog provides information about every object controlled within your AD forest. Additionally, it provides the ability to search across multiple different domains without being required to access the AD for each domain directly. This report provides log message details each time a domain controller in your AD forest has been demoted, and can no longer serve the global catalog.

#### Databases

**Database Failed Logins** – This report is generated to identify and display database login failure log messages received from all monitored hosts. This report is available for Oracle and SQL Server databases.

#### Network devices

**Network Device Failed Logins** – This report is generated to identify and display network device login failure log messages received from all monitored hosts.

**Network Device Policy Change** – This report is generated when a policy is added/changed/removed on network devices.

#### Windows Server&reg; (2012, 2008 R2, 2008, 2003)

**Excessive Windows Account Lockouts** – This report is generated when a threshold of two log messages has been exceeded. The messages indicate that Windows user accounts have been locked out.

**Excessive Windows Account Lockouts by Administrative User** – This report is generated when a threshold of two log messages has been exceeded. The messages indicate that the Windows Administrator account has been locked out.

**Excessive Windows Failed Logins** – This report is generated to identify and display excessive Windows login failure log messages received from all monitored hosts with a threshold greater than five messages.

**Excessive Windows Failed Logins by Administrative User** – This report is generated when an excessive number of Windows login failure log messages are received from a single host for the Administrator account. The threshold is more than five messages.

**Windows FTP Failed Logins** – This report is generated when log messages indicate that accounts have failed to successfully login to IIS.

**Windows User Account Created** – This report is generated when log messages indicate that user accounts have been successfully created.

**Windows User Account Modified** – This report is generated when log messages indicate that user accounts have been modified (changed/created/deleted).

**Windows User Group Created** – This report is generated when log messages indicate that a user group has been created.

**Windows User Group Modified** – This report is generated when log messages indicate that user groups have been modified (changed/created/deleted).

### Unix/Linux&reg;

**Failed UNIX Switch User Command** – This report provides details of all recorded failed uses of the UNIX switch user (`su`) command.

**UNIX Account Created** – This report is generated when log messages indicate the creation of UNIX accounts.

**UNIX Failed Logins** – This report is generated when log messages indicate that local and remote accounts have failed to successfully login.

**UNIX Group Created** – This report is generated when log messages indicate that a UNIX user group was added.

**UNIX SSH Failed Logins** – This report is generated to identify and display SSH login failure log messages received from all monitored hosts.

**UNIX Sudo Access** – This report is generated when a user has executed the UNIX `sudo` command.

**UNIX Switch User Command Success** – This report is generated when log messages indicate that a user has successfully executed the UNIX switch user (`su`) command.

**Windows User Group Modified** – This report is generated when log messages indicate that user groups have been modified (changed/created/deleted).

### Security logging recommendations

In addition to the log configuration recommendations listed for compliance uses, the following log configurations are typical to meet many common security uses.

| Support System | Necessary Logging |
| --- | --- |
| Apache&reg; | Logging level of INFO for server logs. Apache access logs in the Common Log Format. |
| Cisco ASA | Logging Level 3 (Warnings), while setting logging Level 6 (Informational) is useful as it logs all connections there is a cost associated with storing that many log messages|
| Imperva&reg; WAF | Imperva uses *Actions* which must be configured on the Management Platform (MX) and is pushed to the WAF to inform it to log ship. This is not a default configuration. |
| Juniper&reg; | Logging level warning, while setting logging Level 6 (Informational) is useful as it logs all connections there is a cost associated with storing that many log messages|
| Linux (RHEL&reg;, SUSE&reg;, CentOS&reg;, Ubuntu&reg; operating system) | Logging Level 6 (informational) |
| Microsoft&reg; IIS | Default logging levels for server and site level |
| Microsoft Windows Server | Logging levels listed earlier in the article meet most security use cases |
| Oracle&reg; 10g/11i | Oracle default logging is to disk and is not via rsyslog. |
