---
permalink: integrate-statsd-with-rackspace-metrics/
audit_date:
title: Integrate StatsD with Rackspace Metrics
type: article
created_date: '2015-02-05'
created_by: Constanze Kratel
last_modified_date: '2016-12-13'
last_modified_by: Shane Duane
product: Rackspace Metrics
product_url: rackspace-metrics
---

This article describes how to configure StastD to send metrics to Rackspace Metrics. If you don't have StatsD installed, follow the instructions on the [StatsD Website](https://github.com/etsy/statsd/blob/master/README.md).

You can view metrics submitted through StatsD using the following methods:

- Use client script calling [Rackspace Metrics Query API](https://developer.rackspace.com/docs/metrics/v2/query-api-reference/) directly.
- Use [Grafana dashboard](/how-to/create-a-grafana-dashboard-for-rackspace-metrics/)

**Note:** Rackspace Intelligence does not allow visulaziation of any metrics submitted outside Rackspace Monitoring at this time.

To configure StatsD for the Rackspace Metrics service, complete the
following steps:

-   Configure StatsD for Rackspace Metrics
-   Integrate with your blueflood instance
-   Restart StatsD

### Configure StatsD for Rackspace Metrics

1. Navigate to the StatsD directory:

        cd /path/to/statsd

2. Install the StatsD backend engine:

        npm install statsd-blueflood-backend

      If the installation is successful, you should see the module under node_modules.

3. Create a StatsD config file called **local.config** and add the following configuration information. Be sure to set the `deleteIdleStats` flag to true.

        {
         backends: ["statsd-blueflood-backend"],
         port: 8125,
         flushInterval: 10000,
         dumpMessages: true,
         deleteIdleStats: true,
         "blueflood": {
             "tenantId": "<tentant_id>",
             "endpoint": "https://global.metrics-ingest.api.rackspacecloud.com/v2.0",
             "authModule": "./auth",
             "authClass": "RaxAuth",
             "authParams": {
                     "raxusername": "<username>",
                     "raxapikey": "<api key>"
             }
           }
         }

4. Run StatsD with the configuration you provided:

    nodejs stats.js local.config

### Integrate with your blueflood instance

To configure your StatsD to integrate with your own [blueflood instance](https://blueflood.io), you need to modify the end point URL.  This configuration assumes that blueflood ingestion is running on  IP address http://127.0.0.1 and port 19000.

        {
        backends: ["statsd-blueflood-backend"],
        port: 8125,
        flushInterval: 10000,
        dumpMessages: true,
        deleteIdleStats: true,
        "blueflood": {
            "tenantId": "<tenant_id>",
            "endpoint": "http://127.0.0.1:19000",
            "authModule": "./auth",
            "authClass": "RaxAuth",
            "authParams": {
                    "raxusername": "<username>",
                    "raxapikey": "<api_key>"
            }
          }
        }

### Troubleshooting tip

If you encounter an error that the server cannot find the
module `statsd-blueflood-backend`, then check if that module has been installed:

    ls node_modules

If everything has been configured correctly, the nodejs StatsD server should be up and running now as shown in the following example:

    12 Sep 15:25:40 - reading config file: local.config
    12 Sep 15:25:41 - server is up

### Test the configuration

 StatsD continuously generates a series of statistics. These stats are sent to Rackspace Metrics on a regular basis if everything is configured correctly:

    { counters: { 'statsd.bad_lines_seen': 0, 'statsd.packets_received': 0 },
      gauges: {},
      timers: {},
      timer_counters: {},
      sets: {},
      counter_rates: { 'statsd.bad_lines_seen': 0, 'statsd.packets_received': 0 },
      timer_data: {},
      pctThreshold: [ 90 ],
      histogram: undefined,
      statsd_metrics: { processing_time: 0 } }

You can also send StatsD timers, counters, and gauges.

StatsD sends all these items to Rackspace Metrics:

    echo "sample.gauge:10|g" | nc -u -w0 127.0.0.1 8125
    echo "glork:320|ms" | nc -u -w0 127.0.0.1 8125
