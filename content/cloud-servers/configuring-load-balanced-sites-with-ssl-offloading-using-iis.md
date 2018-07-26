---
permalink: configuring-load-balanced-sites-with-ssl-offloading-using-iis/
audit_date: '2018-07-30'
title: Configure load balanced sites with SSL offloading using IIS
type: article
created_date: '2012-12-03'
created_by: Rae D. Cabello
last_modified_date: '2018-07-30'
last_modified_by: Cat Lookabaugh
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates how to configure load balanced
sites with SSL offloading by using Internet Information Services (IIS).

### Create a web server to use a template

Create a web server, set up your site in IIS, and test the site to
make sure it is functioning correctly.

### Create a load balancer

1. In the Rackspace Cloud Portal, click the **Servers** tab, and then click 
**Create Resources** -> **Load Balancers**.

2. Enter a **Name** and a **Region**, and make sure to use **Protocol/Port** ``HTTP:80``

3. After it builds, click **Actions** -> **Edit Protocol/Port** to set Secure Sockets Layer (SSL) traffic. Make sure to allow 
both secure and insecure traffic and to use the default Hyper Text Transfer Protocol 
Secure (HTTPS) port ``443``. Click **Save Protocol/Port**.

4. In the **Optional Features** section, click the Edit pencil to the right of the ``Secure Traffic (SSL)`` option. In the pop-up dialog box, enter and save your SSL configuration.

### Create a conditional redirect

1. IIS version 7 does not support conditional redirects by default. To handle this, 
install an extension, such as Microsoft&reg; [URL Rewrite](http://www.iis.net/downloads/microsoft/url-rewrite).

2. The Rackspace Cloud Load Balancers service passes a header value to determine the
original protocol used by the request (HTTP or HTTPS). This header is
labeled ``X_FORWARDED_PROTO``. Its value will either be **http** or **https**.

3. You can set up conditional redirect either by site or for the IIS instance.
In the following example, we use rewrite on the site level. Insert
the following XML into your **web.config** file in the ``system.webServer``
section:

        <rewrite>
            <globalRules>
        <rule name="HTTPS Redirect" enabled="true" stopProcessing="true">
            <match url="(.*)" />
        <conditions>
        <add input="{HTTP_X_FORWARDED_PROTO}" pattern="https" negate="true" />
        <add input="{SERVER_PORT}" pattern="8080" negate="true" />
            </conditions>
        <action type="Redirect" url="https://{HTTP_HOST}/{R:1}" />
        </rule>
            </globalRules>
        </rewrite>

4. In addition to adding this rule, you need to add a binding to
the site for port ``8080``. This allows monitoring services to test
this server directly without binding a certificate to the site.

5. Open a Firewall port for direct testing. Depending on your security
concerns, you can open port ``8080`` to all Internet Protocol (IP) addresses, 
or to a range of IPs used by your pollers. Opening this port allows the site to 
load without encryption from a remote IP address.

### Create a Monitoring Check

1. In the Rackspace Cloud Portal **Servers** tab, click the server for which you want to create the
monitor.

2. In the "Monitoring Checks"section, click **Create Check**.

3. Change the ``Check Type`` to **HTTP Check (Website)**.

4. In ``Check Name``, enter a meaningful name.

5. Enter the IP address of the server in ``URL``, designating port ``8080``.
The IP address is listed in the **Networks** section. If you are
hosting multiple sites on the server, you need to give the server
its own DNS name (for examplre, **web1.customerdomain.com**). Use this domain name
instead of the IP address and make sure to designate port ``8080``.

6. Click **Create Check** to confirm your entries.
