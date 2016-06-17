---
permalink: working-with-notification-suppressions-in-rackspace-intelligence/
audit_date:
title: Work with notification suppressions in Rackspace Intelligence
type: article
created_date: '2015-07-16'
created_by: Rose Coste
last_modified_date: '2016-06-09'
last_modified_by: Stephanie Fillmon
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

Rackspace Intelligence enables you to temporarily suspend
[Rackspace Intelligence notifications](/how-to/working-with-notifications-in-rackspace-intelligence)
during scheduled outages or maintenance periods.

You access the **Suppressions** page by clicking **Suppress** at the top of the Rackspace Intelligence Control Panel.

To create a new suppression, edit an existing
suppression, or view a list of active, scheduled, or
ended suppressions, click **Suppressions**.

On the **Suppressions** page, you can view two types of suppressions:

- **Active & Scheduled** suppressions are relevant now, which might
  mean that they are actively waiting for a specified time to begin.
  When a suppression is active, you can see when it started and when
  it is scheduled to end.
- **Ended** suppressions were in use previously. Examining the list of
  ended suppressions can help you understand problems such as lack of
  awareness of a previous outage.

You can sort the lists of suppressions by their names, status, start
time, end time, or duration. Sorting by **Start Time** or **End
Time** can help you determine which suppressions started together or are
scheduled to end together.

To see which entity's notifications are being suppressed (**Suppression
Targets**), click the suppression's name.

To view a list of alarms that have been suppressed, click
the **Suppressed Alerts** link. The Suppressed Alerts log page lists all
the alerts that have been suppressed during the past 30 days, with their
corresponding metrics, such as status, entities, and suppression time.

### Create a suppression

You can create a suppression in one of the following ways:

#### Create a suppression from the Suppressions overview page

1. On the **Suppressions** overview page, click **Create Suppression**.

2. On the **Create a Suppression** page, type a name for the
   suppression, and select the appropriate start and end dates.

3. To add one or more suppression targets, click **Add Entities**.

4. Select one or more entities from the list, and then click **Add
   Entities**. You can also use the search functionality to search for
   a specific entity.

5. Click **Create Suppression**.

6. When prompted to confirm that you are ready to create your
   suppression, click **Create Suppression Now**.

Rackspace Intelligence creates the suppression and it goes into effect
immediately. Details about your new suppression are available on the
suppression details page.

#### Create a suppression from within an entity

1. To create a suppression from within an entity, open the entity
   details page by clicking **Monitor > Entities** and then clicking
   the name of the entity.

2. Scroll to the **Suppressions** section of the entity details page,
   and then click **Create Suppression.**

   Rackspace Intelligence has automatically selected all the alarms
   that are associated with this entity.

3. Set the start and end dates and, optionally, add
   additional entities.

4. Click **Create Suppression**.

After you have confirmed that you want to create the suppression,
Rackspace Intelligence creates the suppression and it goes into effect
immediately.

### Edit a suppression

You can edit an existing suppression by using the **Actions** menu on
the suppression details page.

You can perform the following editing actions for suppressions:

#### Edit the time frame of a suppression

1. From the **Actions** menu on the suppression details page,
   select **Edit Timeframe**.

2. Update the start date, end date, or both, and then click **Update
   Timeframe**.

   **Note:** If your suppression has already started, you cannot update the start date.

3. Alternatively, you can end the suppression immediately by
   clicking **End Suppression Now**.

4. Confirm that you want to end the suppression by clicking **End
    Now**.

**Note:** If you end a suppression, you cannot restart it.

#### Delete a suppression

1. From the **Actions** menu on the suppression details page,
   select **Delete Suppression**.

2. Click **Delete** to permanently delete the suppression.
