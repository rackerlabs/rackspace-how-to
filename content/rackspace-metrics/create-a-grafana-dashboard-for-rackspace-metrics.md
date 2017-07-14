---
permalink: create-a-grafana-dashboard-for-rackspace-metrics/
audit_date:
title: Create a Grafana dashboard for Rackspace Metrics
type: article
created_date: '2015-10-19'
created_by: Constanze Kratel
last_modified_date: '2016-12-13'
last_modified_by: Stephanie Fillmon
product: Rackspace Metrics
product_url: rackspace-metrics
---

Rackspace Metrics lets you build a Grafana dashboard to visualize your
metrics. Instead of using a stand-alone Graphite back end, you can point
your Grafana instance to the Rackspace Metrics service. You can complete
all these steps directly from the Cloud Control Panel by importing a
custom template and then creating a stack from this template.

This article describes how to deploy a Grafana instance for Rackspace
Metrics by using a custom Cloud Orchestration template. It also provides
instructions on how to upload a Grafana dashboard for a database
instance.

If you would prefer to deploy Grafana without the custom Cloud Orchestration template or upgrade your existing Grafana instance, see the project wiki page: <https://github.com/rackerlabs/blueflood/wiki/Grafana-3.0-with-Blueflood-datasource>.

### Deploy the Grafana instance for Rackspace Metrics

To create a Grafana dashboard, complete the following steps:

1.  Log in to the [Rackspace Cloud Control
    Panel](https://mycloud.rackspace.com/ "Cloud Control Panel") with
    your user name and password.
2.  In the **Servers** section, click **Create Stack**.
3.  Click **Create Custom Template**.
4.  Go to <https://bitly.com/heat-grafana>, and copy the content on
    the page. This is the template that you will use to create
    your stack.
5.  Go back to the Cloud Control Panel.
6.  On the **Create Custom Template** page, perform the following steps:
    a. Enter a name for the template.
    b. Paste the template content that you just copied
    c. Click **Validate Syntax** at the bottom of the page. After the template has been successfully validated, an `It works!`
        message is displayed beside the button.

7.  Click **Create Template**.
    Your template is created, which might take a few minutes.
    After the template is complete, a details page displays that shows
    information about your custom template, including a description.

    <img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-customized-template1.png %}" width="513"/>

8.  From the **Actions** menu, choose **Create Stack from Template**.
9.  On the **Create Stack** page, enter a name for the stack and then
    enter values for the following fields under **Server Settings**. Use
    the values for your Rackspace account, and overwrite the "not valid"
    values that are populated by default.
    -   **API key**
    -   **username**
    -   **tenant ID** (your account number)

10. Click **Create Stack**.
    The stack details page is displayed.
    While the stack is being built, the **Status** is **Building**.

When the stack has finished building, the **Status** field changes to
**Up**. The page also displays an IP address, a Grafana auth password,
and a Grafana auth username that you can use to access your Grafana
dashboard. Be sure to record this information.

<img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-metrics-up1.png %}" width="408"/>

### Use the Grafana dashboard

Now that you have created your stack, you can access the Grafana dashboard that contains all the relevant information for your stack.

To access the Grafana dashboard, perform the following steps:

1.  Open a web browser.

2.  Type the IP address in the address bar.

    You are prompted with an authentication page.

3.  Type the username and password that were displayed after you created
    the stack and click **Log In**.

4.  Create your Grafana dashboard from Rackspace Monitoring data by pasting the JSON code found in this [orchestration template](https://github.com/rackspace-orchestration-templates/grafana/blob/master/dashboards/default_dashboard.json).

    <img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-home-page_0.png %}" width="432" height="284" />

Note that all of the metrics submitted by Rackspace Monitoring are displayed in the following format:

`rackspace.monitoring.entities.<entityid>.checks.<checktype>.<checkid>.<metricname>`

As seen in the preceding example, Rackspace Monitoring generates `entity IDs` and `check IDs` to guarantee the
uniqueness of the metrics. You can use the `entity IDs` and `check IDs` to identify the format of the metric you want to see.

You can locate the entity ID and check ID on the [Rackspace
Intelligence](http://intelligence.rackspace.com/) **Monitoring
Details** and **Check Details** pages.

For more information, see [Getting Started with Rackspace Intelligence
for the
cloud](/how-to/getting-started-with-rackspace-intelligence-for-the-cloud), [Monitoring
entities with Rackspace
Intelligence](/how-to/monitoring-entities-with-rackspace-intelligence),
and [Working with
checks](/how-to/working-with-checks).

The following screenshot shows where you can locate the entity ID on
the **Monitoring Details** page.

<img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-monitoring-details_0.png %}" alt="" />

You can also locate the monitoring and check IDs by looking at the
Rackspace Intelligence URL for a particular check. Following is an
example of such a URL:

`https://intelligence.rackspace.com/cloud/entities/enrmO7n1hX/checks/ch6fvLIaMC`

The entity ID directly follows the `entities` parameter. Entity IDs always
start with the letters *en*. The check ID directly follows
the `checks` parameter. Check IDs always start with the letters *ch*.

#### Upload a Grafana dashboard for database instances

Rackspace has created a Grafana dashboard to help you set up your Cloud Databases MySQL instances.

To upload a Grafana dashboard that shows your MySQL instances,
complete the following steps:

1.  Download the Grafana dashboard JSON file from
    <http://bit.ly/mysql-grafana>.
2.  Modify the JSON to match your instance by replacing all the
    instances of `\_rax\_entity\_id\_` in the file with the entity ID of
    your database instance.

    <img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-replace-entty-id1.png %}" width="639" height="76" />

3.  On the Grafana dashboard, click the folder icon in the top-right corner, click **Import**, click **Choose File**, and then upload the file to Grafana.

    The dashboard automatically appears and displays your MySQL database
    instances.

    <img src="{% asset_path rackspace-metrics/create-a-grafana-dashboard-for-rackspace-metrics/grafana-mysql-data.png %}" width="428" height="337" />

#### (Optional) Use Annotation
With annotation support, users can submit change event to show along with the graph, adding additional information for the graph on the dashboard. See [Use annotation metrics](/how-to/use-annotation-metrics) for additional information.

### Grafana FAQ

#### How much does Grafana cost?

You pay only for the cost of the server that you create. Everything else
is no cost.

Grafana is an open-source metrics dashboard and graph editor. There is
no cost to the software itself. You can choose to deploy it anywhere and
you are responsible only for maintaining and paying for the server it
runs on.

We want you to have access to your metrics so you can make informed
decisions about your infrastructure. Our monitoring service is no cost,
and so are the metrics that we store.

#### Should I use Rackspace Intelligence or Grafana?

[Rackspace Intelligence](http://intelligence.rackspace.com/) is
another no-cost option that we provide to help you make your
infrastructure choices. It is designed to answer the most obvious
questions that anyone asks about their servers. Although it covers many
use cases and has a certain amount of customization, if you want total
customizability, you can use Grafana as an alternative.

As an additional comparison, Rackspace Intelligence does more than just
graphs; it is a control panel that enables you to manage your Rackspace
Monitoring configuration. Although Grafana might give you total control
over your graphs, Rackspace Intelligence gives you total control to
create, delete, and edit your monitoring configuration.

Rackspace Intelligence and Grafana are using the same metrics stored in
the Rackspace Metrics service. This means that you can try both and
choose the one that works well for you. For more information,
see [Getting started with Rackspace Intelligence for the
cloud](/how-to/getting-started-with-rackspace-intelligence-for-the-cloud).
