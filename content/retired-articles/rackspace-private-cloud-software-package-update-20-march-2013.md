---
permalink: rackspace-private-cloud-software-package-update-20-march-2013/
audit_date:
title: Rackspace Private Cloud Software Package Update - 20 March 2013
type: article
created_date: '2013-03-19'
created_by: Karin Levenstein
last_modified_date: '2013-03-27'
last_modified_by: Jered Heeschen
---

Rackspace has released a package update for Rackspace Private Cloud
Software.

### Update Instructions

If you have an existing environment created with Rackspace Private Cloud
Software v. 3.0, you can update your environment by performing update
commands on all nodes in your  environment.

#### Server Update

Rackspace recommends that you update the OpenCenter server before
updating the agents.

1.  Log in to the Server node and run the following commands.

    On Ubuntu:

        $ apt-get install opencenter-server opencenter-agent opencenter-client

    On CentOS/RHEL:

        $ yum install opencenter-server opencenter-agent opencenter-client

2.  Restart the OpenCenter services.

        $ service opencenter-server restart
        $ service opencenter-agent restart

#### Agent Update

After the server has been successfully updated, update each agent.

1.  Log in to the Server node and run the following commands.

    On Ubuntu:

        $ apt-get install opencenter-agent opencenter-client

    On CentOS/RHEL:

        $ yum install opencenter-agent opencenter-client

2.  Restart the OpenCenter service.

        $ service opencenter-agent restart

### Package Update Changes

The following list summarizes key changes included in this package
update. Where relevant, it includes the issue number from the related
Github repository. All issues addressed in this package update can be
found at [the RCBOPS Github repository](https://github.com/rcbops).

The Rackspace Private Cloud Software *Getting Started Guide*, the *CLI
and API Guide*, and the Rackspace How-To content have been updated to
reflect these changes.

-   The `--role` flag has been implemented in the installation
    `curl`command.

    Server installation:

    ``` {.screen}
    $ curl -s -L http://sh.opencenter.rackspace.com/install.sh | <br>
       sudo bash -s - --role=server
    ```

    Agent installation:

    ``` {.screen}
     $ curl -s -L http://sh.opencenter.rackspace.com/install.sh | <br>
       sudo bash -s - --role=agent --ip=<OpenCenter-server-IP>
    ```

    GUI installation:

    ``` {.screen}
    $ curl -s -L http://sh.opencenter.rackspace.com/install.sh | <br>
        sudo bash -s - --role=dashboard --ip=<OpenCenter-server-IP>
    ```

-   dnsmasq configuration has been updated so that instances can use a
    different DNS server. (nova issue \#255, chef issue \#12)

-   OpenCenter now uses the short hostname instead of the
    fully-qualified domain name for compatibility with OpenStack Nova.
    (opencenter issue \#445, opencenter-agent issue \#221)

-   HTTP proxy is now supported correctly. (opencenter-agent
    issue \#207)

-   Logs on the OpenCenter agent have been improved, and you can now
    include a `--debug` flag for logs. (opencenter-client issues \#60
    and \#61)

-   When `OPENCENTER_ENDPOINT`{.filename} is not set, the error message
    now indicates the correct endpoint URL:
    `https://user:pass@localhost:8443`{.uri}. (opencenter-client
    issue \#48)

-   The node move command is now used to move a node from one container
    to another (opencenter-client issue \#51). The syntax for moving a
    node is:

    ``` {.screen}
    $ opencentercli node move node_id_or_name container_node_id_or_name
    ```

-   Issues where the OpenCenter server might not appear in the Service
    Nodes container have been resolved. (opencenter issue \#433)

-   Users can no longer accidentally add attributes or facts to
    non-existent nodes in the CLI. (opencenter issue \#429)

-   The `nova:libvirt:vncserver_listen`{.filename} address is set by
    default to `0.0.0.0`{.uri}, which prevents issues with live
    migration under KVM. (opencenter issues \#417 and \#418)

-   Error messaging on invalid node IDs has been improved. (opencenter
    issue \#440)

-   Virtualization is enabled for clusters and availability zones.
    (opencenter issue \#415)

-   An issue where an installation on RHEL 6.4 could use the Ubuntu
    package has been resolved. (opencenter-install-scripts issue \#123)

-   The OHAI passwd plugin has been disabled to prevent
    performance problems. (opencenter issue \#436, opencenter-agent
    issue \#208)

-   Issues that could prevent a successful host evacuation have
    been resolved. (opencenter-agent issues \#203, \#204)
