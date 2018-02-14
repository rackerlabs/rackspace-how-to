---
permalink: dns-fundamentals/
audit_date: '2017-11-13'
title: DNS Fundamentals
type: article
created_date: '2017-01-26'
created_by: Alan Hicks
last_modified_date: '2017-11-06'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Many people have an understanding of DNS, but that understanding is often
limited by experience. Hardly anyone takes a class or studies DNS
carefully. As a result, DNS knowledge is somewhat haphazardly obtained.
Technicians often have gaps in their DNS knowledge. Here, I hope to cover the
fundamentals with enough detail to fill in some of those gaps.

- [Background](#background)
- [Global distribution hierarchy](#global-distribution-hierarchy)
- [Caching and TTLs](#caching-and-ttls)
- [Recursion](#recursion)
- [Record types](#record-types)
  - [A records](#a-records)
  - [AAAA records](#aaaa-records)
  - [PTR records](#ptr-records)
  - [MX records](#mx-records)
  - [CNAME records](#cname-records)
  - [NS records](#ns-records)
  - [TXT records](#txt-records)
  - [SOA records](#soa-records)
- [Zone files](#zone-files)
- [Further reading](#further-reading)

### Background

In the early days of the Internet, which was called ARPANET at the time, there
was no DNS service. The total number of nodes on the global network was
tiny - so small in fact, that a list of hostnames was easily
maintained in **/etc/hosts** and other similar files. Whenever someone
created a new server, they sent the server's name and IP address to whoever
maintained the "global" hosts file. This person would then update that
hosts file and publish those updates weekly. Everyone would grab that file
as part of normal operations so everyone had a reasonably up-to-date copy
of all the hosts on the ARPANET and their addresses.

Naturally, this couldn't continue, and as the network grew larger and
updates became more frequent, the need for a new system was
apparent. Thus, the Domain Name System (DNS) was created to form a way of
turning hostnames into IP addresses with a unique set of requirements:

- Heavily distributed
- High redundancy
- Low latency
- Flexibility

Meeting these challenges wasn't easy and explains some of the design
choices of DNS.

### Global distribution hierarchy

To ensure that everyone receives the same records, some sort of global system
was required. At the top of this global system are the root name
servers. Below them are the TLD servers. Still further below them are the
domain name servers, and finally there can be sub-domain servers.
Let's take a look at this in depth.

    www.example.com.
     |    |      | |
     |    |      | +--- the root zone, denoted by a "."
     |    |      +--- the TLD zone, typically three characters (but not always)
     |    +--- the domain
     +--- the hostname

Pay special attention to the **.** at the end of **www.example.com.**
All Fully Qualified Domain Names (FQDNs) include this period at the
end, representing the "root" for that host. Colloquially we omit
the period, but internally the computer appends it if the name in question
contains at least one "." anywhere within it. The root zone is hosted
by 13 root-level name servers, and they handle some portion of
virtually all the DNS traffic in the world.

Beneath the root zone is the TLD zone. In our example, the TLD
is **com**. Each TLD has its own set of name servers
(typically 13, but not always). Collectively these name servers handle
some portion of all DNS traffic in their respective zones.

Finally, we reach name servers that your business and Rackspace can
influence or control. These are the primary name servers for
domain names which you can purchase or lease through a
registrar. We typically refer to these as the authoritative name
servers for a given domain.

### Caching and TTLs

One of the most important aspects of DNS is the ability for name servers to
cache records. Without this ability, DNS traffic would consume a
substantial percentage of all Internet traffic. Each DNS record has a
Time To Live (TTL) value that represents how long other servers should cache
that value. Records that rarely change can have very large TTL values
while records that frequently change or which you expect to change in the
near future should probably have short TTL lengths. The TTL record can
be set for individual records or for the entire zone. Records which
do not have their own TTL value use the default TTL for the
zone. Let's take a look at an example zone file.

    1:  $ORIGIN .
    2:  $TTL 1d
    3:  example.com             IN SOA  ns1.example.com. alan.example.com.
    (
    4:                                  2016053001 ; serial
    5:                                  10800      ; refresh (3 hours)
    6:                                  3600       ; retry (1 hour)
    7:                                  604800     ; expire (1 week)
    8:                                  3600       ; negative ttl (1 hour)
    9:                                  )
    10:                         NS      ns1.example.com.
    11:                         NS      ns2.example.com.
    12:                         A       172.30.16.2
    13:                         MX      10 mail.example.com.
    14: $ORIGIN example.com.
    15: www               300   A       172.30.16.2
    16: mail                    A       172.30.16.3
    17: $TTL 600        ; 10 minutes
    18: ns1                     A       172.30.16.1
    19: ftp                     CNAME   www

There's a lot of information to discuss here. First, take a look at
line 2. `$TTL` is a special part of a DNS zone file that sets the default
TTL for the zone. In this case, any records following this line will
have a default TTL of 24 hours. Note that later on line 17
that default TTL is overridden to 10 minutes. Any records appearing
after line 17 will have a default TTL of 10 minutes. Line 15 is another
special case. In this instance, we have instructed DNS to cache this
record for 5 minutes (300 seconds) regardless of any defaults.

There's one final special case that is very often overlooked: line 8.
This entry is part of the Start Of Authority (SOA) record and
indicates the **negative TTL**. This value is the length of time DNS servers
should cache failed requests. Take for instance the following DNS request:

    # host smtp.example.com
    Host smtp.example.com not found: 3(NXDOMAIN)

In this example, we queried for a record that does not
exist (**smtp.example.com**). The server has replied with `NXDOMAIN` to
inform us that the record does not exist. The DNS server we queried will
now cache that `NXDOMAIN` response for 3600 seconds (1 hour) so it
need not query the authoritative server for that request again.

### Recursion

To understand DNS, you have to understand how recursion works. To look up
a record, assuming that it isn't currently cached, a DNS server must
first locate an authoritative name server for that domain. How does
it do that? That's where recursion comes in. Let's look at our
hierarchy diagram again.

    www.example.com.
     |    |      | |
     |    |      | +--- the root zone, denoted by a "."
     |    |      +--- the TLD zone, typically three characters (but not always)
     |    +--- the domain
     +--- the hostname

When you make a request for a DNS record, your computer asks the
server for the full record. In all likelihood, your DNS server does not
possess that information for the fully qualified domain name, but it
certainly knows some portion of the request. From left to right, it
first searches itself for **www.example.com.** Assuming it fails there, it
searches itself for what it knows of **example.com.** If it fails
that, it searches itself for what it knows of **com.** And if all else
fails, it returns the information it knows for **.**, the root zone.
Typically this information is nothing more than the name servers that are
authoritative for those zones and their IP addresses. Let's take a look
at what happens when we query a name server that is not authoritative
for the domain. Here I am going to use my personal DNS server and
query the CNAME record for **www.rackspace.com.**

    # dig @127.0.0.1 www.rackspace.com CNAME +trace
    com.            172800    IN    NS    a.gtld-servers.net.
    com.            172800    IN    NS    b.gtld-servers.net.
    com.            172800    IN    NS    c.gtld-servers.net.
    com.            172800    IN    NS    d.gtld-servers.net.
    com.            172800    IN    NS    e.gtld-servers.net.
    com.            172800    IN    NS    f.gtld-servers.net.
    com.            172800    IN    NS    g.gtld-servers.net.
    com.            172800    IN    NS    h.gtld-servers.net.
    com.            172800    IN    NS    i.gtld-servers.net.
    com.            172800    IN    NS    j.gtld-servers.net.
    com.            172800    IN    NS    k.gtld-servers.net.
    com.            172800    IN    NS    l.gtld-servers.net.
    com.            172800    IN    NS    m.gtld-servers.net.
    ;; Received 913 bytes from 127.0.0.1#53(127.0.0.1) in 0 ms

    rackspace.com.        172800    IN    NS    ns2.rackspace.com.
    rackspace.com.        172800    IN    NS    ns.rackspace.com.
    ;; Received 598 bytes from 192.31.80.30#53(d.gtld-servers.net) in 36 ms

    www.rackspace.com.    300    IN    CNAME    wwwp.wip.rackspace.com.
    rackspace.com.        86400    IN    NS    ns2.rackspace.com.
    rackspace.com.        86400    IN    NS    ns.rackspace.com.
    ;; Received 136 bytes from 69.20.95.4#53(ns.rackspace.com) in 24 ms

Notice the commented lines between each return. They tell you which name
server responded. In the first block, my client queried my own name
server (127.0.0.1) and asked it for **www.rackspace.com**. 127.0.0.1 responded
with what it new of the query, namely the 13 authoritative **com.** TLD
servers. My client then picked one at random (d.gtld-servers.net) and
queried it for **www.rackspace.com**. That name server didn't know the
requested value either, so it responded with what it knew, namely
the authoritative servers for **rackspace.com**. Finally we queried
**ns.rackspace.com** and it told us the information we were
looking for. If my server did not know the 13 **com.** name servers, it
would have given us the 13 **.** root servers. Here's another
query showing exactly that.

    # dig @127.0.0.1 www.nato.it A +trace
    .            102849    IN    NS    m.root-servers.net.
    .            102849    IN    NS    d.root-servers.net.
    .            102849    IN    NS    k.root-servers.net.
    .            102849    IN    NS    l.root-servers.net.
    .            102849    IN    NS    j.root-servers.net.
    .            102849    IN    NS    g.root-servers.net.
    .            102849    IN    NS    h.root-servers.net.
    .            102849    IN    NS    a.root-servers.net.
    .            102849    IN    NS    c.root-servers.net.
    .            102849    IN    NS    i.root-servers.net.
    .            102849    IN    NS    e.root-servers.net.
    .            102849    IN    NS    b.root-servers.net.
    .            102849    IN    NS    f.root-servers.net.
    ;; Received 913 bytes from 127.0.0.1#53(127.0.0.1) in 0 ms

    it.            172800    IN    NS    m.dns.it.
    it.            172800    IN    NS    dns.nic.it.
    it.            172800    IN    NS    r.dns.it.
    it.            172800    IN    NS    s.dns.it.
    it.            172800    IN    NS    nameserver.cnr.it.
    it.            172800    IN    NS    a.dns.it.
    ;; Received 608 bytes from 202.12.27.33#53(m.root-servers.net) in 107
    ms

    nato.it.        10800    IN    NS    ns2.publinord.it.
    nato.it.        10800    IN    NS    ns1.publinord.it.
    ;; Received 118 bytes from 194.0.16.215#53(a.dns.it) in 132 ms

    www.nato.it.    86400    IN    CNAME    nato.it.
    nato.it.        86400    IN    A    46.37.14.27
    nato.it.        86400    IN    A    46.37.14.7
    nato.it.        86400    IN    A    46.37.14.18
    nato.it.        86400    IN    NS    ns2.publinord.it.
    nato.it.        86400    IN    NS    ns1.publinord.it.
    ;; Received 180 bytes from 46.37.14.8#53(ns2.publinord.it) in 128 ms

First we checked the **.** name servers, then the **it.** servers (note
  that there are only 6 of them, not 13 as is common with other TLDs) before
  being directed to the **nato.it** name servers. Finally one of these
  was able to tell us the CNAME and A records we were after.

### Record types

Now that we know the basics of how DNS works, let's take a look at some of
the many different record types that are available. Which record type
you need depends on what you're doing. While A records and CNAMEs are the
most commonly observed, PTR records, MX records, NS records, TXT
records, and of course SOA records are all deeply important and AAAA
records are becoming increasingly common.

#### A records

A records are the most common record type. You'll request them and modify
them more than any other record type. A records are what map domain
names like **www.rackspace.com** to IPv4 addresses. Here's an example A record.

    mail.rackspace.com. 300 IN A 72.3.128.170

#### AAAA records

Extremely similar to A records, AAAA records (commonly called
  quad-A records) map domain names to IPv6 address.

    email.rackspace.com. 300 IN AAAA 2001:4802:7a01:0010:0000:0000:0000:0006

#### PTR records

PTR records can be thought of as the exact opposite of A and AAAA
records. These map IP addresses to host names. It's a common convention
to match A records and PTR records for mail servers as an anti-spam
method. The value of this is debatable, but many mail servers
require it. These records are literally written backwards. Let's look at one.

    170.128.3.72.in-addr.arpa.  86400  IN  PTR  mail.rackspace.com.

From above, you can see that mail.rackspace.com resolves to 72.3.128.170
and in the PTR record the octets are reversed. This is necessary
in order for PTR records to recurse properly. When a name server requests
this PTR record, it first must check the **arpa.** domain, then
the **in-addr.arpa.** domain, then **72.in-addr.arpa**,
**3.72.in-addr.arpa**, and finally **128.3.72.in-addr.arpa.** in turn. If
the record was written in the same order as the IP address, it would
check **170.in-addr.arpa.** and get an entirely wrong result.

In the **in-addr.arpa.** domain, each 8-bit portion of an IP
address (octet) represents a different sub-domain. IP addresses are
typically read left-to-right, but domain names are resolved from
right-to-left. This reverses the octet ordering so the IP address looks
backwards. This is the classic "Little Endian" vs. "Big Endian" dynamic.
IP Addresses are Big Endian while domain names are Little Endian. To
look up a pointer record, the Endianess has to be reversed.

#### MX records

MX stands for Mail eXchange and informs a client what mail servers
receive mail for a domain. For example, Rackspace e-mail addresses
are written **firstname.lastname@rackspace.com**, not
**firstname.lastname@cust41036-1.in.mailcontrol.com**. Without MX
records, we would have to setup the physical host that **rackspace.com**
points to as our mail server, or configure our e-mail addresses as
something like **firstname.lastname@mail.rackspace.com**. MX records
are special in that they have an additional option - a priority.

    rackspace.com.        300    IN    MX    10 cust41036-1.in.mailcontrol.com.
    rackspace.com.        300    IN    MX    20 cust41036-2.in.mailcontrol.com.

In the above example, the first entry has a priority of 10, the second
20. The server with the lowest priority number is favored over those
with higher numbers. Thus, anyone sending an e-mail to rackspace.com
will send that message to **cust41036-1.in.mailcontrol.com.** unless it
is unavailable for some reason. In that case, the message will be delivered to **cust41036-2.in.mailcontrol.com.**

#### CNAME records

The "C" in CNAME stands for "canonical". It's the "usual" name. We use
CNAME records as aliases for another hostname. For instance, we may have
a set of web servers behind a load balancer with the name
**lb1.example.com**, but most people visiting our website will use
the **www.example.com.** hostname. We can setup a CNAME for
"www" pointing to "lb1". Here's take a look at one.

    www.rackspace.com.    300    IN    CNAME    wwwp.wip.rackspace.com.

Here we see that **www.rackspace.com.** is a CNAME to
**wwwp.wip.rackspace.com.**. The DNS server requesting a record for
this hostname will then immediately request the same record for
**wwwp.wip** and substitute it's value. We can clearly see this if we
try to grab the A record using dig.

    # dig www.rackspace.com a | grep -v -e '^\s*;' -e '^\s*$'
    www.rackspace.com.         6    IN    CNAME    wwwp.wip.rackspace.com.
    wwwp.wip.rackspace.com.    6    IN    A    23.253.6.64

#### NS records

As you might imagine, NS records tell DNS servers what name servers are
authoritative for a zone. Recall our discussion of recursion earlier? In
that case, we hit the authoritative root servers and they told us what
were the authoritative TLD servers. Those then told us the authoritative
domain servers, and so on. But what about sub-domains? Many people
divide their domain up into sub-domains for a variety of purposes. For
instance, if you have multiple web servers rather than have
**web01.example.com.** and **web02.example.com**, you could have
**cms01.www.example.com.** and **cms-sql01.www.example.com.** In such
a situation, you'd be grouping your web servers with the database
servers that support them into a sub-domain. You could then have your
own name servers for the **www.example.com.** subdomain. An entirely
different set of name servers could be configured to service those
requests. Here's what the (partial) zone files might look like
in such a scenario.

    ; example.com zone file
                    IN      NS      ns1.example.com.
                    IN      NS      ns2.example.com.
    www             IN      NS      ns1.www.example.com.
    www             IN      NS      ns2.www.example.com.
    ns1.www         IN      A       192.168.1.1
    ns2.www         IN      A       192.168.1.2

    ============================================================

    ; www.example.com zone file
                    IN      NS      ns1.www.example.com.
    www             IN      NS      ns2.www.example.com.
    ns1             IN      A       192.168.1.1
    ns2             IN      A       192.168.1.2
    www             IN      A       192.168.1.3
    cms01           IN      A       192.168.1.11
    cms02           IN      A       192.168.1.12
    sql01           IN      A       192.168.1.31

Here we are providing the name servers for **www.example.com.** in the
**example.com.** zone file. Notice also, that we have provided A records
for those name servers there as well. These A records are canonically
known as *glue* records. To support recursion, the parent zone must
include A or AAAA records for the name servers of the child zone **if** the
child zone's name servers are themselves children of the parent. That may
sound confusing, so let's break this down by looking at an example that
does not require these glue records.

    ; testzone.com. zone file
                    IN      NS      ns1.example.net.

Here the parent zone is **testzone.com.** and the name server exists in a
different domain entirely (**example.net.**). No glue records are
required here. When a DNS client requests the name servers for
**testzone.com.**, it receives **ns1.example.net.** as a response. It
then begins recursing down the **net.** TLD to locate those. Now what
happens if our zone file looks like this?

    ; dns.testzone.com. zone file
                    IN      NS      ns1.dns.testzone.com.

If we request records under **testzone.com.**, we eventually receive a
response of **ns1.dns.testzone.com.** When we recurse this, we
receive a response telling us to ask **ns1.dns.testzone.com.** for the
answer. However, we have no idea what the A or AAAA record for that server
is. Recursion breaks at this point and clients will have no idea how to
contact the authoritative name server for the **dns.testzone.com.**
domain name. As a result, no one will be able to reach our servers.

Glue records are most commonly encountered on the TLD servers. For
instance, the name servers for **rackspace.com** are children of
**rackspace.com.**.

    # dig rackspace.com ns +short
    ns2.rackspace.com.
    ns.rackspace.com.

To contact those servers, the **com.** TLD name servers **must** have
A or AAAA records for those hostnames, and in fact they do:

    # dig com. ns +short | grep 'a.'
    a.gtld-servers.net.
    # dig @a.gtld-servers.net. rackspace.com ns
    ; AUTHORITY SECTION:
    rackspace.com.        172800    IN    NS    ns2.rackspace.com.
    rackspace.com.        172800    IN    NS    ns.rackspace.com.

    ;; ADDITIONAL SECTION:
    ns2.rackspace.com.    172800    IN    A    65.61.188.4
    ns.rackspace.com.     172800    IN    A    69.20.95.4

#### TXT records

TXT records are simply text fields dedicated to a hostname. They can be
used for a variety of purposes, but are most commonly used for Sender
Permitted From (SPF) for e-mail servers. There's no real limit to
precisely what can and cannot be done with a TXT record. Any ASCII text
is valid, as you can see in the following example:

    example.com.              60    IN  TXT    "v=spf1 -all"
    example.com.              60    IN  TXT    "$Id: example.com 4415 2015-08-24 20:12:23Z davids $"

#### SOA records

Start of Authority (SOA) records contain DNS information about the entire
domain or sub-domain. Unlike other records, SOA always contains seven
fields. Let's take a look at one.

    # dig rackspace.com soa +short
    ns.rackspace.com. hostmaster.rackspace.com. 1485384885 300 300 1814400 300

These fields from left-to-right are: Primary DNS Master, Contact E-Mail
Address, Serial Number, Refresh, Retry, Expiry, and Negative TTL. We'll
discuss them in detail in just a moment. For now, I want to show you
what an example SOA record typically looks like in a zone file.

    rackspace.com. 300 IN SOA ns.rackspace.com. hostmaster.rackspace.com. (
            1485384885;   Serial Number
            300;          Refresh: 5 minutes
            300;          Retry: 5 minutes
            1814400;      Expire: 3 weeks
            300;          Negative Caching: 5 minutes
            )

The use of the parenthesis is necessary, but the entire SOA record could
be set on a single line. It's common to write it this way however, as
it makes reading the record much more natural and the comments clearly
define each field so you don't have to remember the ordering.

- **Primary DNS master** - Gives the fully qualified domain name for
whatever DNS server is the master for this zone.

- **Contact e-mail address** - The e-mail address of the DNS administrator.

  **Note:** Because the '@' character isn't valid as part of the
  record, the first period is always considered to be an '@'. This means
  that it's impossible to have a period in the user portion of this
  e-mail address. For example: **firstname.lastname@rackspace.com** would
  be written as **firstname.lastname.rackspace.com** and interpreted
  as **firstname@lastname.rackspace.com**.

- **Serial number** - A 32-bit integer that indicates what version of the
zone-file we are using. This is used by slave servers to determine if
they have the same version of the zone file as the master server.
Canonically this is written as the date in big-endian form (Year, Month, Day)
plus two additional integers tacked onto the end (example: first change
on July 4th, 2016 would be 2016070401) but the only strict requirement
is that it always increases in value. Many managed DNS tools start
with a serial number of 1 and increment that number every time the
zone is modified.

- **Refresh** - The number of seconds the slave server should wait before
checking with the master for updates. With modern DNS using slave
notifications, this can be set relatively high since the master should
inform the slaves when changes are made, at which point they will
query for a zone transfer regardless of whether the refresh time
has expired or not.

- **Retry** - The number of seconds the slave server should wait before
retrying a failed zone transfer. This is usually set fairly low to
prevent slave servers from remaining out of sync with the master for too long.

- **Expiry** - This is only ever used by slave servers and tells
them how long they should hold onto their zone files and continue to serve
those potentially stale records following a failed zone transfer. In the
event that the master server cannot be reached for zone updates, the
slave servers will operate as normal until this time elapses. At
that point, they will discard their zone file and return failures for
any lookups. Its important that this value be large enough to allow
you time to repair or replace a broken master. It is not uncommon to
see this field set to two weeks or a month or more.

- **Negative TTL** - The length of time to cache a negative result. In other
words, if we lookup a record for **does.not.exist.example.com** and
**example.com**'s SOA record has a Negative TTL field of 300, we receive
an `NXDOMAIN` reply. Our caching DNS server then caches
that `NXDOMAIN` reply for 300 seconds. In older versions of
BIND (and perhaps other name server implementations as well) this was
also treated as the default TTL for any records that did not have
an explicit TTL set.

### Zone files

The most common way to see DNS zones stored is the BIND zone file. This
zone file type is part of the DNS RFC, but not everyone strictly
complies with it. For instance, Microsoft Active Directory uses its own
proprietary format internally. However, most name servers are at least
able to read BIND zone files and import their records. Let's take a
look at an example zone file. (I've included line numbers below so we can
easily reference them later, but the line numbers are NOT part of
the zone file.)

    1)    $TTL 3h
    2)    @ IN SOA router.example.net. admin.example.net. (
    3)         2016012801;
    4)         3h;             Refresh : 3 hours
    5)         1h;             Retry : 1 hour
    6)         1w;             Expire : 1 week
    7)         1h;             Negative Caching : 1 hour
    8)         )
    9)    ;
    10)   ; Name servers ( The name '@' is implied )
    11)   ;
    12)                   IN      NS      ns1.example.net.
    13)                   IN      NS      ns1.rackspace.com.
    14)   ;
    15)   ; Mail servers
    16)   ;
    17)                   IN      MX 10   mail01.example.net.
    18)                   IN      MX 20   mail02.example.net.
    19)   ;
    20)   ; Address for canonical names
    21)   ;
    22)   example.net.    IN      A       192.168.1.1
    23)   router          IN      A       192.168.1.1
    24)   router          IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0001
    25)   ns1             IN      A       192.168.1.2
    26)   ns1             IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0011
    27)   www01           IN      A       192.168.1.11
    28)   www02           IN      A       192.168.1.12
    29)   www03           IN      A       192.168.1.13
    30)   www04           IN      A       192.168.1.14
    31)   lb01            IN      A       192.168.1.5
    32)   lb01            IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0101
    33)   lb02            IN      A       192.168.1.6
    34)   lb02            IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0102
    35)   lb-vip01  300   IN      A       192.168.1.31
    36)   lb-vip01  300   IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0301
    37)   lb-vip02  300   IN      A       192.168.1.32
    38)   lb-vip02  300   IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0302
    39)   mail01          IN      A       192.168.1.21
    40)   mail01          IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0201
    41)   mail02          IN      A       192.168.1.22
    42)   mail02          IN      AAAA    2001:4802:7803:0104:cf87:5f00:0f31:0202
    43)   ;
    44)   ; Aliases
    45)   ;
    46)   mail            IN      CNAME   lb-vip02
    47)   www             IN      CNAME   lb-vip01

