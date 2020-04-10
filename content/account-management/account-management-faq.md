---
permalink: account-management-faq/
audit_date:
title: Account Management FAQ
type: article
created_date: '2019-05-16'
created_by: Stephanie Fillmon
last_modified_date: '2019-02-20'
last_modified_by: Chadwick Sterling
product: Account Management
product_url: account-management
---

### Billing

#### How am I billed for Rackspace services?

Many of our services follow a utility pricing model and are billed for
hourly usage each month on the anniversary date of the account creation.
Charges on invoices are based on service usage since the last invoice
date. Details about our product pricing are located on our [Cloud Pricing Page](http://www.rackspace.com/cloud/public-pricing/).

#### When am I billed for Rackspace services?

When you sign up for products under the Managed Infrastructure or Managed
Operations SysOps service level, your credit card is charged a US $1.00
authorization charge to confirm that it is an active card. The amount of
the authorization charge is refunded to your card within 24 to 72 hours.

Thirty days after you sign up, your first invoice is processed. Your
charges consist of service usage accrued within the first 30 days.

After the first billing cycle, you are billed every month on the same
date that you first signed up for service.

#### What forms of payment does Rackspace accept?

Payments are charged automatically to a credit card. Rackspace accepts
Visa&reg;, Mastercard&reg;, and American Express&reg;.

#### How can I estimate my monthly bill?

You can use our [Cloud Pricing Page](http://www.rackspace.com/cloud/public-pricing/) and [Cloud Pricing Calculator](http://www.rackspace.com/calculator/)
to estimate pricing.

#### Can I pay in advance?

If you meet the minimum requirements for our Commitment Pricing Program,
you can prepay based on a commitment pricing contract for your account. Any
usage beyond the minimum commitment amount is invoiced at the utility rate on
the monthly date of your account's anniversary. For example, if your account
was created on the 25th of the month, you will be billed monthly on the 25th.
You can find more information about the Commitment Pricing
Program on the [Cloud Servers Discount
page](http://www.rackspace.com/cloud/servers/discounts/).

#### What is the duration of my contract for cloud services?

Cloud services are provided on a month-to-month basis. For more information,
see the Rackspace [Cloud Terms of
Service](https://www.rackspace.com/information/legal/cloud/tos).

#### How do I view my invoice?

Follow these steps to view your invoice:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. In the upper-right corner of the page, click **Billing**.

   You are redirected to the **Billing Overview** dashboard, which displays
   information about billing, payments, and usage.

Invoices are available as a summarized PDF, a more detailed
comma-separated-values (CSV) file, and a [detailed HTML
view](/how-to/detailed-invoices-overview/).
We also provide [pivot tables in downloadable
spreadsheets](/how-to/use-pivot-tables-with-your-cloud-billing-invoice)
to help you organize your billing information.

#### How do I view current service usage?

If you have existing services and want to view your current usage, you
can perform the following steps:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com).
2. In the upper-right corner of the page, click **Billing**.

   You are redirected to the **Billing Overview** dashboard, which displays
   information about billing, payments, and usage.

#### How do I update my credit card information?

Follow these steps to update your credit card information:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the upper-right corner of the page, click **Billing**.
3.  In the top navigation bar, click **Payment Methods > Manage Payment
    Methods**.
4.  Add a new card or designate a new default payment method, as needed.

#### How do I change my billing address?

Follow these steps to change your billing address:

1.  Log in to the [Cloud Control Panel](https://login.rackspace.com).
2.  In the upper-right corner of the page, click **Billing**.
3.  Click the **Billing Settings** tab.
4.  Click the pencil icon next to **Billing Address** to edit the address.

#### What are the separate charges and minimums that are applied to Cloud Servers pricing?

The listed prices for Cloud Servers include both *raw
infrastructure* and *managed service* charges. The price is split to
show what you are paying for when you partner with us.

-   The raw infrastructure price can be contrasted with what other
    hosting companies charge for a cloud server. It covers the
    infrastructure of the hosted server.
-   The managed service price applies to the support
    that we offer on top of our infrastructure. This *Service Level
    Rate* varies based on the service level that you choose for your
    cloud account.

The Service Level Rate *minimums* are based on the service level that you
choose for your cloud account. The minimums represent the minimum
monthly charge for the service. If the cost of the resources that you use in
a month exceeds the minimum, the Service Level Rate minimum does
not apply. If your costs for a month are less than the minimum, the
difference between your usage costs and the Service Level Rate minimum
are added to your bill.

#### Why am I being billed for a service when I'm not using it?

Billing begins the moment that you provision a service or server on your
account. You are charged for servers, load balancers, and services as long as
those resources remain allocated to your account, even if they are not in use
or are disabled. This is because we have allocated resources for your
exclusive use that cannot be reserved by other customers.

After you delete the server, load balancer, or service from your
account, its resources are available for someone else to use, and you are no
longer billed for them.

Follow the process outlined in the [Cloud Control
Panel](https://login.rackspace.com) to delete your cloud servers and services. To cancel Rackspace support for Azure,
create a ticket for our Billing team.

#### Am I still charged if my servers are suspended?

According to the Rackspace [Cloud Terms of
Service](https://www.rackspace.com/information/legal/cloud/tos), "If the
suspension was based on your breach of your obligations under the Agreement,
then we may continue to charge you the fees for the Services during the
suspension."

#### Am I still charged if my server goes down?

The Rackspace [Cloud Terms of
Service](https://www.rackspace.com/information/legal/cloud/tos) explains
when customers are entitled to credits.

#### I don't agree with my bill. How can I dispute a charge?

You can create a ticket via the [Cloud Control
Panel](https://login.rackspace.com/) with the details of your dispute. One of
our account managers will review the ticket. A credit is granted only if there
is an error related to our billing system or there is a service error
according to your service level agreement (SLA).

### Access control

#### What is the cost to opt in to RBAC?

RBAC is a no-cost feature that is available to selected public cloud services
with an API.

#### Can a customer opt out of RBAC?

Customers can opt out by simply removing the account users.

#### Is RBAC available internationally?

Yes, RBAC is available to all Rackspace customers.

#### When I add a user login to an existing contact, can I configure custom role assignments?

Yes, you can. For instructions, see [Use Role-Based Access Control
(RBAC)](/how-to/managing-role-based-access-control-rbac).

#### How do I query the capability of a given user?

You can query the roles for a given user by using the [List global roles assigned to a user](https://developer.rackspace.com/docs/cloud-identity/v2/api-reference/role-operations/#list-global-roles-assigned-to-a-user) API operation described in the *Identity API Guide*. Additionally, you can view the roles that a user has through the [Cloud Control Panel](http://login.rackspace.com).

#### Can I view multiple accounts in the Cloud Control Panel?

You can view only one account at a time in the Cloud Control Panel.

#### Can Rackspace display usage per billing or per user?

Per-billing and per-user usage are not offered at this time.

#### Which users can create support tickets?

All users can create support tickets. However, only the account owner is
updated on the ticket status.

#### Can I delegate all functionality as an account owner?

Not at this time, but we are working on developing and delivering that
functionality.

#### Does RBAC provide fine-grained access control for specific servers, directories, or files?

RBAC is limited to granting a user access to a given product. RBAC is
not granular enough to restrict access to individual servers, files, or
directories.

#### Does the API offer more features for RBAC than the Cloud Control Panel offers?

Yes, at this time more features are available through the API. For more
information about using the API for RBAC, see the [Rackspace API Documentation](https://developer.rackspace.com/docs/).

#### Do account users automatically inherit the RackConnect and Managed Cloud features?

Yes.

#### How does RBAC work with MyRackspace?

With RBAC, account owners can leave permissions as
they are in MyRackspace or set up restricted access to specific products
for users through the Cloud Control Panel. For more detailed information,
see [Learn about Role-Based Access Control (RBAC)](/how-to/overview-role-based-access-control-rbac/).

#### Can I link dedicated, hybrid, and cloud permissions?

You cannot link these permissions at this time. Having a common
permission scheme among dedicated, hybrid, and cloud customers will be
addressed in the future.

#### Are servers, containers, files, databases, and load balancers shared, or do users each have their own set of resources?

All resources for an account are shared across users that have the
correct roles. In other words, account users do not have their own set
of resources but share a pool of resources that other users of the
account might have access to.

#### Where can I view the pop-up window that appeared when I initially enabled RBAC?

Following is the initial pop-up window that appears when you enable RBAC.

[<img src="{% asset_path general/faq-role-based-access-control-rbac/RBAC%20Initial%20PDF_0.png %}" width="526" height="378" />](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/RBAC%20Initial%20PDF_0.png)

For information about additional products that will be RBAC-enabled in
the future, see [Learn about Role Based Access Control (RBAC)](/how-to/overview-role-based-access-control-rbac).

For information about changing your admin credentials, see [Use Role-Based Access Control (RBAC)](/how-to/managing-role-based-access-control-rbac).

For access to the Cloud Control Panel, log in at [https://login.rackspace.com/](https://login.rackspace.com/).
