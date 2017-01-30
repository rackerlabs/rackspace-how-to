---
permalink: dns-management-how-to-update-your-ip-address/
audit_date:
title: 'Update your DNS IP address'
type: article
created_date: '2011-09-27'
created_by: Rackspace Support
last_modified_date: '2016-06-16'
last_modified_by: Kyle Laffoon
product: Cloud Sites
product_url: cloud-sites
---

One of the greatest conveniences of Rackspace Cloud Sites is automatic DNS provisioning
when you add a new domain through your Control Panel. But what if you're hosting your DNS
externally to Rackspace? How will you update your DNS records to make your website accessible?

The following sections show you how to locate your Rackspace Cloud Sites DNS entries so
that you can add them to your external DNS provider. This will ensure your DNS is pointing
accurately to your Cloud Site.

### Using the Cloud Sites Control Panel

1.  Log in to the [Cloud Sites Control Panel](https://manage.rackspacecloud.com/pages/Login.jsp).
    You use the control panel to find your DNS entries.

2.  Click on **Hosting > Cloud Sites**.

3.  Select the domain name for which you want to obtain DNS information.

4.  Click on the **DNS** tab toward the top of your screen.

5.  Scroll down to the **DNS Management** section within the DNS tab. The two entries that you need are the www.domain.com, and the
    root domain.com.

6.  Replicate these DNS entries to your external DNS provider. The process will differ
    depending on the service. In the preceding screen shot, you can see **A** and **CNAME**"
    entries in the **Type** column. Ensure that you at least replicate the **A** entries for
    the root domain and **www**, although you might also want to set the **ftp** record (the
    address used to transfer files to the domain). If you are using email through Cloud Sites,
    you should also set up the **CNAME** entries for **mail** and **webmail**.

### Using the Cloud Control Panel

You can also edit and update your DNS records through the DNS page of the Cloud Control Panel.

**Note:** It can take a while for the DNS setting changes to propagate to the rest of the Internet, so your domain might not point to your Cloud Site right away. You can bypass DNS and verify that your site is up by using the **Testing URL** listed in the site's **General Settings** tab. If you still can't access the site through your domain name after an hour or two, contact your DNS provider for assistance.

1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2.  Select **DNS** from the menu at the top of the page.

3.  Click on the domain name for which you want to obtain the DNS information.

4.  On the **Domain Details** page, the DNS entries are located under the **Records** heading.
    The two entries that you need are the www.example-domain.com and the root example-domain.com.

5.  Replicate these DNS entries to your external DNS provider. The process will differ
    depending on the service. In the DNS records list, you can see **A** and **CNAME** entries
    in the **Type** column. Ensure that you at least replicate the **A** entries for the
    root domain and **www**, although you might also want to set the **ftp** record (the
    address used to transfer files to the domain).
