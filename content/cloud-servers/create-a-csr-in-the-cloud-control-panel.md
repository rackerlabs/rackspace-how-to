---
permalink: create-a-csr-in-the-cloud-control-panel/
audit_date:
title: Create a CSR in the Cloud Control Panel
type: article
created_date: '2014-09-25'
created_by: Rackspace Support
last_modified_date: '2016-06-21'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Rackspace  provides a tool for generating a certificate signing request, or CSR. This tool, the CSR Generator, shows you what CSRs you currently have and lets you create new CSRs with a simple form. Once you have entered your details, the generator combines them with your private key so that you can submit the combined encoded information to a certificate authority (CA).

When you are done with the generator, you can return to the Cloud Control Panel by clicking any of the terms in the top navigation or by going to [mycloud.rackspace.com](https://mycloud.rackspace.com).

**Note**: You can also generate a CSR and private key on your Linux Cloud Server using OpenSSL.  For more information, see [Generate a CSR with OpenSSL](/how-to/generate-a-csr-with-openssl).

### Access the CSR Generator

Click the following link to access the [CSR Generator](https://csrgenerator.rackspace.com).

After you log in, the generator lists your existing CSRs (if any), organized by domain name.

### Generate a CSR

1. Click **Create CSR**.

2. Enter the following information, which will be associated with the CSR:

   | Field | Explanation | Example |
   | --- | --- | --- |
   | Domain Name | The fully qualified domain name to which the certificate applies.  The domain names **example.com** and **www.example.com** are distinct from each other, so be sure to submit your request for the right domain.  If you want to secure both domains you can use the **Alt Names** field.  If you are purchasing a wildcard certificate use **\*.example.com**. | example.com |
   | Alt Names | *(Optional)* Additional domains that you want to add to the request. Each CA treats these differently, and the CA might charge for additional names.  The list that you submit can be comma separated. | www.example.com secure.example.com |
   | Email Address | *(Optional)* A contact email address for the certificate. | support@example.com |
   | Organization Name | The exact legal name of your organization.  The CA might seek to confirm that your organization is real and legally registered, so don't abbreviate words that aren't abbreviated in the organization's legal name. | Example Inc. |
   | Organizational Unit |  *(Optional)* The branch of your organization that is making the request. | Marketing |
   | City | The city where your organization is legally located. Do not abbreviate the city name. | San Antonio |
   | State or Province | The state or province where your organization is legally located.  Do not abbreviate the state or province name. | Texas |
   | Country | Choose your country from the drop-down menu.  The two-letter ISO abbreviation for your country is included in the CSR. | United States |
   | Private Key Bit Length | Key sizes smaller than 2048 are considered insecure and may not be accepted by a Certificate Authority. | 1024,2048,4096 |
   | Hashing Algorithm | Both algorithms are currently trusted in mainstream browsers and offer industry recommended security.  SHA-512 requires additional CPU processing. | SHA-256, SHA-512 |

   **Note:** You cannot use the following characters in the **Organization Name** or **Organizational Unit** fields: `< > ~ ! @ # $ % ^ * / \ ( ) ? . , &`

3. After you have entered all the required information, click **Create CSR**.

It can take between 5 and 60 seconds for the CSR to be generated.  You might need to refresh the page that displays your CSRs before the new CSR is listed.

### View CSR details

When CSR has been generated, you can click its UUID (unique identifier) in the CSR list to view its details screen.

This screen displays the information that you provided, the text of the CSR, and its associated private key.

### Submit the CSR to the CA

The text in the **Certificate Request** field is the CSR. It contains encoded details of the CSR and your public key.

To request your SSL certificate copy the** Certificate Request** text and submit it to your CA. Include all the text, including the **BEGIN** and **END**  lines at the beginning and end of the text block.

### Install the private key

Copy the private key to the server that will host the certificate.  See your application documentation to determine where to install the private key and certificate on your server.
