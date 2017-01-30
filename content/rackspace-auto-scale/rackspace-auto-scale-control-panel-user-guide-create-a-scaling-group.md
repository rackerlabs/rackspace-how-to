---
permalink: rackspace-auto-scale-control-panel-user-guide-create-a-scaling-group/
audit_date:
title: Create a scaling group using the Auto Scale Control Panel
type: article
created_date: '2013-11-18'
created_by: Rackspace Support
last_modified_date: '2016-05-31'
last_modified_by: Stephanie Fillmon
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

The
[Concepts](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts "Concepts") article
reviews what Auto Scale does and the core concepts that drive it. This
article provides instructions on how to set the parameters for scaling
policies through scaling group configuration. The scaling group
configuration sets a number of parameters that affect how scaling
policies operate.

### Create a scaling group

1.  Log in to the Cloud Control Panel.

2.  At the top of the panel, click **Servers** > **Auto Scale**.

3.  On the main **Auto Scale** page, click **Create Group**.

    A page opens with areas for **Group Details**, **Configuration**,
    and **Scaling Policies**.

4.  In the **Group Details** area, specify the following values:
    -   **Group Name**: Specify a meaningful name for the scaling group.
        In grey text under the text box, the names of potential servers,
        reflecting the group name, are displayed.
    -   **Region**: Select the cloud data center that houses your
        cloud servers. Currently, you cannot scale across data centers;
        all of the servers in a scaling group must be in the same
        data center.
    -   **Minimum Cooldown**: Specify a period of time to enforce
        between possible actions.
    -   **Minimum *n* active servers**: Specify the minimum number of
        servers for the scaling group, regardless of policy execution.
        For example, if a policy to remove servers is triggered, but the
        group already has the configured minimum number of active
        servers, no servers are removed.
    -   **Maximum *n* active servers**: Specify the maximum number of
        servers allowed in the scaling group, regardless of
        policy execution. For example, if a policy to add servers is
        triggered, but the group already has the configured maximum
        number of servers, no servers are added.

5.  In the **Configuration** area and click **Select Image**.
6.  In the dialog box that opens, select the image for the servers.
7.  Click **Select Flavor**.
8.  In the dialog box that opens, select the **Flavor Class** for the
    servers in the scaling group that corresponds to the server image
    that you selected. Use the widget to adjust the size for the servers
    that will be created from that image and deployed in Auto Scale.
    When you are done, click **Select Flavor**.
9.  Click **Select Networks**.
10. In the dialog box that opens, select the networks for the servers in
    the scaling group. The defaults are **PublicNet** and
    **ServiceNet**. Other network selections are displayed if you have
    created them previously when creating a cloud server. You must
    include the **ServiceNet** network in your
    configuration if you are going to use a load balancer so that the
    load balancer can retrieve the IP address of new servers.</span>
11. When you are done, click **Select Networks**.
12. *(Optional)* Click **Select Load Balancer**.

    A dialog box opens with the available load balancers for your
    scaling group. If no load balancers appear, click the **Servers** >
    **Load Balancers** tab in the control panel and create and save a
    load balancer. The load balancer will then appear in Auto Scale and
    you can select it. You must include the **ServiceNet** network in your
    configuration if you use a load balancer so the load balancer can
    retrieve the IP address of new servers.

13. *(Optional) *Select the load balancer to use in the scaling group
    and enter a value for **Server Port**, which is the port on which
    traffic from the load balancer will be accepted. When you are done,
    click **Select Load Balancer**.

    **Note**: An invalid load balancer configuration will prevent
    servers from being created in a scale-up.

14. Select a previously saved scaling policy. You can create the scaling
    group without any scaling policies, but no scaling actions will
    occur until you create policies for the scaling group. If you
    haven't configured any scaling policies yet, see [Create a scaling
    policy](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy).

15. When you are done, click **Create Scaling Group**.

    A progress bar shows that the group is being created. The page
    changes to display your selections for the scaling group, with a
    status of **Scaling**. An animated orange bar at the bottom of the
    page runs until all of the minimum number of servers are deployed,
    turning green by each server as it completes. When the scaling group
    has been created, the status is **Active**.

### About the Auto Scale control panel

Following are a few things you should know about the pages in the Auto Scale control panel:

-   In the upper right-hand corner of the page that lists the existing
    scaling groups, you can pick from a list of regions to display only
    the scaling groups created in a region, or you can choose **All
    Regions (Global)** to see all scaling groups. The default region
    displayed is **United States**.
-   To the left of each existing group is a gear icon
    that you can click to open a menu of editing options. Wherever you
    see this icon, sometimes used with an **Actions** menu on other
    pages, you can edit, delete, or make other changes to the
    configuration next to it or on that page.
-   Click the name link for any existing scaling group, load balancer,
    or policy to open a Status page with options to edit
    those configurations.
-   Some text has a dashed underline. This indicates that you can hover your mouse pointer over this text and see a tooltip or information about the setting. Also, you can hover your mouse
    pointer over a question mark help icon to get information.
-   You can use the edit pencil
    to open a configuration area and make changes to an
    existing configuration.
-   At the bottom of the **Create Group** page, and on the **Select
    Server Flavor** pane, is a dollar sign cost icon.
    Hover your mouse pointer over it to get pricing information.
-   Links generally take you to a status or configuration page for the
    linked item. However, the configuration page that opens might be
    outside of the **Servers > Auto Scale** page and in a different
    area of the Cloud Control Panel. For example, clicking a load
    balancer link takes you to the status page for that load balancer
    under the top-level **Load Balancer** page.

### User Guide sections

-   [Rackspace Auto Scale Control Panel User Guide - Introduction](/how-to/rackspace-auto-scale-control-panel-user-guide-introduction "Introduction")
-   [Rackspace Auto Scale Control Panel User Guide - Concepts](/how-to/rackspace-auto-scale-control-panel-user-guide-concepts "Concepts")
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling group](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-group "Creating Scaling Groups")
-   [Rackspace Auto Scale Control Panel User Guide - Create a scaling policy](/how-to/rackspace-auto-scale-control-panel-user-guide-create-a-scaling-policy "Creating Scaling Policies")
