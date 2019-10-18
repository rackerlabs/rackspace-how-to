---
permalink: create-a-dkim-txt-record/
audit_date: '2019-10-18'
title: Create a DKIM TXT record
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2019-10-18'
last_modified_by: Stephanie Fillmon
product: Cloud DNS
product_url: cloud-dns
---

Domain Keys Identified Mail (DKIM) helps you protect your company from
email spamming and phishing attempts. It provides a method for
validating a domain name identity that is associated with a message
through cryptographic authentication.

For a complete description of DKIM, see the link to recommended DKIM sites
in the "External resources" section at the end of this article.

**Note:** The method described in this article differs from the way DKIM is
set up for Rackspace Hosted Email and Exchange customers. If you are a
Rackspace Email, Hosted Exchange, or Office 365 customer, contact the
Rackspace Cloud Office team for help configuring the proper DKIM, DMARC, and
SPF records.

The process of setting up DKIM involves the tasks detailed
in the following steps:

1.  Choose a DKIM selector.

2.  Generate a public-private key pair.

3.  Publish the selector and public key by creating a DKIM TXT record.

4.  Attach the token to each outgoing email.

### What is a DKIM selector?

A selector is specified as an attribute for a DKIM signature and is recorded in the DKIM-Signature header field.

Because DKIM selectors give different DNS query names, the system uses the selector as an additional name component for validation. Under each domain name, there might be one too many unique DKIM DNS records associated with different selectors.

Selectors enable multiple keys under a domain name, which can provide separate signatory controls among departments, date ranges, or third parties acting on behalf of the domain name owner. No two services or products should use the same selector.

A selector can be anything you want, such as a word, number, or a string of letters and numbers.

For example, if you choose `oct2019` for your selector, the domain name would
become `oct2019._domain.example.com`.

### Before you begin

Before you log in to the control panel and create a DKIM record, there are
a couple of things that you need:

1. Choose a simple, user-defined text string to be your DKIM selector. The
   selector is appended to the domain name to help identify the DKIM public
   key. See the previous section for more information about choosing a
   DKIM selector.

2. Generate a public-private key pair by using a tool such as ssh-keygen on
   Linux or PuTTYgen on Windows. For help creating key pairs, see
   [Generate RSA keys with SSH by using PuTTYgen](https://support.rackspace.com/how-to/generating-rsa-keys-with-ssh-puttygen).


### Create a DKIM TXT record

Use the following steps to create a DKIM TXT record in the Cloud Control
Panel:

1. Log in to the [Cloud Control Panel](https://login.rackspace.com/).

2. In the top navigation bar, click **Select a Product > Rackspace Cloud**.

3. Select **Networking > Cloud DNS**.

4. Click the gear icon next to the name of an existing domain and
   select **Add DNS Record**.

5. In the pop-up dialog box, select **TXT Record** as the record type.

6. In the **Hostname** text box, enter the selector text string that you chose
   in Step 1, followed by the literal string `._domainkey`. For example, if you
   use the default as the text string, you enter `default._domainkey` in the
   **Hostname** text box.

7. Expand the **Text** box by dragging the corner, and then enter the
   following information, pasting the public key that you generated in the
   previous section after the `p=` prompt:

       v=DKIM1; p=yourPublicKey

   When you finish, the TXT record looks similar to the following
   example:

   <img src="{% asset_path cloud-dns/create-a-dkim-txt-record/Add%20DKIM%20DNS%20TXT%20Record.png %}" alt="DKIM DNS TXT Record" />

8.  Click **Add Record**.

The DKIM TXT record is added to your domain.

For instructions about attaching the token to your outgoing email, see the
**Specification** section at [DKIMcore.org](http://dkimcore.org/).

### Related articles

- [Create an SPF TXT records](/how-to/create-an-spf-txt-record)

### External resources

- [DKIM.org](http://www.dkim.org)

- [DKIMcore.org](http://dkimcore.org/specification.html)
