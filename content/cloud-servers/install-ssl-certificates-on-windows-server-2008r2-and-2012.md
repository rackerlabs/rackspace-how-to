---
permalink: install-ssl-certificates-on-windows-server-2008r2-and-2012/
audit_date:
title: Installing SSL certificates on Windows 2008 R2 and 2012 servers
type: article
created_date: '2014-02-13'
created_by: Justin Bryant
last_modified_date: '2016-03-11'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

This article shows how to install SSL certificates on Windows 2008 R2 and 2012 servers.

**Note**: Because SSL certificates changed little during the update from 2008 R2 to 2012, the instructions in this article apply to both versions.

### Generate a certificate signing request (CSR)

1. Open the Internet Information Services (IIS) Manager.
2. Select the server name and then double-click **Server Certificates**.
3. Under **Actions**, click **Create Certificate Request**.
4. On the Distinguished Name Properties page of the Request Certificate wizard, complete all of the fields for your certificate and then click **Next**.
5. On the next page of the wizard, select a cryptographic service provider (the default is usually acceptable) and the bit length of the encryption key (the recommended minimum is 2048 bits). Then click **Next**.
6. On the File Name page, enter the location where you want to save the certificate request file, and then click **Finish**.

### Install the certificate

1. After you get the certificate from your preferred SSL vendor, in the IIS Manager, select the server and double-click **Server Certificates**.
2. Under **Actions**, click **Complete Certificate Request**.
3. In the wizard, select the location of the certificate file, which is the same location you chose when generating the CSR in the preceding section.
4. (*Windows Server 2012 only*) Name the file and choose your store.
5. Click **OK**.

### Set up the bindings

1. In the IIS Manager, right-click your site and select **Edit Bindings**.
2. In the **Site Bindings** window, click **Add**.
3. In the **Add Site Binding** dialog box, perform the following steps:
    1. Set the value of **Type** to **https**.
    2. (*Windows Server 2012 only*) Specify the host name, if necessary.
    3. From the **SSL certificate** list, select your certificate.
    4. Click **OK**.

After the binding is set up, the **Site Bindings** window shows the binding for HTTPS.

### Import an SSL certificate

1. In the IIS Manager, double-click **Server Certificates**.
2. Under **Actions**, click **Import**.
3. Select the location of your certificate file, enter the password (if you set one), and choose your certificate store (*Windows Server 2012 only*). Then, click **OK**.
