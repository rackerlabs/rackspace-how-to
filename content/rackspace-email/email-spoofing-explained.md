---
permalink: email-spoofing-explained/
audit_date:
title: Email spoofing explained
type: article
created_date: '2017-09-25'
created_by: William Loy
last_modified_date: '2017-09-25'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains what email spoofing is, and steps you can take to combat the practice.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Easy
- **Time needed:** Approximately 15 minutes
- **Tools required:**  Cloud Office Control Panel access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### What is email spoofing?

The word **spoof** means **falsified**. A spoofed email is when the sender purposely alters parts of the email to make the message appear as though it was authored by someone else. Commonly, the sender’s name/address and the body of the message are formatted to appear from a legitimate source. Sometimes, the spoofer will make the email appear to come from a private citizen somewhere.

A spoofed message can appear to be sent from a coworker, a bank, a family member or any number of seemingly trustworthy sources. A good spoof will look like any other email that you would normally receive.

### Why do people spoof email?

In many cases, the spoofed email is part of a **phishing** (scam) attack. In other cases, a spoofed email is used to dishonestly market an online service or sell you a bogus product. The intent is to trick the recipient into making a damaging statement or releasing sensitive information, such as passwords. If you're receiving bounced (returned) emails for messages that you never sent, this could be a case of spoofing.

### Identify a spoofed message

It is vital that users understand that emails that appear to be sent from co-workers, can possibly be forged emails. This is the case w

Scammers will alter different sections of an email to disguise who the *actual* sender of the message is. To identify the following examples you will need to open the **email headers** of a message you suspect has been spoofed. Examples of properties that are spoofed:

**FROM** boss@companyexample.com(This will appear to come from a legitimate source on any spoofed message)
**REPLY-TO** This can also be spoofed, but a lazy scammer will leave the actual **REPLY-TO** address. If you see a different sending address here, the email may have been spoofed.
**RETURN-PATH** This can also be spoofed, but a lazy scammer will leave the actual **RETURN-PATH** address. If you see a different sending address here, the email may have been spoofed.
**SOURCE IP** address or “X-ORIGIN” address. This is typically more difficult to alter but it is possible.

These first three properties can be easily altered by using settings in your Microsoft Outlook, Gmail, Hotmail, or other email software. The fourth property above, IP address, can also be altered, but usually requires more sophisticated user knowledge to make a false IP address convincing.

    <img src="{% asset_path rackspace-email/adding-a-rackspace-email-group-list/group_lists_CP1.png %}" />

In this example, it appears that the recipient has received a message from their office assistant, requesting money. The **subject** line should alert you immediately. This user should contact their assistant through another form of communication to confirm that they did not send this message. Next, you will want to discover who actually sent the message by opening the message headers.

    <img src="{% asset_path rackspace-email/adding-a-rackspace-email-group-list/group_lists_CP1.png %}" />

In this message header snippet, we see that the **From:** field shows the message being sent from **"Assistant"<assistant@yourdomainexample.com>**. However, we can also see that the **REPLY-TO:** field lists *spoofer@scam.com*. That is a clear cut example of a spoofed message. You will want Blacklist any address you find in the **REPLY-TO**, **RETURN-PATH**, and **SOURCE IP** field that is not an address/IP you normally receive mail from.

### Combat spoofing

Spoofing is possibly the most frustrating abuse issue to deal with, simply because it cannot be stopped. Spoofing is similar to hand-writing many letters, and signing someone else's name to it. You can imagine how difficult that would be to trace which is why educating your users is so important.

One way you can help combat spoofing and put a little more protection to your domain is adding what is called an SPF record to your DNS. Your IT personnel should already know how to set this up, and if you contact Support, we can also get you pointed in the right direction, or setup if you manage your DNS with us.

For more information on how to setup an SPF record, you can check here:
