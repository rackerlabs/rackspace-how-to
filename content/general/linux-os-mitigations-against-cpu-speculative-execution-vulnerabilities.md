---
permalink: linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-07-02'
title: 'Linux OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-01-16'
created_by: Marc Nourani
last_modified_date: '2018-08-20'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain central processing units (CPUs). You can find more information about the vulnerabilities in the following locations:

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

Kernel updates to mitigate specific variants of the exploits on the supported Linux® distributions at Rackspace (Red Hat® and CentOS® 6.7+ & 7.3+; Ubuntu® 14.04 & 16.04 LTS) have been released. For additional information on these patches, see [https://access.redhat.com/security/vulnerabilities/speculativeexecution](https://access.redhat.com/security/vulnerabilities/speculativeexecution) and [https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown](https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown).  

**Note**: These updates might impact performance to an extent dependent upon specific workloads. Red Hat has provided information regarding potential performance impacts at [Speculative Execution Exploit Performance Impacts](https://access.redhat.com/articles/3307751).

Servers must be rebooted to apply the new kernel. At this time, Rackspace does not intend to force reboots of customer servers. For those customers who want to apply the update, Rackspace can install the new kernel and reboot servers immediately. Alternatively, Rackspace can install the new kernel and customers can schedule the reboots to occur in the future via the following methods:

- Dedicated Physical Server: MyRack Customer Portal [https://my.rackspace.com](https://my.rackspace.com) -> Services -> Reboot Scheduling

- VMware&reg;  Virtual Server and Managed Operations Rackspace Public Cloud Servers: Supply the date, time, and time zone. Rackspace will schedule an automated reboot on behalf of the customer.

Operating systems listed as End of Life (EOL) by the vendor might not receive patches. For those configurations that run an older EOL operating system including (but not limited to) Red Hat Enterprise Linux 5, CentOS 5, and Ubuntu 12 LTS, Rackspace recommends that customers upgrade to a supported version.

Customers on managed colocation (colo) or Managed Infrastructure Rackspace Public Cloud environments should reference the vendors for their recommended solutions to mitigate the vulnerability via patches of the operating system.

Further remediation might be necessary as evaluation of these vulnerabilities continues.

To fully remediate against the Spectre/Meltdown variants referenced in [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754), dedicated devices will also need a BIOS firmware update. Instructions for applying firmware updates are outlined in [Firmware/Microcode mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/firmware-microcode-mitigations-against-cpu-speculative-execution-vulnerabilities/).

Further remediation might be necessary as evaluation of these vulnerabilities continues.

As always, please contact your support team if you have any questions.