Let's start by looking at line 1. "$TTL" is a shortcut introduced
in BIND9. It sets the default TTL for the zone. Different TTLs
can be set for individual records. On lines 35-38 for instance, the
TTL has been set to 300 seconds.

Now let's take a look at the SOA record starting on line 2. Notice
that we're using a special character here "@". This character is
another piece of BIND shorthand that means "this domain". In our
example, the domain name is **example.net.** If your DNS server is not
compatible with BIND style zone files, you might need to rewrite
the record like this:

    example.net. IN SOA router.example.net. admin.example.net. (
         2016012801;
         3h;             Refresh : 3 hours
         1h;             Retry : 1 hour
         1w;             Expire : 1 week
         1h;             Negative Caching : 1 hour
         )

Note the period at the end of **example.net.** We've been doing this
throughout this document and the reason will soon become clear.

Lines 12 and 13 show us the authoritative name servers for
**example.net.** We do not have any sub-domains, but if we did, the
would be written in this fashion:

    subdomain               IN      NS      other.name.server.some.where.

This is the first time that we've looked at a specific host record.
All of our previous examples in this zone file have been records
for the domain. In this example, **subdomain** is the host portion
of **subdomain.example.net.** When the hostname portion of the
records does not end with a period (**.**), BIND internally appends
the domain name, so the same line could have been written this way instead:

    subdomain.example.net.  IN      NS      other.name.server.some.where.

