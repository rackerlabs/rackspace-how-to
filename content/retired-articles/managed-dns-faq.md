---
permalink: managed-dns-faq/
node_id:
title: Managed DNS FAQ
type: article
created_date: '2016-03-14'
created_by: Nicole Hairston
last_modified_date: '2017-04-17'
last_modified_by: Stephanie Fillmon
---

### General

#### What is DNS?

The Domain Name System (DNS) is a global system by which Internet domain name-to-address and address-to-name resolutions are determined. All domains and their components, such as mail servers, use DNS to resolve to the appropriate locations. For example, DNS is used to turn **www.rackspace.com** into the computer addressable IP address **207.97.209.147**.

DNS servers are usually set up in a master-slave relationship such that failure of the master invokes the slave. DNS servers might also be clustered or replicated such that changes made to one DNS server are automatically propagated to other active servers.

#### What is Rackspace Managed DNS (Early Access)?

Rackspace Managed DNS (Early Access) enables zone (domain) and record management, with improved performance and additional capabilities over our current Cloud DNS offering. It is powered by and compatible with the latest version of OpenStack Designate (DNSaaS), which enables customers to automate DNS for their public OpenStack deployments with a familiar OpenStack standard API and without having to write custom code.

#### How can I access Managed DNS (Early Access)?

**Warning:** If you’re a current Cloud DNS user with a workflow that depends on the Rackspace `pyrax` SDK or Ansible’s Rackspace modules, you need to upgrade to the latest version of `pyrax` (1.9.7) *before you sign up for* Managed DNS (Early Access). Upgrading will prevent the `pyrax` dependency from blocking the use of Cloud DNS.

**Note:** Updated May 19, 2016:The signup period for Managed DNS (Early Access) is now closed. Still have questions? Send them to DNS_EA@rackspace.com.

#### Where can I find the Rackspace Managed DNS (Early Access) API documentation?

The documentation is located at [developer.rackspace.com/docs/cloud-dns/v2/developer-guide/](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/).

#### What are the Managed DNS (Early Access) name servers?

