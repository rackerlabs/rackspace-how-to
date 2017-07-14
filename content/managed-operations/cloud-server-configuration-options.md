---
permalink: cloud-server-configuration-options/
audit_date:
title: Cloud Server configuration options
type: article
created_date: '2014-12-01'
created_by: Rose Contreras
last_modified_date: '2017-06-06'
last_modified_by: Stephanie Fillmon
product: Managed Operations
product_url: managed-operations
---

To deliver a Managed Cloud experience, Rackspace runs support automation
on every cloud server that we build. We have extended this capability by
creating a `build_config` metadata key that you can use to specify the
Rackspace-provided common tools you want installed on your Rackspace
cloud servers and configured with Rackspace recommended best practices.

Many of the `build_config` metadata key options are available only when
you use the Cloud Servers API to build your servers. Building your
servers through the API gives you increased flexibility to select that a
server is configured how you want it and ensure that it does not
conflict with any automation that you have running. If you build servers
through the Cloud Control Panel, you will have the ability to select
only from the most common of these options.

To take advantage of this feature when using the API, you use any of the
defined `build_config` metadata key options that are available for your
specific service level (Managed Infrastructure or Managed Operations)
and pass your specified values to the scripts.

**Note:** This functionality is available only when you create a server.
If you want any of the tools installed after the server is created, you
must download the tools and configure them individually on the servers.
If you have the Managed Operations: SysOps service level, ask a Cloud
Engineer to install the tools on your behalf.

### Build configuration options

Depending upon your service level, these options are available for the
`build_config` metadata key:

`rack_user_only`

-   Available to *Managed Operations* customers.
-   Creates a Rackspace user name and password for Rackspace Support to
    deliver System Administrator Level Support. This option does not add
    or configure any additional components.

`base_mgdops_config`

-   Available to *Managed Operations* customers.
-   Builds a regular Managed Operations server from a base image with a
    Rackspace user name and password, installs and configures the Cloud
    Monitoring agent to the Rackspace defaults, installs and configures
    Cloud Backup to the Rackspace defaults, installs all the support
    packages, and enables automatic updates. This is the standard Managed
    Operations kick.

`backup_agent_only`

-   Available to *Managed Infrastructure* customers.
-   Available to *Managed Operations* customers.
-   Installs the Cloud Backup agent.

`backup_defaults`

-   Available to *Managed Infrastructure* customers.
-   Available to *Managed Operations* customers.
-   Installs the Cloud Backup agent, and configures a default backup set
    and schedule.

    The following default "on" directories are backed up:

    **For Linux Managed Cloud servers:**

    -   `/etc`
    -   `/home`
    -   `/var/www`
    -   ` /var/lib/mysqlbackup`

    **For Windows Managed Cloud servers**

    -   `c:\users`
    -   `c:\InetPub`

`monitoring_agent_only`

-   Available to *Managed Infrastructure* customers.
-   Available to *Managed Operations* customers.
-   Installs the Cloud Monitoring agent.

`monitoring_defaults`

-   Available to *Managed Infrastructure* customers.
-   Available to *Managed Operations* customers.
-   Installs the Cloud Monitoring agent and configures default
    Monitoring, Disk, and CPU checks.

    For Managed Operations service level customers, this option also
    configures default file system alerts that are sent to Rackspace.

`auto_updates`

-   Available to *Managed Infrastructure* customers.
-   Available to *Managed Operations* customers.
-   Enables automatic updates of server software.

You can combine the `build_config` options. For example:

-   **`monitoring_defaults` + `auto_updates` -** installs the monitoring
    agent configured with Rackspace best practices, and turns on
    automatic updates.

-   **`backup_agent_only`** installs the Rackspace Cloud Backup agent
    but does not configure Rackspace backups. You must separately
    identify the directories that you want backed up after the agent
    is installed.

### Build options for configuration management software (Chef, Puppet, Ansible, and Salt)

Using the API to build a server with a core option passed does not
conflict with configuration management software. Such builds have a
Rackspace account and nothing more. If you want additional components,
you must pass them with the `build_config` metadata key.

The following example shows the build option for a Chef server
management.

    nova boot --flavor 2 --image [image] --meta build_config=core www.example.com

The following example shows the build option for building a file server
with a Rackspace user name and password only and backup ability.

    nova boot --flavor 2 --image [image] --meta build_config=core,driveclient fileserver.example.com

This following example shows a good option for a customer who wants a
database server that has monitoring and backups available, but no
updates or additional packages.

    nova boot --flavor 2 --image [image] --meta build_config=core,driveclient,monitoring db.example.com

If you use configuration management software, wait for the post-build
configuration to complete before performing your configuration
management. For standard and workload-optimized cloud servers only, you
can obtain the Managed Operations post-build automation status via the
Cloud Servers API. Look for the metadata key value
`informationrax_service_level_automation`. Depending on the current
status of the Managed Cloud post-build automation process, the metadata
key will have one of the following values:

-   Pending
-   In Progress
-   Complete
-   Build Error
-   Authentication Error

When the metadata key is set to **Complete**, you can begin your
configuration management.
