---
permalink: troubleshooting-dns-issues/
audit_date:
title: Troubleshooting DNS issues
type: article
created_date: '2012-06-27'
created_by: Rackspace Support
last_modified_date: '2016-04-13'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

To troubleshoot Domain Name System (DNS) issues, it is useful to have at
least some understanding of how the system works. A DNS is a distributed
system of servers that host the resource records that are used to find
where a website is hosted or where to deliver an e-mail. To update these
records, you need to know who is hosting them and how to access them. To
determine why you are being directed to the wrong server, you need to
know how to do a lookup.

Your registrar controls where a lookup is directed when someone tries to
check a record related to your domain. If you want to change where your
records are hosted, you must update the location with your registrar. To
check where your records are currently hosted, you can check your domain
against the WHOIS database system. With WHOIS, you can find out
information about the ownership of a domain.

### Checking domain registration details

To check a domain with WHOIS, use the `whois` command on both
Linux and Windows. The output is essentially identical on both systems.

-   **On Linux,** the `whois` command should be installed by default.
-   **On Windows**, if the application is not already installed, you can
    [download it](http://technet.microsoft.com/en-us/sysinternals/bb897435.aspx) from Microsoft.
    The application does not have an installer, so after you extract it,
    open the command prompt and navigate to the folder where it is
    located before running it.

The formatting of the output from WHOIS databases is not standardized
because the information is distributed across a number of sources.
However, the responses should contain similar information, such as
registrar, name servers, and date registered. The following example
shows the WHOIS information for **rackspace.co.uk**:

    $ whois rackspace.co.uk

        Domain name:
            rackspace.co.uk

        Registrant:
            Rackspace US, Inc.

        Registrant type:
            Non-UK Corporation

        Registrant's address:
            9725 Datapoint Drive, Suite 100
            San Antonio
            TX
            78229
            United States

        Registered through:
            NetNames Limited
            URL: http://www.netnames.co.uk

        Registrar:
            Ascio Technologies Inc t/a Ascio Technologies inc [Tag = ASCIO]
            URL: http://www.ascio.com

        Relevant dates:
            Registered on: 26-Apr-1999
            Expiry date:  26-Apr-2013
            Last updated:  28-Jul-2011

        Registration status:
            Registered until expiry date.

        Name servers:
            ns.rackspace.com
            ns2.rackspace.com

        WHOIS lookup made at 09:05:23 25-Jun-2012

    --
    This WHOIS information is provided for free by Nominet UK the central registry
    for .uk domain names. This information and the .uk WHOIS are:

        Copyright Nominet UK 1996 - 2012.

    You may not access the .uk WHOIS or use any data from it except as permitted
    by the terms of use available in full at http://www.nominet.org.uk/whois, which
    includes restrictions on: (A) use of the data for advertising, or its
    repackaging, recompilation, redistribution or reuse (B) obscuring, removing
    or hiding any or all of this notice and (C) exceeding query rate or volume
    limits. The data is provided on an 'as-is' basis and may lag behind the
    register. Access may be withdrawn or restricted at any time.

Important sections of the output for troubleshooting are as follows:

-   **Registrant:** The owner of the domain (if this is your domain,
    this this should be you)
-   **Registrar:** The comapny through whish the domain is registered.
    If there is a intermediary between you and the registrar, the
    imtermediary should also be listed. In the example, the intermediary
    is represented by the **Registered through** field.
-   **Registration status/expiry:** You can control the records for a
    domain only if you have registered it and the registration is valid
    (the expiry date is in the future). If the registration has expired,
    you might have lost control of the domain and should contact the
    company through which you registered the domain to get it renewed.
-   **Name servers**: The servers that store the records that are
    publicly accessible for your domain. By default, the company through
    which you registered the domain provides this hosting. However, you
    can update this location with them to point to another location. For
    example, you can use Rackspace Cloud DNS to host your records. If
    lookups aren't going where you expect, this may be the cause.

    After you have checked your domain with whois, you should be able to
    confirm that the domain is registered to you, that it has not
    expired, and that the name server records point where you expect. If
    this information is not correct, you must contact the company from
    which you purchased the domain to update the details; generally a
    web-based control panel is provided for self-service. If you want to
    host your DNS records with Rackspace, see [Rackspace Cloud Essentials - What Are Your Name Servers?](/how-to/rackspace-cloud-essentials-what-are-your-name-servers)
    for details.

To see all the records that are currently being hosted for your domain,
you must look at the interface provided by your DNS hosting provider.
Most name servers won't allow someone who doesn't own the domain to
request a list of all the records for it. If the domain is hosted on
Rackspace Cloud, you can find instructions in [Create DNS Records for cloud servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).

### DNS lookups

To confirm that a domain name resolves to the correct IP address, Linux
and Windows provide command line tools. For Linux, `dig` is commonly used
and for Windows, `nslookup` is the built-in command.

-  [Using dig to query name servers](/how-to/using-dig-to-query-nameservers)
-  [Check DNS records on Windows with nslookup](/how-to/nslookup-checking-dns-records-on-windows)

To get an indication of how a record is cached around the world, you can
use the third-party website <http://www.whatsmydns.net/> . You specify
the record name and type, and then the site checks a number of DNS
servers around the world for the records that they hold. If responses
from the different servers do not match, the current records have not
completely propagated across the globe. This propagation is controlled
by the TTL of the old record, which specifies the maximum amount of time
the records are cached before checking for a new version.

### Hosts file

If the DNS issue is specific to a single computer, one other thing to
bear in mind is the **hosts** file stored on that machine. This file
contains a list of hostnames and IP addresses that your computer checks,
generally before doing a DNS lookup. `nslookup` and `dig` do not check this
list of hostnames. So, if the IP address your application (for example,
`ping`) is using does not match what is listed in the look up response,
this mismatch may be the cause.

The locations of the files are as follows:

-   On Linux, host file is **/etc/hosts**.
-   On Windows, host file is
    **C:\\Windows\\System32\\drivers\\etc\\hosts**.

Each line in these files represents one record. Note that a **\#** at
the beginning of a line means that the line is a comment and will be
ignored. If you see the domain and an incorrect IP address in the list
and the line isn't commented out, that will typically explain that the
issues you are having. Comment out the line and see if that fixes the
issue.

### Summary

After reading this article, and those linked within the text, you should
be able to confirm that a domain is correctly registered and discover
the location of the authoritative name servers. You should also be able
to check records and isolate any cached records that might be causing
issues accessing services on the Internet, such as a website.
