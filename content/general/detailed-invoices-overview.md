---
node_id: 4813
title: Detailed Invoices Overview
type: article
created_date: '2015-09-17'
created_by: Nate Archer
last_modified_date: '2016-01-15'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

**Note:** The *detailed invoice* feature is currently in Alpha release.
To give feedback, go to [Rackspace Product Feedback](http://feedback.rackspace.com/forums/258797-mycloud-cloud-control-panel/category/86622-billing).

*Detailed invoices* give you access to an itemized, per-service,
per-device overview of your billing charges.

### Open a detailed invoice

1.  Log in to the Cloud Control Panel.
2.  In the upper-right corner of the page, click **Account: *your
    Username* > Billing and Payments.**
3.  Under Billing History, click the ID number of the invoice that you
    want to view.
    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/billinghistory.png" width="600" />

4.  Under Invoice Summary, click **Detailed View of Charges**.
    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/invoicesummary.png" width="600" />

    A separate window opens and displays your detailed invoices. The
    invoice can take up to 1 minute to load.

    Once loaded, the invoice should look as follows:
    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/detailedinvoice.png" width="600" />

### Detailed invoice features

*Detailed invoices* are formatted similarly to a regular invoice, with
one exception. Each service (for example, Cloud Servers) has a
collapsible list of detailed line items. Detailed line items show the
devices that use the service, indicated by the name given to the device
when it was created.

To expand the list, click the arrow next to the service.

  <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/detailedinvoiceexpand.png" width="600" />

When a service's list is expanded, each item contains at least two
lines. The first line indicates the total charges for the device. Any
line under the first indicates an itemized price based on how the device
was used.

For example, in the Cloud Servers list, the cost for the server named
LinuxTEST is calculated from two items: Legacy Server Uptime and Legacy
Server IP. The number in the first line is the sum of the two items
under it.

 <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/linuxtest.png" width="600" />

If you want details about how a device's use charge was calculated,
place your cursor over the charge. A pop-up box appears next to the
cursor with the equation used to calculate the charge.

 <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/linuxequation.png" width="600" />

Lastly, at the top of the invoice is a collapsible list called
**Account**. Account-level charges are the charges that are not specific
to an individual device. This includes service specific charges such as
bandwidth charges.

**Note:** Although their format is similar, detailed invoices are
displayed differently than the CSV format of invoices. The CSV format
lists detailed line items specific to the *service*, even if that item
is not *device* specific. If you cannot find a detailed line item
associated with a service that was listed in the CSV format, look under
**Account** in your detailed invoice.
