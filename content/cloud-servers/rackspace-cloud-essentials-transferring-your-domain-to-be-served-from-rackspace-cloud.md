---
permalink: rackspace-cloud-essentials-transferring-your-domain-to-be-served-from-rackspace-cloud/
audit_date:
title: Rackspace Cloud Essentials - Transferring Your Domain to be Served from Rackspace Cloud
type: article
created_date: '2012-03-07'
created_by: Rackspace Support
last_modified_date: '2017-05-11'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Rackspace Cloud Essentials - What are your name servers](/how-to/rackspace-cloud-essentials-what-are-your-name-servers)

In the previous article you learned how to [identify the Rackspace Cloud Nameservers](/how-to/rackspace-cloud-essentials-what-are-your-name-servers),
and that you will have to update them with your current domain registrar
in order to transfer an existing domain to be served from your new Cloud
Server. For many of our customers, that is all the information they
will need to get going. For those of you who have never been through
this process before we will go into more detail on how DNS works, and
how to transfer and test your domain. Here are the answers to some
basic questions about transferring your domain to Rackspace.

### Domain transfer FAQ

#### We are not a domain registrar

Rackspace IS a provider of world-class Cloud Hosting services on demand
backed by our commitment to Fanatical Support. What we are NOT is a
Domain Registrar like [Namecheap](http://www.namecheap.com/),
[Dreamhost](http://dreamhost.com/domains/), or
[GoDaddy](http://www.godaddy.com/).

So in order to host a domain from your Cloud Server, you will need to
have already registered it at a domain registrar, and then transfer it
to Rackspace.

#### What is a name server?

In the Domain Name (DNS) System, the name server is part of the process
that translates a human readable domain (like **rackspace.com**) into the
corresponding IP address. This information is reported up a
hierarchical chain of name servers that store the mappings in a
directory. When you are requesting to load a website by entering the
domain name into the address bar of your browser, this high level
directory is queried and responds with the next server down the chain
that knows where to find the IP address matching the domain name you
requested. Now that you want your domain to be hosted on a Rackspace
Cloud Server, you will need to update the name servers so that the DNS
system knows where to locate the new IP address that is serving your
domain.

#### What are Rackspace's name servers?

For Rackspace Cloud services, the name servers you need to use are:

**ns.rackspace.com** & **ns2.rackspace.com**

#### How do I transfer the domain?

When you first register a domain, you are usually assigned the
name servers belonging to the domain registrar, unless you specify
otherwise. First, you will need to log into your account with your
domain registrar and locate the section where the name servers are
stored. Next, you will change those to **ns.rackspace.com** and
**ns2.rackspace.com** to initiate the transfer of the domain. Some
registrars require a few extra steps in order to unlock the domain, but
this will vary on a case-by-case basis.

Your next step, if you haven't already done so, is to create
corresponding DNS records for your domain in the Rackspace Cloud Control
Panel. You can follow the instructions in the next article to learn how
to [create DNS records through the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).

#### How long does DNS propagation take?

DNS propagation is the time it takes for the updated information that
you provided to your registrar (the new name servers for your domain) to
be communicated through the hierarchical DNS system. In general, DNS
propagation of new name server information should take no longer than 24 - 48 hours.

#### How do I know my domain is set up correctly?

There are a number of ways you can test your DNS.  You can use the `dig`
command from a Linux machine to view the DNS records associated with
your domain. This will also confirm for you that DNS propagation has
completed. There are also several websites with a browser interface
that will allow you to run the `dig` command against your domain.

Once DNS propagation has completed and you can read the A records
pointing to your Cloud Server through `dig`, you can test the
functionality of your website through a browser like any of your other
site visitors. If you are still unable to view your website, the most
likely culprit would be a misconfiguration of your firewall settings or
of your web applications. You'll need to make sure that you have opened
the ports on your Cloud Server to allow normal HTTP traffic on port
80.

The level of support we provide for Managed Infrastructure Cloud Servers
encompasses the server hardware, the datacenter environment, and the
Internet connectivity to your server. We do not support the
configuration of applications on your server, including OS-level
configurations. If you have verified that DNS and your firewall are
correctly configured and your site is still inaccessible, you will need
to take a closer look at the configuration of your web applications.

**Next steps:** [Create DNS records for Cloud Servers with the Control Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel)
