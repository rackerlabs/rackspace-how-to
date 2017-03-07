---
permalink: create-a-dkim-txt-record/
audit_date: '2017-03-06'
title: Create a DKIM TXT record
type: article
created_date: '2012-07-24'
created_by: Rackspace Support
last_modified_date: '2017-02-22'
last_modified_by: CarlDRacker
product: Cloud DNS
product_url: cloud-dns
---

Domain Keys Identified Mail (DKIM) helps you protect your company from
email spamming and phishing attempts. It provides a method for
validating a domain name identity that is associated with a message
through cryptographic authentication.

For a complete description of DKIM, see a recommended list of DKIM sites
in the "External resources" section at the end of this article.

**Note:** The method described in this article differs from the way DKIM is set up for
Rackspace Hosted Email and Exchange customers. If you are a Rackspace Email, Hosted
Exchange, or Office 365 customer, contact the Rackspace Cloud Office team for help
configuring the proper DKIM, DMARC, and SPF records.

The process of setting up DKIM involves the following tasks:

1.  Create a selector, which is a simple, user-defined text string. You will associate the selector with a public key in a later step.

2.  Generate a public-private key pair by using a tool such as ssh-keygen on Linux or PuTTYgen on Windows.

3.  Publish the selector and public key by creating a DKIM TXT record. See the following procedure for instructions. 

4.  Attach the token to each outgoing email.


### Create a DKIM TXT record

Before you perform this procedure, choose a text string to use as your selector and
generate a public-private key pair


1.  Log in to the [Cloud Control Panel](https://mycloud.rackspace.com/).

2.  In the top navigation bar, select **Networking > Cloud DNS**.

3.  Click the gear icon next to the name of an existing domain and
    select **Add DNS Record**.
    
4.  In the popup dialog box, select **TXT Record** as the record type.

5.  In the Hostname box, enter the selector text string followed by the literal string `._domainkey`. For example, if you use default as the text string, you would enter `default._domainkey` in the **Hostname** text box. 


6.  Expand the **Text** box by dragging the corner, and then enter the following information, pasting your public key after **`p=`**:

        v=DKIM1; p=yourPublicKey

    When you are finished, the TXT record will look similar to the following example:

    <img src="{% asset_path cloud-dns/create-a-dkim-txt-record/Add%20DKIM%20DNS%20TXT%20Record.png %}" alt="DKIM DNS TXT Record" />

7.  Click **Add Record**.

The DKIM TXT record is added to your domain.

For instructions on attaching the token to your outgoing email, see the "Specification" section at
[DKIMcore.org](http://dkimcore.org/)

### Related articles

[Create an SPF TXT records](/how-to/create-an-spf-txt-record)

### External resources

[DKIM.org](http://www.dkim.org)

[DKIMcore.org](http://dkimcore.org/specification.html)
