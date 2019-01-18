---
permalink: prevent-spam-in-postfix/
audit_date:
title: Prevent spam in Postfix
created_date: '2019-01-16'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Cloud Servers
product_url: cloud-servers
---

This article demonstrates some simple configuration changes that you can implement on a [Postfix](http://www.postfix.org) installation on your mail server to help stop some of the flow of spam to your mailboxes.

### Enable Realtime Blackhole Lists

Real-time Blackhole Lists (RBLs) are lists of Internet Protocol (IP) addresses that are associated with known spammers. These lists are generally free. 

You can configure Postfix to check the IP address of the incoming message against one or more RBLs. If there's a match, then your server does not permit the message sender to transmit the message. Enabling RBLs is a straightforward way to stop up to 50% of your spam traffic. 



You configure RBLs under the `smtpd_recipient_restrictions` parameter in the main Postfix configuration file, which is usually located at **/etc/postfix/main.cf**. The following Postfix configuration example file uses six different RBLs:

smtpd_recipient_restrictions =
            reject_rbl_client zen.spamhaus.org,
            reject_rbl_client bl.spamcop.net,
            reject_rbl_client dnsbl.sorbs.net,
            reject_rbl_client cbl.abuseat.org,
            reject_rbl_client b.barracudacentral.org,
            reject_rbl_client dnsbl-1.uceprotect.net,
            permit

After you implement this configuration, entries similar to the following example appear in your mail logs:

    Dec 17 15:58:24 mailserver postfix/smtpd[15573]: NOQUEUE: reject: RCPT from unknown[204.12.225.53]: 554 5.7.1 Service    unavailable; Client host [204.12.225.53] blocked using zen.spamhaus.org ; http://www.spamhaus.org/sbl/query/SBLCSS / http://www.spamhaus.org/query/bl?ip=204.12.225.53; from=<info@lifeyjingu.com> to=<admin@mymailserver.com> proto=ESMTP helo=<hse53.lif eyjingu.com>

RBLs are usually used in conjunction with other spam fighting techniques, such as Apache&reg; SpamAssasin&trade;. However, because SpamAssassin can be very central processing unit (CPU)-intensive, cutting spam traffic in half by using RBLs first might save valuable CPU resources on your mail server.

In addition to RBLs, you can help prevent your server from relaying and receiving spam by adding some of the following configuration options under the `smtpd_recipient_restrictions` parameter:

- `reject_invalid_hostname`: Rejects the request when the HELO or EHLO hostname is malformed. This can potentially prevent poorly programed bots from sending spam to your server.

- `reject_unknown_recipient_domain`: Rejecta the request when Postfix is not final destination for the recipient domain. This can prevent your server from being used as an open relay.

- `reject_unauth_pipelining`: Rejects the request when the client sends SMTP commands ahead of time where it is not allowed. This stops mail from bulk mail software that improperly uses ESMTP command pipelining in order to speed up deliveries.

- `reject_unauth_destination` - This is similar to reject_unknown_recipient_domain, but this includes two conditions, one of which must be met, in order for Postfix to accept the message: 1) Postfix is mail forwarder for the domain (as defined in the `relay_domains parameter`) -or- 2) Postfix is the final destination for the domain. 

Of course there may be certain IPs or entire networks that you do not want to filter out from your mail server. In this case, you can add the `permit_mynetworks` option under `smtpd_recipient_restrictions` to whitelist these IPs. You should also ensure that these networks have been defined under the `my_networks` parameter earlier in the configuration file.


The following example `smtpd_recipient_restrictions` parameter in the main Postfix configuration file uses all of the preceding configuration options:

       smtpd_recipient_restrictions =
                   reject_invalid_hostname,
                   reject_unknown_recipient_domain,
                   reject_unauth_pipelining,
                   permit_mynetworks,
                   reject_unauth_destination,
                   reject_rbl_client zen.spamhaus.org,
                   reject_rbl_client bl.spamcop.net,
                   reject_rbl_client dnsbl.sorbs.net,
                   reject_rbl_client cbl.abuseat.org,
                   reject_rbl_client b.barracudacentral.org,
                   reject_rbl_client dnsbl-1.uceprotect.net,
                   permit


You might also require additional configuration parameters under `smtpd_recipient_restrictions`. You can add them to the bottom of this list, but above the `permit` option.

These Postfix changes are not a complete solution for fighting spam. This configuration alone might stop up to 50% of spam, but you need additional configuration changes and software (such as SpamAssassin) to block additional spam traffic. There is a good Wiki post on the CentOS&reg; website that shows how to install SpamAssassin along with Amavis and ClamAV (http://wiki.centos.org/HowTos/Amavisd). This article should work for Red Hat&reg;-based distributions.
