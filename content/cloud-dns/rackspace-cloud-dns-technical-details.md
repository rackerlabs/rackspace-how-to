---
permalink: rackspace-cloud-dns-technical-details/
audit_date: '2018-05-16'
title: Rackspace Cloud DNS technical details
type: article
created_date: '2011-10-19'
created_by: Rackspace Support
last_modified_date: '2018-05-16'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

**Previous section:** [Rackspace Cloud DNS available features](/how-to/rackspace-cloud-dns-available-features)

Implementation of Rackspace Cloud DNS is available through our RESTful API. To
use our API, you should have a general understanding of DNS management
and be familiar with the following elements:

-   RESTful Web Services
-   JSON or XML Data Serialization Formats

For the full list and technical details of all available Cloud DNS API operations, see the 
[The Cloud DNS API reference](https://developer.rackspace.com/docs/cloud-dns/v1/api-reference/).

Some currently available domain and record operations are shown in the following chart:

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
<td align="left"><strong>List domains</strong>
<ul>
<li>This operation lists all domains and subdomains manageable by the specified account and displays the IDs and names.</li>
</ul></td>
<td align="left"><strong>List Records</strong>
<ul>
<li>This operation lists all records configured for the domain or lists the details for a specific record.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>List Domain Details</strong>
<ul>
<li>This operation lists the details of the specified domain and displays all details, including records. 
It cannot return details for a domain that has been deleted.</li>
</ul></td>
<td align="left"><strong>List Record Details</strong><ul>
<li>List details of the specified record. </li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>Create Domain</strong>
<ul>
<li>This operation provisions one or more new DNS domains under the account specified, based on the configuration defined in the request object. Failures in the validation process are non-recoverable and require the caller to correct the cause of the failure and POST the request again.</li>
</ul></td>
<td align="left"><strong>Add Record</strong>
<ul>
<li>Add new records to the domain.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left"><strong>Modify Domain</strong>
<ul>
<li>This operation modifies DNS domain attributes. Records cannot be added, modified or removed. Only the time to live (TTL) and e-mail address attributes of a domain can be modified.</li>
</ul></td>
<td align="left"><strong>Modify Record</strong>
<ul>
<li>Modify the configuration of a record in a domain.</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><strong>Delete Domain</strong>
<ul>
<li>This operation removes the specified domains from the account. When a domain is deleted, its immediate resource records are also deleted from the account. By default, if a deleted domain had subdomains, each subdomain becomes a root domain and is not deleted.</li>
<li>When a domain is deleted, any and all configuration data is immediately purged and is not recoverable via the API. In a request to remove multiple domains, a failure on a single part of the request causes the entire request to fail.</li>
</ul></td>
<td align="left"><strong>Remove Record</strong>
<ul>
<li>Remove a record from a domain.</li>
</ul></td>
<tr class="odd">
<td align="left"><strong>Import Domain</strong>
<ul>
<li>This operation provisions a new DNS domain under the account specified by the bind9-formatted file configuration contents defined in the request object. Failures in the validation process are non-recoverable and require the caller to correct the cause of the failure and POST the request again.</li>
</ul></td>
<td align="left"> </td>
</tr>
<tr class="even">
<td align="left"><strong>Export Domain</strong>
<ul>
<li>This operation provides the bind9-formatted contents of the requested domain. This operation is for a single domain only, so no subdomain information is provided. </li>
</ul></td>
<td align="left"> </td>
</tr>
</tbody>
</table>

The [Cloud DNS API service](https://developer.rackspace.com/docs/cloud-dns/v1/) provides support for NS, TXT and SRV records. Following is detailed information about each of these record types:

-   **NS (Name Server)** records indicate where the domain's DNS hosting
    services are located. It effectively delegates a domain to use a set
    of name servers.
-   **TXT** records are used primarily for Sender Policy Framework (SPF) and 
    DomainKeys Identified Mail (DKIM) records. An SPF record allows administrators to specify
    which hosts are allowed to send e-mail from a domain by creating a
    specific SPF record in the public DNS. Mail exchangers then use
    the DNS to check that mail from a given domain is being sent by a
    host sanctioned by that domain's administrators. DKIM records are used to associate a domain name to
    an email, thereby allowing an organization to take responsibility
    for a message in a way that can be validated by a recipient.
-   **SRV** records are used to define the location (hostname and port)
    of servers used for a specific service.

For a full list of record types and their definitions, please click
[here](/how-to/rackspace-cloud-dns-additional-resources).

**Next steps:** [Rackspace Cloud DNS - API example](/how-to/rackspace-cloud-dns-api-example)
