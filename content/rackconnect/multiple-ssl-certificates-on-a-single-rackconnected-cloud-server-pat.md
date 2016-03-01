---
node_id: 2056
title: Multiple SSL certificates on a single RackConnect cloud server (PAT)
type: article
created_date: '2012-08-23'
created_by: Juan Perez
last_modified_date: '2014-10-03'
last_modified_by: Jered Heeschen
product: RackConnect
product_url: rackconnect
---

Each cloud server comes with a single private IP address. When
leveraging RackConnect, if you need direct access to the cloud server
from the Internet, you can use the public IP address assigned to your
RackConnect cloud server (the **Provision public IP address** Automation
Feature must be enabled). This public IP address leverages a Network
Address Translation (NAT) on your network device to translate the public IP
address to the private IP address of your cloud server.

Sometimes, you need to have more than one public IP address assigned to a single cloud server. The most common case is when you are hosting multiple SSL sites on a single cloud server and are not able to use a wildcard certificate. Because only one private (10.x) address is allowed on each cloud server, this setup can be
accomplished by leveraging Port Address Translation (PAT) on your network
device versus NAT.

For example, if you have a single cloud server that you want to use to
host `https:// www.example-domain.com` and `https://
www.example-domain-2.com`, you could set up your network device as
follows:

-   Cloud Server private IP address is 10.1.1.1
-   DNS points `www.example-domain.com` to public IP 1.1.1.1
-   DNS points `www.example-domain-2.com` to public IP 1.1.1.2
-   PAT entry on network device points 1.1.1.1 port 443 to 10.1.1.1 port
    8443
-   PAT entry on network device points 1.1.1.2 port 443 to 10.1.1.1 port
    8444

On your cloud server, you would configure your web server software (for example,
Apache or IIS) to listen on ports 8443 and 8444 (they would be able to
distinguish which site the encrypted traffic was destined for based on
the unique port number).

If you need help setting up PAT on your network device, contact your Dedicated Support team.
