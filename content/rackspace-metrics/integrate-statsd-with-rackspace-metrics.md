---
permalink: integrate-statsd-with-rackspace-metrics/
audit_date:
title: Integrate statsD with Rackspace Metrics
type: article
created_date: '2015-02-05'
created_by: Constanze Kratel
last_modified_date: '2016-07-14'
last_modified_by: Nate Archer
product: Rackspace Metrics
product_url: rackspace-metrics
---

This article describes how you can configure your StastD to send metrics to Rackspace Metrics. If you don't have StatsD installed, please check out [StatsD Website](https://github.com/etsy/statsd/blob/master/README.md) first.

To configure StatsD for the Rackspace Metrics service, you just need to complete the
following easy steps:

-   Install the blueflood module for StatsD
-   Configure with your Rackspace account information
-   Restart StatsD

### Configure StatsD for Rackspace Metrics

1. Navigate to the statsd directory by typing the following:

        cd /path/to/statsd

2. Install the statsd backend engine by typing the following:

        npm install statsd-blueflood-backend

      If the installation is successful, you should see the module under node_modules.

3. As a next step, create a statsd config file called **local.config** and add the following configuration information. Be sure to set the `deleteIdleStats` flag to true.

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

4. Run statsd with the configuration you have provided by typing the following:

    nodejs stats.js local.config

### Integrate with Your Own Blueflood Instance

To configure your statsd to integrate with your own [blueflood instance](https://blueflood.io), you need to modify the end point URL.  This configuration assumes that blueflood ingestion is running on  IP address http://127.0.0.1 and port 19000.

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
module "statsd-blueflood-backend", then type the following to check if that module has been installed:

    ls node_modules

If everything has been configured correctly, the nodejs statsd server should be up and running now as shown in the following example:

    12 Sep 15:25:40 - reading config file: local.config
    12 Sep 15:25:41 - server is up

### Test the configuration

 Statsd keeps generating a series of statistics. These stats are sent to Rackspace Metrics on a regular basis if everything is configured correctly:

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

You can also send statsd timers, counters, and gauges as shown in the
following article:
<https://www.digitalocean.com/community/tutorials/how-to-configure-statsd-to-collect-arbitrary-stats-for-graphite-on-ubuntu-14-04>.

Statsd sends all these items to RAckspace Metrics:

    echo "sample.gauge:10|g" | nc -u -w0 127.0.0.1 8125
    echo "glork:320|ms" | nc -u -w0 127.0.0.1 8125
