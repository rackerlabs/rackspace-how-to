---
permalink: view-rackspace-email-headers/
audit_date:
title: View Rackspace Email headers
type: article
created_date: '2017-09-26'
created_by: William Loy
last_modified_date: '2017-09-26'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

This article explains how to view message headers in Rackspace Email webmail.

### Prerequisites

- **Applies to:** Administrator and User
- **Difficulty:** Easy
- **Time needed:** Approximately 5 minutes
- **Tools required:**  Webmail access

For more information on prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

1. Log into your mailbox at [apps.rackspace.com](apps.rackspace.com).

2. Select the message that you would like to view the headers for.

3. Select **More** dropdown from the tool bar about the message preview pane and select **View Full Header**.

    <img src="{% asset_path rackspace-email/view-rackspace-email-headers/view_full_header.png %}" />

4. A box will appears titled **Full Header** containing the full contents of the message header.

    <img src="{% asset_path rackspace-email/view-rackspace-email-headers/full_header.png %}" />

You have successfully viewed the message headers in Rackspace Email webmail.


Example message header:

```Delivered-To:	boss@yourdomainexample.com
Return-Path:	<spoofer@yourdomainexample.com>
Delivered-To:	boss@yourdomainexample.com
Received:	from director5.mail.iad3b.rsapps.net ([000.00.00.0]) by backend41.mail.iad3b.rsapps.net (Dovecot) with LMTP id sUcGAvmhylmdZQAAg3iAog for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from proxy17.mail.iad3a.rsapps.net ([000.00.00.0]) by director5.mail.iad3b.rsapps.net (Dovecot) with LMTP id iiJeOeksylk3CgAAPieIkA ; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from smtp14.gate.iad3a (000.00.00.0) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) by proxy17.mail.iad3a.rsapps.net (Dovecot) with LMTP id rJhmKrqgyllKIgAAR4KW9A ; Tue, 26 Sep 2017 14:52:41 -0400
Return-Path:	<spoofer@yourdomainexample.com>
X-Orig-To:	boss@yourdomainexample.com
X-Originating-Ip:	[00.000.000.00]
Authentication-Results:	smtp14.gate.iad3a.rsapps.net; iprev=pass policy.iprev="000.00.00.0"; spf=neutral smtp.mailfrom="spoofer@yourdomainexample.com" smtp.helo="smtp94.iad3a.emailsrvr.com"; dkim=none (message not signed) header.d=none; dmarc=none (p=nil; dis=none) header.from=yourdomainexample.com
X-Classification-ID:	kjdkfjf12452-4546dfasd-154636
Received:	from [000.00.00.0] ([000.00.00.0] helo=smtp94.iad3a.emailsrvr.com) by smtp14.gate.iad3a.rsapps.net (envelope-from <spoofer@yourdomainexample.com>) (ecelerity 000.00.00.0 r(Core:000.00.00.0)) with ESMTPS (cipher=DHE-RSA-AES256-GCM-SHA384) id E3/AD-22478-8F1AAC95; Tue, 26 Sep 2017 14:52:40 -0400
Received:	from smtp12.relay.iad3a.emailsrvr.com (localhost [000.00.00.0]) by smtp12.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 12345 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	from app39.wa-webapps.iad3a (relay-webapps.rsapps.net [000.00.00.0]) by smtp12.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 12345 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
X-Sender-Id:	spoofer@yourdomainexample.com
Received:	from app39.wa-webapps.iad3a (relay-webapps.rsapps.net [000.00.00.0]) by 0.0.0.0:25 (trex/5.7.12); Tue, 26 Sep 2017 14:52:40 -0400
Received:	from yourdomainexample.com (localhost.localdomain [000.00.00.0]) by app39.wa-webapps.iad3a (Postfix) with ESMTP id 12345 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	by apps.rackspace.com (Authenticated sender: spoofer@yourdomainexample.com, from: assistant@yourdomainexample.com) with HTTP; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Date:	Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Subject:	Send $$$
From:	"Assistant" <assistant@yourdomainexample.com>
To:	boss@yourdomainexample.com
Reply-To:	spoofer@scam.com
MIME-Version:	1.0
Content-Type:	text/plain;charset=UTF-8
Content-Transfer-Encoding:	quoted-printable
Importance:	Normal
X-Priority:	3 (Normal)
X-Type:	plain
Message-ID:	<12345867.91012345@apps.rackspace.com>
X-Mailer:	webmail/12.9.5-RC
```
This header is an example of a spoofed message. If you suspect that you have received a spoofing email, please see [Email spoofing explained](/how-to/email-spoofing-explained) for further instruction.

### Understanding email headers

- **From:** This displays who the message was sent from. This is easily faked and is unreliable. See [Email spoofing explained](/how-to/email-spoofing-explained).

- **Subject:** This is the topic of the message as indicated by the sender.

- **Date:**  Indicates the date and time the email message was composed.

- **To:** Displays to whom the message was address.

- **Received:** Received will appear many times in a message header. This displays a sequential list of computer and servers that received this message, the time they received this message, and the final   destination of the message. **Received** hops should be read from bottom to top, as the first hop is at the bottom of the header.

- **
