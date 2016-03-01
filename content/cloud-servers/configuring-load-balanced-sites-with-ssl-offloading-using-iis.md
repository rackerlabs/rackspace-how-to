---
node_id: 3229
title: Configuring Load Balanced Sites with SSL offloading using IIS
type: article
created_date: '2012-12-03'
created_by: Rae D. Cabello
last_modified_date: '2013-08-02'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

The following article will demonstrate how to Configure Load Balanced
Sites with SSL offloading using IIS.

### Create a web server to use a template

Create a web server and set up your Site in IIS. Test the Site to
make sure it is functioning correctly.

### Create a Load Balancer

1. Make sure to use protocol / port HTTP:80

2. Click the edit button next to Secure Traffic (SSL). Make sure you are
allowing secure and insecure traffic and using the default HTTPS port 443. Then fill in the
certificate information:

  <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/load-balanced-sites-IIS.png" width="444" height="438" />

### Create a Conditional Redirect

1. IIS 7 does not support conditional redirects out of the box. You will
need to install an extension to handle this. URL Rewrite is a good tool
provided by Microsoft for accomplishing this. You can download this
[here](http://www.iis.net/downloads/microsoft/url-rewrite).

2. Rackspace Cloud Load Balancers pass a header value to determine the
original protocol used by the request (HTTP / HTTPS). This header is
labeled X_FORWARDED_PROTO. Its value will either be **http** or **https**.

3. You can set up Conditional Redirect by Site, or for the IIS instance.
For this example, we are going to use rewrite on the Site level. Insert
the following XML into your **web.config** file in the system.webServer
section:

    ```
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
    ```

4. In addition to adding this rule, you will need to add a binding to
the site for port 8080. This will allow for monitoring services to test
this server directly without binding a certificate to the Site.

5. Open a Firewall port for direct testing. Depending on your security
concerns, you can open port 8080 to all IP addresses, or just to a range
used by your pollers. Opening this port will allow the Site to be loaded
without encryption from a remote IP address.

### Create a Monitoring Check

1. On the Rackspace Cloud Portal, open the server you want to create the
monitor for.

2. In the section "Monitoring Checks" click **Create Check**.

3. Change the Check Type to **HTTP Check (Website)**.

4. Give the Check a meaningful name.

5. Use the IP address of the server as the URL, designating port 8080.
You will find the IP address in the "Networks" section above. If you are
hosting multiple sites on the server, you will need to give the server
its own DNS name (i.e. **web1.customerdomain.com**). Use this domain name
instead of the IP address and make sure to designate port 8080.

  <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/load-balanced-sites-iis-2.png" width="591" height="167" />

6. Click **Create Check** to confirm your entries

  <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/load-balanced-sites-iis-3.png" width="354" height="218" />
