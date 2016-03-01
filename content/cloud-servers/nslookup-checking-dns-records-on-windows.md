---
node_id: 1446
title: Nslookup - Checking DNS Records on Windows
type: article
created_date: '2012-06-27'
created_by: Rackspace Support
last_modified_date: '2015-01-27'
last_modified_by: Jered Heeschen
product: Cloud Servers
product_url: cloud-servers
---

If you ever need to check the status of your DNS records, Windows has a
built-in tool for just that task. There are a number of reasons you may
want to do this, for example to check that any updates are correct or to
troubleshoot issues accessing a particular service.

To access the tool you need to open up a command prompt, you should be
able to find this under **Start > All Programs > Accessories > Command Prompt**.

### Checking For a Record

To check for a specific record you need to specify the record type,
e.g. A, MX, TXT, and the host name you want to check. The following
example shows how to check for any A records for **rackspace.co.uk**.

    C:\Users\Administrator>nslookup -type=A rackspace.co.uk
    Server:  cachens1.lon.rackspace.com>
    Address:  83.138.151.80

    Non-authoritative answer:

    Name:    rackspace.co.uk
    Address:  212.64.133.165

The first two lines of output specify the server to which the request
was directed; this will be the default server your system uses for DNS
name resolution. The second section, which specifies a non-authoritative
answer, gives the name of the record and the corresponding IP address.
The answer is non-authoritative because the answer comes from a server,
**cachens1.lon.rackspace.com** in this case, that is not the root source for
those records.

### Getting an Authoritative Answer

To get an authoritative answer we need to go to the source. This can be
done by specifying the authoritative name server at the end of the
request.

We can use the **-type=soa** option to tell `nslookup` to display the
authoritative (primary) name server.

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

The address labeled **primary name server** is the DNS authority for the
domain.

If we add the address of the authoritative name server
(ns.rackspace.com) to the first command, the record is now checked
against that name server.

    C:\Users\Administrator>nslookup -type=A rackspace.co.uk ns.rackspace.com
    Server:  ns.rackspace.com
    Address:  69.20.95.4

    Name:    rackspace.co.uk
    Address:  212.64.133.165

### Checking When a Cached Record Will Expire

DNS uses caching, this reduces the load on authoritative name servers
but means that sometimes records can be out of date. If the
authoritative and non-authoritative answers differ, this means you will
have a cached response from the resolver name server you are using. The
length of time a record is cached depends on its time-to-live (TTL)
value. This is a number specified in seconds. To see how long a record
will be cached for requires the debug switch.

    C:\Users\Administrator>nslookup -type=A -debug rackspace.co.uk

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

-   The first "Got answer" section of this example is used to get the
    hostname of the server you are requesting the A record from, in this
    case cachens1.lon.rackspace.com.
-   The second "Got answer" section relates to your actual request.
-   The header section contains details about the type of request and
    its success.
-   The questions section shows that the request was for A records
    for rackspace.co.uk.
-   The answers section displays one record with an IP address of
    212.64.133.165 and a TTL of 279 seconds (4 minutes 39 seconds).
-   The authority records section specifies the name servers that
    correspond to the domain
-   The additional records are A records for the name servers listed in
    the authority records section

So from this you can see that the name server being used by the client
computer will keep reusing the same A record for **rackspace.co.uk** for the
next 4 minutes and 39 seconds. If you were to run the same command on
the authoritative name server you would see what the current maximum TTL
for the record is.

### Summary

After reading this you should be able to use `nslookup` to check that a
record exists, compare it with the authoritative record and confirm when
the cached record will expire.
