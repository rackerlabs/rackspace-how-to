---
permalink: upload-an-ssl-certificate-to-a-custom-domain/
audit_date: '2017-05-19'
title: Upload an SSL certificate to a custom domain
type: article
created_date: '2017-05-08'
created_by: Juan Garza
last_modified_date: '2017-05-08'
last_modified_by: Nate Archer
product: Managed Operations
product_url: managed-operations
---

To secure an application that has a custom domain name, you need to use HTTPS. By default, Azure secures the **.azurewebsites.net** wildcard domain with a single SSL certificate, so you can already access your application using the  **https://\<appname>.azurewebsites.net** URL.

However, the default Azure SSL certificate does not work if you use a custom domain for your application. A custom domain with its own SSL certificate is more secure than the default. This article describes how to add an SSL certificate to a application with a custom domain.

### Prerequisite

- Your login credentials for the Azure portal. For information about how to log in to the Azure portal, see [Sitecore Cloud portals and account management](/how-to/sitecore-cloud-portals-and-account-management/).

### Get an SSL certificate

If you do not already have SSL certificate, you need to get one from a trusted certificate authority (CA). The certificate must meet all the following requirements:

- Signed by a trusted CA (no private CA servers).

- Contain a private key.

- Created for key exchange, and exported to a .PFX file.

- Use a minimum of 2048-bit encryption.

- Have a subject name that matches the custom domain it needs to secure. To secure multiple domains with one certificate, you need to use a wildcard name (for example, *.contoso.com*) or specify subjectAltName values.

- Merged with all intermediate certificates used by your CA. Otherwise, you might experience irreproducible interoperability problems on some clients.

### Add the SSL certificate to Azure

1. Log in to the [Azure portal](https://portal.azure.com).

2. In the left side navigation pane, click **App services**.

3. Select the application to which you want to assign the certificate.

4. Navigate to the Settings and then click **SSL certificate**.

5. Click **Upload Certificate**.

6. Select the **.pfx** file that contains your SSL certificate, and enter the password that you want to use for this certification.

7. Click **Upload**.

   You can now navigate to the SSL certificate through the application  pane.

8. In the "SSL bindings" section of the SSL certificate pane, click **Add bindings**.

   A new pane labeled *SSL Bindings* appears.

9. Use the drop-down menus to select the custom domain URL you want to secure by using SSL, followed by the name of SSL certificate. You can also select whether to use Server Name Indication (SNI) SSL or IP-based SSL.

10. Click **Add binding**.

    SSL is now enabled for your custom domain.
