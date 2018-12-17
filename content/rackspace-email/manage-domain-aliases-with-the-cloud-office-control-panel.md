---
permalink: manage-domain-aliases-with-the-cloud-office-control-panel/
audit_date:
title: Manage domain aliases with the Cloud Office Control Panel
type: article
created_date: '2014-04-10'
created_by: Mawutor Amesawu
last_modified_date: '2018-01-04'
last_modified_by: William Loy
product: Rackspace Email
product_url: rackspace-email
---

Resellers can create domain aliases for their customers. If you are a
direct customer, however, and you want to create a domain alias, please
contact the Rackspace support team. Direct customers can still view the
aliases that have been set by going to step 2 in the following
procedure.

### Domain aliases and accepted domains

You might want to create a domain alias if, for example, your company
owns several domains (for example, **mycompany.com**, **mycompany.biz**,
and **mycompany.us**), and you want to direct all incoming email to the
company's primary domain. If you assign **mycompany.biz** and
**mycompany.us** as domain aliases, email that is sent to mailboxes at
the aliases will be automatically redirected to a mailbox on the primary
domain, **mycompany.com**.

**Warning:** You must own the domain that you plan to use as a domain alias or accepted domain. The [MX records](/how-to/dns-record-definitions/#mx-record) must also point to Rackspace for mail to be delivered to your mailboxes.

The type of email hosting service that you use determines the relevant
terminology ("domain alias" versus "accepted domain") and functionality
(such as how email is redirected):

-   Domain alias - If you are a Rackspace Email customer, you will create
    a domain alias. Email sent to the domain alias is automatically
    directed to the corresponding mailbox in the original domain. For
    example, if **mycompany.biz** is a domain alias **for
    mycompany.com**, when someone sends an email to
    **bob@mycompany.biz** it is  automatically redirected to
    **bob@mycompany.com**.
-   Accepted domain - If you are a Microsoft Exchange customer, you create
    an accepted domain. Email sent to the accepted domain can be
    automatically directed to any mailbox that you specify.

### Add a domain alias or accepted domain (Resellers Only)

1.  Log in to the [Cloud Office Control
    Panel](https://cp.rackspace.com/).
2.  From the **Go to section** menu, select **Domains**.
3.  In the **Manage** section, click **Domain Aliases**.
4.  If you have multiple domains, select the appropriate domain name.
    Or, to change domains, click **change domain**.
5.  Click **Add Alias**.
6.  In the **Alternate Domain** box, enter the full domain name that you
    want to assign as a domain alias or accepted domain.
7.  In the **Alternate Domain Type** area, select **Domain Alias** or
    **Accepted Domain**. To learn more, see the preceding section in
    this article.
8.  If you selected the Exchange option, **Accepted Domain**, select the
    **Create alternate addresses for existing recipients** check box to
    automatically generate the new domain addresses for your current
    Exchange mailboxes.
9.  Click **Save**.
