---
permalink: rackspace-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-01-09'
title: Rackspace mitigations against CPU speculative execution vulnerabilities
type: article
created_date: '2018-01-09'
created_by: Marc Nourani
last_modified_date: '2018-01-16'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

This page lists various Rackspace services and their current mitigation status for the CPU speculative execution vulnerabilities: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754). In some cases, customers might need to take additional action to mitigate these vulnerabilities.

**Important**: RRackspace is executing our mitigation and remediation strategy to address these vulnerabilities, taking into account any configuration or vendor dependencies. We will provide additional guidance as more information becomes available.

| Service | Mitigation Status |
| --- | --- |
| **Cloud Office** | Given the configuration of the Cloud Office environment, the risk to the platform is assessed to be minimal. |
| **Dedicated Linux** | Currently, normal Rackspace patching processes will apply. Rackspace will add vendor patches to the patching schedule as they become available and are tested by Rackspace.<br/><br/>Customers who want to update devices in advance of typical patching windows should contact their support team. |
| **Dedicated Windows** | Currently, normal Rackspace patching processes will apply. Rackspace will add vendor patches to the patching schedule as they become available and are tested by Rackspace.<br/><br/>Customers who want to update devices in advance of typical patching windows should contact their support team. |
| **Fanatical AWS** | Per the [AWS security bulletin](https://aws.amazon.com/security/security-bulletins/AWS-2018-013/), AWS implemented proactive steps to secure the AWS infrastructure against these vulnerabilities.<br/><br/>Despite AWS actions, malicious software running within guest VMs might be able to exploit these vulnerabilities. Rackspace will provide additional guidance directly to potentially affected customers.<br/><br/>Customers who want to update AWS guest VMs in advance of these communications should contact the Fanatical AWS support team. |
| **Fanatical Azure** | Per [Microsoft Azure](https://support.microsoft.com/en-us/help/4072698/windows-server-guidance-to-protect-against-the-speculative-execution), Microsoft took proactive steps to secure the Azure infrastructure against these vulnerabilities.<br/><br/>Despite Azure actions, malicious software running within guest VMs might be able to exploit these vulnerabilities. Rackspace will provide additional guidance directly to potentially affected customers.<br/><br/>Customers who want to update Azure guest VMs in advance of these communications should contact the Fanatical Azure support team. |
| **Google Cloud Platform** | Per [Google](https://support.google.com/faqs/answer/7622138), Google took proactive steps to secure the GCP infrastructure against these vulnerabilities.<br/><br/>Despite Google actions, malicious software running within guest VMs might be able to exploit these vulnerabilities. Rackspace has provided additional guidance directly to potentially affected customers that OS and/or Google Kubernetes Engine can be patched at any time. |
|**Hyper-V** | Rackspace is currently confirming the mitigation or remediation strategy for any configuration or vendor dependencies. Customers who elect to patch hypervisors with the updates currently available should contact the Microsoft Cloud support team for further assistance.<br/><br/>For guest VMs, Rackspace recommends that customers also follow the guidance provided for Dedicated Windows or Linux as applicable. |
| **Network Security** | Risk to Network Security appliances is assessed to be minimal. |
| **Rackspace Application Services** | Rackspace is currently confirming the mitigation or remediation strategy for any configuration or vendor dependencies.<br/><br/>Rackspace will provide additional guidance directly to potentially affected customers. |
| **Rackspace Managed Security** | Customers should review the platform-specific guidance provided in this document. Customers who have specific questions regarding RMS services or other security concerns should contact the RMS Customer Experience Team. |
| **Rackspace Private Cloud** | **RedHat OpenStack Platform**: Rackspace has provided guidance to affected customers that patches are currently available.<br/><br/>**Rackspace Private Cloud Ubuntu**: Rackspace will provide additional guidance to affected customers, including options to patch or upgrade OpenStack release based on Ubuntu kernel version.<br/><br/>**Guest Instances**: Rackspace recommends that customers follow guidance provided by the applicable OS vendor. |
| **Rackspace Public Cloud** | Should Rackspace take action on our infrastructure that would impact customers, we will provide additional guidance directly to affected customers.<br/><br/>For guest instances, Rackspace recommends that customers follow guidance provided by the applicable OS vendor. |
| **Storage and Managed Backup** | Risk to Managed Storage appliances and Managed Backup services are assessed to be minimal. |
| **VMware** | Customers who elect to patch hypervisors with the updates currently available should contact the VMware support team for further assistance.<br/><br/>For guest VMs, we recommend that customers also follow the guidance provided for Dedicated Windows or Linux as applicable. |

#### References

[Vulnerabilities Affecting Processors by Intel, AMD and ARM](https://blog.rackspace.com/rackspace-is-tracking-vulnerabilities-affecting-processors-by-intel-amd-and-arm).
