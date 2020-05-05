---
permalink: nova-agent-unix-and-rackspace-agent-windows/
audit_date: '2020-05-05'
title: Nova-agent (Linux) and Rackspace agent (Windows)
type: article
created_date: '2019-09-27'
created_by: Brian King
last_modified_date: '2020-05-04'
last_modified_by: Brian King
product: Cloud Servers
product_url: cloud-servers
---

This article describes nova-agent (Linux&reg;) and Rackspace agent (Microsoft&reg;
Windows&reg;), which are required services used in Rackspace public cloud
virtualized servers. For brevity, both agents are referred to as *nova-agent*
in this article, but all statements apply equally to nova-agent and Rackspace
agent.

### What is nova-agent?

Nova-agent is a required service for all virtualized servers in the Rackspace
public cloud. Thus OnMetal is excluded. The service interacts with XenServer&reg. According
to the [Rackspace developer docs](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/nova-agent/),
nova-agent is a service that:

    "provides a means of interacting with the server through the API or the Cloud
    Control Panel. Nova-agent enables components outside the server to control
    the server by sending messages through the XenStore file system."

Nova-agent provides the following functionality:

- Root or admin password resets that you request through the Cloud Control Panel
  or by using the API

- Setting and changing network information, such as adding Cloud Networks or
  setting proper IPs and routes at build time

- Red Hat&reg; Enterprise Linux registration and Windows activation

### When does nova-agent run?

Nova-agent is always listening when the server is active, but it only makes
changes in the following situations:

When | Actions
---|---
Initial server boot | - Sets root password (Administrator for Windows) <br /> <br /> - Sets network configuration <br /> <br /> - Red Hat Enterprise Linux registration and Windows activation
Password reset request through the Cloud Control Panel or API | Sets root password (Administrator for Windows)
Attach/detach Cloud Network | Sets/removes interface IPs and routes

<br />
<br />

### What does nova-agent require?

- UNIX-like systems (Linux and FreeBSD&reg;) must run the *xe-linux-distribution*
  service (XenServer Tools). You should configure the xe-linux-distribution
  service to start before nova-agent.

  **Note:** On newer distributions (distros), this might be called xe-daemon
  instead of xe-linux-distribution.

- Windows systems must run the XenServer Tools.

