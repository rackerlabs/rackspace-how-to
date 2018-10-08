---
permalink: nslookup-checking-dns-records-on-windows/
audit_date: '2016-10-05'
title: Check DNS records on Windows with nslookup
type: article
created_date: '2012-06-27'
created_by: Rackspace Support
last_modified_date: '2018-10-08'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---

There are many reasons why you might need to check the status of your Domain
Name System (DNS) records. For example, you might need to verify that updates
are correct or troubleshoot issues with accessing a service.

If you're a [Cloud DNS](https://www.rackspace.com/cloud/dns) user, you can
view your DNS records through the Cloud Control Panel. In addition,
Microsoft&reg; Windows&reg; offers `nslookup`, a built-in tool for checking
your DNS records from the command line.

To access `nslookup`, open a command prompt window by selecting **Start >
All Programs > Accessories > Command Prompt**.

### Check a DNS record

To check a specific DNS record, you need to specify the `nslookup` command,
an optional record type (for example, `A`, `MX`, or `TXT`), and the host name
that you want to check.

**Note**: If you omit the record type, it defaults to `A`.

The following example shows how to check A records for **rackspace.co.uk**:

    C:\Users\Administrator>nslookup rackspace.co.uk
    Server:  cachens1.lon.rackspace.com>
    Address:  83.138.151.80

    Non-authoritative answer:

    Name:    rackspace.co.uk
    Address:  212.64.133.165

The first two lines of output specify the server to which the request
was directed. This server is the default server that your system uses for DNS
name resolution.

The second section gives the name of the record and the corresponding IP
address. However, the answer in this section is non-authoritative because
it originates from a server (**cachens1.lon.rackspace.com**) that isn't the
root source for those records.

### Get an authoritative answer

To get an authoritative answer you need to specify the authoritative name
server at the end of the request.

Use the `-type=soa` option to tell `nslookup` to display the
authoritative (primary) name server, as shown in the following example:

    C:\Users\Administrator>nslookup -type=soa rackspace.co.uk
    Server:  cachens1.lon.rackspace.com>
    Address:  83.138.151.80

    Non-authoritative answer:
    rackspace.co.uk
            primary name server = ns.rackspace.com
            responsible mail addr = hostmaster.rackspace.com
            serial  = 1415913000
            refresh = 3600 (1 hour)
            retry   = 300 (5 mins)
            expire  = 1814400 (21 days)
            default TTL = 300 (5 mins)

    ns.rackspace.com        internet address = 69.20.95.4

The address labeled `primary name server` is the DNS authority for the
domain.

If you add the address of the authoritative name server
(**ns.rackspace.com**) to the first command, the record is now checked
against that name server.

    C:\Users\Administrator>nslookup rackspace.co.uk ns.rackspace.com
    Server:  ns.rackspace.com
    Address:  69.20.95.4

    Name:    rackspace.co.uk
    Address:  212.64.133.165

### Check when a cached record expires

DNS uses caching, which reduces the load on authoritative name servers.
However, as a result, records might be outdated. If the authoritative and
non-authoritative answers differ, you have a cached response from the resolver
name server that you're using. The length of time that a record is cached
depends on its time-to-live (TTL) value. The TTL is a number that is
specified in seconds.

To see how long a record is cached, include the `debug` option, as shown in
the following example:

    C:\Users\Administrator>nslookup -debug rackspace.co.uk

    ------------

    Got answer:
    HEADER:
            opcode = QUERY, id = 1, rcode = NOERROR
            header flags:  response, want recursion, recursion avail.
            questions = 1,  answers = 1,  authority records = 2,  additional = 2

        QUESTIONS:
            80.151.138.83.in-addr.arpa, type = PTR, class = IN
        ANSWERS:
        ->  80.151.138.83.in-addr.arpa
            name = cachens1.lon.rackspace.com
            ttl = 2466 (41 mins 6 secs)
        AUTHORITY RECORDS:
        ->  151.138.83.in-addr.arpa
            nameserver = ns2.rackspace.com
            ttl = 2466 (41 mins 6 secs)
        ->  151.138.83.in-addr.arpa
            nameserver = ns.rackspace.com
            ttl = 2466 (41 mins 6 secs)
        ADDITIONAL RECORDS:
        ->  ns.rackspace.com
            internet address = 69.20.95.4
            ttl = 12982 (3 hours 36 mins 22 secs)
        ->  ns2.rackspace.com
            internet address = 65.61.188.4
            ttl = 12985 (3 hours 36 mins 25 secs)

    ------------

    Server:  cachens1.lon.rackspace.com
    Address:  83.138.151.80

    ------------

    Got answer:
        HEADER:
            opcode = QUERY, id = 2, rcode = NOERROR
            header flags:  response, want recursion, recursion avail.
            questions = 1,  answers = 1,  authority records = 2,  additional = 2

        QUESTIONS:
            rackspace.co.uk, type = A, class = IN
        ANSWERS:
        ->  rackspace.co.uk
            internet address = 212.64.133.165
            ttl = 279 (4 mins 39 secs)
        AUTHORITY RECORDS:
        ->  rackspace.co.uk
            nameserver = ns.rackspace.com
            ttl = 17465 (4 hours 51 mins 5 secs)
        ->  rackspace.co.uk
            nameserver = ns2.rackspace.com
            ttl = 17465 (4 hours 51 mins 5 secs)
        ADDITIONAL RECORDS:
        ->  ns.rackspace.com
            internet address = 69.20.95.4
            ttl = 15754 (4 hours 22 mins 34 secs)
        ->  ns2.rackspace.com
            internet address = 65.61.188.4
            ttl = 15727 (4 hours 22 mins 7 secs)

    ------------

    Non-authoritative answer:

    Name:    rackspace.co.uk
    Address:  212.64.133.165

-   The first `Got answer` section of this example is used to get the
    host name of the server from which you are requesting the A record.
    In this example, the host name is **cachens1.lon.rackspace.com**.
-   The second `Got answer` section relates to your actual request.
-   The `HEADER` section contains details about the type of request and
    its success.
-   The `QUESTIONS` section shows that the request was for A records
    for rackspace.co.uk.
-   The `ANSWERS` section displays one record with an IP address of
    212.64.133.165 and a TTL of 279 seconds (4 minutes 39 seconds).
-   The `AUTHORITY RECORDS` section specifies the name servers that
    correspond to the domain.
-   The `ADDITIONAL RECORDS` section lists A records for the name servers
    that are listed in the authority records section.

This response shows that the name server that the client computer uses will
reuse the same A record for **rackspace.co.uk** for the next 4 minutes and 39
seconds. If you run the same command on the authoritative name server, you
see the current maximum TTL for the record.
