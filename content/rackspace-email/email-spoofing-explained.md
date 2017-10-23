---
permalink: email-spoofing-explained/
audit_date:
title: Email spoofing explained
type: article
created_date: '2017-09-25'
created_by: William Loy
last_modified_date: '2017-10-23'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains what email spoofing is, and steps you can take to combat the practice.

### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Moderate
- **Time needed:** Approximately 15 minutes
- **Tools required:**  Email access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### What is email spoofing?

The word **spoof** means **falsified**. A spoofed email is when the sender purposely alters parts of the email to make the message appear as though it was authored by someone else. Commonly, the sender’s name/address and the body of the message are formatted to appear from a legitimate source. Sometimes, the spoofer will make the email appear to come from a private citizen somewhere.

If you would prefer a video tutorial see [Rackspace Email - Spoofing: How to identify & protect your organization <img src="{% asset_path rackspace-email/email-spoofing-explained/video_spoofing.png %}" /> ](https://emailhelp.rackspace.com/l/how-to-prevent-email-spoofing).

A spoofed message can appear to be sent from a coworker, a bank, a family member or any number of seemingly trustworthy sources. A good spoof will look like any other email that you would normally receive.

**Warning:** If you suspect you have received a fraudulent message **DO NOT** click any link in the message or enter any information that is requested.

### Why do people spoof email?

In many cases, the spoofed email is part of a **phishing** (scam) attack. In other cases, a spoofed email is used to dishonestly market an online service or sell you a bogus product. The intent is to trick the recipient into making a damaging statement or releasing sensitive information, such as passwords. If you're receiving bounced (returned) emails for messages that you never sent, this could be a case of spoofing.

### Identify a spoofed message

Scammers will alter different sections of an email to disguise who the *actual* sender of the message is. To identify the following examples you will need to open the **email headers** of a message you suspect has been spoofed. Examples of properties that are spoofed:

**FROM** boss@companyexample.com(This will appear to come from a legitimate source on any spoofed message)

**REPLY-TO** This can also be spoofed, but a lazy scammer will leave the actual **REPLY-TO** address. If you see a different sending address here, the email may have been spoofed.

**RETURN-PATH** This can also be spoofed, but a lazy scammer will leave the actual **RETURN-PATH** address. If you see a different sending address here, the email may have been spoofed.

**SOURCE IP** address or “X-ORIGIN” address. This is typically more difficult to alter but it is possible.

These first three properties can be easily altered by using settings in your Microsoft Outlook, Gmail, Hotmail, or other email software. The fourth property above, IP address, can also be altered, but usually requires more sophisticated user knowledge to make a false IP address convincing.

    <img src="{% asset_path rackspace-email/email-spoofing-explained/from_assistant.png %}" />

In this example, it appears that the recipient has received a message from their office assistant, requesting money. The **subject** line should alert you immediately. This user should contact their assistant through another form of communication to confirm that they did not send this message. Next, you will want to discover who actually sent the message by opening the message headers.

    <img src="{% asset_path rackspace-email/email-spoofing-explained/reply_to.png %}" />

In this message header snippet, we see that the **From:** field shows the message being sent from **"Assistant"<assistant@yourdomainexample.com>**. However, we can also see that the **REPLY-TO:** field lists *spoofer@scam.com*. That is a clear cut example of a spoofed message. You will want to Blacklist any address you find in the **REPLY-TO**, **RETURN-PATH**, and **SOURCE IP** field that is not an address/IP you normally receive mail from. For more information on viewing and understanding email headers, please see [View and read Rackspace email headers](/how-to/view-and-read-rackspace-email-headers).

### Combat spoofing

User education is the first line of defense against these types of attacks. If a user receives a spoofed message:

 - Blacklist any address/IP listed in the **REPLY-TO**, **RETURN-PATH**, or **SOURCE IP** that you have determined to be fraudulent. See [Blacklist addresses, domains, and IPs in Rackspace Email webmail](/how-to/blacklist-addresses-domains-and-ips-in-rackspace-email-webmail/) for instructions.
 - Immediately [change the password of your email account](/how-to/change-rackspace-email-mailbox-password) if you or your users provided that information at any point.
 - Alert the rest of your business to the situation.

Spoofing is possibly the most frustrating abuse issue to deal with, simply because it cannot be stopped. Spoofing is similar to hand-writing many letters, and signing someone else's name to it. You can imagine how difficult that would be to trace.

The most impactful change you can make as an administrator is to implement **SPF**, **DKIM**, and **DMARC** in that order. These are DNS records that add extra layers of protection to prevent malicious email from being sent out using your domain name.

   - **Sender Policy Framework (SPF)** records help recipient mail servers identify unauthorized use of your domain in the form of forgeries (spoofing). [Create an SPF record policy](/how-to/create-an-spf-policy) first.

       Note: If you send email from other providers on behalf of your domain, be sure to include their sending servers in the same SPF record entry. Do not create multiple SPF records.

   - **DomainKeys Identified Mail (DKIM)** records assign a digital signature to mail sent from your domain, marking it as authorized mail sent from your domain. If you require instruction to enable DKIM for your  Rackspace Cloud Office email, see Enable DKIM in the Cloud Office Control Panel. [Creating a DKIM record](/how-to/enable-dkim-in-the-cloud-office-control-panel) will be the second step in the process.

   - **Domain Message Authentication Reporting and Compliance (DMARC)** records indicate to recipient mail servers that messages sent from that domain are employing DKIM and SPF sending policies. The recipient mail server then validates the message that you sent by using your DKIM and SPF policies. [Creating a DMARC record policy](/how-to/create-a-dmarc-policy) will allow you to enforce DKIM and SPF.

Putting these records in place will protect the integrity of internal emails, as well as protect the external reputation of your domain. Implementing this protection is a multi-step process that must be carefully followed. Please see [Create a DMARC policy](/how-to/create-a-dmarc-policy) for further instruction.


### References

[Change a Rackspace email mailbox password](/how-to/change-rackspace-email-mailbox-password)
[Cloud Office support terminology](/how-to/cloud-office-support-terminology)
[Create a DMARC policy](/how-to/create-a-dmarc-policy)
[View and read Rackspace email headers](/how-to/view-and-read-rackspace-email-headers)
