---
permalink: email-spoofing-best-practices-exchange-for-exchange-users/
audit_date:
title: Email spoofing best practices for Exchange users
type: article
created_date: '2017-12-22'
created_by: William Loy
last_modified_date: '2018-01-12'
last_modified_by: William Loy
product: Microsoft Exchange
product_url: exchange
---

This article explains email spoofing and describes the steps that you can take to combat it.

### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Moderate
- **Time needed:** Approximately 15 minutes
- **Tools required:**  Email access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

If you would prefer a video tutorial, see [Exchange - Spoofing: How to identify & protect your organization](https://emailhelp.rackspace.com/l/how-to-prevent-email-spoofing).

### What is email spoofing?

The word **spoof** means **falsified**. A spoofed email is one in which the sender purposely alters parts of the email to make the message appear as though it was authored by someone else. Commonly, the sender’s name and email address and the body of the message are formatted to appear from a legitimate source. Sometimes the spoofer makes the email appear to come from a private citizen.

A spoofed message can appear to come from a coworker, a bank, a family member, or any number of seemingly trustworthy sources. A good spoof looks like any other email that you normally receive.

**Warning:** If you suspect that you have received a fraudulent message, **DO NOT** click any link in the message or enter any information that is requested.

### Why do people spoof email?

In many cases, the spoofed email is part of a **phishing** (scam) attack. In other cases, a spoofed email is used to dishonestly market an online service or sell you a bogus product. The intent is to trick the recipient into making a damaging statement or releasing sensitive information, such as passwords. If you're receiving bounced (returned) emails for messages that you never sent, this could be a case of spoofing.

### Identify a spoofed message

Scammers alter different sections of an email to disguise the *actual* sender of the message. To view the following properties, you must open the **email headers** of a message that you suspect has been spoofed. Following are some examples of spoofed properties:

- **FROM** (for example, boss@companyexample.com) - This appears to come from a legitimate source on a spoofed message.

- **REPLY-TO** - This can also be spoofed, but a lazy scammer might leave the actual **REPLY-TO** address. If you see a different sending address here, the email might have been spoofed.

- **RETURN-PATH** - This can also be spoofed, but a lazy scammer might leave the actual **RETURN-PATH** address. If you see a different sending address here, the email might have been spoofed.

- **SOURCE IP address or “X-ORIGIN” address** - This is typically more difficult to alter but it is possible.

The first three properties can be easily altered by using settings in your Microsoft Outlook, Gmail, Hotmail, or other email software. The fourth property, IP address, can also be altered, but it usually requires more sophistication to make a false IP address convincing.

In the following example, the recipient appears to have received a message from their office assistant requesting money.

<img src="{% asset_path exchange/email-spoofing-best-practices-exchange-for-exchange-users/from_assistant.png %}" />

The **subject** line should alert you immediately. The recipient should contact their assistant through another form of communication to confirm that they did not send this message. Next, discover who actually sent the message by opening the message headers. They should look similar to the following:

<img src="{% asset_path exchange/email-spoofing-best-practices-exchange-for-exchange-users/reply_to.png %}" />

In this message header snippet, the **From:** field shows the message being sent from **"Assistant"\<assistant@yourdomainexample.com\>**. However, the **REPLY-TO:** field lists *spoofer@scam.com*. That is a clear example of a spoofed message.

You should blacklist any address that you find in the **REPLY-TO**, **RETURN-PATH**, and **SOURCE IP** field that is not an email address or IP address from which you normally receive mail.

For more information on viewing and understanding email headers, see [View and read email headers in Outlook Web App](/how-to/view-and-read-email-headers-in-owa).

### Combat spoofing

User education is the first line of defense against these types of attacks. If a user receives a spoofed message, they should perform the following tasks:

 - Blacklist any email address or IP address listed in the **REPLY-TO**, **RETURN-PATH**, or **SOURCE IP** field that you have determined to be fraudulent. For instructions, see [Block senders in Outlook Web App](/how-to/block-senders-in-owa).
 - Immediately [change the password of your email account](/how-to/change-a-microsoft-exchange-mailbox-password) if you or your users provided that information at any point.
 - Alert the rest of your business to the situation.

Spoofing is possibly the most frustrating abuse issue to deal with, simply because it cannot be stopped. Spoofing is similar to handwriting many letters and signing someone else's name to it. You can imagine how difficult that would be to trace.

The most impactful change you can make as an administrator is to implement **SPF**, **DKIM**, and **DMARC** records, in that order. These are DNS records that add extra layers of protection to prevent malicious email from being sent out with your domain name.

   - **Sender Policy Framework (SPF)** records help recipient mail servers identify unauthorized use of your domain in the form of forgeries (spoofing). [Create an SPF record policy](/how-to/create-an-spf-policy) first.

       **Note:** If you send email from other providers on behalf of your domain, be sure to include their sending servers in the same SPF record entry. Do not create multiple SPF records.

   - **DomainKeys Identified Mail (DKIM)** records assign a digital signature to mail sent from your domain, marking it as authorized mail sent from your domain. If you require instructions to enable DKIM for your Rackspace Cloud Office email, see [Enable DKIM in the Cloud Office Control Panel](/how-to/enable-dkim-in-the-cloud-office-control-panel). Creating a DKIM record is the second step in the process.

   - **Domain Message Authentication Reporting and Compliance (DMARC)** records indicate to recipient mail servers that messages sent from that domain are employing DKIM and SPF sending policies. The recipient mail server then validates the message that you sent by using your DKIM and SPF policies. [Creating a DMARC record policy](/how-to/create-a-dmarc-policy) enables you to enforce DKIM and SPF records. This is the last step in the process.

Using record policies protects the integrity of internal emails, as well as the external reputation of your domain. Implementing this protection is a multi-step process that you must carefully follow. For more information, see [Create a DMARC policy](/how-to/create-a-dmarc-policy).


### References

- [Change a Hosted Exchange mailbox password](/how-to/change-a-microsoft-exchange-mailbox-password)
- [Cloud Office support terminology](/how-to/cloud-office-support-terminology)
- [Create a DMARC policy](/how-to/create-a-dmarc-policy)
- [View and read email headers in Outlook Web App](/how-to/view-and-read-email-headers-in-owa)
