---
permalink: network-device-reboot-faq/
audit_date: '2017-01-16'
title: Network device reboot FAQ
type: article
created_date: '2017-01-16'
created_by: Aaron Hackney and Trevor Becker
last_modified_date: '2017-12-20'
last_modified_by: Trevor Becker
product: Dedicated Hosting
product_url: dedicated-hosting
---

The MyRackspace Portal now has a new reboot option for network devices. This reboot option gives you the control and flexibility to reboot your network device during a maintenance window that best fits your business needs. You can also use this option when your device experiences security vulnerabilities. During such an event, Rackspace prestages patched versions of software code so that you can reboot and upgrade the code version of your device at will.

The rest of this article provides answers to frequently asked questions about the new reboot option.

### General

#### What does the reboot process do?

The warm-boot process reboots your network appliance which resets all memory utilization. The device loads the preconfigured operating system from primary storage and reloads the device’s saved configuration.

#### Why would I want to reboot my network device?

Generally, you need to reboot a network device only when a new version of the operating system needs to be loaded or the operating system contains a bug that has caused processes on the device to operate improperly. Rackspace prestages the new operating system or the operating system updates on the network device. During the next reboot, the operating system is updated to the staged code. Rackspace notifies you when new code is staged on your device so that you are aware of any pending updates.
 
#### When should I reboot my network devices?

You can reboot your network devices whenever you like. Rackspace highly recommends that except in the case of emergency, you always reboot your network devices in a maintenance window when you expect the least impact to your production or business.

#### Can I schedule the reboot?

Yes, you can schedule a reboot to occur. We have a "Schedule Reboot" feature built into our MyRackspace portal. For more information about scheduling a reboot, see the [Scheduling a network device reboot](https://support.rackspace.com/how-to/schedule-network-device-reboot/) article.

#### I was notified that my network device is vulnerable to a bug or a security related exploit. How do I proceed?

If you were notified by Rackspace that your network device is vulnerable to a bug or a security related exploit, you should also have been notified that the code has been staged on your network device. After the next reboot, you will be running updated code that remediates the issue.


#### How long does a network device take to reboot?

A network appliance device takes approximately 4 to 5 minutes. This estimation is slightly variable based on the platform and the size of the device configuration.

#### What will be “down” while my network device reboots?

Every device located behind the network device will be unavailable while the device reboots, unless you have a high availability (HA) solution.

#### Will any “device down” alerts be generated while my network devices reboot?

No alerts should be generated. During the reboot process, alert suppression is put in place for any devices behind the network device. This alert suppression is removed after the reboot process has completed.
 
#### Who can reboot my network device?

Any contact on your account that has administrative or edit permissions on the network
device can start the reboot process in the MyRackspace Portal.
 
#### What specifically occurs during the reboot process?

The following events occur during this process:

1. A ticket is created to track the reboot process and actions.
2. The boot code version is checked.
3. The device configuration is backed up,
4. The current running configuration is saved to non-volatile memory.
5. Device alert generation is suppressed.
6. The device is reloaded.
7. Alert suppression is lifted.
8. The ticket is updated with the relevant details of the reboot, including the code version running when the process completes.
 
#### What risks are associated with a reboot event?

The biggest risk during in a network device reboot is hardware failure. This risk can be lessened by employing a high availability (HA) solution.

#### What if something goes wrong (like a hardware failure)?

The process monitors the reboot actions. If the device does not recover in the expected amount of time, an emergency ticket is sent to the Rackspace Netsec ticket queue with an emergency priority. The ticket is picked up immediately, ahead of all others, and the situation is treated as a “network down” emergency. If an HA solution is in place and the standby device fails the reboot process, then the process is halted, the primary device continues to pass traffic, and the failed device is handled as stated previously.


### Reboots for high-availability network device pairs
 
#### I have an HA network device pair. How does the reboot process work in this case?

Either device can own the primary device role at any time. The reboot process first determines which device is currently the active device and which device currently owns the standby role. The standby device is rebooted first. After the standby device has been rebooted and is in a healthy status, the network traffic fails over to this device (which is now the active device) and the formerly active device is rebooted. After the formerly active device has rebooted, it assumes the standby role, and the process is complete. 

#### In my HA pair, which network device should I reboot?

You can select either of the HA network devices for reboot. The reboot process
determines which device owns the standby role and which device owns the primary role
 
#### In my HA pair, do I need to reboot both network devices?

No, you need to click the reboot button for only one network device in your HA pair. After the process starts, both devices are rebooted.

