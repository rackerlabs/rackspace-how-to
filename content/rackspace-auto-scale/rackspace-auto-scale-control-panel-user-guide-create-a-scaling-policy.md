---
permalink: rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy/
audit_date:
title: Rackspace Auto Scale Control Panel User Guide - Create a scaling policy
type: article
created_date: '2013-11-18'
created_by: Rackspace Support
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

The [Create a scaling
group](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy "Creatng Scaling Groups") article
describes how to set the parameters for scaling policies through the scaling
group configuration. This section discusses the Auto Scale current
policy options and how group configurations affect policy execution. A
scaling policy determines what actions are taken on your scaling group
and when they are taken. You can create scaling policies for an existing
scaling group at any time by returning to the group configuration page.
Typically, you will create at least two policies: one to scale up and
one to scale down. You can create up to 1000 policies per group.

There are two steps to create a scaling policy:

### Create a scaling policy

1.  On the Create Scaling Group page or on the details page of an
    existing group, click  **Create Policy**.
2.  In the dialog box that opens, enter information for the following
    values:
    -   **Name**: Specify a name for the policy, for example, **Scale up
        by 10 on Fridays at 5p.m.**
    -   **Scale Trigger**: Select who the policy will be triggered,
        either by a specific schedule or a webhook. After you make this
        choice, fill in the schedule or webhook information according to
        your selection:
        -   **Scheduled (repeating)**: Specify how often the policy will
            occur and when.
        -   **Scheduled (once)**: Specify when the policy will occur.
        -   **Scheduled (cron)**: Enter a cron expression. You can click
            **Cron Expression Helper** to open a new tab to a Cron
            expression helper and generate a cron expression; use the
            tabs at the top if necessary. Then copy the expression into
            Auto Scale.
        -   **Webhook URL**: You must create and configure the webhook
            by using the Auto Scale API. To learn more about this, read
            about
            [Webhooks](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#webhooks-and-capability-urls)
            in the *Auto Scale API Developer's Guide*.
    -   **Amount**: Select **Scale Up** or **Scale Down**, enter an
        integer, and select **Servers** or **Percent**. If you specify
        **Scale Up by 2 Servers**, the policy will add two servers to
        your scaling group when the policy is triggered. If you specify
        **Scale Up by 2 Percent**, the policy will add servers to equal
        the equivalent of two percent of your current scaling group,
        whatever size it is. See [Scale Up by Percentage
        Policy](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts)
        for a visual explanation.
    -   **Cooldown Period**: The policy cooldown, like the group
        cooldown, prevents a policy from being executed too frequently.
        For schedule-based policies, we advise leaving this value empty
        or setting it to 0 (zero). This option is available for
        **Scheduled (cron)** and **Webhook URL** triggers only.

3.  Click **Create Policy**.
    The dialog box closes and the scaling policy that you created is
    added to the list of scaling policies on the page.

### Test your configuration

After you create a scaling group and scaling policy, in addition to
checking the status and animated gifs showing deployment, you can test
your configuration by changing the minimum number of entities for the
group and watching the new server or servers being added.

### Next steps

After you have created a scaling group and policy, following are some
next steps that you might take:

-   To learn more about Auto Scale, read the [Rackspace Auto Scale
    FAQ](/how-to/rackspace-auto-scale-faq), [Rackspace Auto
    Scale
    Glossary](/how-to/rackspace-auto-scale-glossary),
    and [Rackspace Auto Scale
    Overview](/how-to/rackspace-auto-scale-overview).

-   To learn about the Auto Scale API, see the [Rackspace Auto Scale
    Developer
    Guide](https://developer.rackspace.com/docs/autoscale/v1/developer-guide/#document-developer-guide).

### User Guide sections

-   [Rackspace Auto Scale Control Panel User Guide -
    Introduction](/how-to/rackspace-auto-scale-control-panel-user-guide-introduction "Introduction")
-   [Rackspace Auto Scale Control Panel User Guide -
    Concepts](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts "Concepts")
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling
    group](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-group "Creating Scaling Groups")
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling
    policy](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy "Crating Scaling Policies")
