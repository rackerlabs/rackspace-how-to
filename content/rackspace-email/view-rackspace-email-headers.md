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

``Delivered-To:	boss@yourdomainexample.com
Return-Path:	<spoofer@yourdomainexample.com>
Delivered-To:	boss@yourdomainexample.com
Received:	from director5.mail.iad3b.rsapps.net ([172.31.157.9]) by backend41.mail.iad3b.rsapps.net (Dovecot) with LMTP id sUcGAvmhylmdZQAAg3iAog for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from proxy17.mail.iad3a.rsapps.net ([172.27.129.38]) by director5.mail.iad3b.rsapps.net (Dovecot) with LMTP id iiJeOeksylk3CgAAPieIkA ; Tue, 26 Sep 2017 14:52:41 -0400
Received:	from smtp14.gate.iad3a ([172.27.255.53]) (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits)) by proxy17.mail.iad3a.rsapps.net (Dovecot) with LMTP id rJhmKrqgyllKIgAAR4KW9A ; Tue, 26 Sep 2017 14:52:41 -0400
Return-Path:	<spoofer@yourdomainexample.com>
X-Orig-To:	boss@yourdomainexample.com
X-Originating-Ip:	[00.000.000.00]
Authentication-Results:	smtp14.gate.iad3a.rsapps.net; iprev=pass policy.iprev="173.203.187.94"; spf=neutral smtp.mailfrom="spoofer@yourdomainexample.com" smtp.helo="smtp94.iad3a.emailsrvr.com"; dkim=none (message not signed) header.d=none; dmarc=none (p=nil; dis=none) header.from=yourdomainexample.com
X-Classification-ID:	df82d834-a2eb-11e7-b6bd-b8ca3a5bbb60-1-1
Received:	from [173.203.187.94] ([173.203.187.94:53887] helo=smtp94.iad3a.emailsrvr.com) by smtp14.gate.iad3a.rsapps.net (envelope-from <spoofer@yourdomainexample.com>) (ecelerity 4.2.1.56364 r(Core:4.2.1.14)) with ESMTPS (cipher=DHE-RSA-AES256-GCM-SHA384) id E3/AD-22478-8F1AAC95; Tue, 26 Sep 2017 14:52:40 -0400
Received:	from smtp12.relay.iad3a.emailsrvr.com (localhost [127.0.0.1]) by smtp12.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id D884625995 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	from app39.wa-webapps.iad3a (relay-webapps.rsapps.net [172.27.255.140]) by smtp12.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id CC64C25983 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
X-Sender-Id:	spoofer@yourdomainexample.com
Received:	from app39.wa-webapps.iad3a (relay-webapps.rsapps.net [172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12); Tue, 26 Sep 2017 14:52:40 -0400
Received:	from yourdomainexample.com (localhost.localdomain [127.0.0.1]) by app39.wa-webapps.iad3a (Postfix) with ESMTP id BE2F520080 for <boss@yourdomainexample.com>; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
Received:	by apps.rackspace.com (Authenticated sender: spoofer@yourdomainexample.com, from: assistant@yourdomainexample.com) with HTTP; Tue, 26 Sep 2017 14:52:40 -0400 (EDT)
X-Auth-ID:	spoofer@yourdomainexample.com
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
Message-ID:	<1506451960.77624876@apps.rackspace.com>
X-Mailer:	webmail/12.9.5-RC``


If you suspect that you have received a spoofing email, please see [Email spoofing explained](/how-to/email-spoofing-explained) for further instruction.
