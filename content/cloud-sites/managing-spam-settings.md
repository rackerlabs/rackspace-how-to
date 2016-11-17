Using your [*Cloud Sites Email Control
Panel*](https://cloudsites.mycpsrvr.com), you can manage spam settings
at the domain or mailbox level. You can save your desired configuration
for all users on your domain and if desired, override existing settings
your users may have within their webmail interface.

**To modify individual mailbox spam settings:**

1.  First, log into your [**Cloud Sites Email Control Panel**](https://cloudsites.mycpsrvr.com) and then click on the
    > **Email Hosting** section.

2.  In the Spam Filtering section, click **Filter Settings**

![](managingspam1.png)

**To modify domain level spam settings:**

1.  First, log into your [**Cloud Sites Email Control Panel**](https://cloudsites.mycpsrvr.com) and then click on the
    > **Domains** section.

2.  In the Spam Filtering section, click **Filter Settings**

![](managingspam2.png)

1.  Select the mailbox or domain you wish to modify and choose your
    > desired settings. In the Status section, turn spam filtering
    > **ON**, **OFF**, or **EXCLUSIVE**. The EXCLUSIVE option will only
    > allow mailboxes to receive email from addresses and IPs on
    > your Safelist. **NOTE:** When using the EXCLUSIVE setting, any
    > message sent from a user not on the Safelist will be rejected and
    > returned to sender.

If you turned spam filtering on, indicate how messages should be handled
for Rackspace Email:

> **Deliver to Spam folder** - Spam messages are sent to the user’s Spam
> folder. If you want to automatically delete messages from this folder,
> select the Delete after n days or n total email check box and enter a
> specified number of days or total emails. NOTE: The default if
> selected is 7 days and 250 emails.
>
> **Delete the email immediately** - Spam email will be deleted
> automatically and not delivered to the user’s mailbox. Email will be
> permanently deleted and will not be retrievable.
>
> **Include “\[SPAM\]” at the beginning of the subject line** - Spam
> email will be delivered to the user’s Inbox, but will include the text
> “\[SPAM\]” in the Subject line.
>
> **Deliver to the email address** - Spam messages are sent to an
> address in your domain that you specify.

![](managingspam3.png)

1.  If managing at the domain level, select the desired **Override
    > Options**

-   Set preferences only for users who have not set their own.

-   <span id="_gjdgxs" class="anchor"></span>Override preferences for
    > all users regardless of their own preferences.

1.  Click the Save button.

![](managingspam4.png)

![](managingspam5.png)
