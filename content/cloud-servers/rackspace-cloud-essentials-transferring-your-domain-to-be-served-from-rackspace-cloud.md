---
permalink: rackspace-cloud-essentials-transferring-your-domain-to-be-served-from-rackspace-cloud/
audit_date: '2018-09-18'
title: Rackspace Cloud Essentials - Enable your domain to be served from Rackspace Cloud
type: article
created_date: '2012-03-07'
created_by: Rackspace Support
last_modified_date: '2018-09-18'
last_modified_by: Kate Dougherty
product: Cloud Servers
product_url: cloud-servers
---

**Previous section:** [Rackspace Cloud Essentials - What are your name
servers](/how-to/rackspace-cloud-essentials-what-are-your-name-servers)

In the previous article you learned how to [identify the Rackspace Cloud
Nameservers](/how-to/rackspace-cloud-essentials-what-are-your-name-servers),
and that you need to update them with your current domain registrar
in order to enable an existing domain to be served from your new Cloud
Server.

This article is intended for customers who have not completed this process
before. It goes into more detail about how the Domain Name System (DNS) works
and how to enable and test your domain. It also provides answers to some basic
questions about enabling your domain at Rackspace.

### Frequently asked questions about domain enablement

The following FAQs provide answers to frequent questions about domain
enablement.

#### Rackspace is not a domain registrar

Rackspace is a provider of world-class, on-demand Cloud Hosting services
that are backed by our commitment to **Fanatical Support**&reg;. We are
not a domain registrar such as [Namecheap](http://www.namecheap.com/),
[Dreamhost](http://dreamhost.com/domains/), or
[GoDaddy](http://www.godaddy.com/).

In order to host a domain from your Cloud Server, you first need to
register it at a domain registrar and then enable it at Rackspace.

#### What is a name server?

In the DNS, the name server helps translate a human-readable domain (such
as **rackspace.com**) into its corresponding Internet Protocol (IP) address.
This information is reported up a hierarchical chain of name servers that
store the domain name-IP mappings in a directory.

When a user enters a domain name in their browser's address bar, the high-level
directory in the DNS is queried and the request cascades down through a chain
of name servers. The final chain of name servers has the authoritative answer
to the request in the form of the IP address that matches the domain name.

When you're ready to host your site on a Rackspace Cloud Server, you need to
update the name servers so that the DNS knows the new IP address that is
serving the content of your site.

#### What are Rackspace's name servers?

For Rackspace Cloud services, you need to use the following name servers:

- **ns.rackspace.com** and **ns2.rackspace.com**

#### How do I start to enable the domain at Rackspace?

When you first register a domain, you're usually assigned the
name servers that belong to the domain registrar unless you specify
otherwise. In order to switch to Rackspace name servers, you need to log
in to your account at your domain registrar, locate the section of the
domain registrar's portal that stores the name servers, and change the name
servers to **ns.rackspace.com** and **ns2.rackspace.com**.

Finally, you need to create the corresponding DNS records for your domain in
the Rackspace Cloud Control Panel. For instructions, see [create DNS records
through the Control
Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel).

#### How long does DNS propagation take?

The term DNS propagation refers to the amount of time it takes for the updated
information that you provide to your registrar (the new name servers for your
domain) to be communicated through the hierarchical DNS system. In general, DNS
propagation of new name server information should take no longer than
24 to 48 hours.

#### How do I know if my domain is set up correctly?

There are a number of methods that you can use to test the DNS. For example,
you can use the `dig` command from a Linux&reg; machine to view the DNS records
that are associated with your domain. This method also confirms that DNS
propagation is complete. In addition, there are several websites that have
browser interfaces that can run the `dig` command against the domain.

After you confirm that DNS propagation is complete and that the A records
pointing to your Cloud Server are available through the `dig` command, you can
test the functionality of your website through a standard web browser. If you
still can't view your website, the firewall settings or web application might
be misconfigured. Ensure that the necessary ports (such as port 80 or 443) are
open on the Cloud Server to enable normal HTTP or HTTPS traffic.

The level of support that we provide for Managed Infrastructure Cloud Servers
encompasses the server hardware, data center environment, and
Internet connectivity to your server. We do not support the
configuration of applications on your server, including operating system-level
configurations. If you've verified that the DNS and the firewall are
correctly configured and your site is still inaccessible, you need
to take a closer look at the configuration of your web applications.

**Next steps:** [Create DNS records for Cloud Servers with the Control
Panel](/how-to/create-dns-records-for-cloud-servers-with-the-control-panel)
