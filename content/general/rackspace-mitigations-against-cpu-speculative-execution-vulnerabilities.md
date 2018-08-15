---
permalink: rackspace-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-02-18'
title: Rackspace mitigations against CPU speculative execution vulnerabilities
type: article
created_date: '2018-01-09'
created_by: Marc Nourani
last_modified_date: '2018-08-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

This page lists various Rackspace services and their current mitigation status for the CPU speculative execution
vulnerabilities. In some cases, customers might need to take additional action to mitigate these vulnerabilities.

**Spectre and Meltdown**

Details related to the vulnerabilities can be found in:
  - [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753)
  - [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715)
  - [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754)

**Spectre and Meltdown variants 3A and 4** (May 21, 2018)

Details related to the vulnerabilities can be found in:
  - [CVE-2018-3639](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3639)
  - [CVE-2018-3640](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3640)
  - [US Cert's Alert TA18-141A](https://www.us-cert.gov/ncas/alerts/TA18-141A).

**L1 Terminal Fault (L1TF) or Foreshadow** (August 14, 2018)

Details related to the vulnerabilities can be found in:
  - [CVE-2018-3615](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3615)
  - [CVE-2018-3620](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3620)
  - [CVE-2018-3646](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3646).

We are continuing to work in collaboration with our vendors and partners. Additional details will be provided as they are made available. If we need to take action that would impact customers, we will provide additional guidance directly to the customers involved.

**Important**: Rackspace continues to execute its mitigation and remediation strategy to address the CPU speculative execution vulnerabilities. We have multiple teams working with the utmost urgency to remediate these vulnerabilities. This a complex and evolving situation, as the guidance provided by numerous vendors regarding remediation efforts and patching continues to change. Based on the level of threat, we firmly believe the best course forward is to continue working with our vendors as they develop stable and proven patches, and applying them in the least impactful manner possible. If we need to take action that would impact customers, we will provide additional guidance directly to the customers involved.

| Service | Mitigation Status |
| --- | --- |
| **Cloud Office** | Given the configuration of the Cloud Office environment, the risk to the platform is assessed to be minimal. |
| **Fanatical AWS** | Per the [AWS security bulletin](https://aws.amazon.com/security/security-bulletins/AWS-2018-013/), Amazon Web Services (AWS) implemented proactive steps to secure the AWS infrastructure against these vulnerabilities.<br/><br/>Despite AWS actions, malicious software running within guest VMs might be able to exploit these vulnerabilities. Rackspace will provide additional guidance directly to potentially affected customers.<br/><br/>Customers who want to update AWS guest VMs in advance of these communications should contact the Fanatical AWS support team. |
| **Fanatical Azure** | Per [Microsoft Azure®](https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution), Microsoft® took proactive steps to secure the Azure infrastructure against these vulnerabilities.<br/><br/>Despite Azure actions, malicious software running within guest virtual machines (VMs) might be able to exploit these vulnerabilities. Rackspace will provide additional guidance directly to potentially affected customers.<br/><br/>Customers who want to update Azure guest VMs in advance of these communications should contact the Fanatical Azure support team. |
| **Firmware / Microcode** | Rackspace has received a subset of server platform firmware/microcode updates. Each firmware/microcode update will be tested and released according to our standard procedures.<br/><br/>As firmware/microcode updates become available, Rackspace will send tickets to customers who use the specific platforms. Customers who elect to patch their dedicated servers **must** opt in to a maintenance window to apply the update. Additional actions might be required to fully remediate against these vulnerabilities.<br/><br/>For more information, see [Firmware/Microcode mitigations against CPU speculative execution vulnerabilities](/how-to/firmware-microcode-mitigations-against-cpu-speculative-execution-vulnerabilities/). |
| **Google Cloud Platform™ (GCP)** | Per [Google](https://support.google.com/faqs/answer/7622138), Google took proactive steps to secure the GCP infrastructure against these vulnerabilities.<br/><br/>Despite Google actions, malicious software running within guest VMs might be able to exploit these vulnerabilities. Rackspace has provided additional guidance directly to potentially affected customers that OS and/or Google Kubernetes® Engine can be patched at any time. |
|**Hyper-V®** |Customers who elect to patch hypervisors with the updates currently available should contact the Microsoft Cloud support team for further assistance.<br/><br/>For guest VMs, Rackspace recommends that customers also follow the guidance provided for Windows® OS or Linux® OS, as applicable. |
| **Linux OS** | Currently, normal Rackspace patching processes will apply. Rackspace will add vendor patches to the patching schedule as they become available and are tested by Rackspace.<br/><br/>Customers who want to update devices in advance of typical patching windows should contact their support team.<br/><br/>For more information, see [Linux OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/). |
| **Managed Colocation & Managed Infrastructure** | Given the configuration of Managed Colocation and Managed Infrastructure environments, Rackspace does not have root access to customer devices.<br/><br/> Customers should reference the vendors for their recommended solutions to mitigate the vulnerability via patches of the operating system and microcode updates. |
| **Network Security** | Risk to Network Security appliances is assessed to be minimal. |
| **ObjectRocket** | Our engineering teams continue to work with our vendors to review all internal and customer environments. If we need to take action that would impact production databases, we will provide additional guidance directly to the customers involved. |
| **Rackspace Application Services** | Currently, normal Rackspace Application Services patching processes will apply. Rackspace will add vendor patches to the patching schedule as they become available and are tested by Rackspace.<br/><br/>Customers who want to update devices in advance of typical patching windows should contact their support team.<br/><br/>For more Linux information, see [Linux OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).<br/><br/>For more Hypervisor information see [VMware OS mitigations against CPU speculative execution vulnerabilities](/how-to/vmware-os-mitigations-against-cpu-speculative-execution-vulnerabilities).<br/><br/>For more Windows information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/). |
| **Rackspace Managed Security (RMS)** | Customers should review the platform-specific guidance provided on this page. Customers who have specific questions regarding RMS services or other security concerns should contact the RMS Customer Experience Team. |
| **Rackspace Network Infrastructure** | Engineers have confirmed with all vendors that these vulnerabilities cannot be exploited on the Rackspace network infrastructure. |
| **Rackspace Private Cloud** | **RedHat® OpenStack® Platform**: Rackspace has provided guidance to affected customers that patches are currently available.<br/><br/>**Rackspace Private Cloud Ubuntu®**: Rackspace will provide additional guidance to affected customers, including options to patch or upgrade OpenStack release based on Ubuntu kernel version.<br/><br/>**Guest Instances**: Rackspace recommends that customers follow guidance provided by the applicable OS vendor. <br/><br/>For more RPC information, see [RPC mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/rpc-mitigations-against-cpu-speculative-execution-vulnerabilities/). |
| **Rackspace Public Cloud** | The vast majority of Rackspace Public Cloud infrastructure is not vulnerable and the remaining threat vectors are minimal.  For security reasons, we won't disclose the exact nature of those vectors but they are aligned with similar industry-leading cloud providers. To date, we have consciously executed remediation with non-impacting mitigation work. While new information from our upstream vendors could alter this stance, we do not anticipate impactful action to our customers associated with remediation of these vulnerabilities.  For more information, see [Rackspace Public Cloud OS mitigations against CPU speculative execution vulnerabilities](/how-to/rackspace-public-cloud-os-mitigations-against-cpu-speculative-execution-vulnerabilities).<br/><br/>Rackspace has provided additional guidance directly to Managed Operations customers on Rackspace Public Cloud.<br/><br/>We suggest that Managed Infrastructure customers on Rackspace Public Cloud follow guidance provided by the applicable operating system vendor. |
| **Storage and Managed Backup** | Risk to Managed Storage appliances and Managed Backup services are assessed to be minimal. |
| **VMware®** | Customers who elect to patch hypervisors with the updates currently available should contact the VMware support team for further assistance.<br/><br/>For guest VMs, we recommend that customers also follow the guidance provided for Windows OS or Linux OS, as applicable.<br/><br/> For more information see [VMware OS mitigations against CPU speculative execution vulnerabilities](/how-to/vmware-os-mitigations-against-cpu-speculative-execution-vulnerabilities). |
| **Windows OS** | Currently, normal Rackspace patching processes will apply. Rackspace will add vendor patches to the patching schedule as they become available and are tested by Rackspace.<br/><br/>Customers who want to update devices in advance of typical patching windows should contact their support team.<br/><br/>For more information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/). |


#### References

[Vulnerabilities Affecting Processors by Intel, AMD and ARM](https://blog.rackspace.com/rackspace-is-tracking-vulnerabilities-affecting-processors-by-intel-amd-and-arm)
