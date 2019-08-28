---
permalink: cloud-native-security/
audit_date: '2019-08-28'
title: Rackspace Cloud Native Security
type: article
created_date: '2019-08-19'
created_by: Toby Dillman
last_modified_date: '2019-08-28'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Cloud providers are constantly expanding their portfolio of native security
products. These native products often fill a gap that other 3rd party tools
are not able to cover due to lack of access to the back-end data and resources
that are only available to the cloud providers themselves. Rackspace Managed
Security is expanding its services to provide support for native security
products on all the leading public clouds, beginning with AWS.

### Cloud Native Security for AWS (beta release)

AWS customers who want to improve their security posture by using
products like [Amazon GuardDuty](https://aws.amazon.com/guardduty/ "Amazon GuardDuty")
and [AWS Security Hub](https://aws.amazon.com/security-hub/ "AWS Security Hub")
but do not have the expertise or the resources to invest in a 24/7/365
Security Operations Center (SOC)
are now able to utilize the Cloud Native Security Service Block from Rackspace.

Amazon GuardDuty provides threat detection utilizing existing AWS native data
sources (CloudTrail Logs, VPC Flow Logs, and DNS Logs) without any
potentially disruptive deployment steps such as agent installation. AWS
describes GuardDuty as a service that "uses machine learning, anomaly
detection, and integrated threat intelligence to identify and prioritize
potential threats”. AWS Security Hub provides the aggregation point for
GuardDuty findings across multiple AWS accounts, acts as the conduit to
Rackspace systems, and serves as a single pane of glass for all native security
services which emit findings.

### Deployment and Configuration

Every customer will have a dedicated AWS account to be used as Security Hub
master and GuardDuty master. Rackspace will enable and configure Security
Hub and GuardDuty on the master account and all other accounts that are in
scope, including configuration of the master-member relationship.

Security Hub will be configured to ingest security findings from GuardDuty. It
will also be configured to deliver the events to the Rackspace SIEM (Security
Information and Event Management), a system that is used by our security
specialists to monitor the security of customer environments 24/7/365.

### Monitoring of Findings

Rackspace security specialists will monitor Security Hub and GuardDuty
findings 24/7/365. As part of this beta release, Rackspace will strive to
begin analysis of findings within response times commensurate with the
finding severity:

- Critical: 30 minutes
- High: 60 minutes
- Medium: 4 hours

Rackspace security specialists will analyze and filter the findings and
will apply context based on customer’s runbook -- for example:

- Identification of false-positive findings
- Identification of affected environment – production/test/dev
- Aggregation of multiple related findings into a single incident
- Review of the findings against customer’s runbook

Once the findings have been analyzed, escalation and notification processes
will be initiated.

### Investigation and Remediation of Findings

GuardDuty monitors your AWS environment to detect security findings like a
compromised EC2 instance or cloud credential, a misconfigured security
group, or the use of root account credentials.

Rackspace will investigate the findings and will recommend remediation
actions. On AWS accounts that include the Manage & Operate Service Block,
Rackspace will remediate the findings and will engage the customer as
necessary according to the runbook.

### Ongoing Management

When you create new AWS accounts, you'll need to request Rackspace to
enable and configure Security Hub and GuardDuty on these newly created
AWS accounts.

Rackspace can create custom Security Hub Insights based on your security needs.

Rackspace will manage GuardDuty auto-archive rules and trusted IP/threat
lists according to your requirements.
