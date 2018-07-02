---
permalink: windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-07-02'
title: 'Windows OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-01-16'
created_by: Marc Nourani
last_modified_date: '2018-07-02'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain central processing units (CPUs), commonly known as Meltdown and Spectre: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754). 

It is important to note that the January 2018 Security Rollup Patch security patch, and other recent patches, have the capability to eliminate multiple possible vectors. However, for the patches to be fully functional, three additional registry keys must be implemented on each device, and the server must be rebooted for implementation. Rackspace is not pushing these keys because we have identified that devices might experience a performance impact or possible "blue screens" after these additional keys are implemented. Given this, we recommend that customers carefully consider the implications of applying the three additional registry keys and apply them as they deem appropriate. As a reminder, the main registry is required, and the patch must be installed for the additional keys to take effect.  

Customers on managed colocation (colo) and Managed Infrastructure environments should reference the vendors for their recommended solutions to mitigate the vulnerability via patches of the operating system.  

We recommend that those Microsoft Private Cloud customers running virtual machines on Hyper-V hypervisors follow Microsoft’s remediation guidance for customers who request host level patching.  More info is available here: [Protecting guest virtual machines from CVE-2017-5715 (branch target injection)](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/CVE-2017-5715-and-hyper-v-vms). We recommend that guest OS remediation align with the process noted in this document.

We have aligned with Microsoft guidance to patch your device and mitigate the vulnerability, and we will align with them on availability of the patches. Microsoft has released patches for all Windows operating systems. The following link provides access to currently available patches, as well as any necessary registry keys: [https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution](https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution).

**Note:** The patches apply to only Windows operating systems. Additional patches for hardware and firmware for all platforms will be required and are continuing to roll out. We are working with our vendors to secure Unified Extensible Firmware Interface (UEFI) firmware and Basic Input/Output System (BIOS) updates. Timing of availability for updates will vary from vendor to vendor, adding another layer of complexity to full remediation. Firmware updates are the final part of the process to protect against Variant 2 2017-5715 of Spectre. Because it’s likely these updates will require reboots, customers must opt in to the maintenance prior to execution.

**Important:** Opting out of UEFI firmware updates and BIOS updates will result in not being protected against Variant 2 2017-5715 of Spectre. 

### Technical remediation

We have added new steps both for understanding and for those who want to fully remediate vulnerabilities.

<img src="{% asset_path general/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/windows-os-remediation.png %}" />


#### Step 1: Install the update

- The download and installation of the update will be dependent upon the device **Windows Updates** settings.
- Check for updates to ensure the patch is available by going to the Windows Update control panel and checking for updates.

**Note:** Server 2008 requires the following registry key to be set: 
``“HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat” /v cadca5fe-87d3-4b96-b7fb-a231484277cc``

#### Step 2: Enable update protection

There are three additional registry keys that must be configured to fully enable the protection capability of the update noted in Step 1. Instructions for enabling the mitigations are included in the "Enable mitigation" section.

#### Step 3: Apply OEM firmware

In addition to updating the registry, applying the update, and enabling update protection, an OEM firmware (processor microcode) update is required to enable the ``Branch target injection`` protection in the update.  


**Install patches**

1. Check for and install outstanding patches for the server.

2. After the any outstanding patches have been install, reboot the server and ensure the January 2018 Security rollups have been applied.


**Enable mitigation**

1. Set the registry keys to enable the mitigation by running the following commands in the command prompt window on the local server:

       reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0 /f

       reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f

       reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f

    **Note:** Branch Target Injection Mitigation will not be enabled until firmware updates have been applied.

**Install the firmware updates**

Instructions for applying firmware updates are outlined in [Firmware/Microcode mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/firmware-microcode-mitigations-against-cpu-speculative-execution-vulnerabilities/).


As always, please contact your support team if you have any questions. 
