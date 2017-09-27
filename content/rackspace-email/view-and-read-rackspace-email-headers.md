---
permalink: view-and-read-rackspace-email-headers/
audit_date:
title: View and read Rackspace Email headers
type: article
created_date: '2017-09-26'
created_by: William Loy
last_modified_date: '2017-09-27'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to view message headers in Rackspace Email webmail.

### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Moderate
- **Time needed:** Approximately 5 minutes
- **Tools required:**  Webmail access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

### Viewing headers in Rackspace Email

1. Log into your mailbox at [apps.rackspace.com](apps.rackspace.com).

2. Select the message that you would like to view the headers for.

3. Select **More** dropdown from the tool bar about the message preview pane and select **View Full Header**.

    <img src="{% asset_path rackspace-email/view-and-read-rackspace-email-headers/view_full_header.png %}" />

4. A box will appears titled **Full Header** containing the full contents of the message header.

    <img src="{% asset_path rackspace-email/view-and-read-rackspace-email-headers/full_header.png %}" />

You have successfully viewed the message headers in Rackspace Email webmail.

### Understanding email headers

Example message header:

```Delivered-To:	boss@yourdomainexample.com
Return-Path:	<spoofer@yourdomainexample.com>
Delivered-To:	boss@yourdomainexample.com
Received:	from sapps.net ([000.00.00.0]) by sapps.net (Dovecot) with LMTP id asdkasdfiwlefj for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from proxy.net ([000.00.00.0]) by sapps.net; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from smtp (000.00.00.0)  by apps.net; Tue, 26 Sep 2017 14:52:41 -0400
Return-Path:	<spoofer@yourdomainexample.com>
X-Originating-Ip:	[00.000.000.00]
Received:	from [000.00.00.0] ([000.00.00.0] server.com) by apps.net; Tue, 26 Sep 2017 14:52:40 -0400
Received:	from server.com (localhost [000.00.00.0]) by server.com for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	from apps.net (sapps.net [000.00.00.0]) by server.com (SMTP Server)  for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
X-Sender-Id:	spoofer@yourdomainexample.com
Received:	from  (apps.net [000.00.00.0]) by 0.0.0.0:00; Tue, 26 Sep 2017 14:52:40 -0400
Received:	from yourdomainexample.com (localhost.localdomain [000.00.00.0]) by apps.net (Postfix) with for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	by apps.rackspace.com (Authenticated sender: spoofer@yourdomainexample.com, from: assistant@yourdomainexample.com) with HTTP; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Date:	Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Subject:	Send $$$
From:	"Assistant" <assistant@yourdomainexample.com>
To:	boss@yourdomainexample.com
Reply-To:	spoofer@scam.com
Message-ID:	<12345867.91012345@apps.rackspace.com>
```
This header is an example of a **spoofed** message. If you suspect that you have received a spoofing email, please see [Email spoofing explained](/how-to/email-spoofing-explained) for further instruction.

### Understanding email headers

- **From:** This displays who the message was sent from. This is easily faked and is unreliable. See [Email spoofing explained](/how-to/email-spoofing-explained) for guidance on detecting fraud email.

- **Subject:** This is the topic of the message as indicated by the sender.

- **Date:**  Indicates the date and time the email message was composed.

- **To:** The "To:" headers of a message with indicate the addresses listed in the "To:" and "CC:" fields. Headers will not show any addresses that were included in the "BCC:" (Blind Carbon Copy) field, as these addresses were intended to remain private.

- **Received:** Received will appear many times in a message header. This displays a sequential list of computer and servers that received this message, the time they received this message, and the final   destination of the message. **Received** hops should be read from bottom to top, as the first hop is at the bottom of the header.

- **Reply-To:** The email address listing in the "Reply-to:" header will determine which email address is auto-populated when you click the reply button to reply to an email in your email client. This is easily faked and is unreliable. See [Email spoofing explained](/how-to/email-spoofing-explained) for guidance on detecting fraud email.

- **Return-Path:** Like the **Reply-To:** address, this is where return mail will be sent. This is easily faked and is unreliable. See [Email spoofing explained](/how-to/email-spoofing-explained) for guidance on detecting fraud email.

- **Message-ID** A unique identifier assigned to a message. The **Message-ID** is useful for diagnosing a duplicate email issue. If you compare the **Message-ID** for multiple emails, and the IDs match, you know those messages are duplicates.

- **X-Originating-Ip:** This is the IP address of the computer that sent the message. While this is slightly more difficult to fake, it is still possible. Typically it is the more reliable information about where the message actually came from. See [Email spoofing explained](/how-to/email-spoofing-explained) for guidance on detecting fraud email.
