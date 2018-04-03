---
permalink: getting-started-with-rackspace-monitoring-cli/
audit_date:
title: Get Started with Rackspace Monitoring CLI
type: article
created_date: '2012-04-04'
created_by: Rackspace Support
last_modified_date: '2016-1-22'
last_modified_by: Constanze Kratel
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

Rackspace Monitoring is an API driven cloud service built for infrastructure
monitoring.  It offers a simple yet powerful feature set, allowing
extreme flexibility in configuration and execution.

This guide is intended to be a supplement to the 
[Rackspace Monitoriing Developer Guide](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/),
not a replacement for it.

Getting started with an API-based monitoring system can be daunting when
trying to rapidly scale infrastructure. To get your feet wet with the
API, we have created **Raxmon**, a Command Line Interface (CLI) tool.


### Step One: Setup

### Install the Raxmon CLI

To avoid repeating the raxmon installation on each new Cloud Server,
install it on your workstation and not your server.

**Note**: raxmon requires Python 2.5, 2.6 or 2.7. Be sure that Python is
installed before proceeding.

The Rackspace-Monitoring CLI tool is available here as open source:
<https://github.com/racker/rackspace-monitoring-cli>.

The utility can be installed via
[PIP](http://www.pip-installer.org/en/latest/installing.html):

    sudo pip install rackspace-monitoring-cli

### Getting your API Key

You will need to [obtain your API
key](/how-to/view-and-reset-your-api-key)
in order to be able to administer Rackspace Monitoring.

Once you've obtained your API key, go to your Home folder (you can use
**cd \~/**) and create a file named **.raxrc**, and add the following configuration information:

    [credentials]
    username=MY_USERNAME
    api_key=MY_API_KEY

An additional section is required in order to make use of the UK
authentication endpoint (the default URL points to the US endpoint):

    [auth_api]
    url=https://lon.identity.api.rackspacecloud.com/v2.0/tokens

Now run raxmon to see that you can connect properly.

    $ raxmon-entities-list

If the output includes a Trackback of the most recent calls,
Congratulations! It works!


### Step Two: Familiarize yourself with Raxmon


Raxmon CLI has a variety of commands and abilities at its disposal. This
section walks you through generating one of the most used checks, an
HTTP check.

HTTP checks continually submit **GET** requests to your webpage and make
sure that it responds and doesn't time out, the connection gets refused, and
triggers an alert if the response is something like a 404.

Raxmon mostly follows CRUD methodology, Create, Read (list), Update,
Delete with five types:

-   [Checks](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/check-operations)
-   [Entities](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/entities-operations)
-   [Alarms](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/alarms-operations)
-   [Notifications](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notifications-operations)
-   [Notification Plans](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notification-plans-operations)

Type \$ **raxmon --help** to see all of the commands available to
raxmon.

You may need to update multiple items in one go, so let's review how to
input lists and dictionaries in the terminal:

- For **lists**, use a comma delimited string. For example:
      raxmon-checks-create --monitoring-zones=mzA,mzB,mzC

- For **dictionaries**, se a comma-delimited string of key=value pairs. For example:

      raxmon-entities-create --metadata="location=server room,tag=foobar"


### Step Three: Monitor an HTTP page


### Create an entity

[Entities](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/entities-operations)
are Rackspace Monitoring's name for server-like objects. Anything that has
an IP address is defined as an entity. Currently Rackspace Monitoring has no
concept of our environment, so lets create an entity. The
option `--ip-addresses="alias=10.10.10.10"` specifies
the IP address and an alias for the target. You can have multiple
targets per node.</span>

    $ raxmon-entities-create --label my_first_server --ip-addresses="alias=10.10.10.10"

If the operation was successful, you'll receive the following message:

    Resource created. ID: entZ4JPIfA

Now we need to create a
[check](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#checks)
. To create a check we'll need a few things.

-   **Check Type** - In this case,
    [remote.HTTP](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#remote-http).
-   A **Label**
-   **Entity ID** - In this case 'entZ4JPIfA' as returned in the example
    above
-   **Monitoring
    Zone** -
    The data center we're going to monitor from
-   **Target Alias** - A key in the entity's 'ip\_addresses' hash used to
    resolve this check to an IP address.
-   Any check-specific details.

We have all of these, except the monitoring
zone.
Let's get that information now.

    $ raxmon-monitoring-zones-list

If the operation was successful, you'll receive the following message:

    <MonitoringZone: id=mzdfw label=dfw provider=Rackspace Monitoring ...>
    <MonitoringZone: id=mzhkg label=hkg provider=Rackspace Monitoring ...>
    <MonitoringZone: id=mzlon label=lon provider=Rackspace Monitoring ...>
    <MonitoringZone: id=mzord label=ord provider=Rackspace Monitoring ...>
    Total: 4

Now, lets create a check. You'll use the Entity ID returned above, and
the name of the Target Alias we created before.

    $ raxmon-checks-create --type remote.http --label http --entity-id entZ4JPIfA --monitoring-zones mzord --details="url=www.example.com,method=GET" --target-alias eth0

If the operation was successful, you'll receive the following message:

    Resource created. ID: chNbqDaZrJ

### Notification addresses and alarms

Checks are great, but you also need to be able to receive
[notifications](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notifications-operations).
Lets create an e-mail address notification type now.

    $ raxmon-notifications-create --label example-email --type email --details="address=user@email.com"

If the operation was successful, you'll receive the following message:

    Resource created. ID: ntYgMnnipC

You also need to create a [notification
plan](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/notification-plans-operations).
This allows Rackspace Monitoring to emit different types of alerts on
different states.

    $ raxmon-notification-plans-create --label notification_plan_1 --critical-state ntYgMnnipC --warning-state ntYgMnnipC --ok-state ntYgMnni

If the operation was successful, you'll receive the following message:

    Resource created. ID: npzwIZKV6o

Notifications are only emitted when the state changes. When a plan moves
from **OK** state to **Critical** state, it will notify the "Critical State
Notification." When it then changes from **Critical** to **OK** the "OK State
Notification" will be used.

Now that you have a notification address and plan, you also need to
create the
[alarm](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#document-api-operations/alarms-operations)
itself. Rackspace Monitoring uses alarms to evaluate the metrics
of a check and decide if a notification plan should be executed.

    $ raxmon-alarms-create --check-id=chNbqDaZrJ --criteria "if (metric[\"code\"] regex \"^[23]..$\") { return OK } return WARNING" --notification-plan npzwIZKV6o --entity-id entZ4JPIfA

Great! That's it. You now have a check, notification, and alarm. Lets
look at the details:

    raxmon-alarms-list --entity entZ4JPIfA --details

This returns the following information:

    {'criteria': u'if (metric["code"] regex "^[23]..$") { return OK } return WARNING', 'driver': <rackspace_monitoring.drivers.rackspace.RackspaceMonitoringDriver object at 0x101d66710>, 'entity_id': u'entZ4JPIfA', 'id': u'albuOSvLjf', 'notification_plan_id': u'npzwIZKV6o','type': u'remote.http'}

Now anything but a 2XX or 3XX will return an error and you will be
notified via e-mail.

### Conclusion


With these simple principles, you'll be able to create a robust and
scalable monitoring system that gives you better insight into
your infrastructure.  For more information, be sure to consult the
[Development Guide for Rackspace
Monitoring](https://developer.rackspace.com/docs/cloud-monitoring/v1/developer-guide/#developer-guide)
as well as the [Rackspace Monitoring
FAQ](/how-to/rackspace-monitoring-faq).
