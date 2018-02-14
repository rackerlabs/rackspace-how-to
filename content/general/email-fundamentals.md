---
permalink: email-fundamentals/
audit_date: '2017-11-07'
title: Email Fundamentals
type: article
created_date: '2017-01-27'
created_by: Alan Hicks
last_modified_date: '2017-11-07'
last_modified_by: Stephanie Fillmon
product: undefined
product_url: undefined
---

Of the many different types of services businesses need to configure, troubleshoot, and maintain, email is perhaps the most convoluted, complicated, and poorly documented. Email is one of the oldest services on the Internet. Many of the problems that plague email today are due to design decisions that were made decades ago by people who never envisioned email or the Internet to be a fraction as large as it is today. In the years that have followed, email systems have been cobbled together from many different resources to try to deal with these issues - with varying degrees of success. In this article, we're going to take a look at the protocols used to implement email delivery and retrieval, as well as offer some best practice advice so you can begin to implement your own solution.

- [Problematic email design](#problematic-email-design)
- [Email protocols](#email-protocols)
    - [Simple Mail Transfer Protocol](#simple-mail-transfer-protocol)
    - [Post Office Protocol](#post-office-protocol)
    - [Internet Message Access Protocol](#internet-message-access-protocol)
- [SMTP mail transmission](#smtp-mail-transmission)
  - [Mail routing](#mail-routing)
  - [Mail storage](#mail-storage)
  - [SMTP relay decisions](#smtp-relay-decisions)
- [POP3 mail retrieval](#pop3-mail-retrieval)
- [IMAP message access](#imap-message-access)
- [SMTP best practices](#smtp-best-practices)
  - [Proper DNS records](#proper-dns-records)
  - [Protocol checks](#protocol-checks)
  - [SPF records](#spf-records)
  - [Relational block lists](#relational-block-lists)
- [Other common spam fighting techniques](#other-common-spam-fighting-techniques)
  - [Bayesian filtering](#bayesian-filtering)
  - [Greylisting](#greylisting)
  - [Challenge-response](#challenge-response)
- [Conclusion](#conclusion)

### Problematic email design

**No single protocol**

Unlike the world-wide-web, which runs exclusively via HTTP (and HTTPS, which is really the same thing), email systems utilize a variety of protocols. Web browsers need speak only HTTP, but an email client needs to speak and understand - at a minimum - SMTP, POP3, and IMAP. There are separate protocols for sending email than for retrieving email. There are even mutually exclusive protocols for retrieving email. This is further complicated by Microsoft, whose MAPI protocol is proprietary and undocumented. Fortunately, as this is a non-standard email system, we will not touch on it in this document.

**No authentication layer for senders**

This is the single largest reason for the spam problem. Email was dreamed up during a time when the Internet (really the Arpanet) was tiny. The only people using email were defense contractors, college professors, and some graduate students. The number of people communicating with email was small, and the community generally knew almost everyone using it. There was no need to ensure that people were not acting malicious, as malicious users could simply be ostracized by their peers. Their failure to envision the growth of the Internet and the expansion of email as a world-wide system meant that authentication controls were not included as any part of the protocol, so today we find ourselves cobbling together lots of different (flawed) ideas to implement authentication while maintaining backwards compatibility.

**No single on-disk format**

At one time email did have a single on-disk format: **mbox**. These files were basically flat text files into which new emails were appended and old emails were removed. Today, most people have migrated to **maildir**, which stores each message in its own text file. There are performance benefits to using **maildir**, but the configuration is often more complex.

**No end-to-end encryption**

Although there are extensions which enable encrypted connections between your Mail User Agent (MUA), such as Outlook or Thunderbird, and the server, the email itself is almost always plain text. Since emails can bounce around between multiple intermediary servers, there's no guarantee that your message won't be transmitted in the clear across the Internet before reaching its final destination. In fact, this is almost always the case. Unless both sender and recipient agree on an encryption method (such as GPG/PGP) and already have a trust relationship between their keys, there is no way to communicate securely via email.

### Email protocols

Email systems are composed of a variety of protocols. We'll go into each one in depth later.

#### Simple Mail Transfer Protocol

Simple Mail Transfer Protocol (SMTP) is the primary email protocol. It is responsible for sending and receiving emails from other mail servers and is the primary way in which mail servers communicate with other programs. For instance, say you want to send an email from your desktop to admin@rackspace.com. Your email client establishes an SMTP connection to your email server. That server then accepts the message and establishes an SMTP connection to the mail server for **rackspace.com**. Rackspace's mail server receives the message and, in this case, forwards it to an internal email server, requiring yet another SMTP connection! As you can see, this is much more complex than a protocol like HTTP, where your browser typically connects to the host domain's server directly without all these intermediaries.

#### Post Office Protocol

Post Office Protocol (POP3) has fallen out of favor with most businesses, but it's almost certainly the mail retrieval protocol supported by your ISP. POP3 is an old and simple protocol that doesn't support many of the features of its latter replacement, Internet Message Access Protocol (IMAP). POP3 supports only a single mail spool, or folder, and is not recommended for permanent on-server mail storage. While it's possible to implement, POP3 is kludgy and prone to break as the implementations are generally performed on the clients, not on the server.

#### Internet Message Access Protocol

A more powerful alternative than POP3, IMAP is a mail retrieval protocol which natively supports, and even encourages, online storage of your messages. It supports multiple mail spools and handles discrete or concurrent connections from multiple clients to the same mail account without issues.

### SMTP mail transmission

SMTP is the protocol used for mail transmission. We should take a moment to differentiate mail transmission from mail retrieval, as both involve "transmitting" data over the Internet. Mail transmission refers to the steps involved from the time a new email is sent to when it is placed into a mail spool for latter retrieval by the user's MUA. SMTP is, at it's core, non-authenticated. There are some extensions to the protocol that involve authenticating to relay mail, which are covered later in this section. For now, let's take a look at an example SMTP connection. In the following telnet connection, the lines beginning with the number 2 were generated by the mail server for **rackspace.com**.

    # telnet cust41036-1.in.mailcontrol.com. 25
    220 cluster-g.mailcontrol.com ESMTP MailControl
    ehlo mail.example.com
    250-cluster-g.mailcontrol.com Hello harrier.slackbuilds.org
    [196.112.4.100], pleased to meet you
    250-ENHANCEDSTATUSCODES
    250-PIPELINING
    250-8BITMIME
    250-SIZE 1073741824
    250-DSN
    250-ETRN
    250-STARTTLS
    250-DELIVERBY
    250-AUTH PLAIN
    250 HELP
    mail from: sender@example.com
    250 2.1.0 sender@example.com... Sender ok
    rcpt to: tester@rackspace.com
    250 2.1.5 tester@rackspace.com... Recipient ok
    data
    354 Enter mail, end with "." on a line by itself
    From: Test Account <sender@example.com>
    To: Test Account 2 <tester@rackspace.com>
    Date: January 27, 2017 01:50:01 PM
    Subject: Test

    This is a test.
    .
    250 2.0.0 v0RFm2pK028481 Message accepted for delivery
    quit
    221 2.0.0 rly01g.srv.mailcontrol.com closing connection
    Connection closed by foreign host.

Here we see a typical unencrypted SMTP connection. The first thing we must do once we've connected to a mail server is identify ourselves. This is done by sending either a `HELO` (hello) or `EHLO` (extended hello) command, followed by our fully qualified domain name. `EHLO` indicates that the client supports at least some extensions to SMTP that weren't part of the original specification. Today, it's rare to see `HELO` anywhere as virtually everything supports these extensions. When an extended hello is sent, the server responds with each extension that it understands. In the above example you see a pretty standard list of extensions, but these can be quite complex. Let's take a look at each in turn. Some of these we will go over in further detail later.

- `ENHANCEDSTATUSCODES` is the extension that displays HTTP-like error codes. It's responsible for prefixing each server message with a numerical code like `220`, `250`, and `354` above. As with HTTP, `2XX` codes indicate success, `3XX` codes indicate partial success with more input required, `4XX` means temporary failures, and `5XX` means permanent failures.

- `PIPELINING` allows the client to queue up a number of commands and send them to the server, and the server will process them in order as it is able to do so. Without the `PIPELINING` extension, only one request can be sent, and the client must wait for the server to respond before sending the next.

   **Note:** Not all commands can be pipelined.

- `8BITMIME` enables the use of 8-bit MIME in emails. This allows messages to include characters outside of the standard ASCII range.

- `SIZE`serves two purposes: first, it tells the client how large a message the server will receive. In this case, any messages above 1GB will be rejected. If the MUA wants to send a message above this limit and the server supports `SIZE`, the client can self-reject the message without bothering to send it. This saves bandwidth and time. Second, as part of the `MAIL` command, the MUA can send its own `SIZE` estimate of the message so the server will know about what size message to expect.

- `DSN` enables delivery status notifications. This allows the currently receiving server to pass along DSN information to subsequent servers in the mail routing chain and enables them to inform the client of failure.

- `ETRN` is designed for mail servers that may have limited Internet connectivity. You will rarely ever see it in use. Typically this is only configured for a handful of known domains. When the destination mail server is unavailable, other mail servers queue email for that destination. Later, when the server has become available, an application can initiate an SMTP connection, send an `ETRN` command, and the mail server will re-queue all mail for that domain and deliver it immediately. Unless you are doing something extremely unusual, such as running an email server at [McMurdo Station](https://en.wikipedia.org/wiki/McMurdo_Station), you are not likely to encounter a situation where this extension is utilized.

- `STARTTLS` tells the server to immediately switch to using RSA encryption. This allows the MUA and server to communicate on an encrypted channel, mostly to protect user credentials used for relaying. This is analogous to the use of HTTPS for HTTP connections, but does not require running the server on an alternate port. (There actually is an SMTPS port, but it's rarely used.)

   When your mail server transmits an email to another mail server using SMTP, it will typically do so using a plain-text connection on port 25. There's no way in SMTP to "redirect" an SMTP connection to an encrypted target like there is with HTTP, so this allows your server to accept both encrypted connections from your MUA and unencrypted connections from other mail servers on the same port.

- `DELIVERBY` allows a connecting client to request a time by which its message must be delivered. The client can also instruct the server on what actions to take if it has not delivered the message by its expiration time. Typically those actions are to either bounce the message or send a "delayed" status via the DSN extension previously mentioned.

- `AUTH` enables authentication. In our case, we're using plain-text authentication, but there are other authentication types allowed as well. You may think that "plain text" authentication is insecure (and many older articles you read online will say the same), but the other authentication protocols are really just plain-text with some wrapping paper on them. For instance, MD5 authentication takes an MD5 checksum of your password and sends that, but in reality the checksum itself is the real password. The only extension that actually enables true credential encryption is `STARTTLS`.

- `mail from` and `rcpt to` tell the SMTP server the origin and destination email addresses. Note that these are fundamentally different from the "From:" and "To:" headers that your MUA displays. SMTP servers make mail routing decisions based on these values.

- `data` tells the SMTP server that we're ready to send the actual email contents. This is not just the body, but the email headers as well. Note that none of these headers are mandatory. It's perfectly valid even to send an empty body.

        From: Test Account <sender@example.com>
        To: Test Account 2 <tester@rackspace.com>
        Date: January 27, 2017 01:50:01 PM
        Subject: Test

        This is a test.
        .

   There are the contents of our email, terminated by a single period on a line by itself. Note that these headers are interpreted by your MUA, not by the SMTP server. As far as the server is concerned, these are just random fields. It pays no attention to any headers in the body and "From:" and "To:" have no bearing on how the mail is routed. Random fields can be inserted here and the message is still perfectly valid and will be routed based on `mail from` and `rcpt to`.

#### Mail routing

Now that we've looked through an example SMTP connection in detail, let's review mail routing. This is a complex topic, and we won't delve into it too deeply. One important thing to bare in mind is that SMTP services function as both SMTP providers (daemons) and SMTP clients. This if fundamentally different from the way that HTTP works for instance. With HTTP, your browser connects to a server. That server returns content to you. It does not (normally) fire up an internal browser of its own and retrieve content from elsewhere. Mail servers however routinely do this as their standard method of operation.

For purposes of this discussion, we're going to assume that I'm sending an email from **sender@example.com** to **tester@rackspace.com**. There are several steps involved after the email is composed and the **Send** button is pressed.

1. My MUA makes a connection to the mail server configured in my email account's options. In this case, we're going to call that **mail.example.com**. During this connection, my MUA sends the `mail from:` and `rcpt to:` headers to instruct **mail.example.com** where the message is to be delivered and who is sending it. At this point **mail.example.com** decides if it should accept the mail for local deliver, accept the mail for relay, or reject the mail.

2. **mail.example.com** accepts the message, determines that it is destined for another server, and drops it into its queue for processing. It checks the `rcpt to:` header and discovers the message is bound for **tester@rackspace.com**. At this point, the mail server does an MX record lookup and determines that the mail server for **rackspace.com** is **cust41036-1.in.mailcontrol.com**. It then pulls the A or AAAA record for this server.

3. At this point, **mail.example.com** is acting like a mail client in almost exactly the same way that my MUA did in step 1. It makes a connection to **cust41036-1.in.mailcontrol.com** on port 25 and attempts delivery. At this stage, **cust41036-1.in.mailcontrol.com** decides whether to accept the message for local delivery, accept the message for relay, or deny the message.

4. Now **cust41036-1.in.mailcontrol.com** accepts the message and determines if it needs to forward it further. It is not uncommon for large companies to have mail servers for different divisions and the message may need to be routed accordingly. For instance, there may be a single mail server for the Support Team, a different server for Accounting and HR, and a third for Marketing and Sales. Mail routing doesn't have to stop at the destination MX. Unfortunately, anything behind the destination MX is something of a black box to the rest of the Internet.

If the server with the MX record for a domain needs to route the message further, it has to look that information up internally. Every mail server handles this differently with open source implementations often supporting several different methods.

#### Mail storage

There are two main storage formats for email messages, but no standard says that either must be used. Indeed, many mail servers such as Microsoft Exchange use their own proprietary format or store mail in relational databases. The primary on-disk storage formats for email are mbox and maildir. mbox is a simple flat file of concatenated emails, while maildir stores each message in its own individual file and supports multiple message folders.

##### mbox

If the mail system is using mbox, messages will be concatenated into the user's mbox file, generally in some central location. On Linux, this tends to be **/var/spool/mail**. Since every message enters a single file, this file can grow to tremendous size if not regularly purged. Here's an example mbox file:

    # cat /var/spool/mail/root
    From root  Fri Oct 11 18:19:26 2013
    Return-Path: <root>
    Received: from hive64 (localhost [127.0.0.1])
        by hive64 (8.14.7/8.14.5) with ESMTP id r9BNJQX3000990
        for <root>; Fri, 11 Oct 2013 18:19:26 -0500
    Received: (from root)
        by hive64 (8.14.7/8.14.5/Submit) id r9BNJQQe000989
        for root; Fri, 11 Oct 2013 18:19:26 -0500
    From: root
    Message-Id: <201310112319.r9BNJQQe000989@hive64>
    Date: Fri, 11 Oct 2013 18:19:26 -0500
    To: root
    Subject: Register with the Linux counter project
    User-Agent: Heirloom mailx 12.5 7/5/10
    MIME-Version: 1.0
    Content-Type: text/plain; charset=us-ascii
    Content-Transfer-Encoding: 7bit


       (Adapted from a question in the Linux-FAQ)

       How Many People Use Linux?

    ...

    From root  Fri Oct 11 18:21:05 2013
    Return-Path: <root>
    Received: from hive64 (localhost [127.0.0.1])
        by hive64 (8.14.7/8.14.5) with ESMTP id r9BNL5RP001020
        for <root>; Fri, 11 Oct 2013 18:21:05 -0500
    Received: (from root)
        by hive64 (8.14.7/8.14.5/Submit) id r9BNL4rr001019
        for root; Fri, 11 Oct 2013 18:21:04 -0500
    From: root
    Message-Id: <201310112321.r9BNL4rr001019@hive64>
    Date: Fri, 11 Oct 2013 18:21:04 -0500
    To: root
    Subject: Welcome to Linux (Slackware 14.1)!
    User-Agent: Heirloom mailx 12.5 7/5/10
    MIME-Version: 1.0
    Content-Type: text/plain; charset=us-ascii
    Content-Transfer-Encoding: 7bit


    Welcome!  I'm glad to see you've made it this far! :^)

    Here are a few hints to help you navigate through the Linux operating
    system a little bit better.

    ...

    Have fun!

    ---
    Patrick Volkerding
    volkerdi@slackware.com

As you can see, each message, including its headers, is appended one at a time to the bottom of the file. This is terribly inefficient when a user has many messages. Reading the file requires a lot of disk operations, and altering the file, particularly if messages somewhere in the middle of the file are deleted, is even more costly.

##### maildir

maildir was developed by Daniel J. Bernstein and is a solid improvement over mbox for many people. Most systems today implement maildir++, which is an extension of the original maildir to support multiple message folders. Let's take a look at an example maildir.

    # ls -a ~/Mail/
    ./      .Archive/        .Sent\ Messages/  .linux-wireless/     .spam/
    ../     .Drafts/         .Spam/            .oss-security/       cur/
    .2013/  .OpenBSD-misc/   .Trash/           .postfix-users/      new/
    .2014/  .OpenBSD-ports/  .freebsd/         .slack-docs/         tmp/
    .2015/  .Queue/          .hylafax/         .slackbuilds-devel/  
    .2016/  .Sent/           .linux-cluster/   .slackbuilds-users/

This is the root mailbox directory. The first directories to investigate are **cur/**, **new/**, and **tmp/**. These hold messages for the default **INBOX** folder. Unread messages are deposited into the **new/** directory. Once they've been read, they are transferred to the **cur/** (current) directory. The **tmp/** directory is used only as a temporary message store by the mail server internally and is typically devoid of messages.

The other directories represent mail folders. An IMAP-aware MUA will display each of these as a subscribable mail folder. Below each of these directories, you will find **new/**, **cur/**, and **tmp/** subdirectories.

    # ls -a ~/Mail/.postfix-users/
    ./  ../  cur/  new/  tmp/

And in each of those sub-directories, you'll find potentially thousands of email messages, each stored in its own file.

    # ls ~/Mail/.postfix-users/cur/
    1363887571.28611_1.barnowl:2,S  1389196918.12168_1.barnowl:2,S
    1412286182.30383_1.barnowl:2,S  1437398883.24306_1.barnowl:2,S
    1363887747.28619_1.barnowl:2,S  1389207225.12355_1.barnowl:2,S
    1412330995.317_1.barnowl:2,S    1437400441.24336_1.barnowl:2,S
    1363894799.28795_1.barnowl:2,S  1389208071.12377_1.barnowl:2,S
    1412341069.583_1.barnowl:2,S    1437404301.24391_1.barnowl:2,S
    1363939306.29987_1.barnowl:2,S  1389208878.12400_1.barnowl:2,S
    1412342205.600_1.barnowl:2,S    1437407068.24445_1.barnowl:2,S
    1363940381.29998_1.barnowl:2,S  1389210109.12415_1.barnowl:2,S
    1412342789.609_1.barnowl:2,S    1437408441.24489_1.barnowl:2,S
    1363950142.30234_1.barnowl:2,S  1389210500.12428_1.barnowl:2,S
    1412356479.2067_1.barnowl:2,S   1437409272.24513_1.barnowl:2,S

    # cat cur/1363887571.28611_1.barnowl:2,S
    Return-Path: <owner-postfix-users@postfix.org>
    X-Original-To: tester@rackspace.com
    Delivered-To: tester@rackspace.com
    Received: from russian-caravan.cloud9.net (russian-caravan.cloud9.net [168.100.1.4])
	    by mail.rackspace.com (Postfix) with ESMTP id D2D145D58E
	    for <tester@rackspace.com>; Thu, 21 Mar 2013 13:39:31 -0400 (EDT)
    Received: by russian-caravan.cloud9.net (Postfix)
	    id 8609E3310B3; Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    Delivered-To: postfix-users-outgoing@cloud9.net
    Received: from localhost (localhost [127.0.0.1])
	    by russian-caravan.cloud9.net (Postfix) with ESMTP id 82D1C330C80
	    for <postfix-users-outgoing@cloud9.net>; Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    X-Virus-Scanned: amavisd-new at cloud9.net
    Received: from russian-caravan.cloud9.net ([127.0.0.1])
	    by localhost (russian-caravan.cloud9.net [127.0.0.1]) (amavisd-new, port 10024)
	    with ESMTP id L8BEXuesurQd for <postfix-users-outgoing@cloud9.net>;
	    Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    Received: by russian-caravan.cloud9.net (Postfix, from userid 54)
	    id 5D646331114; Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    Delivered-To: postfix-users@cloud9.net
    Received: from localhost (localhost [127.0.0.1])
	    by russian-caravan.cloud9.net (Postfix) with ESMTP id 4384F3310B3
	    for <postfix-users@cloud9.net>; Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    X-Virus-Scanned: amavisd-new at cloud9.net
    Received: from russian-caravan.cloud9.net ([127.0.0.1])
	    by localhost (russian-caravan.cloud9.net [127.0.0.1]) (amavisd-new, port 10024)
	    with ESMTP id rE_N0-wVJX-e for <postfix-users@cloud9.net>;
	    Thu, 21 Mar 2013 13:39:14 -0400 (EDT)
    Received: from spike.porcupine.org (spike.porcupine.org [IPv6:2604:8d00:189::2])
	    by russian-caravan.cloud9.net (Postfix) with ESMTP id E72DD330C80
	    for <postfix-users@postfix.org>; Thu, 21 Mar 2013 13:39:13 -0400 (EDT)
    Received: by spike.porcupine.org (Postfix, from userid 1001)
	    id 3ZWwGn4SkXzk2RX; Thu, 21 Mar 2013 13:39:13 -0400 (EDT)
    DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=porcupine.org;
	    s=dktest; t=1363887553;
	    bh=pVIYly6eTQxcA1lGi+URgYTXo8wfaO2n3vRJBqqgg7Y=;
	    h=Subject:In-Reply-To:To:Date:Sender:From:Reply-To:MIME-Version:
	     Content-Transfer-Encoding:Content-Type:Message-Id;
	    b=sgbF1z11gZkEsOsDeWC4UtDr8hd6Qbk5chshjHvNyez2K99aop3c1C/SlXJF2MpV7
	     GMsmQAlYMoLDGl9I3pBm4waqS5ghcbqisITLvBGJDp92qosolvBMZ7/YjXIx0xvQeV
	     NWdTz3XPdEN7e9O5l3QrQrcFd/Atr4lUlFh3mfaY=
    Subject: Re: always_bcc
    In-Reply-To: <SNT133-W189CF5EACE19D7E6CEA69BBAEB0@phx.gbl>
    To: Postfix users <postfix-users@postfix.org>
    Date: Thu, 21 Mar 2013 13:39:13 -0400 (EDT)
    From: Wietse Venema <wietse@porcupine.org>
    Reply-To: Postfix users <postfix-users@postfix.org>
    X-Mailer: ELM [version 2.4ME+ PL124d (25)]
    MIME-Version: 1.0
    Content-Transfer-Encoding: 7bit
    Content-Type: text/plain; charset="US-ASCII"
    Message-Id: <3ZWwGn4SkXzk2RX@spike.porcupine.org>
    Sender: owner-postfix-users@postfix.org
    Precedence: bulk
    List-Post: <mailto:postfix-users@postfix.org>
    List-Help: <http://www.postfix.org/lists.html>
    List-Unsubscribe: <mailto:majordomo@postfix.org>
    List-Subscribe: <mailto:majordomo@postfix.org>

    Jumping Mouse:
    > Wietse,
    > What do you mean by:   "(I warned you that it is VERY rudimentary.
    > There is no "DUNNO"special result value that forces a lookup
    > failure)."  What does this look like in a real world scenario?
    > What are the potential drawbacks?

    I described a solution with configuration file examples.  It does
    what it does: exclude two sender addresses with a nested if/endif
    construct.

    In an ideal world, this solution would be nicer. You would specify
    three rules: one rule for each excluded sender address, and one
    wild-card rule for everyone else.  But the word is not ideal, and
    therefore I will not decribe the nicer solution in detail.

	    Wietse

Because each file represents a different message, disk operations such as reading, moving, and deleting these messages are simplified and much faster. For example, deleting the above message is as simple as deleting that file. Were we using the mbox format, we would first have to search the entire file to determine where the message begins and ends, then carefully remove those lines. Typically this involves copying the entire mbox into RAM, modifying it there, then overwriting the old mbox file.

#### SMTP relay decisions

In the early days of the Internet, anyone could relay mail through anyone else's server. You sent mail simply by knowing the IP address of an open relay on the Internet. Then spammers began to use these open relays to inundate the Internet with advertisements for fake Viagra and charitable donations to Nigerian princes. In response, ISPs began restricting access to port 25. Today, there are two principle methods for restricting mail relay: trusted hosts and authentication.

- The trusted hosts method allows certain hosts, generally listed by IP address or subnet mask, to relay any mail through the system without restriction. If you are connecting from a trusted IP address, the mail server appears to be an open relay.

- Authentication is provided by extensions to the SMTP protocol, and there are a wide variety of different implementations. With authentication, the connection MUST make an "extended hello" as this is unsupported without SMTP extensions. It's also generally a bad idea to use authentication without enabling encryption for the connection for obvious reasons. Once the client is authenticated, the connection is trusted for as long as it lasts. Authentication also provides a handy way of referencing a specific message to the user that generated it, as the username is typically logged.

There is an alternative method for allowing authentication without enabling the `AUTH` extension, but we do **not** recommend it. Log scraping techniques read the logs for your POP3 or IMAP service, determine which IP addresses have had a successful authentication recently, and allow those IP addresses to relay mail through your server. Since this effectively adds these addresses to the list of trusted hosts, it allows anyone from that IP to relay mail through your server. If you set this up on an email server, then just check your email using POP3 or IMAP, anyone else with the same public IP address could freely relay email through that server for a limited time.

At first glance, this may not seem like a problem. After all, you are likely checking your email from your office and you don't mind if everyone in your office relays mail through your server. Indeed, you likely intend for them to do so. Consider though the number of laptops, phones, and tablets you and your coworkers use. You likely have email configured on those devices and pass through many open wifi networks as you go about your daily business. Since these devices routinely check email upon successfully connecting to a new network, you are allowing potentially thousands of unknown people to relay mail through your server.

Even if this is not a concern for you, this practice developed when most MUAs could not authenticate to SMTP. That is no longer the case as every mail client today has this capability, rendering this technique moot. We have better options available these days, so log scraping isn't necessary.

### POP3 mail retrieval

POP3 daemons allow users to retrieve their mail from the server to their local machine using a post office metaphor. SMTP delivers your mail to a mail spool (PO Box) and then you remove the mail from it. The mail is essentially "delivered" to your MUA at that point. There are some options that allow you to leave mail on the server after retrieval, in which case you're essentially copying the messages and leaving the originals in your mail spool.

Like a PO Box, POP3 only supports a single mailbox. You cannot have more than one mailbox. Additionally, POP3 does not support folders or directories of any kind. Any organization of your email must be done on your local machine. Let's take a look at an example POP3 connection.

    # telnet localhost 110
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    +OK
    USER tester
    +OK
    PASS $mypassword
    +OK
    LIST
    +OK 2 messages (320 octets)
    1 120
    2 200
    .
    RETR 1
    +OK 120 octets
    Return-Path: <test@example.com>
    X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on mail.rackspace.com
    X-Spam-Level:
    X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,NO_RELAYS
        autolearn=ham version=3.3.2
    X-Original-To: tester
    Delivered-To: tester@rackspace.com
    <snipped>
    .
    DELE 1
    +OK message 1 deleted
    QUIT
    +OK

As you can see, POP3 is an incredibly simple protocol. We just used `USER` and `PASS` to log in to the service. The `LIST` command gives us a list of all available messages and the message size. `RETR` shows us the email's contents, and `DELE` immediately deletes the message from the server. POP3's primary advantages over IMAP are its simplicity and low overhead.

### IMAP message access

IMAP is a far superior protocol to POP3 in most ways. Rather than mimicking the behavior of a snail-mail post office, IMAP operates more like a personal secretary, storing and retrieving information for the user as required. IMAP is capable of storing more than just mail as well, with various MUAs being capable of storing contacts or calendar information. Typically, IMAP is used predominately for email only. Here's an example session.

    # telnet localhost 143
    Trying 127.0.0.1...
    Connected to localhost.
    Escape character is '^]'.
    * OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS ID ENABLE
    IDLE STARTTLS AUTH=PLAIN] mail.rackspace.com ready.
    a1 LOGIN alan $MYPASSWORD
    a1 OK [CAPABILITY IMAP4rev1 LITERAL+ SASL-IR LOGIN-REFERRALS ID ENABLE
    IDLE SORT SORT=DISPLAY THREAD=REFERENCES THREAD=REFS
    THREAD=ORDEREDSUBJECT MULTIAPPEND URL-PARTIAL CATENATE UNSELECT
    CHILDREN NAMESPACE UIDPLUS LIST-EXTENDED I18NLEVEL=1 CONDSTORE QRESYNC
    ESEARCH ESORT SEARCHRES WITHIN CONTEXT=SEARCH LIST-STATUS SPECIAL-USE
    BINARY MOVE] Logged in
    a2 LIST "" "*"
    * LIST (\HasNoChildren) "." 2016
    * LIST (\HasNoChildren) "." OpenBSD-misc
    * LIST (\HasNoChildren) "." Trash
    * LIST (\HasNoChildren) "." Drafts
    * LIST (\HasNoChildren) "." slackbuilds-devel
    * LIST (\HasNoChildren) "." postfix-users
    * LIST (\HasNoChildren) "." 2013
    * LIST (\HasNoChildren) "." 2015
    * LIST (\HasNoChildren) "." 2014
    * LIST (\HasNoChildren) "." spam
    * LIST (\HasNoChildren) "." OpenBSD-ports
    * LIST (\HasNoChildren) "." Sent
    * LIST (\HasNoChildren) "." Queue
    * LIST (\HasNoChildren) "." freebsd
    * LIST (\HasNoChildren) "." slackbuilds-users
    * LIST (\HasNoChildren) "." INBOX
    a2 OK List completed.
    a3 EXAMINE INBOX
    * FLAGS (\Answered \Flagged \Deleted \Seen \Draft $Forwarded Old)
    * OK [PERMANENTFLAGS ()] Read-only mailbox.
    * 123 EXISTS
    * 0 RECENT
    * OK [UNSEEN 122] First unseen.
    * OK [UIDVALIDITY 1363886602] UIDs valid
    * OK [UIDNEXT 17917] Predicted next UID
    * OK [HIGHESTMODSEQ 32149] Highest
    a3 OK [READ-ONLY] Examine completed (0.001 secs).
    a4 FETCH 1 BODY[HEADER]
    * 1 FETCH (BODY[HEADER] {729}
    Return-Path: <root@web1.example.com>
    X-Original-To: admin
    Delivered-To: admin@example.com
    Received: by example.com (Postfix, from userid 0)
        id ABF735D5D8; Tue, 31 May 2016 03:41:26 -0400 (EDT)
    Date: Tue, 31 May 2016 03:41:26 -0400
    From: backup@web1.example.com
    To: admin@example.com
    Subject: web1 - Backup Notification
    Message-ID: <574d4026.ig13wDVHWNH3tOY9%backup@web1.example.com>
    User-Agent: Heirloom mailx 12.4 7/29/08
    MIME-Version: 1.0
    Content-Type: text/plain; charset=us-ascii
    Content-Transfer-Encoding: 7bit

    )
    a5 FETCH 1 BODY[TEXT]

    Backup attempted on Tuesday May 31, 2016 03:40:01 AM.
    Backup completed on Tuesday May 31, 2016 03:41:26 AM.

    Total files included in this backup: 136262

    )
    a5 OK Fetch completed.
    a6 LOGOUT
    * BYE Logging out
    a6 OK Logout completed.
    Connection closed by foreign host

The first thing to notice here is that IMAP commands begin with a two-byte field. This field is mandatory, but can really be anything you desire. Canonically it is a two-byte field that is incremented with each command, but that is not a strict requirement of the protocol. If you search online you'll find documentation informing you to use a question mark or some other character for this field but the reality is that the contents of the field are arbitrary. In this example, each command line begins with "a" followed by a number.

Second, notice that as soon as we connected to the IMAP server it offered us a list of its capabilities similar to the way SMTP behaves when it receives an extended-hello. This is a solid improvement over POP3 as there is no ambiguity. The server will tell us immediately if it supports things like encryption. Additionally, once we've authenticated it informs us of new capabilities that are now available.

    a2 LIST "" "*"
    * LIST (\HasNoChildren) "." 2016
    * LIST (\HasNoChildren) "." OpenBSD-misc
    * LIST (\HasNoChildren) "." Trash
    * LIST (\HasNoChildren) "." Drafts
    * LIST (\HasNoChildren) "." slackbuilds-devel
    * LIST (\HasNoChildren) "." postfix-users
    * LIST (\HasNoChildren) "." 2013
    * LIST (\HasNoChildren) "." 2015
    * LIST (\HasNoChildren) "." 2014
    * LIST (\HasNoChildren) "." spam
    * LIST (\HasNoChildren) "." OpenBSD-ports
    * LIST (\HasNoChildren) "." Sent
    * LIST (\HasNoChildren) "." Queue
    * LIST (\HasNoChildren) "." freebsd
    * LIST (\HasNoChildren) "." slackbuilds-users
    * LIST (\HasNoChildren) "." INBOX
    a2 OK List completed.

The format for the `LIST` command is complex, so if you ever have need to know more check the RFCs for IMAP. For now, know that the `LIST` command displays mail folders on the server. When you select which folders to subsribe to, your MUA performs a `FETCH` command, similar to the following:

    a4 FETCH 1 BODY[HEADER]
    a5 FETCH 1 BODY[TEXT]

The `FETCH` command is much more powerful than POP3's `RETR` command. It is capable of retrieving specific parts of the message. Here we made two fetches - one for headers and one for the body - but others are possible as well. In particular, you can specify a list of headers to pull and your MUA will only retrieve those specific ones. Typical IMAP clients retrieve a subset of all the headers, such as sender, subject, and date, and sort mail based on those headers. They then download only the message bodies and remaining headers when the user specifically requests those messages.

### SMTP best practices

The unusual history and nature of email means that a lot of evolution has happened along the years in a decentralized, organic way. Spam has always been the primary evolutionary force behind improvements to email systems. Today there are many different practices to prevent spam, but only a handful of them are in frequent usage. No one can guarantee that following these practices will ensure your email is delivered successfully to its destination, but these practices reduce the chances that another mail server will refuse delivery of your messages or unjustly mark them as spam. We have chosen these as best practices because they are nearly universal, accept or reject mail early in the transaction with minimal delay or overhead, and are unlikely to result in false positives (legitimate mail being refused as spam). You may also wish to explore further options than these.

#### Proper DNS records

Compromised servers and workstations are a constant source of spam. Spammers love to relay their junk through someone else's compromised system as they do not have to pay bandwidth costs or suffer the consequences of having their IP addresses blocked. If a compromised server or workstation becomes blocked, there's always another one available. Email operators have begun checking DNS records, particularly PTR records, to ensure that emails are originating from an actual mail server. This process is not 100% fool-proof and it does result in some false positives, but it's a great way to weed out a ton of spam without significantly impeding legitimate email.

When these checks are enabled, the receiving mail server looks up the PTR record for whichever server is connecting. Note that this is the IP address of the device that is connecting and has no direct relationship with any of the email headers. In fact, this check is made before any message content (including headers) is sent. Once it has the PTR record, it then checks the A record for that domain to determine if it matches. Here's an example of a successful match:

    - connection from 208.87.233.190
    # dig 190.233.87.208.in-addr.arpa. ptr +short
    cluster-g.mailcontrol.com.
    # dig cluster-g.mailcontrol.com. a +short
    208.87.233.190

To better ensure that mail your server sends is actually delivered, you must set up proper PTR records for your servers and proper A (and/or AAAA) records for your domain. Failure to do so will result in your emails being rejected by a sizable number of recipients.

#### Protocol checks

Much of the spam we see every day is sent from compromised computers as part of a large botnet. These compromised devices typically implement only a primitive SMTP service. As a result, they rarely follow best practices and often even violate parts of the SMTP protocol. By checking for such violations and refusing mail when they are present, we can eliminate much spam without negatively impacting emails sent from legitimate servers.

Configuring these sorts of checks is different for every mail server, and not every SMTP implementation is guaranteed to offer the same checks, but we'll address the most common ones here.

- **Reject Invalid HELO/EHLO Hostnames**: Refuse delivery if the client specifies a malformed hostname during the `HELO` or `EHLO` command.
- **Reject Non-FQDN HELO/EHLO Hostnames**: Refuse delivery if the client does not specify a fully-qualified domain name (FQDN) during the `HELO` or `EHLO` command.
- **Reject Non-FQDN Senders**: Refuse delivery if the `MAIL FROM` address does not include a FQDN.
- **Reject Non-FQDN Recipient**: Refuse delivery if the `RCPT TO` address does not include a FQDN.
- **Reject Unknown Sender Domain**: Refuse delivery if the `MAIL FROM` domain does not have a proper MX record.
- **Reject Unknown Recipient Domain** Refuse delivery if the `RCPT TO` domain does not have a proper MX record.
- **Reject Clients With Improper DNS Records**: Refuse delivery if the connecting client does not have a PTR record and if the PTR record does not have an A record mapping back to the client's IP address.

#### SPF records

A relative newcomer to the world of anti-spam measures, Sender Permitted From (SPF) gives domain name owners some ability to restrict which devices can send email using their domain name in the `mail from` header. The idea is that a domain owner can publish a DNS record stating that only a handful of email servers are legitimate origins for email from that domain in an effort to restrict sender address spoofing. Unfortunately, like many anti-spam efforts, it requires cooperation from everyone all at once. The domain owner must have published an SPF record, and the mail servers that receive messages with spoofed addresses must also support SPF record look-ups and honor those values.

To make matters even more complicated, there is no SPF record type in DNS. Rather, this record piggybacks within the TXT record for the domain. Also, the records are not the easiest thing in the world to read. Here's an example of a SPF record:

    # dig wikimedia.org txt +short
    "v=spf1 ip4:91.198.174.0/24 ip4:208.80.152.0/22 ip6:2620:0:860::/46 include:_spf.google.com ip4:74.121.51.111 ?all"

The "v=spf1" prefix indicates that this TXT record should be interpreted as an SPF version 1 record. This particular record is relatively simple. The domain owner has whitelisted three different subnets, 91.198.174.0/24, 208.80.152.0/22, and 2620:0:860::/46. They are also including an additional record for **_spf.google.com**. Apparently Wikipedia utilizes Google's G Suite. They've also explicitly allowed the IP address 74.121.51.111 to send email on their behalf. Finally, they have ended the record with `?all` which states that no other servers are explicitly allowed to send email on their behalf, but doesn't recommend blocking such emails either. Let's drill down further and have a look at that included record, **_spf.google.com**.

    # dig _spf.google.com txt +short
    "v=spf1 include:_netblocks.google.com include:_netblocks2.google.com include:_netblocks3.google.com ~all"
    # dig _netblocks.google.com txt +short
    "v=spf1 ip4:64.18.0.0/20 ip4:64.233.160.0/19 ip4:66.102.0.0/20 ip4:66.249.80.0/20 ip4:72.14.192.0/18 ip4:74.125.0.0/16 ip4:108.177.8.0/21 ip4:173.194.0.0/16 ip4:207.126.144.0/20 ip4:209.85.128.0/17 ip4:216.58.192.0/19 ip4:216.239.32.0/19 ~all"
    # dig _netblocks2.google.com txt +short
    "v=spf1 ip6:2001:4860:4000::/36 ip6:2404:6800:4000::/36 ip6:2607:f8b0:4000::/36 ip6:2800:3f0:4000::/36 ip6:2a00:1450:4000::/36 ip6:2c0f:fb50:4000::/36 ~all"
    # dig _netblocks3.google.com txt +short
    "v=spf1 ip4:172.217.0.0/19 ip4:108.177.96.0/19 ~all"

Here we can see that the SPF records for **_spf.google.com** are quite extensive. Google has whitelisted 14 different large IPv4 subnets as valid email senders. They've also whitelisted 6 different IPv6 subnets which are enormous. Each of these records ends with the `~all` keyword, which is a "Soft Fail" scenario. This means that any records not stated are not authorized to send email, but allowing mail from those addresses is not explicitly prohibited.

**Note:** SPF protects only against spam that includes a spoofed from address, and even then it only protects against spam if both the receiving mail server and the domain's owner have implemented SPF. Spammers can continue to spoof your domain to mail servers that don't implement SPF checks. If your mail server implements SPF, you'll still get spoofed messages from domains that don't implement this, and if the spammer controls his own domain and doesn't attempt to spoof the sending address, SPF will do nothing to protect you.

#### Relational block lists

Relational block lists are a common and effective way of reducing the amount of spam your mail server receives. Relational block lists are either public or private services which track a variety of factors such as known spam IPs, consumer IP subnets, and open proxies that might be used for spam. Modern email systems can then make a simple DNS query whenever it receives a connection to determine if that address is a known or likely source of spam.

The most common public relational blacklist is **zen.spamhaus.org**. Let's take a look a couple different DNS queries using this blacklist.

    # dig @0.ns.spamhaus.org. 52.1.234.206.zen.spamhaus.org +short
    # dig @0.ns.spamhaus.org. 52.1.234.207.zen.spamhaus.org +short
    127.0.0.2
    127.0.0.9

In the first query we received no response. This indicates that 52.1.234.206 is a legitimate email service, according to **zen.spamhaus.org**. In the second query we received responses of 127.0.0.2 and 127.0.0.9. Since the RBL has at least one value for this IP address, this address is likely source of spam and the mail server can chose to reject the message based on this information alone.

Relational block lists aren't foolproof. Often legitimate mail servers can be caught by them, so reputable block lists typically include some way to dispute your IP address's standing on the list.

### Other common spam fighting techniques

These techniques aren't always the best fit for every email server, so they don't fall under the previous best practices section. They tend to be more complex to set up, have a higher overhead, are more likely to introduce false positives, or some combination of the above.

#### Bayesian filtering

Bayesian Filtering is a technique that applies a bit of Artificial Intelligence (AI) to the content of email to determine if the message is spam. Since the entire email must be inspected, this step requires that the mail be delivered fully to the server before a decision can be made. This means that Bayesian filtering requires a much higher network overhead than other techniques in addition to a high CPU overhead. Still, it can be a highly effective method for filtering out spam. Bayesian filtering can often have a high false-positive rate, so care needs to be taken in applying it to a server. Generally, each email account should have its own Bayesian database (as each user's email is different) and mail should be marked as spam or moved to a spam folder rather than be deleted outright. The big improvement here is that Bayesian filtering "learns" what should be marked as spam and what should be passed as ham. This requires some method by which the user can train the Bayesian filter. As such, proper setup is difficult and complex, often with a lot of permissions juggling. This is particularly true when email accounts are stored in a relational database.

#### Greylisting

Greylisting is a technique in which connections from unknown IP addresses are temporarily refused, then later white-listed or black-listed depending on later behavior. The technique has a very low false-positive rate, but introduces a sometimes cumbersome delay in mail delivery. Typically, the mail server responds with a temporary error message. After a configurable length of time, if the client reconnects the email server accepts delivery. The working theory here is that spammers are often using primitive SMTP clients that don't support the full range of SMTP error codes. As such, they rarely retry a failed connection. This doesn't always work, so a portion of spam will leak through, but many admins are content with the trade-offs involved with greylisting, particularly since it so rarely blocks legitimate email.

#### Challenge-response

Spend long enough on the Internet and you'll stumble across someone advocating challenge-response schemes for fighting spam. Usually they claim that they have implemented such a system and have never gotten a single spam message since.

The primary problem with challenge-response methods is that they place the burden of spam prevention upon the sender. Whenever an email server implementing challenge-response schemes receives a message from a new sender, it holds that message in a queue. It then sends an email to the original sender challenging them to reply. When the server receives a response to this challenge, it white-lists that sender. It should become immediately apparent that automated systems, for example, Rackspace's ticket notification system, will never send a response and thus cannot be automatically white-listed. Furthermore, many senders simply won't bother responding to the challenge, so a lot of legitimate email will never be delivered and neither the sender nor the recipient will even know why.

This method is particularly flawed when the sender is also behind a challenge-response system. In that scenario, the original sender will receive a challenge. That challenge will get queued and a second challenge will be sent to the original recipient. Until the original sender replies to a challenge, his own challenges will be rejected. In this scenario, these two users can never communicate with one another. Additionally, they may never even know that their emails were not received.

### Conclusion

Hopefully this document has given you a better understanding of the complexities of modern email systems. Unfortunately, email is always something of a moving target. The conflict between mail providers and spammers can be likened to an arms race. Both sides are eternally struggling to outdo the other, so mail providers need to keep up-to-date on the latest spam prevention techniques. While this document can't hope to be a definitive resource on hosting your own mail server, hopefully it has provided you with a solid base from which to evaluate your requirements and implement a service which works best for your business.
