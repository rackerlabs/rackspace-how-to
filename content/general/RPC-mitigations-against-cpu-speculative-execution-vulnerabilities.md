---
permalink: rpc-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-02-18'
title: 'RPC mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-03-07'
created_by: Marc Nourani
last_modified_date: '2018-03-08'
last_modified_by: Cat Lookabaugh
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution
vulnerabilities affecting certain CPU, commonly known as Meltdown and Spectre:
[CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753),
[CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715),
and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754).

### Rackspace Private Cloud - OpenStack

Ubuntu has released the following articles to explain the impact of these
vulnerabilities:

- [SpectreAndMeltdown](https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown)
- [Meltdown, Spectre and Ubuntu: What you need to know](https://insights.ubuntu.com/2018/01/24/meltdown-spectre-and-ubuntu-what-you-need-to-know/)

Additional Ubuntu security notices have been opened for QEMU/libvirt:

- [USN-3561-1: libvirt update](https://usn.ubuntu.com/usn/usn-3561-1/)
- [USN-3560-1: QEMU update](https://usn.ubuntu.com/usn/usn-3560-1/)

#### Mitigation

HP and Dell previously released microcode updates to mitigate Ubuntu Openstack,
but they pulled those patches from circulation due to instability concerns.
Currently, we are waiting for microcode and firmware updates from our hardware
vendors.

**Note:** Patching hardware and software *will* result in hypervisor and possible
API downtime. Patching the microcode and firmware *may* result in hypervisor and
API downtime

### Rackspace Private Cloud - Red Hat

Red Hat has published various articles that explain the impact of these
vulnerabilities. The following packages contain the necessary errata to
remediate and address the anticipated performance impacts associated with the
fix:

- [Kernel Side-Channel Attacks - CVE-2017-5754 CVE-2017-5753 CVE-2017-5715](https://access.redhat.com/security/vulnerabilities/speculativeexecution)
- [Speculative Execution Exploit Performance Impacts - Describing the performance impacts to security patches for CVE-2017-5754 CVE-2017-5753 and CVE-2017-5715](https://access.redhat.com/articles/3307751)

#### Mitigation

After receiving a  customer request, Rackspace will apply the errata to the Red
Hat OSP-based Rackspace Private Cloud – Red Hat environments.

**Note**: The ability to fully remediate these vulnerabilities is pending the
availability of updated vendor firmware and microcode updates. After the firmware and microcode 
updates are available, a second maintenance that _will_ result in hypervisor downtime will be needed.

Further remediation might be needed, because evaluation of these vulnerabilities
continues. When additional information becomes available, we will provide updates.

As always, contact your support team if you have any questions.
