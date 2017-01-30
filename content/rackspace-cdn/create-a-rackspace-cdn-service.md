---
permalink: create-a-rackspace-cdn-service/
audit_date: '2016-06-01'
title: Create a Rackspace CDN service
type: article
created_date: '2015-05-08'
created_by: Rackspace Support
last_modified_date: '2016-06-01'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

When you access Rackspace CDN through the Cloud Control Panel (as
described in [Access Rackspace CDN](/how-to/access-rackspace-cdn)),
the **Content Delivery Network (CDN)** page is displayed. If you have
already created any services, they are listed. To create a new service,
perform the following steps.

A box opens letting you know that your service is being deployed.
Another box opens showing that your set up is complete along with the
URL you need to use to create your CNAME record.

1. Click **Create Service**.

   A popup dialog box is displayed.

2. Enter the following information to create your service:

   - **Service Name:** A human-readable name for your service.
   - **Choose Traffic Type:** Choose HTTP or HTTPS.

   When you choose HTTPS, **Choose Certificate Type** displays to enable you to select the kind of certificate your service will use. After June 10, 2015, any new domains that are enabled for HTTPS deliver both HTTPS and HTTP traffic. Domains that existed before June 10, 2015 also support this; to turn this support on, you edit and save the TTL (edit without changing the value). Note that your origin must have a secure certificate before traffic can be routed to your origin with HTTPS. For more information on serving secure traffic, see [Rackspace CDN secure delivery options](/how-to/rackspace-cdn-secure-delivery-options).

   **Shared SAN Certificate** enables you to use your own domain name with Rackspace CDN and serve traffic securely. (Note that pricing information displays below under the type of certificate chosen.) When you create a service using a shared SAN certificate, when you click **Create Service**, you are also creating your SAN certificate. The following steps are involved when you create a service using a shared SAN certificate:

      - Rackspace CDN sends the domain details to Akamai.
      - Akamai send the request to the SSL Provider for verification.
      - SSL Provider contacts the administrator for the domain based on WHOIS information.
      - The administrator verifies the domain rights.
      - SSL Provider issues the certificate to Akamai.
      - Akamai deploys the certificate and sends a response to Rackspace CDN.
      - Rackspace CDN shows the completed status in the Control Panel.

   - **Domain Name**: This is the domain name through which visitors receive content. The domain name must have a subdomain in it, for example, www.example.com. You can add additional domains to the service after the service is created. You will be provided with a Canonical Name (CNAME) to use as an alias for your domain name. When you create a secure shared domain, the name must be a single word with any periods (.) but it can contain hyphens (-).
   - **Origin**: The origin is the domain (or IP address for HTTP) where your content resides. The HTTP or HTTPS server that will respond to origin pull requests from the CDN edge servers. The origin for your site can be the IP address of the server or load balancer for your site. Additionally, it is a good practice to use a domain name for your origin. To do this, simply create a DNS A record for your origin - for example, **origin.example.com = 12.345.6.789**. You can add additional origins to the service after the service is created.

3. Click **Create Service**.

   A box opens showing the progress of the creating of the service. When the setup of the service is complete, a box opens that provides the URL to use to create your CNAME record and a link to update DNS to complete the setup. (For instructions to update DNS, see [Change DNS to enable Rackspace CDN](/how-to/change-dns-to-enable-rackspace-cdn).)

   **Note:** Before you update DNS, you must make sure that your web servers are configured to accept the domain name that you chose because the domain that is generated for https will produce an error.

   For example, if the CDN domain is `cdn.customer.com.cdn306.raxcdn.com`, to update the website configuration (origin) for Apache, you need to include the CDN domain `cdn.customer.com.cdn306.raxcdn.com `as `ServerAlias `for Apache or as `Server_Name` for Nginx.

   After you have configured the website and before you update your DNS records, test that the web server is responding by using a cURL statement similar to the following one:

        curl -I -k -H "Host:cdn.customer.com.cdn306.raxcdn.com" https://SERVER_IP/

   The response should be `HTTP/1.1 200 OK`.

4.  Click **Close** to close this box and open a page with all the
details about the new service.

   On this page, [add and manage your domains](/how-to/add-and-manage-domains-in-rackspace-cdn) and define the following optional rules:

   - [Origin rules](/how-to/work-with-origins-and-origin-rules-in-rackspace-cdn/)
   - [Caching rules](/how-to/create-and-manage-caching-rules-in-rackspace-cdn/)
   - [Restrictions](/how-to/create-and-manage-restrictions-in-rackspace-cdn/)

   **Note**: The **Actions** menu on the top right side of the page enables the actions for managing your service, which are described in [Section 3. Manage a CDN Service](/how-to/rackspace-cdn).

### Additional resources

- [Access Rackspace CDN](/how-to/access-rackspace-cdn)
- [Add and manage domains in Rackspace CDN](/how-to/add-and-manage-domains-in-rackspace-cdn)
