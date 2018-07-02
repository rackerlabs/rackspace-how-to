---
permalink: firmware-microcode-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-07-02'
title: 'Firmware/Microcode mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-04-10'
created_by: Marc Nourani
last_modified_date: '2018-07-02'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPUs, commonly known as Meltdown and Spectre: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754).

Vendors have begun to release firmware/microcode updates for specific platforms. Rackspace will perform testing based on standard practices and make updates available upon successful completion of this process. We are aware that these updates might impact performance to an extent dependent upon specific workloads, application usage, or I/O. Our testing will not account for customer-specific performance impact. If you have concerns related to performance impact, review vendor-provided guidance. Red Hat has provided information regarding potential performance impacts at [Speculative Execution Exploit Performance Impacts](https://access.redhat.com/articles/3307751).

As firmware/microcode updates become available, Rackspace will send a ticket to inform customers that one or more of their devices has available firmware/microcode updates. Customers **must** opt in to a maintenance window to install the firmware/microcode updates if they would like Rackspace to install the firmware/microcode updates. Customers who would prefer to apply the updates on their own can follow the steps provided later in this article. Along with the updates, devices might require additional steps for guest OS and virtualization platforms to be fully remediated.

### Guest OS and virtualization specifics

This section includes specific information for different operating systems (OSs) and services.

**Linux OS**

Linux operating systems require both a kernel update and firmware/microcode update, along with a subsequent reboot, for remediation against all known variants of the vulnerabilities. For those devices submitted for the opt-in maintenance, Rackspace will perform an audit to detect environment details that are likely to cause delays or issues during a kernel patch or reboot maintenance, and will take the steps necessary to remediate any issues that appear in the audit. If the device is not running a patched kernel, Rackspace will install the updated kernel prior to the firmware/microcode update and the subsequent reboot.

For additional information, see [Linux OS mitigations against CPU speculative execution vulnerabilities](/how-to/linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

**Windows OS**

After the firmware/microcode updates are installed, the application of three additional registry keys is required to fully remediate these vulnerabilities. Rackspace will add these remaining keys at the time of the firmware/microcode updates.

For additional information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

**VMware**

After the firmware/microcode updates are installed, an ESXi upgrade might be necessary. In some cases, this upgrade might require a re-kick, resulting in downtime for virtual machines. Because of this, Rackspace will coordinate ESXi Hypervisor firmware/microcode updates separately and will **not** include them in the initial maintenance process.

For additional information, see [VMware OS mitigations against CPU speculative execution vulnerabilities](https://support.rackspace.com/how-to/vmware-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

**Hyper-V**

After the firmware/microcode update is applied to the hypervisor, mitigation of the vulnerability will require patching the hypervisor OS, application of registry keys, and a firmware update. This process requires a reboot for both the OS and firmware updates, potentially resulting in downtime for virtual machines. Because of this, Rackspace will coordinate Hyper-V Hypervisor firmware/microcode updates separately and will **not** include them in the initial maintenance process.

For additional information, see [Windows OS mitigations against CPU speculative execution vulnerabilities](/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/).

### Managed colocation

Customers on managed colocation environments can work with their Rackspace account team to schedule maintenance to install the firmware/microcode updates or they can download the updates and apply them on their own. Customers can also flash the firmware on their own as described in the following section. 

### Flashing firmware

Those customers who would like to apply the firmware updates to their devices can use the following procedures: 

#### Flashing firmware on Dell servers by using Rackspace mirror servers

Rackspace has created a repository on our RHN mirror servers to provide internally and externally-facing access to the latest approved firmware updates for our Dell servers. 

Use the following steps to update the firmware and reboot your server:

1.	Ensure Dell OpenManage DRAC Tools are installed on the server.
    -	Confirm tools are installed by running the following command in a command prompt window (Windows) or terminal session         (Linux): ``racadm version``

2.	Run the following commands in a command prompt window (Windows) or terminal session (Linux) to update the firmware:
    -	For devices managed by Rackspace, execute: ``racadm update -f Catalog.xml -e 10.5.87.152/dell_firmware -t HTTP -a TRUE`` 
    -	For devices not managed by Rackspace (Colo devices), execute: ``racadm update -f Catalog.xml -e 74.205.112.120/dell_firmware -t HTTP -a TRUE``

The device reboots after the firmware update. Monitor the progress of the updates using the ``racadm jobqueue view`` command. A successful return looks like this:

       ----------------------------------------------------------
       [Job ID=JID_278794219428]
       Job Name=Repository Update
       Status=Completed
       Start Time=[Not Applicable]
       Expiration Time=[Not Applicable]
       Message=[RED001: Job completed successfully.]
       Percent Complete=[NA]
       ----------------------------------------------------------

Repeating the ``racadm jobqueue view`` command shows the subsequent jobs that are spawned from reading the catalog file and compares the versions in the file to those in the local hardware inventory. All files found to be older than the catalog version will be scheduled for upgrade automatically.

If you check the job queue and receive a message that indicates that the catalog file could not be downloaded, it is possible your server has a DRAC firmware version that does not support RESTful API calls. If this is the case, contact Support to update the DRAC firmware on Rackspace Managed devices. This update occurs outside of the operating system and does not cause any downtime for your device.

#### Flashing firmware on HP servers

This process is still being developed. We will update this article with instructions as soon as they are available.

As always, please contact your support team if you have any questions.