Let's look at line 22:

    example.net.            IN      A       192.168.1.1

In this case, the hostname ends with a period, so BIND does *not* append
the domain name. This is the A record for **lizella.net.** with no
additional hostname files (like "mail" or "www"). If the period were
omitted, BIND would appends the domain name and this record would
actually reference **example.net.example.net.**!

Some DNS implementations do not support this short-hand. In those
situations, you will need to write out the entire hostname, including
the domain portion, and include a period at the end. As you can
see, this shorthand definitely makes editing and reading zone
files a lot simpler.

The rest of the zone file should be pretty straight forward. Note that
in the Aliases portion we are using the short-hand hostname for both
the record's source and the record's destination. For example, line 46
could have been written in any of these ways:

    mail                    IN      A       lb-vip02
    mail                    IN      A       lb-vip02.example.net.
    mail.example.net.       IN      A       lb-vip02
    mail.example.net.       IN      A       lb-vip02.example.net.

All four are internally identical.

### Further reading

If you're interested in learning more, we recommend reading the
following external sites:

* [Domain Names - Concepts and Facilities](https://tools.ietf.org/html/rfc1034)
* [Domain Names - Implementation and Specification](https://tools.ietf.org/html/rfc1035)
* [Wikipedia - Zone Files](https://en.wikipedia.org/wiki/Zone_file)
* [Wikipedia - DNS Record Types](https://en.wikipedia.org/wiki/List_of_DNS_record_types)
