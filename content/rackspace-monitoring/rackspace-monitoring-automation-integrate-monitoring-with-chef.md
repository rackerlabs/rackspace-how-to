---
permalink: rackspace-monitoring-automation-integrate-monitoring-with-chef/
audit_date:
title: Rackspace Monitoring Automation - Integrate Monitoring with Chef
type: article
created_date: '2012-08-14'
created_by: Rae D. Cabello
last_modified_date: '2016-01-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Do you leverage data center automation to build products faster? Do you
want a seamless way to define thresholds? Do you want to leverage some
of the easiest, most reliable technology to make monitoring a
breeze? Learn how to leverage the power of a full featured/hosted
monitoring system with Rackspace Monitoring!

### How?

-   Leverage all the primitives built as a lightweight resource in Chef.
     This means you have complete control
-   You're in total control - We run the monitoring system; however,
    it's a platform and this code bootstraps the integration. It's up to
    you to define what you want to monitor and how you want to
    be alerted.
-   We dog food this internally - we'll continue to improve this as we
    continue to find new and interesting ways to use it.
-   This is only the beginning - We'll continue to improve this cookbook
    as Rackspace Monitoring grows in functionality.

** **

**What do I need to get started?**

-   Chef knowledge
-   Ruby knowledge
-   Desire to reduce the time to monitor your infrastructure



### Prerequisites

Getting started requires downloading the cookbook. Right now the
Rackspace Monitoring git repo is hosted on github, but it will be an
official cookbook soon. Get the cookbook here:
[https://github.com/racker/cookbook-cloudmonitoring.](https://github.com/racker/cookbook-cloudmonitoring)

Install it into a chef repo and then you're ready to get started.

*Note: If you are unfamiliar with chef I recommend reading the [Opscode
Getting Started Guide](http://docs.opscode.com/#getting-started%20).
 This particular recipe uses data bags, read more about them here, that
assumes a chef version greater than 0.8.  Also make sure and brush up on
knife and how it works.*



### **Step 1: Create the initial encrypted data bag**

In order to manage the Rackspace Monitoring API, authentication
credentials need to be added to the node. There are various ways to
handle this, this recipe uses the encrypted data bag approach. Create
the following data bag with following initial values:

    $ knife data bag create --secret-file <secret-file> rackspace cloud
    { "id": "cloud", "username": "", "apikey": "", "region": "" }

Once created this will make it painless to use the recipes without
having to include API key and Rackspace Cloud account username for every
call. For information about how to find your API key, see [View and
reset your API
key](/how-to/view-and-reset-your-api-key).

### **Step 2: Add the default recipe to the runlist**

Next step is to add the cloud\_monitoring::default recipe to the run
list for the servers that will need monitoring. This identifies the
servers that will interact with the Rackspace Monitoring API. It will
also install all the gem dependencies needed to make calls with the
Rackspace Monitoring Gem. Use the knife command to add the default
recipe to the runlist:

    $ knife node run_list add <NODE> cloud_monitoring::default

Chef's runlist inheritance will also serve the same purpose.  If for
instance the cloud\_monitoring::default recipe is applied to the
production environment, then all production nodes will inherit the
recipe.



### **Step 3: Configure the initial node setup**

The approach on this cookbook focuses on flexibility for the user to use
it as they please. These particular instructions will use the recipe in
an opinionated way. As an example, the label of the entity will be the
hostname. This is a recommendation on how to leverage this recipe, but
not the only way. Creating an "Entity" is the first step of actually
using the API from Chef. The Entity maps to the target of what you're
monitoring.

Entity in most cases represents a server, loadbalancer or website.
However, there is some advanced flexibility but that is only used in
rare cases. This use-case will highlight populating your chef nodes in
Rackspace Monitoring. Learn more about all these concepts in the docs
and specifically the Concepts section of the developer guide:

    cloud_monitoring_entity "#{node.hostname}" do
      ip_addresses        'default' => node[:ipaddress]
      metadata            'environment' => 'dev', :more => 'meta data'
      action :create
    end

Woohoo, upon a chef run, an entity with that label will be created, or
if it exists it will be updated.  Another important point, if the chef
server ever goes away, the label of the entity will be matched up with
hostname (in this case).



### **Step 4: Create the first check**

After creating an entity, this describes one or more checks for that
target entity. It prescribes how often to poll a website, or which piece
of HTML to perform a regular expression match against. The documentation
goes into more depth in the Concepts section. Ping is the first check
created in this guide, it is simple to configure and really straight
forward:

After performing a chef run, the Rackspace Monitoring API should begin
pinging the specified entity. Since this snippet is using the
target\_alias feature, it points at the IP specified node\[:ipaddress\].
If that ever changes the check will automatically be updated. This is an
important feature of the Rackspace Monitoring API:

    cloud_monitoring_check  "ping" do
      target_alias          'default'
      type                  'remote.ping'
      period                30
      timeout               10
      monitoring_zones_poll ['mzord']
      action :create
    end



### **Step 5: Create an alarm**

An alarm describes how a user gets an alert based on a check.  It
matches the criteria to alert with a destination to send the
notifications. The alarm leverages our Javascript-like language to
create criteria based on metrics for a particular check. You can read in
depth about the alarm language here:
<https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#alarm-language>.

We are going to create an Alarm for a ping either not returning (which
would happen by default) or is below 80% or 95% on the number of
returned pings.By default the remote.ping check sends out 5 pings and if
3 came back, it would be marked as CRITICAL, if 4 came back it would be
WARNING, if 5 came back it would be marked as OK:

    cloud_monitoring_alarm  "ping alarm" do
      check_name            'ping'
      example_id            'remote.ping_packet_loss'
      notification_plan_id  'npTechnicalContactsEmail'
      action :create
    end

Three important things are happening in this example.

1. Since the entity recipe was placed before this stanza, it implicitly
selects the entityId for this or any check in scope.

2. **npTechnicalContactsEmail** is a default notification plan that sends to
the technical contacts on the account, if there is none it sends to the
primary contact on the account. If there is no one on the account, it
sends the Rackspace Monitoring team an email, which will in turn file a
ticket.

3. This uses the alarm example API detailed here. This particular
example uses the snippet below:

    ...
        {
            "id": "remote.ping_packet_loss",
            "label": "Ping packet loss",
            "description": "Alarm which returns WARNING if the packet loss is greater than 5% and CRITICAL if it's greater than 20%",
            "check_type": "remote.ping",
            "criteria": "if (metric['available'] < 80) {\n  return CRITICAL, \"Packet loss is greater than 20%\"\n}\n\nif (metric['available'] < 95) {\n  return WARNING, \"Packet loss is greater than 5%\"\n}\n\nreturn OK, \"Packet loss is normal\"\n",
            "fields": []
        }
    ...


### Done!

That's it. We now have monitoring for each server in your infrastructure
with at least ping checking. As you add servers Rackspace Monitoring
will automatically scale with you. As homework, work on adding more
complex checks like SSH and HTTP. We also support CPU, Disk and other
host-based metrics.
