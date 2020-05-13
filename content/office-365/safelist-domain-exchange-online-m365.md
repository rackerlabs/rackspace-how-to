---
permalink: safelist-domain-exchange-online-m365/
audit_date:
title: Safelist a Domain in Exchange Online
type: article
created_date: '2020-05-13'
created_by: Walter Stubbs
last_modified_date: '2020-05-13'
last_modified_by: Walter Stubbs
product: Office 365
product_url: office-365
---

This article provides two methods to safelist (or whitelist) a domain in Exchange Online® for Microsoft 365®. Safelisting a domain prevents messages sent from that domain from being filtered as spam by the Exchange Online® spam filter, sending the message directly to your users’ inbox. When safelisting a domain there are always security risks involved, so ensure your users remain vigilant against spoofing.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time Needed:** Approximately 25 minutes
- **Tools Needed:** Global Administrator Access for Microsoft 365

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

#### Safelist a Domain using Allowed Senders list

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left menu, select **Office 365 Admin Center**.

3.	Select **Show all** from the left menu, then **Exchange** under the **Admin centers** section.

4.	Select **Protection** from the left menu, then the **Spam Filter** tab.

5.	Select your **Default spam** filter policy (or the policy with the Relative priority set to Lowest), then select the pencil icon above to edit the policy.

6.	Select **Allow Lists**.

7.	Select the + icon below the **Domain allow list** section.

8.	Add the domain you wish to safelist in the textbox. Separate multiple domains using a semi-colon or use a new line.

9.	Select **OK**, then select **Save**.

Any mail that is sent from the domains in your **Domain allow list** will now be delivered to your users' inbox successfully. This includes mail that is being spoofed. If you wish to safelist a domain while reducing the likelihood of spoofed messages being delivered, please see the steps below.

#### Safelist a Domain using Mail Flow rules

Using mail flow rules to bypass spam filtering still allows Exchange Online to perform some authentication checks for the domain you wish to bypass. This method is more complicated, however it reduces the risk of allowing spoofing and un-authenticated senders from delivering mail, though does not eliminate it.

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left menu, select **Office 365 Admin Center**.

3.	Select **Show all** from the left menu, then **Exchange** under the **Admin centers** section.

4.	Select **Mail Flow** from the left menu, then select the **Rules** tab.

5.	Select the **+** icon, then choose **Bypass spam filtering…** from the drop-down menu.

6.	Give the rule a descriptive name such as “Bypass spam filtering for domain.com”.

7.	Under the **Apply this rule if…** section, from the first drop-down menu select **The sender…**, then **domain is**. When prompted type the domain you wish to safelist into the text box, then select the **+** icon, then **OK**.

8.	Select **Add Condition**, from the new drop-down menu select **The sender…**, then **is external/internal**. When prompted select **Outside the organization** from the drop-down menu, then **OK**.

9.	Select **Add Condition**, from the new drop-down menu select **A message header…**, then **includes any of these words**.

10.	Select the **Enter text…** hyperlink on the right side. From the **Specify Header Name** field, type in **Authentication-Results**. Select **OK**.

11.	Select the **Enter words…** hyperlink on the right side, in the text box type **dmarc=pass**, then select **+**, then type **dmarc=bestguesspass**, then select **+**, then **OK**.

12.	Select **Add Action**, from the new drop-down menu select **Modify the message properties…**, then **set a message header**.

13.	Select the first **Enter text…** hyperlink on the right, then type in **X-ETR** into the message header text box, then select **OK**.

14.	Select the second **Enter text…** hyperlink on the right, then type in **Bypass spam filtering for authenticated sender domain.com**, then select **OK**.

15. Select **Save**.

Your rule is now configured to bypass spam filtering for your specified domain while allowing Exchange Online to perform a DMARC check. It also follows Microsoft best practices by modifying the message headers to include details about bypassing the spam filter which provides more information for administrators when troubleshooting issues.

**Note:** If you notice any issues with mail delivery, it is recommended that you turn off the rule by unchecking it in the rules list and use the steps under the “Safelist a domain using the Allowed Senders list” section above.

### Additional Resources

To learn more about creating safe senders lists in Microsoft 365, see [Create safe sender lists in EOP](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/create-safe-sender-lists-in-office-365?view=o365-worldwide).
