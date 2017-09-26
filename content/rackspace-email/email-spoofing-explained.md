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

### Email Spoofing

The word “spoof” means “falsified”. A spoofed email is when the sender purposely alters parts of the email to masquerade as though it was authored by someone else. Commonly, the sender’s name/address and the body of the message are formatted to appear from a legitimate source, as though the email came from a bank or a newspaper or legitimate company on the Web. Sometimes, the spoofer will make the email appear to come from a private citizen somewhere.
In many cases, the spoofed email is part of a phishing (scam) attack. In other cases, a spoofed email is used to dishonestly market an online service or sell you a bogus product like scareware, which are fake programs they make you think you need or is missing from your computer.
Email spoofing is forging an email header to make it look like it came from somewhere or someone other than the actual source. It is often an attempt to trick the recipient into making a damaging statement or releasing sensitive information, such as passwords.
If you're receiving bounced (returned) emails for messages that you never sent and that use as the return address your domain and addresses you never created, then this could be a case of spoofing.

### User education

It is vital that users understand that emails that appear to be sent from co-workers, can possibly be forged emails. This is the case w


Dishonest users will alter different sections of an email so as to disguise the sender as being someone else. Examples of properties that are spoofed:

FROM name/address
REPLY-TO name/address
RETURN-PATH address
SOURCE IP address or “X-ORIGIN” address

These first three properties can be easily altered by using settings in your Microsoft Outlook, Gmail, Hotmail, or other email software. The fourth property above, IP address, can also be altered, but usually requires more sophisticated user knowledge to make a false IP address convincing.

Spoofing is possibly the most frustrating abuse issue to deal with, simply because it cannot be stopped. Spoofing is similar to hand-writing many letters, and signing someone else's name to it. You can imagine how difficult that would be to trace.

One way you can help combat spoofing and put a little more protection to your domain is adding what is called an SPF record to your DNS. Your IT personnel should already know how to set this up, and if you contact Support, we can also get you pointed in the right direction, or setup if you manage your DNS with us.

For more information on how to setup an SPF record, you can check here:
