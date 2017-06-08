---
node_id: 3232
title: Installing XenServer 6.2 Tools on Migrated First Generation Windows Cloud Servers
type: article
created_date: '2016-02-09'
created_by: Aaron Mehar
last_modified_date: '2016-02-09'
last_modified_by: Aaron Mehar
product: Cloud Servers
product_url: cloud-servers
---

An earlier version of the XenServer Tools software that is installed was on First Generation Windows Cloud Servers has been found to cause server instability in rare cases.

This document walks through installing XenServer Tools version 6.2 to resolve the issue.

We **strongly** recommend backing up any important data (and possibly taking a snapshot of your server) before attempting the installation, to be on the safe side.

### Upgrade, don't uninstall ###

If your Cloud Server is affected by this issue, **do not uninstall the existing Citrix XenServer Tools package.  Upgrade the package in place.**  Uninstalling the existing XenServer Tools software will render your server inaccessible.

### Affected instances ####

[nextcp]:https://mycloud.rackspace.com

This issue **only affects First Generation Cloud Servers that have been migrated to Next Generation**.

To determine whether you need a newer version of XenServer Tools installed, check your current version under Programs and Features in the Windows control panel.

![xsversion](http://63773473543190a035ec-a897bd33ba42b6c03ac54566871e97ca.r54.cf2.rackcdn.com/xstoolsversion.png)

If the listed version is less than 6.2 you should upgrade.

Note that the upgrade will require a reboot of your instance to complete the process.

### Download the package ####

[xsdownload]:http://8d268c176171c62fbd4b-7084e0c7b53cce27e6cc2142114e456e.r30.cf1.rackcdn.com/xstools-6.2.zip
 "XenServer Tools 6.2"

You can download the recommended version of XenServer Tools by [clicking this link][xsdownload] or by pasting the following URL into a browser:

    http://8d268c176171c62fbd4b-7084e0c7b53cce27e6cc2142114e456e.r30.cf1.rackcdn.com/xstools-6.2.zip


### Install the package ####

Extract the XenServer Tools zip file to a directory of your choosing, then navigate into the software directory and run the "xensetup.exe" program to launch the installer.

**NOTE:** Change the target directory when installing the software from the default (which wants to install to the "Program Files (x86)" directory) to:

    C:\Program Files\Citrix\XenTools

Pointing the installer to the Program Files directory will ensure that the old XenServer Tools files will be overwritten.

### Restart the instance ####

After the installer is complete, reboot the server so the change will take effect.

### Confirm the installation ####

After the instance has rebooted you can confirm the installation was successful by checking the version of XenServer Tools in Programs and Features, as described above.  The new version should now be 6.2.
