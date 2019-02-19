---
permalink: planned-maintenance-for-vmware-guest-introspection-drivers/
audit_date: '2018-10-11'
title: Planned maintenance for VMware Guest Introspection drivers
type: article
created_date: '2018-10-11'
created_by: Scot Stine
last_modified_date: '2018-10-22'
last_modified_by: Catherine Richardson
product: Dedicated Hosting
product_url: dedicated-hosting
---

Rackspace has identified a potential issue with the VMware&reg; Guest
Introspection drivers for Microsoft&reg; Windows&reg; devices. Windows VMware
virtual machines (VMs) with NSX&reg; Network Introspection drivers (**vnetflt.sys**
and **vsepflt.sys**) might temporarily lose Transmission Control Protocol (TCP)
network connectivity for new connections. To mitigate potential future issues,
Rackspace is performing a maintenance to disable these drivers on Windows VMware
VMs.

### Frequently asked questions

Q: Will my devices be rebooted as part of this remediation?

A: No, Rackspace will *not* reboot your devices as part of our remediation
plan. However, a reboot is required for the changes to take effect.

**Note**: Your servers will likely reboot during your normal, scheduled patching
cycle to apply the patches. Full remediation is complete after the reboot.

Q: Only some of my Windows VMs are listed in my support ticket. Why is this?

A: Following are two reasons that devices don't appear on that ticket:

1) For all devices provisioned after April 20, 2017, the Guest Introspection
Driver is disabled by default during the provisioning process. As a result,
only devices provisioned before this date have been identified for remediation.

2) If your devices are on Rackspace patching and scheduled for different weeks
(pre/default/post cycles), you will receive a new ticket for devices in each of
the patching cycles. This is by design for both automation and the reboots that
occur naturally as part of the patching process.

Q: Why is Rackspace aligning the remediation plan to Windows patching cycles?

A: Rackspace understands that unexpected downtime is impactful to customer
solutions. We force reboots only when we believe they must occur. Microsoft
patching using cumulative updates naturally requires a reboot. Because this
remediation effort also requires a reboot to be effective, we are scheduling
the automation to set up remediation and allow the reboots to occur in
accordance with your normal patching schedule.

Q: Do I need to take any action?

A: It depends on your patching solution:

1) If your devices are configured for automated patching on the Rackspace
schedule, no additional action on your part is required. Our automation
maintenance will run on your servers to remediate the issue. During your
prescribed patching schedule, Windows patches are applied, and the device
reboots automatically.

2) If you are on your own patching schedule, the automation will still run on
your servers to remediate the issue. At your discretion, either (1) wait until
the next set of patches are applied to your servers (devices will reboot
automatically), or (2) schedule reboots through the MyRackspace Portal.

Q: Can I reboot devices myself after the maintenance?

A: Yes, you can reboot devices any time after the maintenance window. You know
your operational requirements and when your devices can incur downtime. If you
keep patching up to date, your servers will reboot the next time they are
patched. You can also schedule reboots through the MyRackspace Portal or do them
manually.

Q: Do I need to respond to this notification?

A: No. However, if you have questions that have not been answered here, please
update the ticket or contact your account team – we’re always happy to help.

Q: Can we upgrade VMWare Tools to a later version?

A: Updating or upgrading is not a valid path to resolution. VMware has indicated
the issue might be present in all versions of these drivers. The drivers are not
in use in your environment because only certain VMware vSphere add-on products use
this feature of VMware Tools. Proper resolution of the issue is removal of the
offending drivers. Because our goal is to prevent disruption to your environment to
the extent possible, we’ll disable the driver during the automation maintenance and
utilize your normal scheduled patching process to reboot the device to effectively
remediate this issue.

Q: How will I know if automation has been successfully run on my device?

A: Rackspace will be updating tickets informing you that the automation has
succeeded.

Q: Where can I get more information?

A: If you would like more information on this issue, see the
[documentation provided by VMware](https://kb.vmware.com/s/article/2148218).
