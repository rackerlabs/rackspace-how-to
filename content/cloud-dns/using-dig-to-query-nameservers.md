---
permalink: using-dig-to-query-nameservers/
audit_date:
title: Use dig to query nameservers
type: article
created_date: '2013-05-28'
created_by: Jered Heeschen
last_modified_date: '2017-05-15'
last_modified_by: Cat Lookabaugh
product: Cloud DNS
product_url: cloud-dns
---

By now, you have built your server, made it secure, and uploaded content
to your server. The next step is to configure your DNS so the rest of the Internet knows where to find your site.

The most commonly asked DNS question is about our name servers. Name
servers store the internet directory information that connects your
domain name to your website and email hosting. Essentially, name servers
tell the internet where to find your website and where to deliver your
email. Our name servers are:

	 ns.rackspace.com
	 ns2.rackspace.com

If you have a domain that you have already registered and you want to
host it from your Rackspace Cloud Server, you will need to go to the
domain registrar and set our name servers for the domain. This DNS
change will take a variable amount of time to propagate to the Internet
from your domain registrar, but usually not more than 24 hours.

If you're unsure of your current name servers, a WHOIS search can help
you determine which name servers are currently assigned to your domain
name. If you change your hosting service provider, the name server
information for your domain must be updated to reflect that your site is
now being served by a different IP address.

`dig` can also help us understand how our DNS records look from the
perspective of other machines on the Internet.

The `dig` tests we have performed so far contain the option
"@ns.rackspace.com". This option instructs `dig` to query your cloud
server's primary DNS server. With that option we are testing the records
on your cloud servers's DNS server rather than any DNS records for the
domain that might be cached on other Internet DNS servers. That means
what we've done so far demonstrates techniques for testing DNS set up
for your cloud server's cloud files before you go live or before you
transfer DNS from a previous hosting provider to the server.

When you are happy with the results from the previous tests, it should
be safe to change the authoritative DNS servers for your domain to your
server's DNS servers:

    ns.rackspace.com
    ns2.rackspace.com

You can set the authoritative DNS servers through your domain's
registrar via their preferred method (with their own web-based tool or
by contacting them directly). After the changes have been submitted to
the registrar, the new values propagate across the Internet. In a
(hopefully) short time, the DNS records on other DNS servers will match
those you configured with your cloud server's DNS tool.

### Testing authoritative name servers

You can check the authoritative DNS servers for a domain by entering
something like:

    dig @8.8.8.8 +short NS domain.com

This is similar to the command used when testing for a correct NS configuration. The critical difference is that instead of using Rackspace's primary name server for this test, you point `dig` to a public DNS server run by Google - "8.8.8.8". You want to make sure to get your test results from an external server, and 8.8.8.8 is one of a few DNS servers that have been made available to the
public for this purpose.

The result of your test should be:

    ns2.rackspace.com.

    ns.rackspace.com.

If the external DNS server you're querying returns those results, then the change has propagated properly. If you see something different, such as the authoritative DNS servers of your previous
hosting company, then either the domain has not been transferred properly or the change is taking a while to propagate to the rest of the Internet. The reasons for delay vary, but a wait of several hours before a change completely works its way through the rest of the Internet is
not unusual.

If the results of the mailto:RackerPulse@Sirota.com name server check are
unfamiliar, you might be able to glean more information about the
name server in question by issuing the `dig` command without the `+short`
flag.

#### Variants for testing authoritative name servers

There are some variants of this test. They can give you different
answers, but only if you have an unusually intricate DNS set-up.

You can issue the command:

    dig @8.8.8.8 +nssearch domain.com

or:

    dig @8.8.8.8 +short SOA domain.com | cut -d' ' -f1

These two commands give you more data about the domain's refresh
settings (for DNS cache management), while revealing whose DNS servers
are the authorities for the domain. They can be useful for
troubleshooting.

The second command queries the "SOA" for the domain's zone file. SOA stands for "Start of Authority", and this record stores the domain's authoritative name servers and the defined minimum
time-to-live (TTL) on other servers. Depending on a DNS server's
configuration the SOA may contain additional information, like a domain
administrator's email address.

### Causes of DNS problems

It is possible to omit the destination DNS server (the "@8.8.8.8" part)
when issuing a `dig` command. With no server specified, `dig` will query the
DNS server configured on the system where you are running the command.
On a server, that will be whatever was set up in the default
configuration for the image the server was built from. On your home
computer, you would most likely query your ISP's DNS servers. It helps
to be aware of which DNS server is being queried when troubleshooting a
DNS issue in case the problem is related to DNS caching.

If you find your default DNS server returns a different IP address from
the one you configured with the cloud server's DNS tool, this is almost
always for one of two reasons:

1. Your registrar has not yet made the authoritative DNS server change or expects you to make the change using the registrar's tools.

2. DNS propagation delay, in which some stragglers - most often mail servers - catch up on the change over a week or so.

Some advanced techniques can be employed to reduce propagation delay but
they are beyond the scope of this article.

### Which DNS server is responding to my queries?

We can see which DNS server is resolving the client's requests by
issuing the `dig` command with no arguments. The client's default DNS
server is listed on the "SERVER" line close to the end of the output.

    dig

    ; <<>> DiG 9.5.1-P2 <<>>
    ;; global options:  printcmd
    ;; Got answer:
    ;; ->>HEADER<