For current name server details, see the [Rackspace Managed DNS API 2.0 *Early Access* Guide](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/#document-getting-started/name-server-setup).

### Billing / Usage

#### How much does Managed DNS (Early Access) cost?

You will not be subject to any usage fees for Managed DNS *Early Access*. After the Early Access period is complete and we transition to Unlimited Availability, your account may be subject to usage fees and additional contract terms.  Any additional fees will be billed to your Rackspace Cloud account. You will be notified via email at least 30 days prior to beginning to accrue usage fees.

### Product compatibility

#### What types of customers or accounts can access Managed DNS (Early Access)?

Any customer with a Rackspace Cloud account is eligible for Managed DNS *Early Access* access.

#### What if I am currently using Rackspace Cloud DNS?

**Warning:** If you’re a current Cloud DNS user with a workflow that depends on the Rackspace `pyrax` SDK or Ansible’s Rackspace modules, you need to upgrade to the latest version of `pyrax` (1.9.7) *before you sign up for* Managed DNS (Early Access). Upgrading will prevent the `pyrax` dependency from blocking the use of Cloud DNS.

Rackspace Cloud DNS API users are especially encouraged and able to participate in Managed DNS (Early Access) in order to become familiar with the improvements and associated API contract changes compared to the Cloud DNS API.

We will continue to support Rackspace Cloud DNS users, domains, and associated user interfaces in parallel as we transition new and existing customers to Rackspace Managed DNS. Our long-term goal is to transition *all* Cloud DNS usage to the new Managed DNS service, and we’ll provide details as they become available well in advance.  Until the transition from Cloud DNS to Managed DNS is complete, we have taken measures to prevent the creation of duplicate zones (domains) and subdomains between these two services.

#### Can Managed DNS (Early Access) be used with Rackspace Dedicated account resources?

Yes. Although the Managed DNS (Early Access) service is currently accessible via Cloud account only, it is possible to configure one or more of your Managed DNS (Early Access) zones (domains) with one or more records that point to your Dedicated account resources.

For example, it is possible to configure a Managed DNS (Early Access) zone with an A record that points to the IP address of your Rackspace Dedicated server. Managed DNS (Early Access) can also be configured using any valid IPv4 or IPv6 address inside or outside of the Rackspace network.

**Note:** The Managed DNS (Early Access) service will be subject to unscheduled downtime for maintenance, upgrades, and testing during this initial phase and therefore should not be used for any production applications, zones (domains), or subdomains.

#### How does Managed DNS (Early Access) work for Rackspace Hybrid customers?

A Hybrid customer who may or may not be using MyRackspace.com to manage Dedicated account domains, using Cloud DNS to manage Cloud account domains, or both, can also choose to participate in the Early Access phase for Managed DNS.

**Note:** The Managed DNS (Early Access) service can be accessed only via a Rackspace Cloud account.  Zones (domains) and subdomains must be unique among Rackspace Dedicated Hosting, Cloud DNS, and Managed DNS (Early Access).

#### What is the difference between Rackspace Cloud DNS and Managed DNS (Early Access)?

Rackspace Managed DNS and Rackspace Cloud DNS use the same reliable and secure Rackspace DNS global infrastructure.

Rackspace Managed DNS (Early Access) offers the following improvements over Rackspace Cloud DNS:

- All record set rate limits have doubled
- All GET rate limits have doubled
- Zone (domain) quota has increased per account by 10 times, to 5,000 zones (domains) per account
- Record quota per zone (domain) has increased by 6 times, to 3,000 record sets per zone (domain)
- Supported command-line interface (CLI)
- OpenStack compatible RESTful API
- Immediate zone and record validation before the asynchronous process starts
- Imports and exports in pure BIND9 zone file format, which means no more parsing to and from XML or JSON
- Built-in status monitoring for asynchronous responses so that you don’t have to keep checking a separate endpoint

We’re also working in parallel to apply these and other Managed DNS improvements within our Cloud Control Panel.

**Note:** The Cloud DNS service will continue to be available and supported during the Early Access phase. Zones (domains) and subdomains must be unique among Rackspace Dedicated Hosting, Cloud DNS, and Managed DNS (Early Access).

#### What will happen to my Managed DNS zones (domains) after Early Access?

The Managed DNS (Early Access) service will be subject to unscheduled downtime for maintenance, upgrades, and testing during this initial phase and therefore should *not* be used for any production applications, zones (domains), or subdomains. Although we will do our best to preserve any customer zones (domains) provisioned during Early Access, certain conditions might require us to remove Early Access usage prior to and in support of our next phase of Unlimited Availability.

### Features and functionality

#### What operations are supported by the Managed DNS API?

- Easily view, add, update, delete, import, and export zones (domains), subzones (subdomains), and record sets via the OpenStack Designate based RESTful API.
- Delegate subzones to non-Rackspace name servers, and manage mail servers and secure email delivery with SPF and DKIM configuration (via TXT records).
- Use the export and import features to more easily transfer DNS configurations to and from Rackspace via BIND9 zone files.
- Search zones and record sets.

For a full list of supported API operations, see the [Rackspace Managed DNS API 2.0 (Early Access) Guide](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/).

#### What record types does Managed DNS (Early Access) support?

- A (IPv4 compatible)
- CNAME
- MX
- AAAA (IPv6 compatible)
- NS
- TXT (SPF and DKIM records are supported via associated formatting of TXT records.)
- SRV
- SOA (Users cannot create SOA records, because this is handled by the system, but may modify the TTL and email address.)

**Note:** PTR records for reverse DNS are not supported during Early Access.

#### Do Managed DNS (Early Access) TTL settings expire?

No.

#### What are the default TTL values for zones (domains) and records?

For current TTL default details, see the [Rackspace Managed DNS API 2.0 (Early Access) Guide](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/#create-a-zone).

#### Does Managed DNS (Early Access) support domain registration?

No. Domain registration is not currently supported by the Managed DNS API, nor is it planned for a future release at this time.

### Network

#### What type of DNS network does Rackspace have?

Rackspace's authoritative DNS server infrastructure is globally redundant. We rely on Anycast routing to achieve maximum availability, with no single point of failure within a data center.

All DNS queries generally go to the geographically closest name servers, giving you faster results no matter where your queries originate. Additionally, all of our DNS servers are monitored 24x7x365. If an entire data center were to fail, or even if all of the DNS servers within a specific data center were to fail, the DNS queries will automatically start going to the next best location.

#### How well can your DNS network handle a DDoS attack?

We are prepared for DDoS incidents on multiple levels and can employ both internal and external mitigation systems on-demand in the event of a large-scale DDoS attack. We have successfully engaged these resources in the past to protect our infrastructure in order to continue to provide authoritative DNS services if impacted by a DDoS attack. Because of the structure and redundancy of our DNS infrastructure, Rackspace has never experienced a global authoritative DNS outage and, for the same reasons, the likelihood of a global outage is extremely small.

### Scale and performance

#### How long does it take for Managed DNS (Early Access) changes to be propagated globally?

For information about propagation times to Rackspace name servers, see the [Rackspace Managed DNS API 2.0 (Early Access) Guide](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/#cdns-dg-propagation/).

#### What are the Managed DNS (Early Access) API rate and account quota limits?

All accounts, by default, have a preconfigured set of thresholds (or limits) to manage capacity and prevent abuse of the system. The system recognizes two kinds of limits: API rate limits and resource quotas. API rate limits are thresholds that are reset after a certain amount of time passes. Resource quotas are fixed. For current and specific limit details, see the [Rackspace Managed DNS API 2.0 (Early Access) Guide](https://developer.rackspace.com/docs/cloud-dns/v2/developer-guide/#document-general-api-info/limits).

#### Can I raise Managed DNS (Early Access) limits for my account?

No. API rate limits and resource quotas are fixed during Early Access and may not be adjusted.

### Support

#### Can I create a Managed DNS (Early Access) support ticket?

No. Managed DNS (Early Access) support cannot be obtained via chat, phone, or ticket. The Managed DNS Engineering team will provide direct (best effort) support for Early Access inquiries and participants Monday through Friday from 8 a.m. to 5 p.m. CST excluding major holidays); there is no SLA during Early Access.  Issues, questions, and concerns related to Managed DNS should be emailed to <DNS_EA@rackspace.com> (only during the Early Access phase).

**Still have questions? Send them to <DNS_EA@rackspace.com>.**
