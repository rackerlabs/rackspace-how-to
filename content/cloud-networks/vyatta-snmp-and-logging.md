---
permalink: vyatta-snmp-and-logging/
audit_date:
title: Vyatta SNMP and logging
type: article
created_date: '2015-08-26'
created_by: Rose Contreras
last_modified_date: '2016-01-13'
last_modified_by: Rose Coste
product: Cloud Networks
product_url: cloud-networks
---

This article details the process for setting up Simple Network
Management Protocol (SNMP) and `syslog` for monitoring of the Brocade
Vyatta vRouter.

### Configuring SNMP on vRouter

The following object ID and description for support with a standard SNMP
management and logging system are built in to the vRouter:

    sysObjectID  =  1.3.6.1.4.1.30803
    sysDescr     =  Vyatta_version_info

You can configure your SNMP management software to communicate with the
vRouter by using the following SNMP messages:

-   **GET** - Pulls system information and device operational statistics
-   **SET** - Sets event conditions or thresholds on the vRouter
-   **TRAP** - When thresholds or conditions are met, sends information
     to the management system

The following scenario variables are used in the SNMP configuration below:

-  **Community string** - BROCADE
-  **IP Address of the SNMP management system** - 10.0.0.12

Other variables provide vRouter specific device information.

**SNMP configuration**

    set service snmp community BROCADE
    set service snmp community BROCADE client 10.0.0.12
    set service snmp community BROCADE authorization rw
    set service snmp trap-target 10.0.0.12
    set service snmp contact "Rackspace Network Security"
    set service snmp description "Test Brocade vRouter"
    set service snmp location "San Antonio, TX"`

### SNMP access via VPN tunnel

If you want to poll the Vyatta for SNMP information, but you don't want
to receive just traps, you must put a specific configuration in place on
a local firewall applied to the outside interface. Local firewall rules
apply to traffic entering an interface directed at the Vyatta itself.
This is called the Control Plane access list.

The firewall rule in the following example uses the default
`protect-vyatta` firewall script that is executed when a Vyatta image is
created. By default, the `protect-vyatta` firewall is already applied,
but the application command is included in this example for a complete
view of how to execute this configuration.

**Permit SNMP traffic to vRouter**

    set firewall name protect-vyatta rule 400 action 'accept'
    set firewall name protect-vyatta rule 400 description 'allow snmp'
    set firewall name protect-vyatta rule 400 destination port '161'
    set firewall name protect-vyatta rule 400 ipsec 'match-ipsec'
    set firewall name protect-vyatta rule 400 protocol 'udp'
    set interfaces ethernet eth0 firewall local name 'protect-vyatta'

### MIBs for managing and monitoring a vRouter

Following is a sample subset of available Management Information Bases
(MIBs) on a vRouter. A full list of supported MIBs is available at the
[Vyatta documentation page](http://www.brocade.com/downloads/documents/html_product_manuals/vyatta/vyatta_5400_manual/wwhelp/wwhimpl/js/html/wwhelp.htm#href=Remote%20Management/SNMP.5.11.html#1952242).

-  HOST-RESOURCES-MIB
-  SNMPv2-MIB
-  IF-MIB
-  IP-MIB
-  RFC1213-MIB
-  TCP-MIB
-  UDP-MIB

### Configuring logging on vRouter

Using the standard Linux `syslogd` process, the vRouter allows the
logging capabilities of most vRouter processes.

**Note:** Log messages are stored in `/var/log/messages`. When the file
reaches 500 KB in size, the `messages` file is renamed to `messages.#`,
with # being an incremental number).

Use the `show log` command to view logs. Following are some
examples of the show log command variables.

**Viewing the active log file**

    show log
    show log | match <string>
    show log | more
    show log all
    show log tail
    show log vpn ipsec

You can configure different custom logging scenarios, such as location,
file name, and user, by using a single command string with the
destination variable, as shown in the following example:

**Logging syntax**

    set system syslog <destination> facility <facility_num> level <logging_level>

**Send logs to a specific host**

    set system syslog host 10.176.10.10 facility local3 level info

The preceding example uses

- `host` as the logging destination
- `local3` as the facility
- `info` as the logging level

### Log options

The following tables shows options for
destinations, logging levels, and facility numbers.

**Logging destinations**

| Destination | Purpose                                    |
|--------------|-------------------------------------------|
| console   | Logging to system console |
| file    | Logging to a file (stored in `/var/log/user/`) |
| global  | Logging to system standard location            |
| host    | Logging to a remote host                       |
| user    | Logging to specific user's terminal      |

**Logging levels**

The `level` variable refers to severity level, which can be application-specific.

| Level   | Purpose                              |
|---------|--------------------------------------|
| emerg   | Emergency messages                   |
| alert   | Urgent messages                      |
| crit    | Critical messages                    |
| err     | Error messages                       |
| warning | Warning messages                     |
| notice  | Messages for investigation (default) |
| info    | Informational messages               |
| debug   | Debug messages                       |

**Facility numbers**

The `facility` variable refers to the type of program logging the message.

| Facility  | Purpose                          |
|-----------|----------------------------------|
| all       | All facilities excluding "mark"  |
| auth      | Authentication and authorization |
| authpriv  | Non-system authorization         |
| cron      | Cron daemon                      |
| daemon    | System daemons                   |
| kern      | Kernel                           |
| lpr       | Line printer spooler             |
| mail      | Mail subsystem                   |
| mark      | Timestamp                        |
| news      | USENET subsystem                 |
| protocols | Routing protocols (local7)       |
| security  | Authentication and authorization |
| syslog    | System activity logging          |
| user      | Application processes            |
| uucp      | UUCP subsystem                   |
| local0    | Local facility 0                 |
| local1    | Local facility 1                 |
| local2    | Local facility 2                 |
| local3    | Local facility 3                 |
| local4    | Local facility 4                 |
| local5    | Local facility 5                 |
| local6    | Local facility 6                 |

### Difference between show log and monitor commands

The `show log` command is a static representation of the log files that
were written to the `/var/log/messages` files at the time you executed
the command. If new entries are written to the file after you execute
the command, you will not see those entries until you re-run the
`show log` command.

The `monitor`command shows log messages as they are being written to the
log buffer. Similar to the `debug` command in Cisco ASA, you see log
messages on the console as they are generated. Messages are logged to
the console until you exit the `monitor command (Ctrl-C). `
