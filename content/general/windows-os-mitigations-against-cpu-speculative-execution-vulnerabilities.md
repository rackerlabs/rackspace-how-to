---
permalink: windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities
audit_date:'2016-01-16'
title: 'Windows OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-01-16'
created_by: Marc Nourani
last_modified_date: '2018-01-16'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPU processors: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754), commonly known as "Meltdown" and "Spectre".   

From a Windows Server OS perspective, Rackspace is primarily focused on implementing the main registry key, which is required for devices to receive both the current and future Microsoft Security patches. For the registry key, Microsoft guidance is to use anti-virus solutions to push the main key out to devices. However, given the variety of AV solution utilized by Rackspace customers, Rackspace took the approach to push the registry key out to devices to ensure customers could receive the most recent security patch.   

In many cases, customers and Rackspace have now applied this key. There are no known impacts to server performance associated with the installation of the main registry key. If Rackspace manages your patching, the most current security patch (which addresses a key issue for the current vulnerability) is being pushed through our Windows Server Update System (WSUS).   

Those customers on managed colo environments should reference the vendors for your recommended solutions.  

It is important to note that the current security patch has the capability to eliminate multiple possible vectors.  However, for the patch to be fully functional, three additional registry keys have to be implemented on each device and the server must be rebooted for implementation. Rackspace is not pushing these keys because we have identified that devices may experience a performance impact or possible "blue screens" once these additional keys are implemented.  Given this, we recommend that customers carefully consider the implications of applying the three additional registry keys and apply them as they deem appropriate. As a reminder, the main registry is required and the patch must be installed for the additional keys to take effect.  

### Patch Rollup Install Schedule for January 2018

- Early Week: January 15-January 21  

- Default Week: January 22-January 28  

- Delayed Week: January 29-February 4  

We have aligned with Microsoft guidance to patch your device and mitigate the vulnerability, and we will align with them on availability of the patches. Microsoft has released patches for Windows Server versions 2008R2, 2012R2, and 2016. At this time, Microsoft **has not yet** released patches for Windows Server versions 2008 and 2012.  The links below provide access to currently available patches, as well as any necessary registry keys:  

- [https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution](https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution)

- [https://support.microsoft.com/en-us/help/4072699/important-information-regarding-the-windows-security-updates-released](https://support.microsoft.com/en-us/help/4072699/important-information-regarding-the-windows-security-updates-released)

**Note**: These patches apply only to Windows operating systems. Additional patches for hardware and firmware will come in the future. We are working with our vendors to secure UEFI firmware and BIOS updates. If and when updates will be pushed out will vary from vendor to vendor, adding another layer of complexity to full remediation. Firmware updates are the final part of the process to protect against Variant 2 2017-5715 of Spectre. Because it’s likely these updates will require reboots, customers must either opt in or opt out of the maintenance prior to execution.  

**Important**: Opting out of UEFI firmware updates and BIOS updates will result in not being protected against Variant 2 2017-5715 of Spectre.   

As always, please contact your support team if you have any questions or concerns. 
