---
permalink: rackspace-public-cloud-os-mitigations-against-cpu-speculative-execution-vulnerabilities/
audit_date: '2018-02-18'
title: 'Rackspace Public Cloud OS mitigations against CPU speculative execution vulnerabilities'
type: article
created_date: '2018-02-18'
created_by: Marc Nourani
last_modified_date: '2018-02-18'
last_modified_by: Nate Archer
product: undefined
product_url: undefined
---

Rackspace continues to evaluate and address a set of speculative execution vulnerabilities affecting certain CPU, commonly known as Meltdown and Spectre: [CVE-2017-5753](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5753), [CVE-2017-5715](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5715), and [CVE-2017-5754](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-5754).

The vast majority of our infrastructure is NOT vulnerable and the remaining threat vectors are minimal.  For security reasons, we can't disclose the exact nature of those vectors but they are aligned with similar industry-leading cloud providers.

To date, remediation has been done consciously with non-impacting mitigations. While new information from our upstream vendors could alter this stance, we do not anticipate impactful action to our customers associated with remediation of these vulnerabilities.

We continue to work with our vendors as they iterate on their patches to improve the level of security and stability of our environment. With this approach, we are working to avoid multiple impacts to customer environments.  If we need to take action that would impact customers, we will provide additional guidance directly to the customers involved.

### Operating System-Specific guidance

[Windows information](/how-to/windows-os-mitigations-against-cpu-speculative-execution-vulnerabilities/) and [Linux information](/how-to/linux-os-mitigations-against-cpu-speculative-execution-vulnerabilities/) are posted on other pages within the [Rackspace Support Network](/how-to/rackspace-mitigations-against-cpu-speculative-execution-vulnerabilities/).

Rackspace has provided additional guidance directly to Managed Operations customers on Rackspace Public Cloud.

We suggest that Managed Infrastructure customers on Rackspace Public Cloud follow guidance provided by the applicable operating system vendor.