If these required applications are missing, you can download the XenServer Tools
ISO from [boot.rackspace.com](https://boot.rackspace.com/files/xentools/xs-tools-6.2.0.iso),
which works for Linux or Windows. Citrix&reg; also has packages for the common
[Linux distros](downloads.vmd.citrix.com/OpenStack/xe-guest-utilities).

### What happens when nova-agent is broken or missing?

If you don't have nova-agent installed, the following symptoms might occur:

- Builds take a long time, but eventually complete. The resulting server has the
  same IP address information and password as the server used to create its
  image. Thus, networking doesn't work, but you can log in by using the console.

- You can't reset the root or admin password through the Cloud Control Panel.

- You can't add or remove networks or set proper IP addresses and routes, which
  causes build failures.

- Red Hat&reg; Enterprise Linux registration or Windows activation does not occur.

- (Windows only) Versions older versions than 1.3.1 do not work with RackConnect
  v3, because the agent can't properly create virtual Network Interface Cards
  (NICs) with the Cloud Network names.

All images created from a server with a broken nova-agent exhibit these issues.

### Are there any known bugs?

Nova-agent for Linux and Windows does not deal with unexpected Ethernet
interfaces. For example, Tun and Tap devices, created by VPN applications, can cause
nova-agent to crash.

#### Windows known issues

You must enable IPv6 on the public interface, or the `netsh` commands that
nova-agent runs to set the network fail with the following error:

    {"returncode":"1","message":"Command Failed. , Output:Element not found.\\r\\n"}

### Troubleshooting

The following sections provide some possible solutions.

#### Operating system (OS) independent troubleshooting

General fixes in order of desirability:

1. Fix the agent from a running server, and then take a new image to use as the
   golden master.

2. If the source server was deleted but you know the root password of the source
   server, log in to the new server by using the console and manually set the IP
   address information. Then log in and fix nova-agent.

3. If the source server was deleted and you don't have the root or admin password
   of the source server, perform the following steps:

   1. Build a new server from an image.
   2. Boot the new server into rescue mode.
   3. Fix the password.
   4. Boot out.
   5. Fix nova-agent.
   6. Take a new image.

#### Installing nova-agent on Linux

If starting the nova-agent service doesn't work, you can troubleshoot by looking
at the nova-agent logs. The newest version of nova-agent is now available in EPEL
and Rackspace's internal, Ubuntu&reg; operating system, and Debian&reg; repositories. Typically, package
installation commands (`yum install nova-agent` or `apt-get install nova-agent`)
should install or update the agent.

If that doesn't work, you can also try installing the packages from [the OSPC repo](https://mirror.rackspace.com/ospc/).

If you're not on a Rackspace-supported distribution, you can try to install an
[older version of nova-agent](https://github.com/rackerlabs/openstack-guest-agents-unix)
from the rackerlabs Github repository. However, this is technically unsupported.

If you're using an imported image of a distro that supports `cloud-init`, you might
find it easier to use `cloud-init` instead of nova-agent. This requires setting
the following metadata on your imported image:

Metadata key and value | Description
---|---
`img_config_drive=mandatory` | Always attach the config drive on builds from this image. <br /> The config-drive always contains **meta-data.json**, <br /> **network-data.json**, and **vendor-data.json**. <br /> Any distro with the `cloud-init` service active at boot <br /> should be able to read these files and inject <br /> a SecureShell (SSH) key, set network configuration, and so on.
`vm_mode=hvm` | Boot in hardware virtual machine (HVM) mode as opposed to <br /> the deprecated paravirtual (PV) mode. <br /> PV mode is implicit, so you get bootloader errors <br /> unless you set this mode.
`xenapi_use_agent=False` | Don't check for the nova-agent response before marking <br /> the server as **ACTIVE** in the Cloud Servers API.

<br />


**Note**: A RHEL&reg; 7.2/CentOS&reg; 7.2 update pushed in December 2015 broke legacy
behavior that older nova-agents relied on. You might still see this issue on
older custom images or on servers that haven't been updated lately. Tag
any related support tickets with "rm14157" so we can track this issue.

##### FreeBSD and Linux only: Nova-agent 2.x branch vs 1.x branch

The 2.x branch of nova-agent is a complete rewrite. We recommend the 2.x branch,
unless you are using an OS not supported by the 2.x branch (such as FreeBSD).
We don't recommend upgrading from 1.x to 2.x because there is nothing to be
gained, and the process is extremely complex.

Topic | 2.x branch | 1.3.9 branch
---|---|---
**Recommended** <br /> **install method** | `yum` or `apt` package managers| Download the release from github and run the script
**Github link** | [2.x link](https://github.com/Rackspace-DOT/nova-agent) | [1.3.9 link](https://github.com/rackerlabs/openstack-guest-agents-unix)
**OS** <br /> **compatibility** | Only OS currently supported in <br /> Rackspace Cloud (Fedora&reg;, <br />  CoreOS&reg;, Red Hat/CentOS, <br />  Debian, and Ubuntu operating system; | Supported OS plus some older <br /> unsupported OS such as <br />  OpenSuSE&reg;, Gentoo&reg;, FreeBSD, <br /> and Arch&reg;
**Python3 support** | Yes | No

<br />
<br />

#### Installing nova-agent on Windows

1. Download the latest versions of the following nova-agent files from
   [Github](https://github.com/rackerlabs/openstack-guest-agents-windows-xenserver/releases):

   - **AgentService.zip**
   - **UpdateService.zip**

2. Extract the contents of **AgentService.zip** to
   **C:\Program Files\Rackspace\Cloud Servers\Agent** to install the agent.

3. Run **installagentservice.bat**.

4. Extract the contents of **UpdateService.zip** to
   **C:\Program Files\Rackspace\Cloud Servers\AgentUpdater** to install the
   agent updater.

5. Run **installupdateservice.bat**.

#### Rerun bootstrap.cmd or bootstrap.bat (Windows)

If you would like the agent to rerun **bootstrap.cmd** on your next reboot, you
need to set the registry key `cloud-automation-run` in **SOFTWARE/Rackspace**
to any value. This causes that file to be rerun on next reboot. This is useful
for setting up golden images with autoscale.

### Related Articles

[Operating a cloud server with nova-agent](https://developer.rackspace.com/docs/user-guides/infrastructure/cloud-config/compute/cloud-servers-product-concepts/nova-agent/)
[All About Nova-Agent (on Linux)](http://www.syntheticworks.com/rackspace-cloud/linux-rackspace-cloud/all-about-nova-agent-linux/)
