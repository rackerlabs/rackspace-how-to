---
permalink: rackspace-cloud-essentials-rescue-mode-on-windows-cloud-servers-behaviors/
audit_date:
title: Rackspace Cloud Essentials - Rescue Mode on Windows Cloud Servers behaviors
type: article
created_date: '2012-03-01'
created_by: Rackspace Support
last_modified_date: '2016-07-08'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rescue Mode is a maintenance state that can allow you access to an unresponsive server. You would use this in order to fix configuration problems, or to copy your data and move it to another server.  

When you enter your server into Rescue Mode, your original disk volume is set aside temporarily. Meanwhile a fresh server is built, based from the original stock image for your OS selection. Your original volume will then be attached as a secondary device to the rescued instance. Then you have the opportunity to assign a drive letter to your existing drive in order to access it.  

After the rescue image has completed building, a temporary password is presented. You will need to copy password if you wish to enter into your server in rescue mode through an SSH client. After entering Rescue Mode, you will have 24 hours to repair your instance before it automatically reverts back to the previous instance.

**Note:** Some versions of the Windows OS will modify the original disk signature when mounted a secondary drive. If you reboot, you'll probably get a `winload.exe` error or a `0xc000000e` error. This occurs with the BCD boot loader and not with the NTLDR loader. If that happens, you can re-rescue the system, and fix up the bootloader so it has the proper signature. Please see the instructions below for your OS type.

### Windows 2008 SP2 rescue behavior

Enter into computer management. You’ll need to right click on Disk 1 and select **on-line**. This will automatically assign the volume a drive letter, usually **D:**.

For Windows 2008 SP2, the BCD store will reside on the System Partition. When fixing up the bootloader, you'll need to point to the BCD Store. The partition setting will be the drive where the location of the System Partition (where \Windows is located). The idea is we need to put the correct disk signature into the BCD store, so that Windows can boot properly. You'll need to first run `bcdedit` and point it to your original drive's store:

    Microsoft Windows [Version 6.0.6002]
    Copyright (c) 2006 Microsoft Corporation.  All rights reserved.

    C:\Users\Administrator>bcdedit /store d:\boot\bcd

    Windows Boot Manager
    --------------------
    identifier              {bootmgr}
    device                  partition=C:
    description             Windows Boot Manager
    locale                  en-US
    inherit                 {globalsettings}
    default                 {ntldr}
    displayorder            {1d25cc4a-fc03-11de-b973-d1d82d39e489}
    toolsdisplayorder       {memdiag}
    timeout                 30
    resume                  No

    Windows Boot Loader
    -------------------
    identifier              {1d25cc4a-fc03-11de-b973-d1d82d39e489}
    device                  partition=C:
    path                    \Windows\system32\winload.exe
    description             Microsoft Windows Server 2008
    locale                  en-US
    inherit                 {bootloadersettings}
    osdevice                partition=C:
    systemroot              \Windows
    resumeobject            {1d25cc4b-fc03-11de-b973-d1d82d39e489}
    nx                      OptOut

You'll need to grab the unique identifier under the Windows Boot Loader section. In this example it's `\{1d25cc4a-fc03-11de-b973-d1d82d39e489}` however, on most of the instances it will be `{Default}`. Please check the identifier and use the appropriate one. If you have ANY doubts, contact support for assistance. The default path for the BCD store is **\boot\bcd** so if the drive you are working with is **D:**, then the full path is **D:\boot\bcd**. Following is the format for the `BCD` command:

    bcdedit /store <full path to BCD store> /set <Windows Boot Loader Unique Indentifier> osdevice partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set <Windows Boot Loader Unique Indentifier> device partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set {bootmgr} device partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set {memdiag} device partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set {ntldr} device partition=<drive letter where original \Windows folder resides>

