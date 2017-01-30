---
permalink: common-windows-issues-why-password-resets-fail-on-a-domain-controller/
audit_date:
title: 'Common Windows Issues:  Why Password Resets Fail on a Domain Controller'
type: article
created_date: '2011-08-16'
created_by: Richard Goodwin
last_modified_date: '2016-06-10'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

**Problem:** After issuing a password
reset request for a Windows Server acting as a Domain Controller (DC),
the password does not reset.

**Cause:** The Rackspace Cloud Servers
Agent service attempts to alter the local Security Accounts Manager
(SAM) account for the Administrator object and reports a failure, but
the password reset operation appears to have completed
successfully.

**Resolution:** None at this time. A Domain Controller does not have any local accounts.  When
a server is promoted to a Domain Controller, all local accounts are
removed and authentication, access permissions, group memberships, etc
are handled by the Active Directory database.  Since there are no local
accounts, the password reset command sent to the local Administrator
object will fail.

**Conclusion:** When you attempt to
clone a Domain Controller, the operation will fail on multiple levels.
Even if the build somehow makes it past the password reset stage, the DC
will never be functional as it will detect a duplicate Domain Controller
object within the forest, which is impossible outside of a cloning
scenario due to how computer names are handled within Active Directory.

If the new Domain Controller's name was altered, another failure will
occur because DNS (and hence Active Directory since they are tied
together) will be unable to locate the name it sees as the Start of
Authority (SOA) for the Active Directory domain's zone file.  The
computer object within the Domain Controllers container within Active
Directory will also not match, so the cloned Domain Controller will think
it abides by all the rules during its boot process, but when confronted
with reality, it will become so confused and embarrassed that it will
isolate itself from all communication on the network and shut down all
Directory Services attributes - which means you will never make it past
a login prompt and you'll have to boot into Directory Services Restore
Mode to clean up the metadata.

**Note:** You cannot clone a Rackspace Cloud
Server that is configured to be a Domain Controller. In order to save
an image of the server for use in creating new servers, you must first
demote the server from being a Domain Controller.
