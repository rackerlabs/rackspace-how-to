---
permalink: monitoring-entities-with-rackspace-intelligence/
audit_date:
title: Monitor entities with Rackspace Intelligence
type: article
created_date: '2015-07-17'
created_by: Rose Coste
last_modified_date: '2017-01-12'
last_modified_by: Shane Duan
product: Rackspace Intelligence
product_url: rackspace-intelligence
---

Rackspace Intelligence lets you create, edit, and view entities.

Like Rackspace Monitoring, Rackspace Intelligence uses *entities* to
represent any object or resource that you want to monitor. An entity can
be a set of servers or non-server objects, but most often an entity
refers to an individual server.

You can define an entity in Rackspace Intelligence that is something
other than a Rackspace cloud server, a Rackspace cloud database, or a Rackspace dedicated device. You
can create an entity to represent any server or website that you want to
monitor, even if it is not hosted at Rackspace.

As you create new Rackspace cloud servers or cloud databases, Rackspace
Intelligence entities representing them are created automatically.

To see a list of the entities known to Rackspace Intelligence,
select **Monitor** at the top of the Rackspace Intelligence interface,
and then click **Entities**.

From the **Monitor Entities** section, you can perform the following actions
on the list of entities:

### Sort entities

You can sort the list of monitored entities by entity name, by the
number of alarms reported for each entity in the **Critical**, **Warning**, and
**OK** categories, and by the number of monitoring checks reported for each
entity.

### View the details of an entity

All the entity labels in Rackspace Intelligence are linked to an entity
details page. To view the details page for an entity, click on the
entity's name. The following information about the entity is displayed:

- Monitoring details, such as IP addresses and RAM configured for the
  entity
- Monitoring checks, listing numbers of critical, warning, and OK
  alarms fired for each check activated for the entity
- Suppressions, showing any alarms currently muted for this entity

If the entity is a cloud server, the details page provides the same
information that you can get about the server by using the Cloud Control
Panel or by logging in to the server itself.

### Create an entity

To create a new entity:

1. On the **Monitoring** page, click **Create Entity**.

2. Type a name for your entity and click **Create Entity.**

Rackspace Intelligence creates the entity and displays the information
on the entity details page. You can now update the entity by adding an
IP address or a check. See the next section for instructions.

### Update an entity

You can update an existing entity by clicking the **Actions** menu at
the top of the entity details page.

You can perform the following updates on an entity:

#### Rename an entity

To rename an entity:

1. Select **Rename Entity** from the **Actions** menu.
2. Type a new name in the **Rename Entity** box, and then click **Rename**.

The new name appears on the entity details page.

#### Add an IP address to an entity

You can add one or more IP addresses to an entity. You can reference
these IP addresses by the checks on the entity.

To add one or more IP addresses:

1. Select **Add IP** from the **Actions** menu.
2. On the **IP Addresses** page, specify a label for the IP address, type the numbers for the IP address, and then click **Add**.
3. To add another IP address, repeat the preceding step.
4. After you have added all your IP addresses, click **Save**.

The IP addresses that you added appear on the entity details page.

#### Delete an entity

To delete an entity:

1. Select **Delete Entity** from the **Actions** menu.
2. To confirm that you want to permanently delete the entity, click **Delete**.

The entity is permanently deleted from the database and is no longer
monitored by Rackspace.

#### Create a check for an entity

To create a check for an entity:

1. Select **Create Check** from the **Actions** menu.
2. Select a check from the **Check Type** list, and then enter all the required information.

   **Note:** Different check types require different values of input. For
   more information, see [Working with
   checks](/how-to/working-with-checks).

3. Click **Create Check**.

Rackspace Intelligence creates the check and displays the details on the
check details page. If your check requires a monitoring agent to be
installed to collect metrics, a message is displayed in the **Check
Details** section.

#### Create a suppression

To create a suppression:

1. Select **Create Suppression** from the **Actions** menu.

   On the **Create a Suppression** page, your entity is displayed in
   the **Suppression Targets** section.

2. Type a name for your suppression, and specify the start and end dates.
3. To add an additional entity to this supression, click **Add Entities** and select one or more entities.
4. Click **Create Suppression**.
5. When asked to confirm that you want to create a suppression,
   click **Create Suppression Now**.

For more information about suppressions, see [Working with notification
suppressions](/how-to/working-with-notification-suppressions-in-rackspace-intelligence).

### Visualize an entity

In the list of entities, click in the **Visualize** column of the row
for an entity to launch a **Default Graphs** presentation for the
entity. The page shows any graphs that are available for checks
configured for the entity.

<img src="{% asset_path rackspace-intelligence/monitoring-entities-with-rackspace-intelligence/intelligence-visualize-defaultgraphs-1on1off.png %}" width="743" height="280" />

For checks that are defined but not configured, a link to begin the
process of configuring the check is provided.
