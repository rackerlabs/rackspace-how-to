---
permalink: spam-filtering/
audit_date: '2017-06-05'
title: Spam filtering
type: article
created_date: '2017-05-24'
created_by: William Loy
last_modified_date: '2017-05-25'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains the spam filtering system, used in Rackspace Cloud Office.

### Prerequisite

**Applies to:** Administrators

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Spam filtering system

Over 95 percent of all email traffic on the Internet is spam. Spammers have grown increasingly sophisticated, using innovative methods to trick spam filters and penetrate email inboxes. Rackspace uses the following robust filtering system to protect your users from spam:

1. **Gateway scan**: As soon as an email arrives, our gateway servers try to match the sending IP address to an aggregated blacklist compiled from multiple spammer tracking systems. The servers analyze the email message in comparison to other arriving mail, and block the message if the following conditions exist:

   - A large number of emails arrive simultaneously from a single IP address.
   - A large number of emails are addressed to users that do not exist in our system.
   - The sending address is from a domain in our system but the mailbox does not exist.

2. **Cloudmark® scan**: We scan all email with the industry-leading Cloudmark spam detection software. Cloudmark uses Advanced Message Fingerprinting to detect viruses, spam, and phishing. Advanced Message Fingerprinting uses algorithms that detect spam across all languages and character formats. These algorithms update every 60 seconds based on worldwide feedback loops and the latest spam tactics.

3. **Message Sniffer scan**: We scan email with Message Sniffer from ARM Research Labs. Message Sniffer relies on pattern recognition and machine learning technology to detect spam and malware. It searches the entire message for spam and malware features, including unusual headers, message source behaviors, structural artifacts, obfuscation techniques, binary and image signatures, email and URL targets, unusual code fragments, and even coding styles.

The filtering system does not apply only to the “sophisticated spammer”. This system scans all incoming and outgoing mail traffic regardless of sender or intent.  Our filters will flag only message content that has been deemed as spam by the whole of the internet community.

#### Outbound messages

Filtering outbound email protects deliverability for all users on the Rackspace Cloud Office environment.
Spam definitions change rapidly, but you can follow certain practices to prevent your message from becoming spam:

- When sending transactional, promotional, or marketing emails see [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients/).

- If your personal emails to friends and business partners are flagged as spam see [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/).

- Ask your frequent recipients to add your domain to their safelist or whitelist to ensure your messages are delivered to their inboxes. For more information, see [Manage Safelists at Rackspace Cloud Office](/how-to/spam-preferences-safe-lists-and-black-list-in-rackspace-email/#manage-safelists).

**Note:** Outbound messages are likely being scanned by the recipient's mail provider. Each provider has its own policies for flagging and filtering spam.

#### Inbound messages

When a legitimate message is flagged as spam, follow these recommendations:

- Always “unflag” or mark legitimate messages  as “Not Spam.” This is the most effective method for improving the reputation of the sender and is a long-term solution.

- Advise the sender that they are being flagged as spam and provide them with [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/).

- Add the sender to your safelist. See [Manage Safelists at Rackspace Cloud Office](/how-to/spam-preferences-safe-lists-and-black-list-in-rackspace-email/#manage-safelists).

   **Note:** Safelisting ensures that the messages from the sender are delivered to your inbox, but it does not remove a spam flag from a message.

**Warning:** Rackspace Cloud Office does not forward any message that is flagged as spam, regardless of whether it is safelisted. If the message is sent to an Alias, Contact, Group List, or Distribution List, it is considered to be forwarded and is not delivered if the message is flagged as spam.

### References

- [Acceptable Use Policy](https://www.rackspace.com/information/legal/aup?_ga=2.75345873.298003222.1495221511-62538955.1439921553)
- [Rackspace Cloud Office Mail Terms](https://www.rackspace.com/information/legal/mailterms)
