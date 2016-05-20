---
permalink: securing-the-cloud-addressing-cloud-computing-security-concerns-with-private-cloud/
audit_date:
title: 'Address Cloud Computing Security Concerns with Private Cloud'
type: article
created_date: '2011-03-27'
created_by: Rackspace Support
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Cloud computing in the [public cloud](http://www.rackspacecloud.com/)
has raised some security questions for businesses that have regulatory
compliance requirements. Barriers to adopting public cloud for
security-sensitive applications have been created because many
regulatory agencies have been slow to align security requirements with
[public cloud](http://www.rackspacecloud.com/) computing. To meet some
of these security needs, a [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
allows businesses to achieve the benefits of cloud computing while
maintaining the security and privacy that dedicated hardware provides.
Private cloud also provides users with a path for future migration to
public cloud. This article describes security concerns in the [public
cloud](http://www.rackspacecloud.com/) and strategies for employing
[private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
to address these issues.



### Security against Hackers

The first security concern in any computing environment is the threat
from hackers. Cloud computing in a shared environment creates new
opportunities for hackers seeking to discover vulnerabilities, which may
ultimately allow them to deny service or gain unauthorized access.
Additionally, security experts have detailed methods for attacking cloud
infrastructure from the inside by running hacker tools in the cloud
itself.



Once a hacker has access into a node of a public cloud, the hacker gains
greater visibility inside the cloud. The hacker then uses this inside
information to more effectively probe the system and plan attacks. To
combat this vulnerability, a [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
restricts access to its resources to authorized users and administrators
only. By preventing potential hackers from gaining an inside view,
[private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
allows businesses to tightly control access to the entire environment.



### Security against Resource Contention



Another concern in the [public cloud](http://www.rackspacecloud.com/) is
resource contention. A security issue can arise when the resource
contention is the result of a Denial of Service (DoS) attack on another
tenant of the shared infrastructure. The [public
cloud](http://www.rackspacecloud.com/) is a shared resource that can
potentially expose all tenants in the cloud to security risks when any
tenant becomes the target of a DoS attack. However, [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
provides businesses with inherent protection from DoS attacks directed
at other businesses by avoiding shared infrastructure.



Many regulatory compliance specifications, including HIPAA and PCI,
specifically require data segregation (although not all [public
clouds](http://www.rackspacecloud.com/) use virtualization technology).
While these standards have not been updated to address how data can be
protected and segregated in the public cloud, they fit very well with
private cloud. Since a [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
uses dedicated hardware, it is comparatively simpler to segregate the
data on separate servers and in separate virtual machines (VM). This
allows businesses to maintain regulatory compliance while benefiting
from cloud computing.



The example above includes the following components:

-   Hypervisors - These are the physical servers that run the various
    virtual machines under hypervisor control.
-   Firewall - Firewalls are an important first line of defense
    against attacks.
-   IDS - Intrusion Detection System.
-   DMZ segment - The demilitarized zone (DMZ) network segment has
    tightly controlled access to the public Internet.
-   Private segment - This network segment has no access from the
    public Internet.

The custom configuration above is an example that includes both a public
segment and a private segment, as well as both firewall and IDS
hardware. In this example the two network segments enable publication of
applications in a compliant manner regardless of whether a public or
private network is required. Private network segments prohibit access
from the public Internet and are a necessary component of many
regulatory compliance specifications such as PCI DSS. The IDS device
would proactively detect any incoming attacks and send alerts prompting
the security staff to investigate and respond.



Cloud computing is constantly evolving, and as the technology advances,
many of these security concerns will be addressed. Technology is being
created that will allow virtual machines to move from [private
clouds](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
to [public clouds](http://www.rackspacecloud.com/) and back again.
Businesses that choose to deploy [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
today will benefit immediately by making the best use of their available
resources. In addition, the businesses using [private
cloud](http://www.rackspace.com/managed_hosting/private_cloud/index.php)
to optimize their environments now will be well-positioned for a future
transition to [public cloud](http://www.rackspacecloud.com/) as their
needs evolve and new technologies are developed.
