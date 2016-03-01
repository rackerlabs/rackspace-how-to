---
node_id: 4553
title: Integrate StatsD with Rackspace Metrics
type: article
created_date: '2015-02-05'
created_by: Constanze Kratel
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Metrics
product_url: rackspace-metrics
---

To deploy the Rackspace Metrics service, you first need to complete the
following steps:

-   Install the Rackspace Metrics Statsd backend engine
-   Integrate with Rackspace Metrics

### Install the Rackspace Metrics Statsd backend engine

1. First clone the statsd repository by typing the following at a command-line
interface:

        git clone https://github.com/etsy/statsd.git

2. Then, in a separate directory, clone the statsd backend engine by typing the following:

        git clone git@github.com:tilogaat/blueflood-statsd-backend.git

3. Install nodejs by typing the following:

        sudo apt-get install nodejs

      If you are running Ubuntu, another program called node installed. Be sure to delete this program and then install nodejs.

4. Install the node package manager program npm by typing the following:

        sudo apt-get install npm

5. Navigate to the statsd directory by typing the following:

        cd /path/to/statsd

6. Install the statsd backend engine by typing the following:

        npm install /path/to/blueflood-statsd-backend

      If the installation is successful, you should see the module under node\_modules.

7. As a next step, create a statsd config file called *local.config* and add the following configuration information:

        {
        backends: ["statsd-blueflood-backend"],
        port: 8125,
        flushInterval: 10000,
        dumpMessages: true,
        deleteIdleStats: true,
        "blueflood": {
            "tenantId": "333333",
            "endpoint": "http://127.0.0.1:19000",
            "authModule": "./auth",
            "authClass": "RaxAuth",
            "authParams": {
                    "raxusername": "my_cloud_user_name",
                    "raxapikey": "my_rax_api_key"
            }
          }
        }

    This configuration assumes that blueflood ingestion is running on  IP address http://127.0.0.1
      and port 19000 (You can view an example configuration here:
      https://github.com/etsy/statsd/blob/master/exampleConfig.js).
      Be sure to set the `deleteIdleStats` flag to true.


### Integrate with Rackspace Metrics

To ingrate your statsd configuration with Rackspace Metric, you need to add your Rackspace Cloud account username and Api key to the configuration file. If the API key is
present, the metrics are sent to the Rackspace Metrics endpoint. If
not, the metrics are sent to the endpoint that is specified in the configuration:

      "blueflood": {
        "tenantId": "333333",
        "endpoint": "http://iad.metrics-ingest.api.rackspacecloud.com:80",
        "authModule": "./auth",
        "authClass": "RaxAuth",
        "authParams": {
          "raxusername": "my_cloud_user_name",
          "raxapikey": "my_rax_api_key"
        }
      }

Now you can run statsd with the configuration you have provided by typing the following:

    nodejs stats.js local.config

**Troubleshooting tip**

 If you encounter an error that the server cannot find the
module "statsd-blueflood-backend", then type the following to check if that module has been installed:

    ls node\_modules

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
https://www.digitalocean.com/community/tutorials/how-to-configure-statsd-to-collect-arbitrary-stats-for-graphite-on-ubuntu-14-04.

Statsd sends all these items to RAckspace Metrics:


    echo "sample.gauge:10|g" | nc -u -w0 127.0.0.1 8125
    echo "glork:320|ms" | nc -u -w0 127.0.0.1 8125
