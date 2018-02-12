---
permalink: detailed-permissions-matrix-for-billing-services/
audit_date: '2018-02-12'
title: Detailed permissions matrix for billing and payment services
type: article
created_date: '2013-09-19'
created_by: Renee Rendon
last_modified_date: '2018-02-12'
last_modified_by: Kate Dougherty  
product: undefined
product_url: undefined
---

The permissions matrix for billing and payment services displays the specific capabilities for the following roles:

- **Admin** provides full access to create, read, update, and delete.
- **Observer** provides read-only access.

### Billing services

Capability | Role | Description
:---: | :---: | :---:
List account balance | **Observer, Admin** | Returns the balance for the current account.
List billing summary | **Observer, Admin** | Returns the billing summary for the current account.
List account currency | **Observer, Admin** | Returns the currency for the current account.
List account billing cycle | **Observer, Admin** | Returns the billing cycle for the current account.
List current invoice | **Observer, Admin** | Returns the invoice for the current account, in PDF format.
List invoice by ID | **Observer, Admin** | Returns a specific invoice, in PDF format.
List invoice payments | **Observer, Admin** | Returns a list of payments related to an invoice.
List account payment by ID | **Observer, Admin** | Lists a specific payment.
List payment invoices | **Observer, Admin** | Returns a list of invoices related to a payment.
List refund by ID | **Observer, Admin** | Lists a specific refund.
List billing periods | **Observer, Admin** | Returns a list of billing periods.
List estimated charges | **Observer, Admin** | Returns a list of summarized estimated charges for a specific billing period.
List subscriptions | **Observer, Admin** | Returns a list of subscriptions for the account.
List contract entity | **Observer, Admin** | Retrieves a Rackspace Contract Entity for a billing account.
Create payment | **Admin** | Submits a payment for the balance owed by an account.
Update account VAT | **Admin** | Updates the Value Added Tax (VAT) code for the account.
List account VAT | **Observer, Admin** | Returns the Value Added Tax (VAT) code for the current account.
Create account VAT | **Admin** | Creates a Value Added Tax (VAT) code for the current account.
Delete account VAT | **Admin** | Deletes the Value Added Tax (VAT) code for a current account.

### Payment services

Capability | Role | Description
:---: | :---: | :---:
Get payment method | **Observer, Admin** | Returns the payment method for the current account.
Get default payment method | **Observer, Admin** | Returns the default payment method for the current account.
Create payment method | **Admin** | Creates a payment method for the current account.
Set default payment method | **Admin** | Sets the default payment method for the current account.
Delete default payment method | **Admin** | Deletes the default payment method for the current account.

**Note:** Role-Based Access Control (RBAC) is enabled for the billing services level (BSL) and payment services level (PSL) only through the Cloud Control Panel. API access for BSL and PSL is not provided at this time.

### Related articles

-  [Billing services overview](/how-to/billing-services-overview)
-  [Role-Based Access Control (RBAC) permissions matrix for Cloud Hosting](/how-to/permissions-matrix-for-role-based-access-control-rbac)
