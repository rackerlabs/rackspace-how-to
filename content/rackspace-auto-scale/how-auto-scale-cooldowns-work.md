---
permalink: how-auto-scale-cooldowns-work/
audit_date:
title: Auto Scale Cooldowns
type: article
created_date: '2013-12-21'
created_by: Maria Abrahms
last_modified_date: '2016-05-31'
last_modified_by: Stephanie Fillmon
product: Rackspace Autoscale
product_url: rackspace-auto-scale
---

Cooldowns enforce a period of time between possible actions. Auto Scale
has the following types of cooldowns:

-   **Group Cooldowns**
-   **Policy Cooldowns**

**Note**: Cooldowns are mainly relevant to event-based scaling policies
because those policies are triggered by events that could occur before a
required minimum cooldown period ends. However, a schedule-based policy
will not override a cooldown and will not run during a cooldown
period.

### Use a group cooldown

When you set a group **Minimum Cooldown**, you are restricting the
ability of the group to change in response to a policy. If you have
configured event-based policies, an event, or multiple events, to scale
up or scale down could happen before enough time has elapsed for the
servers to fully deploy, in the case of a scale-up; or for all
transactions to finish, in the case of a scale-down. A group cooldown
ensures that at least a minimum amount of time passes before a scale-up
or scale-down triggered by an event-based policy, can occur.

For example, if you have three separate monitoring alerts for a server
and each alert is configured with a webhook to your Auto Scale group to
trigger a scale-up event if the alarm state goes critical, in the event
of all three monitoring alerts going critical at the same time, there
could be three separate but near-simultaneous requests to scale up.
Having a minimum cooldown of 30 minutes would allow only one of the
scale-up events to occur within 30 minutes--the other two alerts would
not be acted upon and do not iterate.

This feature is mostly used to ensure that servers being added in a
scale-up have enough time to fully deploy. The required minimum cooldown
is not about how many servers you may add at once - all servers are added
at the same time. It is about the complexity of the servers that you are
adding. If the servers that you add are very complex, they need a longer
minimum cooldown period in order to fully deploy. You should set the
group minimum cooldown to the length of time that it takes for one
server to fully deploy.

### Use a policy cooldown

When you set a policy **Cooldown**, you are restricting the
executability of the policy by requiring a period of time to pass before
the policy can be executed again - even if it is triggered by an event. A
policy cooldown controls how often a single, specific, policy can be
executed. For example, a scale-up policy cooldown restricts how often
the scale-up is executed despite being triggered by an event, which
allows scale-ups to fully deploy before another scale-up can occur.
Conversely, a scale-down policy cooldown can allow for the graceful
removal of servers by restricting the removal of too many servers at
once even if multiple scale-downs are rapidly triggered. Policy
cooldowns allow you to scale up fast and scale down slowly.

### Cooldowns graph

The following graphs illustrate how cooldowns affect policy execution:

<img src="{% asset_path rackspace-auto-scale/how-auto-scale-cooldowns-work/Slide6.png %}" width="720" height="540" />

<img src="{% asset_path rackspace-auto-scale/how-auto-scale-cooldowns-work/Slide7.png %}" width="720" height="540" />
