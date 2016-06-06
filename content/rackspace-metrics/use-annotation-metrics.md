---
permalink: use-annotation-metrics/
audit_date:
title: Use annotation metrics
type: article
created_date: '2016-02-23'
created_by: Kyle Laffoon
last_modified_date: '2016-02-25'
last_modified_by: Kyle Laffoon
product: Rackspace Metrics
product_url: rackspace-metrics
---

Grafana is a popular and beautiful dashboard tool for IT Ops. Rackspace Metrics is designed to meet the functional and performance requirements of enterprise-scale metrics. By integrating with Grafana, Rackspace Metrics changes the cost-structure of metrics collection by replacing the storage component without changing the users' workflow.

With the annotation pushed to Rackspace Metrics showing up in Grafana dashboard, customers can now gain insight into the events that might be the cause of the changes in the performance graph.

### Detailed Information

The concept of "Annotation" can be traced back easily to a blog post by Etsy team, where they use it to make events like release to show up in the performance graph, often providing valuable insights into the changes on the graph.

Through Grafana, Rackspace Metrics users can create dashboard that can help identify the performance changes in the system.  While detection is the first step towards managing the application, the next step is often to figure out what has changed.

<img src="{% asset_path rackspace-metrics/use-annotation-metrics/Anotationsupport-what-changed.png %}" alt="" />

With annotation support, users can submit change event to show along with the graph, adding additional information for the graph on the dashboard. See [Request an annotation](https://developer.rackspace.com/docs/metrics/v2/developer-guide/#retrieve-an-annotation) for additional information. (Mock-ups below)

<img src="{% asset_path rackspace-metrics/use-annotation-metrics/Anotattionsupport-change-event.png %}" alt="" />

#### Ingesting Annotation through API

Annotation is submitted through /events API end point:

    curl https://global.metrics-ingest.api.rackspacecloud.com/v2.0/737305/events -X POST -d '{
          "what": "app03 deployment",
          "when": 1452105873000,
          "tags": "deployment",
          "data": "deploying prod"
        }
    ' -H 'X-Auth-Token: e0247392bdd04ef0afa4f0b868fe99a4' -H 'Content-Type: application/json' -H 'Accept: application/json'

**Note**: The value for the "when" field is the epoch time in milliseconds.  To convert the date strings to and from epoch time, you can use the "date" method in Mac or [http://www.epochconverter.com/](http://www.epochconverter.com/)

    > date +%s
    1452101351

    > date -j +%s -f "%a %b %d %T %Z %Y" "Mon Jan  4 12:43:57 PST 2016"
    1451940237

    > date -j -f "%m/%d/%Y %T %Z" "01/04/2016 12:43:57 PST" +%s
    1451940237

    > date -r 1451940237
    Mon Jan  4 12:43:57 PST 2016

### Adding Annotation to Grafana dashboard

1. Click on the gear icon in the upper right-hand corner to open the **Settings** menu and select the **Features** tab.

2. Select the **Annotations** checkbox to enable annotations.

3. On the **Add** tab, enter a name for the annotation and select **RackspaceMetrics** as the datasource.

   <img src="{% asset_path rackspace-metrics/use-annotation-metrics/Annotationsupport-datasource.png %}" alt="" />

4. Add Annotation by Searching for the tag in the **Blueflood event tags** field.

   <img src="{% asset_path rackspace-metrics/use-annotation-metrics/Anotattionsupport-change-event.png %}" alt="" />

The new annotation shows up in Grafana.

<img src="{% asset_path rackspace-metrics/use-annotation-metrics/Annotationsupport-annotation-appears.png %}" alt="" />

### (optional) Retrieve Annotation from API

If you prefer to use the API command to retrieve your annotation, use the following command.

    curl -i -X GET 'http://global.metrics.api.rackspacecloud.com/v2.0/737305/events/getEvents?from=1452105863000&until=1452105883000' \
    > -H "Content-Type: application/json" \
    > -H "Accept: application/json" \
    > -H "X-Auth-Token: AABlXo00elZk9FEtn2MGz8QQ9v3GD86AEZ_LbMe3yHyC43GE9pTFNXqVxYLq92FPwED0sDkYS8c1R222AWMS1y4nqTG3NmRofHmj4S0lfPsz3YXBTtFaXDac"
    HTTP/1.1 200 OK
    Date: Wed, 06 Jan 2016 18:45:38 GMT
    Via: 1.1 Repose (Repose/6.0.2), 1.1 540559-DFW1WWSG03.secops.rackspace.com
    Access-Control-Allow-Origin: *
    Server: Jetty(9.2.z-SNAPSHOT)
    Content-Length: 114
    Age: 0

    [{"tags":"deployment","tenantId":"737305","what":"app03 deployment","when":1452105873000,"data":"deploying prod"}]

### Pricing

Rackspace Metrics comes bundled free with any cloud or dedicated customer.

### FAQ

#### How can I learn more about Rackspace Metrics product?

Product Overview:  [http://bit.ly/rax-metrics-overview](http://bit.ly/rax-metrics-overview)

Grafana support blog post:  [http://bit.ly/grafana-cloudmetrics](http://bit.ly/grafana-cloudmetrics)

#### Why don't I see the events that I just pushed?

Make sure all your API calls have 200 OK response code.

  - If it is 403 Forbidden and your API call into other end points (like Rackspace Monitoring) with the same tenant and auth token works, check with metrics team to make sure that the account is in EAP program.

Make sure that the dates of the events are within the time window specified by query.

#### How do I sign up an account for EAP?

Contact <cloudmetrics-earlyaccess@rackspace.com>. For more information on how to sign up for the Early Access Program, see the [Rackspace Metrics Developer Guide](https://developer.rackspace.com/docs/metrics/v2/developer-guide/#document-overview/early-access-program).
