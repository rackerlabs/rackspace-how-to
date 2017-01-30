---
permalink: rackspace-cdn-secure-delivery-options/
audit_date: '2016-09-21'
title: Rackspace CDN secure delivery options
type: article
created_date: '2015-04-20'
created_by: Megan Meza
last_modified_date: '2016-09-21'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

[Rackspace CDN](http://www.rackspace.com/cloud/cdn-content-delivery-network) offers the following certificate types for secure delivery: Rackspace shared domain, SAN, and Custom. These types are distinguished by how
much ownership a customer has over the secure certificate.

### Requirements for all Rackspace CDN certificate types

No matter what your secure certificate type, the following requirements
apply to all customers delivering HTTPS traffic with the Rackspace CDN
product.

#### Secure origin

To serve encrypted traffic from the Akamai edge network to an origin
over HTTPS, the origin (that is, the web server or load balancer) must
have a secure certificate that was provisioned by an approved
Certificate Authority (CA).

**Note:** Server Name Indication (SNI) configurations on origin servers
are not currently supported.

Following is a list of approved CAs:

-   AddTrust External CA Root
-   AffirmTrust Commercial
-   AffirmTrust Networking
-   AffirmTrust Premium
-   America Online Root Certification Authority 2
-   Baltimore CyberTrust Root
-   Certum CA
-   Class 2 Primary CA
-   COMODO Certification Authority
-   Cybertrust Global Root
-   DigiCert Assured ID Root CA
-   DigiCert Global Root CA
-   DigiCert High Assurance EV Root CA
-   DST Root CA X3
-   Entrust.net Certification Authority (2048)
-   Entrust Root Certification Authority
-   GeoTrust Global CA
-   GeoTrust Primary Certification Authority
-   GeoTrust Primary Certification Authority - G3
-   Global Chambersign Root
-   GlobalSign
-   GlobalSign
-   GlobalSign Root CA
-   Go Daddy Root Certificate Authority - G2
-   Network Solutions Certificate Authority
-   QuoVadis Root Certification Authority
-   QuoVadis Root CA 3
-   QuoVadis Root CA 2
-   SecureTrust CA
-   SwissSign Gold CA - G2
-   SwissSign Silver CA - G2
-   TC TrustCenter Class 2 CA II
-   Thawte Primary Root CA
-   Thawte Primary Root CA - G3
-   UTN - DATACorp SGC
-   UTN-USERFirst-Hardware
-   VeriSign Class 3 Public Primary Certification Authority - G3
-   VeriSign Class 4 Public Primary Certification Authority - G3
-   VeriSign Class 3 Public Primary Certification Authority - G5
-   VeriSign Universal Root Certification Authority

#### HTTPS request fees

All traffic delivered over HTTPS is charged an increased request fee.
Request pricing for HTTP versus HTTPS is as follows:

-   \$0.0075 per 10,000 requests for HTTP traffic
-   \$0.010 per 10,000 requests for HTTPS traffic

#### Organizational validation

All Rackspace CDN certificates are provisioned using organizational
validation (OV). This method of validation requires that the domain
administrator be contacted to validate the ownership of the domain. This
validation has already been addressed for customers using Rackspace
shared domain, but a certificate authority will contact all customers
that purchase a SAN or Custom certificate to validate their domain
ownership.

For this reason, it is critical that your domain's WHOIS information is
up-to-date. You can check your current WHOIS information at
<http://whois.icann.org/>.

If this information is out-of-date, update it with your DNS provider
before submitting a request for a SAN or Custom certificate.

### Rackspace shared domain

This method of secure delivery uses a shared Rackspace domain and
implements a wildcard certificate that Rackspace owns and manages. When
you use a shared domain, your SSL domain is structured as
**https://*mysite*.secure.raxcdn.com/**, where ***mysite*** is an
attribute that you can choose.

Because this URL uses the raxcdn.com domain, users of shared domain
HTTPS often decide not to use Rackspace CDN to accelerate their entire
website. Instead, they are more likely to use Rackspace CDN to
accelerate their static content like images, videos, and style sheets.
In this scenario, the HTTPS URL is not seen in the browser navigation,
but is instead visible only in references in the website code itself.

To use the Rackspace shared domain method, you create a CDN service in
the Cloud Control Panel and select **HTTPS** in **Choose Traffic Type**
and select **Shared Rackspace Domain Certificate** in **Choose
Certificate Type**. For more information, see [Create a Rackspace CDN
service](/how-to/create-a-rackspace-cdn-service).

<img src="{% asset_path rackspace-cdn/rackspace-cdn-secure-delivery-options/Screen%20Shot%202015-12-17%20at%209.49.51%20AM.png %}" width="665" height="548" />

In the Domain Name field, enter the domain that you want to use in the
shared domain URL. This name must be unique across all Rackspace CDN
URLs, so we recommend using a name specific to your company or
application. Your subdomain (the part of the URL before
.xxxx.secure.raxcdn.com in the Domain Name entry) can be only a single
word, and it can contain hyphens, but *not* contain periods.

Using a Rackspace shared domain for secure traffic does not carry an
additional monthly fee. Customers who use this certificate type for
secure delivery are charged the standard fee for CDN bandwidth and the
HTTPS request fee (\$0.010 per 10,000 requests).

### SAN certificate

Customers who choose the Subject Alternative Name (SAN) certificate type
can use their own domain name when serving traffic over HTTPS. In this
method, a customer's domain name is added as an "alternative name" on a
SAN certificate that Rackspace owns and manages. By offering customers
the ability to share a "host certificate" with other customers,
Rackspace can reduce the cost of using your own domain with HTTPS
delivery. In this method, a customer's SSL domain is structured as
**https://www.mysite.com**.

To request that Rackspace add you to a shared SAN certificate, you log
in to the control panel and create a CDN service with **HTTPS** selected
under **Choose Traffic Type** and **Shared SAN Certificate** selected
under **Choose Certificate Type**. Make sure that you enter a **Domain
Name** with a subdomain and also enter an **Origin**. Then click Create
Service. For more information, see [Create a Rackspace CDN
service](/how-to/create-a-rackspace-cdn-service).

<img src="{% asset_path rackspace-cdn/rackspace-cdn-secure-delivery-options/Screen%20Shot%202015-12-17%20at%2010.28.59%20AM.png %}" width="672" height="555" />

When you click **Create Service**, the process is started to create the
SAN certificate. You can follow the process on the CDN Service
page in the **Domains** section. Below you see the **Status** is
**Certificate Pending**.

<img src="{% asset_path rackspace-cdn/rackspace-cdn-secure-delivery-options/Screen%20Shot%202015-12-17%20at%2010.13.35%20AM.png %}" width="622" height="449" />

The certificate authority (CA) will contact the administrator of the
domain to confirm that Rackspace has the right to add the domain to a
shared SAN certificate. The CA uses the domain's WHOIS information to
determine who to contact.  For more information about WHOIS information,
see the previous section on [Organizational
validation](#Organizational%20validation).

**Note**:  It might take up to three business days to fully complete
your request for a SAN certificate.

Using a shared Rackspace SAN certificate carries an additional monthly
fee of \$36 per domain. Customers who use this certificate type for
secure delivery are charged the standard per-GB fee for CDN bandwidth
and the HTTPS request fee (\$0.010 per 10,000 requests).

### Custom certificate

Customers who choose a Custom secure certificate have the most
flexibility over their certificate because they fully own the
certificate.  No other Rackspace customers can use or have access to
this certificate.

When provisioning a Custom certificate, you have the option for a SAN,
wildcard, or standard certificate.

-   A custom SAN certificate enables you to put multiple domains on a
    single certificate. Customers often use this option if they want to
    manage multiple brands under a single certificate. For example, your
    car cleaning business might own **squeakycleancars.com**, as well as
    **cleanyourcarshere.com** and **best-in-business-car-cleaning.com**.
    Using a custom SAN certificate, you can put each of these domains as
    "alternate" names on your SAN, saving you the cost and time
    associated with provisioning a certificate for all of your domains.
-   A wildcard certificate enables you to add multiple subdomains to a
    single certificate. Using the preceding example, your primary domain
    might be **cleancars.com**. Provisioning a wildcard certificate for
    **\*cleancars.com** allows you to secure anything before that
    domain - for example, **images.cleancars.com** and
    **mobile.cleancars.com**.

To get a Custom certificate for your domain or domains, start by
creating a CDN service with HTTPS enabled, as described in the
[Rackspace shared domain](#Rackspace%20shared%20domain)  and [SAN
certificate](#SAN%20certificate) sections.  After your service is
deployed, you can request a certificate by clicking the **Request a
Secure Certificate** link in **CUSTOM SECURE CERTIFICATES** in the
sidebar, which is shown in the figure below.

<img src="{% asset_path rackspace-cdn/rackspace-cdn-secure-delivery-options/Screen%20Shot%202015-12-17%20at%2010.35.08%20AM.png %}" width="771" height="531" />

This link routes you to a page to create a ticket. When you request a
Custom certificate, you need to supply multiple types of information.
Fill in all bolded items in the **Custom** section of the ticket
message.

<img src="{% asset_path rackspace-cdn/rackspace-cdn-secure-delivery-options/CustomCertificateTicket.png %}" width="764" height="447" />

After you submit the ticket, a Support Technician will contact you to
verify your information and will send your request to a certificate
authority (CA) to be processed.

**Note:**  The CA will contact the admininstrator of the domain to
confirm that Rackspace has the right to request a certificate on your
behalf. The CA uses the domain's WHOIS information to determine who to
contact. For more information about WHOIS information, see the previous
section on [Organizational validation](#Organizational%20validation).

**Note:**  It might take up to five business days to fully complete your
request for a Custom certificate.

Using a Custom certificate with Rackspace CDN carries an additional
monthly fee of \$730 per certificate. Customers who use this certificate
for secure delivery are charged the standard per-GB fee for CDN
bandwidth and the HTTPS request fee (\$0.010 per 10,000 requests).
