---
permalink: generate-certificate-signing-request/
audit_date:
title: Generate Certificate Signing Request
type: article
created_date: '2019-12-12'
created_by: Chad Sterling
last_modified_date: '2019-12-12'
last_modified_by: Chad Sterling
product: Dedicated Hosting
product_url: dedicated-hosting
---

### MyRackspace Portal 

This article explains how to generate a Certificate Signing Request(CSR).

#### Create a ticket in the MyRackspace Portal

1. Log in to the [MyRackspace Portal](https://login.rackspace.com/login) with your username and password.

2. In the top navigation bar, choose **Select a Product** > **Dedicated Hosting**.

3. Select **Tickets** > **Create Ticket**. The Create New Ticket page displays. 

4. Select the Subject field.

5. From the dropdown menu, Select **Generate a Certificate Signing Request**. 

    <img src="{% asset_path cloud-load-balancers/reset-user-password-on-active-directory-domain/password1.png %}" />

5. In the Ticket Details section, select a device from the dropdown menu. 

6. Complete all the required fields.

    **Note:** The Common Name field is the Fully Qualified Domain Name (FQDN) of the site you want to cover with the SSL certificate; for example 'www.mysite.com'.

    **Note:** The Alt. Names field is for sub domains of the FQDN from the previous step, such as 'shop.mysite.com'.  This field is optional.

    **Note:** The other required fields are Organization, Locality (City), State or Province Name, Country, and Bits.  The Bits field represents the encryption strength of the certificate.

7. Select **Create Ticket**.

    <img src="{% asset_path cloud-load-balancers/reset-user-password-on-active-directory-domain/password2.png %}" />
