---
permalink: rackspace-cloud-dns-technical-details/
audit_date:
title: Rackspace Cloud DNS - Technical details
type: article
created_date: '2011-10-19'
created_by: Rackspace Support
last_modified_date: '2016-04-13'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

**Previous section:** [Rackspace Cloud DNS - Available features](/how-to/rackspace-cloud-dns-available-features)

Implementation of Rackspace Cloud DNS is available through our API. To
use our API, you should have a general understanding of DNS management
and be familiar with:

-   RESTful Web Services
-   JSON and/or XML Data Serialization Formats

The list of currently available operations are shown below on this
chart:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Domains</th>
<th align="left">Records</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><strong>List Domains</strong>
<ul>
<li>List all domains and subdomains manageable by the account specified. Displays ID's and names only.</li>
<li>Filter domains by domain name: list all domains and subdomains manageable by the account specified that match the <em>domainName</em>. Display ID's and names only.</li>
</ul></td>
<td align="left"><strong>List Records</strong>
<ul>
<li>List all records configured for the domain or list the details for a specific record. SOA cannot be modified.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>List Domain Details</strong>
<ul>
<li>List details of the specified domain. Display all details, including records. This operation provides the detailed output for a specific domain configured and associated with an account. This operation is not capable of returning details for a domain that has been deleted.</li>
</ul></td>
<td align="left"><strong>List Record Details</strong><ul>
<li>List details of the specified record. </li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>Create Domain(s)</strong>
<ul>
<li>This operation provisions one or more new DNS domains under the account specified, based on the configuration defined in the request object. If the corresponding request cannot be fulfilled due to insufficient or invalid data, an HTTP 400 (Bad Request) error response will be returned with information regarding the nature of the failure in the body of the response. Failures in the validation process are non-recoverable and require the caller to correct the cause of the failure and POST the request again.</li>
</ul></td>
<td align="left"><strong>Add Records</strong>
<ul>
<li>Add new record(s) to the domain.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>Modify Domain(s)</strong>
<ul>
<li>This operation modifies DNS domain(s) attributes only. Records cannot be added, modified or removed. Only the TTL and e-mail address attributes of a domain can be modified.</li>
</ul></td>
<td align="left"><strong>Modify Records</strong>
<ul>
<li>Modify the configuration of a record or records in a domain.</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>Delete Domain(s)</strong>
<ul>
<li>This operation removes one or more specified domains from the account; when a domain is deleted, its immediate resource records are also deleted from the account. By default, if a deleted domain had subdomains, each subdomain becomes a root domain and is not deleted. This can be overridden by the optional <em>deleteSubdomains</em> parameter.</li>
<li>When a domain is deleted, any and all configuration data is immediately purged and is not recoverable via the API. In a request to remove multiple domains, a failure on a single part of the request will cause the entire request to fail. Utilizing the optional <em>deleteSubdomains</em> parameter on domains without subdomains does not result in a failure.</li>
</ul></td>
<td align="left"><strong>Remove Records</strong>
<ul>
<li>Remove a record or multiple records from a domain.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>Search (Filter Domains)</strong></td>
<td align="left"> </td>
</tr>
<tr class="odd">
<td align="left"><strong>Import Domain</strong>
<ul>
<li>This operation provisions a new DNS domain under the account specified by the bind9 - formatted file configuration contents defined in the request object. If the corresponding request cannot be fulfilled due to insufficient or invalid data, an HTTP 400 (Bad Request) error response will be returned with information regarding the nature of the failure in the body of the response. Failures in the validation process are non-recoverable and require the caller to correct the cause of the failure and POST the request again.</li>
</ul></td>
<td align="left"> </td>
</tr>
<tr class="even">
<td align="left"><strong>Export Domain</strong>
<ul>
<li>This operation provides the bind9-formatted contents of the requested domain. This operation is for a single domain only, and as such, does not traverse up or down the domain hierarchy for details (that is, no subdomain information is provided). </li>
</ul></td>
<td align="left"> </td>
</tr>
</tbody>
</table>

With the new API we have added support for NS, TXT and SRV records. Following is detailed information about each of these record types:

-   NS (Name Server) records indicate where the domain's DNS hosting
    services are located. It effectively delegates a domain to use a set
    of name servers.
-   TXT records are used primarily for SPF and DKIM records. An SPF
    (Sender Policy Framework) record allows administrators to specify
    which hosts are allowed to send e-mail from a domain by creating a
    specific SPF record in the public (DNS). Mail exchangers then use
    the DNS to check that mail from a given domain is being sent by a
    host sanctioned by that domain's administrators. DomainKeys
    Identified Mail (DKIM) is a method for associating a domain name to
    an email, thereby allowing an organization to take responsibility
    for a message in a way that can be validated by a recipient.
-   SRV records are used to define the location of a (hostname and port)
    of servers used for a specific service.

For a full list of record types and their definitions, please click
[here](/how-to/rackspace-cloud-dns-additional-resources).

**Next steps:** [Rackspace Cloud DNS - API example](/how-to/rackspace-cloud-dns-api-example)
