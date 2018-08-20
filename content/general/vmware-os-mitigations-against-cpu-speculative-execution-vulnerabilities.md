---
permalink: vmware-os-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-02-18'
title: 'VMware OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-02-18'
created_by: Marc Nourani
last_modified_date: '2018-08-20'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPUs. You can find more information about the vulnerabilities in the following locations:

**Spectre and Meltdown**

Details related to the vulnerabilities can be found in:

  - [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753)
  - [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715)
  - [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754)

**Spectre and Meltdown variants 3A and 4** (May 21, 2018)

Details related to the vulnerabilities can be found in:

  - [CVE-2018-3639](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3639)
  - [CVE-2018-3640](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3640)
  - [US Cert's Alert TA18-141A](https://www.us-cert.gov/ncas/alerts/TA18-141A)

**L1 Terminal Fault (L1TF) or Foreshadow** (August 14, 2018)

Details related to the vulnerabilities can be found in:

  - [CVE-2018-3615](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3615)
  - [CVE-2018-3620](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3620)
  - [CVE-2018-3646](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-3646)

### Mitigation categories

For VMware, mitigation of these vulnerabilities fall into three different categories:

1. Hypervisor-Specific Mitigation
2. Hypervisor-Assisted Guest Mitigation
3. Operating System-Specific Mitigations

#### Hypervisor-Specific Mitigation

Rackspace has made available ESXi patches up to the following build numbers to help remediate this category:

- ESXi 6.0 - Build 6921384
- ESXi 5.5 - Build 7618464

**Note:** Patching ESXi may result in Hypervisor and VM downtime.

#### Hypervisor-Assisted Guest Mitigation

VMware previously released microcode updates to address a portion of this category, but pulled those patches from circulation due to instability concerns. Currently, we are awaiting microcode and firmware updates from our hardware vendors.  

**Note:** Patching the microcode and firmware may result in Hypervisor and VM downtime.

#### Operating System-Specific Mitigations

Currently, normal Rackspace patching processes apply. Rackspace will add vendor patches to the patching schedule as they become available.

VMware also recommends that we upgrade the hardware version of the VM to version 9 at minimum.

**Note:** Patching at the OS and VM hardware level may result in Virtual Machine downtime.

### Patching - ESXi and Guest OS

Currently, patching ESXi and the Guest OS will only cover two of the three categories:

1. Hypervisor-Specific
2. Operating System-Specific Mitigations.


**Note:** Patches to microcode and firmware for Hypervisor-Assisted Guest Mitigations may require further downtime for Hypervisor and Virtual Machines.

### Public facing articles

VMware has released the following public-facing articles:

- [VMSA-2018-0002 - VMware ESXi, Workstation and Fusion updates address side-channel analysis due to speculative execution](https://www.vmware.com/us/security/advisories/VMSA-2018-0002.html)
- [VMware Response to Speculative Execution security issues, CVE-2017-5753, CVE-2017-5715, CVE-2017-5754 (aka Spectre and Meltdown)(52245)](https://kb.vmware.com/s/article/52245)
- [VMware Virtual Appliances and CVE-2017-5753 (Spectre v1), CVE-2017-5715 (Spectre v2), CVE-2017-5754 (Meltdown v3) (52264)](https://kb.vmware.com/s/article/52264)
