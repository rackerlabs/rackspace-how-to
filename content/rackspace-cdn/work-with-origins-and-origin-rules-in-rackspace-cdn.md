---
permalink: work-with-origins-and-origin-rules-in-rackspace-cdn/
audit_date: '2016-06-02'
title: Work with origins and origin rules in Rackspace CDN
type: article
created_date: '2015-05-11'
created_by: Rackspace Support
last_modified_date: '2016-06-02'
last_modified_by: Stephanie Fillmon
product: Rackspace CDN
product_url: rackspace-cdn
---

You can add origins to your CDN service. For example, if all your images
are stored in a Cloud Block Storage volume attached to one server, and
your web code lives on another server, you need to specify both servers
as origins. If you add an origin, you must always add an origin rule
that defines which traffic should pull from that origin.

After you create your service, you enter origin rules in the **Origin
Rules** section of the CDN service page. A **Default Origin** rule is
created for the origin that you defined when you created your service.

**Note**: If you have specified only one origin for a service, the **Add
Rule** button does not display. You must have at least two origins
defined for the **Add Rule** button to be shown in the dialog.

If you create multiple origin rules, you must order the rules from least
specific to most specific. For more information about rules, see the
following sections and [Rackspace CDN edge
rules](/how-to/rackspace-cdn-edge-rules).

### Add an origin

To add an additional origin to your service, follow these steps:

1. In the **Service Details** section, click **Add Origin**.

2. Enter the IP address or domain name of the origin where your content
resides.

3. Enter the path for the origin. You can use a wildcard for the path.

   <img src="{% asset_path rackspace-cdn/work-with-origins-and-origin-rules-in-rackspace-cdn/AddOrigin.png %}" width="376" height="166" />

4. Click **Save Origin**.

The **Service Status** is **Pending** until
the new origin is deployed. After the origin is deployed, it is
displayed in the **Origin** list under **Service Details.**

### Specify the Host Header

To change the **Host Header** for any origin that you create, follow
these steps to create an origin rule:

1. Click the pencil icon beside the origin name.

   A popup dialog box appears.

2. Select the type of Host Header from the dropdown. The following types
are available:

   - **Domain**: The default value. The Host Header takes a NULL value. Using Domain indicates that the Host Header in the queries from the CDN edge nodes to the origin will match the domain on which the request comes in.
   - **Origin**: The Host Header takes the value of the origin domain. Using Origin indicates the Host Header in the queries from the CDN edge nodes to the origin will match the name of the origin server.
   - **Custom**: The Host Header takes the value, for which an entry box opens, that you specify. Using Custom indicates that the Host Header in the queries from the CDN edge nodes to the origin will match the custom value that you provide in the entry box.

Following are several use cases for the Host Header capability, particularly related to using Virtual Hosts (VHOST):

1. You have one or more domains that point to a single origin using
Virtual Hosts.

   You can set up each domain in the service, and then edit the origin by specifying the Host Header type.

   - A type of **Domain** means that the domain entered in the URL is what will be forwarded to the origin and mapped to a VHOST. If multiple VHOSTs exist, they should match the domain name.
   - A type of **Origin** means that the origin domain set up is what will be forwarded in the host header and mapped to a VHOST. This is useful if each domain serves content from the same VHOST and the VHOST is setup to match the origin name.
   - A type of **Custom** means that the custom value entered by the user will be sent to the origin and mapped to a VHOST.  This is useful if the VHOST is set up to respond to host headers different from the origin name or domain name.

2. You have more than one domain that point to a single origin, but
want to use different VHOSTs for each domain (overriding the Host Header
for each domain).

For this use case, you can create multiple services for each domain,
allowing them to specify a different Host Header for the origin for each
service.

### Create an origin rule

After you have created your service and added an additional origin,
follow these steps to create an origin rule:

1. Click **Add Rule**.

   The **Add Rule** button appears only if you have multiple origins for the service. A popup dialog box appears.

   <img src="{% asset_path rackspace-cdn/work-with-origins-and-origin-rules-in-rackspace-cdn/createOriginRule.png %}" width="370" height="176" />

2. Enter the following information to define the rule:

-   **Name**: Name for the rule.
-   **Origin**: The origin to which the rule applies. Select the origin
    from the menu, which shows the origins that are defined for
    the service.
-   **Path**: Path for the rule.

3. Click **Save Rule**.

The **Service Status** is **Pending** until the
new rule is deployed. After the rule is deployed, it is displayed in the
**Origin Rules** list.

### Edit an origin rule

To edit an origin rule, follow these steps:

1. Click the gear icon beside the rule that you want to edit, and select
**Edit Rule**.

2. In the popup dialog box, edit the name of the rule or the path for
the rule.

3. Click **Save Rule**.

The **Service Status** is **Pending** until the
updated rule is deployed. After the rule is deployed, it is displayed in
the **Origin Rules** list.

### Delete an origin rule

To delete an origin rule, follow these steps:

1. Click the gear icon beside the rule that you want to delete, and
select **Delete Rule**.

2. In the popup dialog box, click **Delete Rule**.

The **Service Status** is **Pending** until the rule is deleted. After
the rule is deleted, it is removed from the **Origin Rules** list.

### Additional resources

- [Add and manage domains with Rackspace CDN](/how-to/add-and-manage-domains-in-rackspace-cdn)
- [Create and manage caching rules in Rackspace CDN](/how-to/create-and-manage-caching-rules-in-rackspace-cdn)
