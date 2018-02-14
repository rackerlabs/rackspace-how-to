---
permalink: windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-02-01'
title: 'Windows OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-01-16'
created_by: Marc Nourani
last_modified_date: '2018-02-01'
last_modified_by: Nate Archer
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPU, commonly known as Meltdown and Spectre: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754).   
From a Windows® Server® OS perspective, Rackspace is primarily focused on implementing the main registry key, which is required for devices to receive both the January 2018 Security Rollup Patch and future Microsoft Security patches. For the registry key, Microsoft® guidance is to use anti-virus (AV) solutions to push the main key out to devices. However, given the variety of AV solutions utilized by Rackspace customers, Rackspace took the approach to push the registry key out to devices to ensure customers could receive the January 2018 Security Rollup Patch.  

In many cases, customers and Rackspace have now applied this key. As of this time, there are no known impacts to server performance associated with the installation of the main registry key. If Rackspace manages your patching, the most current security patch (which addresses a key issue for the current vulnerability) is being pushed through our Windows Server Update System (WSUS).   

Customers on managed colocation (colo) and Managed Infrastructure environments should reference the vendors for their recommended solutions to mitigate the vulnerability via patches of the operating system.  

It is important to note that the January 2018 Security Rollup Patch security patch has the capability to eliminate multiple possible vectors. However, for the patch to be fully functional, three additional registry keys must be implemented on each device, and the server must be rebooted for implementation. Rackspace is not pushing these keys because we have identified that devices might experience a performance impact or possible "blue screens" after these additional keys are implemented. Given this, we recommend that customers carefully consider the implications of applying the three additional registry keys and apply them as they deem appropriate. As a reminder, the main registry is required, and the patch must be installed for the additional keys to take effect.  

### Patch rollup install schedule for January 2018

- Early week: January 15-January 21  
- Default week: January 22-January 28  
- Delayed week: January 29-February 4  

### Patch rollup install schedule for February 2018

- Early week: February 19-February 25
- Default week: February 26-March 4
- Delayed week: March 5-March 11


We have aligned with Microsoft guidance to patch your device and mitigate the vulnerability, and we will align with them on availability of the patches. Microsoft has released patches for Windows Server versions 2008R2, 2012R2, and 2016. At this time, Microsoft **has not yet** released patches for Windows Server versions 2008 and 2012. The links below provide access to currently available patches, as well as any necessary registry keys:  

- [https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution](https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution)

- [https://support.microsoft.com/en-us/help/4072699/important-information-regarding-the-windows-security-updates-released](https://support.microsoft.com/en-us/help/4072699/important-information-regarding-the-windows-security-updates-released)

**Note**: The patches apply only to Windows operating systems. Additional patches for hardware and firmware will come in the future. We are working with our vendors to secure Unified Extensible Firmware Interface (UEFI) firmware and Basic Input/Output System (BIOS) updates. If and when updates will be pushed out will vary from vendor to vendor, adding another layer of complexity to full remediation. Firmware updates are the final part of the process to protect against Variant 2 2017-5715 of Spectre. Because it’s likely these updates will require reboots, customers must either opt in or opt out of the maintenance prior to execution.  

**Important**: Opting out of UEFI firmware updates and BIOS updates will result in not being protected against Variant 2 2017-5715 of Spectre.   

### Technical remediation

We have added new steps for both understanding and for those who want to fully remediate vulnerabilities.

<img src="{% asset_path general/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/windows-os-remediation.png %}" />


#### Step 1: Update the registry and apply the update

1. Update the registry. A registry key must be configured to download the required January security update.

   **Note:** Devices will not receive the January 2018 security updates (or any subsequent security updates) and will not be protected from security vulnerabilities unless the following registry key is set:  `EY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat`

2. Install the update.

   - The download and installation of the update will be dependent upon the device **Windows Updates** settings.
   - Check for updates to ensure the patch is available by going to the Windows Update control panel and checking for updates.

   **Note:** As of this update, there are no current security updates for server 2008 or server 2012 (NON R2 Versions).


#### Step 2: Enable update protection

There are three additional registry keys that must be configured to fully enable the protection capability of the update noted in Step 1. Instructions for enabling the mitigations are included in the "Enable mitigation" section.


#### Step 3: Apply OEM Firmware

In addition to updating the registry, applying the update, and enabling update protection, an OEM firmware (processor microcode) update is required to enable the ' Branch target injection' protection in the update.  

**Note:** We are awaiting the release of the firmware from the hardware vendors.


**Install Hotfix**

1. Validate if you have the QualityCompat reistry key so the server will continue to receive updates. Run the following command locally on the server:

       reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" /v cadca5fe-87d3-4b96-b7fb-a231484277cc

2. Set the QualityCompat registry key if it is not present by running:

       reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\QualityCompat" /v cadca5fe-87d3-4b96-b7fb-a231484277cc /t REG_DWORD /d 0 /f

3. Check for and install outstanding patches for the server.

4. After the any outstanding patches have been install, reboot the server and ensure the January 2018 Security rollups have been applied.


**Enable mitigation**

1. Set the registry keys to enable the mitigation by running the following commands locally on the server:

       reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 0 /f

       reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f

       reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f

2. Reboot the server to enable mitigation.

3. Verify the mitigations have been enabled by installing and running the following Validation Powershell script: https://gallery.technet.microsoft.com/scriptcenter/Speculation-Control-e36f0050.

    **Note:** Branch Target Injection Mitigation will not be enabled until firmware updates have been applied.

4. Install the firmware updates.

    **Note:** At this time, firmware updates are not available from the hardware vendors.


As always, please contact your support team if you have any questions. 
