---
permalink: set-up-spf-records/
audit_date:
title: Set up SPF records
created_date: '2019-01-21'
created_by: Rackspace Community
last_modified_date: '2019-01-21'
last_modified_by: Kate Dougherty
product: Cloud DNS
product_url: cloud-dns
---
When you add Sender Policy Framework (SPF) information to your Domain Name Service (DNS) records, you are able to specify the email servers that you use to send email from your domain. Completing this step validates your sending email address, which can improve your email deliverability rate. In other words, SPF helps keep your domain’s email out of your recipients’ spam folders.

To get started, you must first contact your DNS hosting company and ask them to add the following SPF information to your DNS records. You can also make this change yourself in the [Cloud Control Panel](https://login.rackspace.com).


1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.
3. Click **Networking > Cloud DNS**.
4. Click on the domain that you want to edit.
5. In the **Record** section of the **Domain Details** page, click the gear icon next to the **TXT** record that you want to edit, then select **Modify Record**. If the record doesn't exist yet, click **Add Record**.
6. In the **Record Type** field, select **TXT Record**.
7. *(Optional)* Enter a **Hostname** (<@domain>).
8. In the **Text** field, enter your information in the following format:

   Address:
   
       v=spf1 [any combination of the below] ~all

   - If you are a Hosted Exchange or Email Hosting customer, plug in the following information:

         include:emailsrvr.com

   - If you send email from your own server, plug in your Internet Protocol (IP) address as shown in the following example, replacing "1.2.3.4" with your mail server IP:    

         ip4:1.2.3.4

     For example, if your domain falls under both of these categories, the SPF information would look like the following example:

         v=spf1 include:emailsrvr.com ip4:1.2.3.4 ~all

Repeat these steps for every domain from which you plan to send email.

**Note**: When you compose an email, you must use a **From** address (or, more specifically, a _Return-Path_) that belongs to an SPF-enabled domain to ensure that SPF takes effect.
