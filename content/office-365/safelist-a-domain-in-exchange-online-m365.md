---
permalink: safelist-a-domain-in-exchange-online-m365/
audit_date: '2020-05-13'
title: Safelist a domain in Exchange Online
type: article
created_date: '2020-05-13'
created_by: Walter Stubbs
last_modified_date: '2020-05-13'
last_modified_by: Cat Lookabaugh
product: Office 365
product_url: office-365
---

This article provides two methods to safelist, or whitelist, a domain in Exchange Online® for Microsoft 365®. Safelisting a domain prevents messages sent from that domain from being filtered as spam by the Exchange Online® spam filter. Instead, Exchange Online sends the message directly to the user's inbox. When you safelist a domain, ensure that your users remain vigilant against the risk of spoofing.

### Prerequisites

- **Applies to:** Administrator
- **Difficulty:** Moderate
- **Time Needed:** Approximately 25 minutes
- **Tools Needed:** Global Administrator Access for Microsoft 365

For more information about prerequisite terminology, see [Cloud Office support terminology](/how-to/cloud-office-support-terminology).

#### Safelist a domain by using the allowed senders list

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left-hand menu, select **Office 365 Admin Center**.

3.	Select **Show all** from the left-hand menu and then select **Exchange** under the **Admin centers** section.

4.	Select **Protection** from the left menu and then click the **Spam Filter** tab.

5.	Select your **Default spam** filter policy (or the policy with the **Relative priority** set to `Lowest`) and then select the pencil icon to edit the policy.

6.	Select **Allow Lists**.

7.	Select the **+** icon below the **Domain allow list** section.

8.	Enter the domain you wish to safelist in the textbox. Separate multiple domains by using a semi-colon or use a new line.

9.	Select **OK** and then select **Save**.

Any emails sent from the domains in your **Domain allow list** are now delivered to your users' inbox successfully. This delivery includes mail with spoofed sender addresses. The next section shows you how to safelist a domain while reducing the likelihood of receiving spoofed messages.

#### Safelist a domain by using mail flow rules

When you use mail flow rules to bypass spam filtering, Exchange Online can perform some authentication checks for the domain you want to bypass. This more complicated method reduces but does not eliminate the risk of allowing un-authenticated senders to deliver spoofed mail.

1.	Log in to your [Office 365 Control Panel](https://office365.cp.rackspace.com).

2.	From the left-hand menu, select **Office 365 Admin Center**.

3.	Select **Show all** from the left menu and then select **Exchange** under the **Admin centers** section.

4.	Select **Mail Flow** from the left menu and then select the **Rules** tab.

5.	Select the **+** icon and then choose **Bypass spam filtering…** from the drop-down menu.

6.	Give the rule a descriptive name such as “Bypass spam filtering for domain.com”.

7.	Under the **Apply this rule if…** section in the first drop-down menu.

    a. Select **The sender…**.
    
    b. Select **domain is**. 
    
    c. When prompted, type the domain you want to safelist into the text box.
    
    d. Select the **+** icon.
    
    e. Click **OK**.

8.	Select **Add Condition**. 

    a. From the new drop-down menu, select **The sender…**.
    
    b. Select **is external/internal**. 
    
    c. When prompted, select **Outside the organization** from the drop-down menu.
    
    d. Click **OK**.

9.	Select **Add Condition**. 

    a. From the new drop-down menu, select **A message header…**.
    
    b. Select **includes any of these words**.

10.	Select the **Enter text…** hyperlink on the right side. 

    a. In the **Specify Header Name** field, enter **Authentication-Results**. 
    
    b. Select **OK**.

11.	Select the **Enter words…** hyperlink on the right side, in the text box, enter **dmarc=pass**.

    a. Select **+**.
    
    b. Type **dmarc=bestguesspass**.
    
    c. Select **+**.
    
    d. Click **OK**.

12.	Select **Add Action** from the new drop-down menu.

    a. Select **Modify the message properties…**.
    
    b. Select **set a message header**.

13.	Select the first **Enter text…** hyperlink on the right.

    a. Enter **X-ETR** into the message header text box.
    
    b. Select **OK**.

14.	Select the second **Enter text…** hyperlink on the right.

    a. Enter **Bypass spam filtering for authenticated sender domain.com**.
    
    b. Select **OK**.

15. Select **Save**.

Your rule now bypasses spam filtering for your specified domain while allowing Exchange Online to perform a DMARC check. It also follows Microsoft best practices by modifying the message headers to include details about bypassing the spam filter, which provides more information for administrators when troubleshooting issues.

**Note:** If you notice any issues with mail delivery, we recommend that you turn off the rule by unchecking it in the rules list. Then use the steps under the preceding **Safelist a domain by using the allowed senders list** section.

### Additional Resources

To learn more about creating safe senders lists in Microsoft 365, see [Create safe sender lists in EOP](https://docs.microsoft.com/en-us/microsoft-365/security/office-365-security/create-safe-sender-lists-in-office-365?view=o365-worldwide).
