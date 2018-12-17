---
permalink: best-practices-for-sending-emails-to-many-recipients/
audit_date: '2017-05-30'
title: Best practices for sending emails to many recipients
type: article
created_date: '2015-12-22'
created_by: Beau Bailey
last_modified_date: '2017-05-30'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article provides best practices for sending legitimate email to many recipients through the Rackspace mail system.

If you have received a bounce message when sending an email, see our list of [common email bounce messages](/how-to/common-email-bounces/) for more information.

### Prerequisite

- **Applies to:** Administrators and Users

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Best practices

For a video tutorial see [Rackspace Email - Spam Flags: Best Sending Practices](https://emailhelp.rackspace.com/l/spam-overview).

Sending email to many recipients is a common practice of spammers. As a result, most email providers have strict rules regarding email content sent to many recipients. It is difficult to distinguish your email from typical mass marketing, newsletter, and other unsolicited mass email content.

To ensure that your emails reach their destination, we recommend that you use the following practices.

#### Bulk email

Rackspace Cloud Office does not offer bulk email services. To ensure that your bulk emails are not blocked, use a reputable bulk email service to send out your content. Reputable email service providers deliver your bulk email in a way that mail providers accept it as good mail. Following are examples of reputable email service providers:

- [MailChimp](https://mailchimp.com/) and [Marketo](https://www.marketo.com/) for marketing, advertising, or promotional emails
- [MailGun](https://www.mailgun.com/) and [SendGrid](https://sendgrid.com/) for transactional emails

**Note**: If you use Rackspace Email to send emails to a large number of recipients, respect the mail requirements listed in our [Acceptable Use Policy](https://www.rackspace.com/information/legal/aup).

#### Recipients

Ensure that your recipient lists are current and accurate. Sending emails to a large number of invalid recipients is a clear indicator of spam. Also, mail providers and ISPs can use common invalid addresses as spam traps. Sending mail to these spam traps can result in your domain being blacklisted.

Use confirmed opt-in practices when collecting email addresses for mailing lists. Doing so reduces the chances of your messages being considered unsolicited. Unsolicited email is more likely to be marked as spam by recipients, which leads to the sender being flagged as a spammer by content filters.

If you send email newsletters or communications to your customers, give them a way to remove themselves from your mailing list. Typically you can do this by providing an unsubscribe link in the message or with reply-to instructions. This is required by law.

#### Reputation

Maintain a safe and reputable business website that includes easy access to any privacy policies and contact information for your business. Spam filter providers often audit high-volume senders by visiting their websites, which can be a factor in determining whether you are a spammer.

If you allow other companies to include references to your business, ensure that they are reputable. If they send out spam and your company information is referenced in those emails, your domain could be flagged as being related to spam.

#### Message content

We recommend that you follow our person-to-person best practices when creating message content. For more information, see [Best practices for sending person-to-person email](/how-to/best-practices-for-sending-person-to-person-email).

**Note:** Rackspace strives to maintain the best possible reputation with other mail providers and the email industry. Our Anti-Abuse and Acceptable Use teams work diligently to protect our users from abusive email. An important part of helping us maintain our reputation is helping you send good email.

### References

- [Rackspace Acceptable Use Policy](https://www.rackspace.com/information/legal/aup), specifically the Mail Requirements section
- [Rackspace Cloud Office Mail Terms](https://www.rackspace.com/information/legal/mailterms)
