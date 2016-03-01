---
node_id: 4866
title: Create a Grafana dashboard for Rackspace Metrics
type: article
created_date: '2015-10-19'
created_by: Constanze Kratel
last_modified_date: '2016-02-15'
last_modified_by: Nate Archer
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
    After the template is complete, you will see a page that displays
    information about your custom template, including a description.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-customized-template1.png" width="513" height="297" />


8.  From the **Actions** menu, choose **Create Stack from Template**.
9.  On the **Create Stack** page, enter a name for the stack and then
    enter values for the following fields under **Server Settings**. Use
    the values for your Rackspace account, and overwrite the &ldquo;not valid&rdquo;
    values that are populated by default.
    -   **API key**
    -   **username**
    -   **tenant ID** (your account number)

10. Click **Create Stack**.
    The stack details page is displayed.
    While the stack is being built, the **Status** is **Building**.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-create-stack-building.png" width="449" height="400" />


When the stack has finished building, the **Status** field changes to
**Up**. The page also displays an IP address, a Grafana auth password,
and a Grafana auth username that you can use to access your Grafana
dashboard. Be sure to record this information.

<img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-metrics-up1.png" width="408" height="600" />

### Use the Grafana dashboard

Now that you have created your stack, you can access the Grafana dashboard that contains all the relevant information for your stack.

To access the Grafana dashboard, perform the following steps:

1.  Open a web browser.
2.  Type the IP address in the address bar. 
    You are prompted with an authentication page.
3.  Type the username and password that were displayed after you created
    the stack and click **Log In**.
    Your Grafana dashboard is displayed.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-home-page_0.png" width="432" height="284" />

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

![](https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-monitoring-details_0.png)

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

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-replace-entty-id1.png" width="639" height="76" />
3.  On the Grafana dashboard, click the folder icon in the top-right corner, click **Import**, click **Choose File**, and then upload     the file to Grafana.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-JSON-file-upload.png" width="432" height="184" />

    The dashboard automatically appears and displays your MySQL database
    instances.

    <img src="https://8026b2e3760e2433679c-fffceaebb8c6ee053c935e8915a3fbe7.ssl.cf2.rackcdn.com/field/image/grafana-mysql-data.png" width="428" height="337" />

#### (Optional) Use Annotation
With annotation support, users can submit change event to show along with the graph, adding additional information for the graph on the dashboard. See [Use annotation metrics](/how-to/use-annotation-metrics) for additional information. 

#### (Optional) Use Enum metrics

The enum metrics release will allow you to push state based metrics (enums) and get the report from API on the frequency of occurrence of the values. For example, a common report for the IT teams to provide the uptime report based on the occurrences of the response codes from the server, or the state of the alerts during a period of time. Enum support is a stepping stone by providing the data to be used in report or visualization.  See [Use enum suport](/how-to/use-enum-metrics-support) for additional information.

For API commands and additonal information about sending enum metrics, see [Sending enum metrics](https://developer.rackspace.com/docs/metrics/v2/developer-guide/#sending-enum-metrics) in the API documentation.

For API command and additional informationon about retrieving enum metrics, see [Retrieving enum metrics](https://developer.rackspace.com/docs/metrics/v2/developer-guide/#retrieving-enum-metrics) in the API documentation.

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
