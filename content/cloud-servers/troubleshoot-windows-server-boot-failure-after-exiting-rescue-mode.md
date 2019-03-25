---
permalink: troubleshoot-windows-server-2008-boot-failure-after-exiting-rescue-mode/
audit_date: '2019-03-25'
title: Troubleshoot Windows Server 2008 boot failure after exiting rescue mode
type: article
created_date: '2019-03-25'
created_by: Rackspace Community
last_modified_date: '2019-03-25'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rescue mode is a maintenance state that allows you access to an
unresponsive server. You can use rescue mode to fix configuration problems
or to copy your data and move it to another server.

Entering your server into rescue mode temporarily sets aside your original
disk. Meanwhile, a new server builds based on the
original stock image of your selected operating system (OS). Your original
volume then attaches as a secondary device to the rescued instance.
Then you have the opportunity to assign a drive letter to your existing drive
in order to access it.

After the rescue image completes building, you receive an email with the
new password for the temporary rescue mode image. After you enter rescue mode,
you have 24 hours to repair your instance before it automatically reverts
to the previous instance.

Some versions of the Windows&reg; OS modify the original disk signature when
mounting a secondary drive. If you reboot, you are likely to receive a
**winload.exe** error or a **0xc000000e** error. This situation occurs with the
BCD boot loader and not with the NTLDR loader.

If you receive one of these errors, you can re-rescue the system and fix
the boot loader so that it has the proper signature. Use the instructions
in the following sections to edit the boot loader settings.

### Windows Server 2008

Ensure that the volume has an automatically assigned drive letter,
usually **D:**, by opening **Computer Management**. Right-click **Disk 1**
and then select **On-line**.

For Windows Server&reg; 2008 SP2, the boot configuration data (BCD) store
resides on the system partition. When
you edit the boot loader settings, you need to ensure that the
partition setting is the driver where the system partition is located. By
putting the correct disk signature into the BCD store, the Windows server
should boot properly.

To update the BCD store with the correct boot loader signature, you need
the unique identifier of the Windows Boot Loader. Use the following command
to display the settings of the boot loader:

    bcdetit /store D:\boot\bcd

The output should look similar to the following example:

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

Take note of the identifier listed under the **Windows Boot Loader** section.
In this example, the identifier is `{1d25cc4a-fc03-11de-b973-d1d82d39e489}`.

The default path for the BCD store is **\boot\bed**, so if **D:** is the drive
you are working with, the full path is **D:\boot\bed**.

Use the following commands to update the BCD store with the Windows Boot
Loader identifier:

    bcdedit /store <fullPath> /set <uniqueIdentifier> osdevice partition=<driveLetter>
    bcdedit /store <fullPath> /set <uniqueIdentifier> device partition=<driverLetter>
    bcdedit /store <fullPath> /set {bootmgr} device partition=<driveLetter>
    bcdedit /store <fullPath> /set {memdiag} device partition=<driverLetter>
    bcdedit /store <fullPath> /set {ntldr} device partition=<driveLetter>

The commands and output should look similar to the following example:

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {1d25cc4a-fc03-11de-b973-d1d82d39e489} osdevice partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {1d25cc4a-fc03-11de-b973-d1d82d39e489} device partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {bootmgr} device partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {memdiag} device partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {ntldr} device partition=d:
    The operation completed successfully.

### Windows Server 2008 R2

Open **Computer Management**, right-click **Disk 1** and then select
**On-line**. **D:** is the setting for the System Reserved Partition and
**E:** is the setting for your original storage volume.

**Note:** Occasionally, the drive order flips so that **E:** is the setting
for the System
Reserved Partition and **D:** is the setting for the original storage volume.

For Windows Server 2008 R2, the BCD store resides on the boot partition,
which is 100 MB in size. When you edit the boot loader settings, you need to
ensure that the partition setting is the driver where the system partition is
located. By putting the correct disk signature into the BCD store, the Windows
server should boot properly.

To update the BCD store with the correct boot loader signature, you need
the unique identifier of the Windows Boot Loader. Use the following command
to display the settings of the boot loader:

    bcdetit /store E:\boot\bcd

The output should look similar to the following example:

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

Take note of the identifier listed under the **Windows Boot Loader** section.
In this example, the identifier is `{1d25cc4a-fc03-11de-b973-d1d82d39e489}`.

The default path for the BCD store is **\boot\bed**, so if **E:** is the drive
you are working with, the full path is **E:\boot\bed**.

Use the following commands to update the BCD store with the Windows Boot
Loader identifier:

    bcdedit /store <fullPath> /set <uniqueIndentifier> osdevice partition=<driveLetter>
    bcdedit /store <fullPath> /set <uniqueIndentifier> osdevice partition=<driveLetter>
    bcdedit /store <fullPath> /set {bootmgr} device partition=<driveLetter>
    bcdedit /store <fullPath> /set {memdiag} device partition=<driveLetter>

**Note:** The `driveLetter` that you use is for your original storage
volume.

The commands and output should look similar to the following example:

    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {ca73fe21-fc0c-11de-8f38-8e2c5384be89} osdevice partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {ca73fe21-fc0c-11de-8f38-8e2c5384be89} device partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {bootmgr} device partition=e:
    The operation completed successfully.
    C:\Users\Administrator>bcdedit /store d:\boot\bcd /set {memdiag} device partition=e:
    The operation completed successfully.
