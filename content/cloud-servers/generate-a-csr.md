---
permalink: generate-a-csr/
audit_date: '2018-10-23'
title: Generate a certificate signing request
type: article
created_date: '2018-10-23'
created_by: Stephanie Fillmon
last_modified_date: '2018-12-21'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

Before you can install a [Secure Socket Layer (SSL) certificate](/how-to/install-an-ssl-certificate), you must first generate a certificate signing request (CSR). You can do this by using one of the following methods:

- [(Linux&reg; server) OpenSSL](#openssl)
- [(Microsoft&reg; Windows&reg; server) Internet Information Services (IIS) Manager](#windows-iis-manager)
- [(Cloud customers) Cloud Control Panel](#cloud-control-panel)
- [(Managed customers) MyRackspace Portal](#myrackspace-portal)

### OpenSSL

The following sections describe how to use OpenSSL to generate a CSR for a single host name. If you want to generate a CSR for multiple host names, we recommend using the [Cloud Control Panel](#cloud-control-panel) or the [MyRackspace Portal](#myrackspace-portal).

#### Install OpenSSL

Check whether OpenSSL is installed by using the following command:

- CentOS&reg; and Red Hat&reg; Enterprise Linux&reg;

      rpm -qa | grep -i openssl

  The following output provides an example of what the command returns:

      openssl-1.0.1e-48.el6_8.1.x86_64
      openssl-devel-1.0.1e-48.el6_8.1.x86_64
      openssl-1.0.1e-48.el6_8.1.i686

- Debian&reg; and Ubuntu&reg;

      dpkg -l | grep openssl

  The following output provides an example of what the command returns:

      ii  libgnutls-openssl27:amd64           2.12.23-12ubuntu2.4              amd64        GNU TLS library - OpenSSL wrapper
      ii  openssl                             1.0.1f-1ubuntu2.16               amd64        Secure Sockets Layer toolkit - cryptographic utility

If the preceding packages are not returned, install OpenSSL by running the following command:

- CentOS and Red Hat

      yum install openssl openssl-devel

- Debian and Ubuntu

      apt-get install openssl

#### Generate the RSA key

Run the following commands to create a directory in which to store your RSA key, substituting a directory name of your choice:

    mkdir ~/domain.com.ssl/
    cd ~/domain.com.ssl/

Run the following command to generate a private key:

    openssl genrsa -out ~/domain.com.ssl/domain.com.key 2048

#### Create a CSR

Run the following command to create a CSR with the RSA private key (output is in Privacy-Enhanced Mail (PEM) format):

    openssl req -new -sha256 -key ~/domain.com.ssl/domain.com.key -out ~/domain.com.ssl/domain.com.csr

When prompted, enter the necessary information for creating a CSR by using the conventions shown in the following table.

**Note:** You cannot use the following characters in the **Organization Name** or **Organizational Unit** fields: `< > ~ ! @ # $ % ^ * / \ ( ) ? . , &`

| Field | Explanation | Example |
| --- | --- | --- |
| **Common Name** | The fully qualified domain name to which the certificate applies. The domain names **example.com** and **www.example.com** are distinct from each other, so be sure to submit your request for the right domain. If you are purchasing a wildcard certificate, use **\*.example.com**. | example.com |
| **Organization Name** | The exact legal name of your organization. The Certificate Authority (CA) might seek to confirm that your organization is real and legally registered, so don't abbreviate words that aren't abbreviated in the organization's legal name. | Example Inc. |
| **Organizational Unit** | The branch of your organization that is making the request. | Marketing |
| **City/locality** | The city where your organization is legally located. Do not abbreviate the city name. | San Antonio |
| **State/province** | The state or province where your organization is legally located. Do not abbreviate the state or province name. | Texas |
| **Country/region** | The two-letter International Standards Organization (ISO) abbreviation for your country. | US |

**Warning:** Leave the challenge password blank (press **Enter**).

#### Verify your CSR

Run the following command to verify your CSR:

    openssl req -noout -text -in ~/domain.com.ssl/domain.com.csr

After you have verified your CSR, you can submit it to a CA to purchase an SSL certificate.

### Windows IIS Manager

Use the following steps to generate a CSR by using Windows IIS Manager:

**Note:** The following steps are for IIS 8 or IIS 8.5 on Windows Server 2012.

1. Open IIS Manager.
2. In the left-hand **Connections** pane, click the server for which you want to generate a CSR.
3. In the center server **Home** pane under the **IIS** section, double-click **Server Certificates**.
4. In the right-hand **Actions** pane, click **Create Certificate Request**.
5. In the **Request Certificate** wizard, on the **Distinguished Name Properties** page, enter the following information and then click **Next**.

   | Field | Explanation | Example |
   | --- | --- | --- |
   | **Common Name** | The fully qualified domain name to which the certificate applies. The domain names **example.com** and **www.example.com** are distinct from each other, so be sure to submit your request for the right domain. If you are purchasing a wildcard certificate, use **\*.example.com**. | example.com |
   | **Organization Name** | The exact legal name of your organization. The CA might seek to confirm that your organization is real and legally registered, so don't abbreviate words that aren't abbreviated in the organization's legal name. | Example Inc. |
   | **Organizational Unit** | The branch of your organization that is making the request. | Marketing |
   | **City/locality** | The city where your organization is legally located. Do not abbreviate the city name. | San Antonio |
   | **State/province** | The state or province where your organization is legally located. Do not abbreviate the state or province name. | Texas |
   | **Country/region** | The two-letter ISO abbreviation for your country. | US |

6. On the **Cryptographic Server Provider Properties** page, enter the following information and then click **Next**.

   - **Cryptographic service provider**: Unless you have a specific cryptographic provider, use the default selection.
   - **Bit length**: 2048 is the recommended bit length.

7. On the **File Name** page, enter the location where you want to save the certificate request file and then click **Finish**.

After you have generated the CSR, you can submit it to a CA to purchase an SSL certificate.

### Cloud Control Panel

Rackspace provides the CSR Generator for generating a CSR. The CSR Generator shows you the CSRs that you currently have and lets you create new CSRs with a simple form. After you have entered your details, the generator combines them with your private key so that you can submit the combined encoded information to a CA.

When you are done with the generator, you can return to the Cloud Control Panel by clicking any of the terms in the top navigation or by going to [login.rackspace.com](https://login.rackspace.com) and selecting **Rackspace Cloud** from the drop-down product menu in the top navigation bar.

#### Access the CSR Generator

Access the CSR Generator [directly](https://csrgenerator.rackspace.com) or through the control panel by using the following steps:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com) and select **Rackspace Cloud** from the drop-down product menu in the top navigation bar.
2. In the top navigation bar, click **Servers > Cloud Servers**.
3. Click the name of the server for which you want to generate a CSR.
4. In the right-hand **Managing Your Server** section under **Help me with**, click **Generate a CSR**.

The generator lists your existing CSRs, if you have any, organized by domain name.

#### Generate a CSR

1. Click **Create CSR**.

2. Enter the following information, which will be associated with the CSR:

   | Field | Explanation | Example |
   | --- | --- | --- |
   | Domain Name | The fully qualified domain name to which the certificate applies. The domain names **example.com** and **www.example.com** are distinct from each other, so be sure to submit your request for the right domain. If you want to secure both domains, you can use the **Alt Names** field.  If you are purchasing a wildcard certificate, use **\*.example.com**. | example.com |
   | Alt Names | *(Optional)* Additional domains that you want to add to the request. Each CA treats these differently, and the CA might charge for additional names. You can submit a comma-separated list. | www.example.com, secure.example.com |
   | Email Address | *(Optional)* A contact email address for the certificate. | support@example.com |
   | Organization Name | The exact legal name of your organization. The CA might seek to confirm that your organization is real and legally registered, so don't abbreviate words that aren't abbreviated in the organization's legal name. | Example Inc. |
   | Organizational Unit |  *(Optional)* The branch of your organization that is making the request. | Marketing |
   | City | The city where your organization is legally located. Do not abbreviate the city name. | San Antonio |
   | State or Province | The state or province where your organization is legally located. Do not abbreviate the state or province name. | Texas |
   | Country | Choose your country from the drop-down menu. The two-letter ISO abbreviation for your country is included in the CSR. | United States |
   | Private Key Bit Length | Key sizes smaller than 2048 are considered insecure and might not be accepted by a CA. | 1024,2048,4096 |
   | Hashing Algorithm | Both algorithms are currently trusted in mainstream browsers and offer industry recommended security.  SHA-512 requires additional CPU processing. | SHA-256, SHA-512 |

   **Note:** You cannot use the following characters in the **Organization Name** or **Organizational Unit** fields: `< > ~ ! @ # $ % ^ * / \ ( ) ? . , &`

3. After you have entered all the required information, click **Create CSR**.

It can take between 5 and 60 seconds for the CSR to be generated.  You might need to refresh the page that displays your CSRs before the new CSR is listed.

#### View CSR details

When CSR has been generated, you can click its UUID (unique identifier) in the CSR list to view its details screen.

This screen displays the information that you provided, the text of the CSR, and its associated private key.

#### Submit the CSR to the CA

The text in the **Certificate Request** field is the CSR. It contains encoded details of the CSR and your public key.

To request your SSL certificate, copy the **Certificate Request** text and submit it to your CA. Include all the text, including the **BEGIN** and **END**  lines at the beginning and end of the text block.

#### Install the private key

Copy the private key to the server that will host the certificate.  See your application documentation to determine where to install the private key and certificate on your server.

### MyRackspace Portal

If you are a Managed or Dedicated customer, you can request a CSR through the MyRackspace Portal by using the following steps:

1. Log in to the [MyRackspace Portal](https://login.rackspace.com) and select **Dedicated Hosting** from the drop-down product menu in the top navigation bar.
2. In the top navigation bar, click **Tickets > Create Ticket**.
3. On the **Tickets / Create New Ticket** page, select **Generate Certificate Signing Request (CSR)** from the **Subject** drop-down list.
4. Enter the following information in the **Ticket Details** section:

   | Field | Explanation | Example |
   | --- | --- | --- |
   | **Device(s)** | The server or servers for which you want to generate a CSR. Use the drop-down menu to select your servers. | |
   | **Common Name** | The fully qualified domain name to which the certificate applies. The domain names **example.com** and **www.example.com** are distinct from each other, so be sure to submit your request for the right domain. If you want to secure both domains, you can use the **Alt Names** field.  If you are purchasing a wildcard certificate, use **\*.example.com**. | example.com |
   | **Alt. Names** | *(Optional)* Additional domains that you want to add to the request. Each CA treats these differently, and the CA might charge for additional names. You can submit a comma-separated list. | www.example.com, secure.example.com |
   | **Email Address** | *(Optional)* A contact email address for the certificate. | support@example.com |
   | **Organization** | The exact legal name of your organization. The CA might seek to confirm that your organization is real and legally registered, so don't abbreviate words that aren't abbreviated in the organization's legal name. | Example Inc. |
   | **Organizational Unit** |  *(Optional)* The branch of your organization that is making the request. | Marketing |
   | **Locality (City)** | The city where your organization is legally located. Do not abbreviate the city name. | San Antonio |
   | **State or Province Name** | The state or province where your organization is legally located. Do not abbreviate the state or province name. | Texas |
   | **Country** | Choose your country from the drop-down menu. The two-letter ISO abbreviation for your country is included in the CSR. | United States |

   **Note:** The bit length is automatically set to 2048.

5. Click **Create Ticket**.

### Next steps

- [Purchase or renew an SSL certificate](/how-to/purchase-or-renew-an-ssl-certificate)
- [Install an SSL certificate](/how-to/install-an-ssl-certificate)

### Reference

- <https://www.digicert.com/csr-ssl-installation/iis-8-and-8.5.htm>


<script type="application/ld+json">
   {
   "@context": "http://schema.org/",
   "@type": "HowTo",
   "name":"Generate a certificate signing request",
   "description": "This article explains how to generate a certificate signing request for a variety of operating systems.",
   "step": [
   	{
   	"@type": "HowToSection",
   	"name": "Use OpenSSL to generate a CSR for a single host name",
       "position": "1",
   	"itemListElement": "You can use OpenSSL to generate a CSR"
   	},{
   	"@type": "HowToSection",
   	"name": "Check whether OpenSSL is installed and, if it isn't, install it",
       "position": "2",
   	"itemListElement": [
   		{
           "@type": "HowToStep",
           "position": "1",
   		"text": "Check whether OpenSSL is installed on CentOS by using the following command: rpm -qa | grep -i openssl"
   		},{
           "@type": "HowToStep",
           "position": "2",
           "text": "If the expected packages are not returned, install OpenSSL by running the following command: yum install openssl openssl-devel"
   		}]
   	},{
   	"@type": "HowToSection",
   	"name": "Generate an RSA key",
       "position": "3",
   	"itemListElement": "Run the following commands to create a directory in which to store your RSA key, substituting a directory name of your choice: "
   }]}
</script>