Following is sample output from the `BCD` command:

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {1d25cc4a-fc03-11de-b973-d1d82d39e489} osdevice partition=d:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {1d25cc4a-fc03-11de-b973-d1d82d39e489} device partition=d:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {bootmgr} device partition=d:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {memdiag} device partition=d:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {ntldr} device partition=d:
    The operation completed successfully.

### Windows 2008 R2 rescue behavior

Enter into computer management. You’ll need to right click on Disk 1 and select **on-line**. It will on-line the disk and set the System Reserved Partition to **D:** and your original storage volume to **E:**. Occasionally it will flip the drive order so the System Reserved Partition is **E:** and the original storage volume is **D:**. Make sure to make note of which partition is what.

For Windows 2008 R2, the BCD store will reside on the Boot Partition which is 100MB in size. When fixing up the bootloader, you'll need to point to the BCD Store. The partition setting will be the drive where the location of the System Partition (where \Windows is located). The idea is we need to put the correct disk signature into the BCD store, so that Windows can boot properly. You'll need to first run `bcdedit` and point it to your original drives store:

    Microsoft Windows [Version 6.1.7600]
    Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

    C:\Users\Administrator>bcdedit /store e:\boot\bcd

    Windows Boot Manager
    --------------------
    identifier              {bootmgr}
    device                  partition=E:
    description             Windows Boot Manager
    locale                  en-US
    inherit                 {globalsettings}
    default                 {ntldr}
    resumeobject            {ca73fe20-fc0c-11de-8f38-8e2c5384be89}
    displayorder            {ca73fe21-fc0c-11de-8f38-8e2c5384be89}
    toolsdisplayorder       {memdiag}
    timeout                 30

    Windows Boot Loader
    -------------------
    identifier              {ca73fe21-fc0c-11de-8f38-8e2c5384be89}
    device                  partition=C:
    path                    \Windows\system32\winload.exe
    description             Windows Server 2008 R2
    locale                  en-US
    inherit                 {bootloadersettings}
    recoverysequence        {ca73fe24-fc0c-11de-8f38-8e2c5384be89}
    recoveryenabled         Yes
    osdevice                partition=C:
    systemroot              Windows
    resumeobject            {ca73fe20-fc0c-11de-8f38-8e2c5384be89}
    nx                      OptOut

You'll need to grab the unique identifier under the Windows Boot Loader section. In this example it's `\{ca73fe21-fc0c-11de-8f38-8e2c5384be89}`. The format for the `BCD` command will be this:

    bcdedit /store <full path to BCD store> /set <Windows Boot Loader Unique Indentifier> osdevice partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set <Windows Boot Loader Unique Indentifier> osdevice partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set {bootmgr} device partition=<drive letter where original \Windows folder resides>
    bcdedit /store <full path to BCD store> /set {memdiag} device partition=<drive letter where original \Windows folder resides>

Following is sample output from the `BCD` command:

    C:\Users\Administrator>bcdedit /store e:\boot\bcd /set {ca73fe21-fc0c-11de-8f38-8e2c5384be89} osdevice partition=e:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store e:\boot\bcd /set {ca73fe21-fc0c-11de-8f38-8e2c5384be89} device partition=e:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store e:\boot\bcd /set {bootmgr} device partition=e:
    The operation completed successfully.

    C:\Users\Administrator>bcdedit /store e:\boot\bcd /set {memdiag} device partition=e:
    The operation completed successfully.

### Windows 2003 rescue behavior

**Note:** Rackspace no longer offers Cloud Servers with Windows 2003, but these instructions are here for legacy support purposes.

Once in Rescue Mode, you’ll need to go to Disk Management and assign the secondary disk a drive letter in order to manipulate the original volume.  Upon exit from Rescue Mode, your Cloud Server should boot normally.

### Summary

Using Rescue Mode is a useful process if you are required to save data from your server.  However, if you don't need to save any data from your non-functioning server, it can be simpler to delete it and start with a fresh instance created from a recent good backup image of the server.

### Related articles

[Rescue Mode on Windows Cloud Servers](/how-to/rescue-mode-on-windows-servers)
