---
permalink: linux-log-files/
audit_date: '2019-01-24'
title: Linux log files
type: article
created_date: '2018-08-21'
created_by: Kate Dougherty
last_modified_date: '2019-01-24'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article identifies what is in each of the Linux&reg;logs, where they are
stored, and which distributions (distro) use the logs.

For the most of the following logs, you can use `vi`, `less`, `tail`, or `cat`
to view the log details. Exceptions to this rule are noted in the descriptions.

- **/var/log/alternatives.log** (Ubuntu&reg;/Debian&reg; (DEB))

  Stores information from `update-alternatives`.

- **/var/log/apache2/access.log** (Ubuntu/DEB)

  Stores requests, such as HTTP `GET` and `POST` requests, that are processed
  by Apache&reg;. Parse these logs by using log parsers such as `awstats` or
  `webalizer`. Configure this by using the `CustomLog` directive.

- **/var/log/apache2/error.log** (Ubuntu/DEB)

  Stores all Apache errors and diagnostic information found while serving
  requests. The location of the **error.log** file is set by the `ErrorLog`
  directive.

- **/var/log/audit/audit.log**

  Stores information from the Linux audit daemon (`auditd`). This log contains
  information on which files users perform reads or writes. For example, you can
  use this log to determine who changed a specific file.

- **/var/log/auth.log**

  Contains system authorization information, including user logins and
  which authentication mechanism that was used.

- **/var/log/boot**

  Contains information about the boot process after the kernel has loaded.
  Information includes things such as system file checks, mounting a
  filesystem, starting a firewall, starting network devices, and starting services.

- **/var/log/btmp**

  Contains failed login attempts. Use the `last` command to view this log.
  For example: `last -f /var/log/btmp |more`

- **/var/log/cron**

   `crondaemon` and `anacron` store information about the cron job is here, after
   they start a cron job.

- **/var/log/dmesg**

  Contains kernel information about hardware and devices detected during the
  boot process. This file is overwritten when new messages are sent to it, such
  as during the next boot.

- **/var/log/dpkg.log** (Ubuntu/DEB)

  Stores information that is logged when a package is installed or removed by
  using the `dpkg` command.

- **/var/log/faillog**

  Contains failed user login attempts. Use `faillog` to access the information.

- **/var/log/kern.log** (Ubuntu/DEB, and can be configured for Centos&reg; and Redhat&reg;)

  Contains log details from the kernel's initialization at system bootup, as well
  as any kernel errors or informational messages that are sent from the kernel.

- **/var/log/lastlog**

  Displays recent login information. Run this command to view the log entries.

- **/var/log/maillog.log** (Centos/Redhat)

  Stores information from the mail server that is running on your system, such
  as Sendmail logging information.

- **/var/log/mail.log (Ubuntu/DEB)**

  Stores information from the mail server that is running on your system, similar
  to Maillog.log for the Centos and Redhat flavors.

- **/var/log/mail**

  Contains additional logs provided by your mail server. For example: Sendmail
  stores collected mail statistics in **/var/log/mail/statistics**.

- **/var/log/messages (Centos/Redhat)**

  Contains global system messages, including the messages logged during boot.
  Log entries include information from `mail`, `cron`, `daemon`, `kern`, `auth`,
  and so on.

- **/var/log/sa**

  Contains daily `sar` files collected by the  `sysstat` package.

- **/var/log/samba/**

  Contains log information stored by the `samba` daemon, which is used to
  connect to Microsoft Windows&reg; and Linux filesystems.

- **/var/log/setroubleshoot/**

  Used by SELinux to capture security issues in files and log that information.

- **/var/log/secure** (Centos/Redhat)

  Stores information related to authentication and authorization privileges.
  For example, `sshd` logs all information here, including unsuccessful attempts.

- **var/log/wtmp** or **/var/log/utmp**

  Contains login records and shows who is logged into the system. The `who`
  command uses this file to display the information.

- **/var/log/yum.log** (Centos/Redhat)

  Stores information that is logged when a package is installed or removed.
