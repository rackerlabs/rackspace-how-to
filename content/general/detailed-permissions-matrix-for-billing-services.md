---
node_id: 3693
title: Detailed Permissions Matrix for Billing Services
type: article
created_date: '2013-09-19'
created_by: Renee Rendon
last_modified_date: '2016-01-15'
last_modified_by: Rose Contreras
product: undefined
product_url: undefined
---

The following permissions matrix displays specific capabilities for the roles in Billing and Payment Services.

[Related Rackspace How-To Articles](/how-to/billing-services-overview)

### As of April 8, 2014

Capability | Role | Description
:---: | :---: | :---:
**BILLING SERVICES** |
List Account Balance | **Observer & Admin** | Returns the balance for the current account.
List Billing Summary | **Observer & Admin** | Returns the billing summary for the current account.
List Account Currency | **Observer & Admin** | Returns the currency for the current account.
List Account Billing Cycle | **Observer & Admin** | Returns the billing cycle for the current account.
List Current Invoice | **Observer & Admin** | Returns the invoice for the current account. Returns response in PDF format.
List Invoice by ID | **Observer & Admin** | Returns a specific invoice. Returns response in PDF format.
List Invoice Payments | **Observer & Admin** | Returns a list of payments related to an invoice.
List Account Payment by ID | **Observer & Admin** | Lists a specific payment.
List Payment Invoices | **Observer & Admin** | Returns a list of invoices related to a payment.
List Refund by ID | **Observer & Admin** | Lists a specific refund
List Account VAT | **Observer & Admin** |Returns the Value Added Tax (VAT) code for the current account.
List Billing Periods | **Observer & Admin** | Returns a list of billing periods.
List Estimated Charges | **Observer & Admin** | Returns list of summarized estimated charge for a specific billing period.
List Subscriptions | **Observer & Admin** | Returns a list of Subscriptions for the account.
List Contract Entity | **Observer & Admin** | Retrieves a Rackspace Contract Entity for a billing account.
Create Payment | **Admin only** | Submits a payment for the balance owed by an account.
Update Account VAT | **Admin only** | Updates the Value Added Tax (VAT) code for the account.
Create Account VAT | **Admin only** | Creates a Value Added Tax (VAT) code for the current account.</span></td>
Delete Account VAT | **Admin only** | Deletes the Value Added Tax (VAT) code for a current account.
**PAYMENT SERVICES** |
Get Payment Method | **Observer & Admin** | Returns the payment method for the current account.
Get Payment Methods | **Observer & Admin** | Returns a list of payment methods for the current account.
Get Default Payment Method | **Observer & Admin** | Returns the default payment method for the current account.
Create Payment Method | **Admin only** | Creates a payment method for the current account.
Set Default Payment Method | **Admin only** | Sets the default payment method for the current account.
Delete Default Payment Method | **Admin only** | Deletes the default payment method for the current account.
Get Supported Methods | **Observer & Admin** | Lists the supported method of payments.

**Note:** RBAC is enabled for Billing Services Level (BSL) and Payment Services Level only through the Cloud Control Panel. API access for BSL and PSL is not provided at this time.

### Related articles

-  [Billing services overview](/how-to/billing-services-overview)
-  [Permission Matrices for RBAC](/how-to/permissions-matrix-for-role-based-access-control-rbac)
