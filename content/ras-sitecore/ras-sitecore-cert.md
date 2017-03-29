---
permalink: sitecore-cert/
audit_date:
title: Upload a certificate
type: article
created_date: '2017-09-02'
created_by: Juan Garza
last_modified_date: '2017-02-09'
last_modified_by: Juan Garza
product: Sitecore
product_url: sitecore
---

[Sitecore Cloud FAQ](/how-to/sitecore-faq)

### Getting Started

To secure with HTTPS an app that has a custom domain name, you add a certificate for that domain name. By default, Azure secures the *.azurewebsites.net wildcard domain with a single SSL certificate, so you can already access your app via: 
**https://\<appname>.azurewebsites.net**

If you would like to use a custom domain the default certificate cannot secure that. Like all wildcard certificates, the default certificate is not as secure as using a custom domain and your own certificate for that custom domain.

### Get an SSL certificate

If you do not already have one, you need to get one from a trusted certificate authority (CA). The certificate must meet all the following requirements:

-It is signed by a trusted CA (no private CA servers).
-It contains a private key.
-It is created for key exchange, and exported to a .PFX file.
-It uses a minimum of 2048-bit encryption.
-Its subject name matches the custom domain it needs to secure. To secure multiple domains with one certificate, you need to use a wildcard name (e.g. *.contoso.com) or specify subjectAltName values.
-It is merged with all intermediate certificates used by your CA. Otherwise, you may run into irreproducible interoperability problems on some clients.

[Purchase an SSL Certificate](https://docs.microsoft.com/en-us/azure/app-service-web/web-sites-purchase-ssl-web-site)

### Add the SSL Certificate to Azure

- In your browser, open the Azure Portal.
- Click the App Service option on the left side of the page.
- Click the name of your app to which you want to assign this certificate.
- In the Settings, Click SSL certificates
- Click Upload Certificate
- Select the .pfx file that you exported in Step 1 and specify the password that you create before. - Then, click Upload to upload the certificate. You should now see your uploaded certificate back in the SSL certificate blade.
- In the ssl bindings section Click on Add bindings
- In the Add SSL Binding blade use the dropdowns to select the domain name to secure with SSL, and the certificate to use. You may also select whether to use Server Name Indication (SNI) or IP based SSL.

------------------------------------------------------------------------
