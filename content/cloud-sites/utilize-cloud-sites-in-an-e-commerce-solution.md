---
permalink: utilize-cloud-sites-in-an-e-commerce-solution/
audit_date:
title: Utilize Cloud Sites in an E-commerce Solution
type: article
created_date: '2011-08-10'
created_by: Rackspace Support
last_modified_date: '2016-01-12'
last_modified_by: Stephanie Fillmon
product: Cloud Sites
product_url: cloud-sites
---

### Building an e-commerce solution using Cloud Sites

Cloud Sites is designed to provide an elastic web-hosting environment.
This capability can allow an e-commerce merchant to properly handle the
high-volume shopping season without carrying extra infrastructure
throughout the remainder of the year.  Cloud Sites is not currently
designed for the storage or archival of any credit card related
information, all credit card information must be handled on the payment
gateway.

<img src="{% asset_path cloud-sites/utilize-cloud-sites-in-an-e-commerce-solution/sitesecommerce.png %}" alt="" />

In the Cloud Sites infrastructure you can have the entire e-commerce
environment up until the point the customer provides credit card
information during check out.  When the shopper has a cart and clicks
"purchase" utilizing the API with your payment gateway partner you'll
provide a transaction ID and a dollar amount to authorize.

The customer will then connect directly to the Card Processing System on
a new session and input their payment information.

After the Card Processing System validates the transaction it will
return an authorized/failed message.  The failure messages can contain
details such as:  insufficient funds, invalid card number, failed to
complete transaction.  The communication from the Card Processing System
to the Web Front End can never contain cardholder data.  

**Note:** Cardholder data includes: primary account number, expiration date, name as it
appears on the card, CVV, CVV2, and magnetic stripe information.  In
other words, all credit card related information must be handled by the
gateway and not handled by or stored on Cloud Sites.

The Web Application Database can store information to uniquely identify
the transaction with the Payment Processing System such as:  transaction
ID, customer name, dollar amount of the transaction, date/time of
transaction, return status of the payment request.

Following is an example proves flow that shows where the hand-off occurs
between the e-commerce site and the payment gateway provider:

<img src="{% asset_path cloud-sites/utilize-cloud-sites-in-an-e-commerce-solution/sampleconfig.png %}" alt="" />

### Cloud Sites vulnerability scan policy

Since Cloud Sites is designed to be a multi-tenant cloud hosting
solution, scans for PCI compliance or vulnerability are not allowed per
the Cloud Sites acceptable use policy.

<http://www.rackspace.com/cloud/legal/aup/>
