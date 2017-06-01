---
permalink: spam-filtering
audit_date:
title: Spam Filtering
type: article
created_date: '2017-05-24'
created_by: William Loy
last_modified_date: '2017-05-25'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains our spam filtering systems.

### Prerequisites
**Applies to:** - Administrators



### Spam Filtering
Today, over 95% of all e-mail traffic on the Internet is spam. Spammers have grown increasingly sophisticated, using innovative methods to trick spam filters and penetrate email inboxes. To prevent harm coming to your users, we utilize a robust filtering system.


1.	Gateway Scan: As soon as an email arrives, our gateway servers try to match the sending IP address to an aggregated blacklist compiled from multiple spammer tracking systems. The servers analyze the email message in comparison to other arriving mail. If a large number of emails arrive simultaneously from a single IP, or are addressed to users that do not exist in our system, it could signify a spam attack, and the servers block the offending email. If the sending address is from a domain in our system but the mailbox does not exist, the servers block the email.
2.	Cloudmark® Scan: We scan all email with Cloudmark's industry-leading spam detection software. Cloudmark uses Advanced Message Fingerprinting™ to detect viruses, spam, and phishing. Advanced Message Fingerprinting uses algorithms that detect spam across all languages and character formats. These algorithms update every 60 seconds based on worldwide feedback loops and the latest spam tactics.
3.	Message Sniffer Scan: We scan email with Message Sniffer from ARM Research Labs. Message Sniffer relies on pattern recognition and machine learning technology to detect spam and malware. It searches the entire message for spam and malware features, including unusual headers, message source behaviors, structural artifacts, obfuscation techniques, binary and image signatures, email and URL targets, unusual code fragments, and even coding styles.


The filtering system does not only apply to the “sophisticated spammer”. This system scans all incoming and outgoing mail traffic regardless of sender or intent.  Our filters will only flag message content that has been deemed as spam by the whole of the internet community.

#### Outbound messages
Filtering outbound email protects deliverability for all users on the Rackspace Cloud Office environment.
Spam definitions change rapidly. However, there are measures you can take to prevent your message from becoming spam:

- For sending transactional, promotional, or marketing emails see [Best practices for sending emails to many recipients](/how-to/best-practices-for-sending-emails-to-many-recipients/).
- If your personal emails to friends and business partners are flagged as spam see [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/).
- Ask your frequent recipients to add your domain to their Safelist or Whitelist to ensure your messages are delivered to their Inbox. [Manage Safelists at Rackspace Cloud Office](/how-to/spam-preferences-safe-lists-and-black-list-in-rackspace-email/#manage-safelists)

*Note: Outbound messages are likely being scanned by the recipient's mail provider. Each provider has their own policies for flagging and filtering spam.*


#### Inbound Messages
Follow these recommendations when a legitimate message is flagged as spam:

- Always “unflag” or mark legitimate messages  as “Not Spam”. This is the most effective method for improving the spam reputation of the sender and is a long term solution.
- Advise the sender that they are being flagged as spam and provide them with [Best practices for sending person to person email](/how-to/best-practices-for-sending-person-to-person-email/)
- Add the sender to your Safelist. See [Manage Safelists at Rackspace Cloud Office](/how-to/spam-preferences-safe-lists-and-black-list-in-rackspace-email/#manage-safelists).

    *Note: Safelisting does not remove a spam flag from a message. It ensures the message will be delivered to your Inbox.*


    *Warning: Rackspace Cloud Office will not forward any message that is flagged as spam, regardless of it is Safelisted. If the message is sent to an Alias, Contact, Group List, or Distribution List, it is considered to be forwarded and will not deliver if the message is flagged as spam.*



#### References
- [Acceptable Use Policy](https://www.rackspace.com/information/legal/aup?_ga=2.75345873.298003222.1495221511-62538955.1439921553)
- [Rackspace Cloud Office Mail Terms](https://www.rackspace.com/information/legal/mailterms)
