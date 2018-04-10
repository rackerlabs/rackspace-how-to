---
permalink: firmware-microcode-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-04-10'
title: 'Firmware/Microcode mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-04-10'
created_by: Marc Nourani
last_modified_date: '2018-04-10'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPUs, commonly known as Meltdown and Spectre: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754).

Vendors have begun to release firmware/microcode updates for specific platforms. Rackspace will perform testing based on standard practices and make updates available upon successful completion of this process. We are aware that these updates might impact performance to an extent dependent upon specific workloads, application usage, or I/O. Our testing will not account for customer-specific performance impact. If you have concerns related to performance impact, please review vendor-provided guidance. Red Hat has provided information regarding potential performance impacts at [Speculative Execution Exploit Performance Impacts](https://access.redhat.com/articles/3307751).

As firmware/microcode updates become available, Rackspace will send a ticket to inform customers that one or more of their devices has available firmware/microcode updates. Customers **must** opt in to a maintenance window to install the firmware/microcode updates. Along with the updates, devices might require additional steps for guest OS and virtualization platforms to be fully remediated.

### Guest OS and Virtualization Specifics

**Linux**

Linux operating systems require both a kernel update and firmware/microcode update along with a subsequent reboot for remediation against all known variants of the vulnerabilities. For those devices submitted for the opt-in maintenance, Rackspace will perform an audit to detect environment details likely to cause delays or issues during a kernel patch or reboot maintenance and take steps necessary to remediate any issues that appear in the audit. If the device is not running a patched kernel, Rackspace will install the updated kernel prior to the firmware/microcode update and subsequent reboot.

For additional information, see [Linux OS mitigations against CPU speculative execution vulnerabilities](/how-to/linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

**Windows**

After firmware/microcode updates are installed, application of three additional registry keys is required to fully remediate these vulnerabilities. Rackspace will add these remaining keys at the time of the firmware/microcode updates.

For additional information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

**VMware**

After the firmware/microcode updates are installed, an ESXi upgrade might be necessary. In some cases, this upgrade might require a reboot, resulting in downtime for Virtual Machines. Given this, Rackspace will coordinate ESXi Hypervisor firmware/microcode updates separately and **not** include them in the initial maintenance process.

For additional information, see [VMware OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/vmware-os-mitigations-against-cpu-speculative-execution-vulnerabilities/)

**Hyper-V**

After the firmware/microcode update is applied to the hypervisor, mitigation of the vulnerability will require patching the hypervisor OS, application of registry keys, and a firmware update. This process requires a reboot for both the OS and firmware updates, potentially resulting in downtime for Virtual Machines. Given this, Rackspace will coordinate Hyper-V Hypervisor firmware/microcode updates separately and **not** include them in the initial maintenance process.

For additonal information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

### Managed Colocation

Customers on Managed Colocation (colo) environments can work with their Rackspace account team to schedule maintenance to install the firmware/microcode updates, or download the updates to apply on their own.
