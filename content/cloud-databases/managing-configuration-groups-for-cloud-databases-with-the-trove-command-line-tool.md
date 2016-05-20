---
permalink: managing-configuration-groups-for-cloud-databases-with-the-trove-command-line-tool/
audit_date:
title: Manage configuration groups for Cloud Databases with the trove command-line tool
type: article
created_date: '2014-03-17'
created_by: Neha Verma
last_modified_date: '2016-01-21'
last_modified_by: Mike Asthalter
product: Cloud Databases
product_url: cloud-databases
---

You can save and manage the settings for Cloud Databases instances in
configuration groups by using the [Cloud Databases
API](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#document-developer-guide)
or the
[python-troveclient](https://pypi.python.org/pypi/python-troveclient)
command-line interface for the API.

This article describes the commands that you run with python-troveclient
to manage configuration groups.

### Configuration groups and configuration parameters

A *configuration group* is a collection of settings that can be saved
and applied to one or more instances in Cloud Databases.

A configuration group consists or one or more *configuration
parameters*, which represent options that can be applied to a datastore
(the database running in an instance). For example, a configuration
group could have a configuration parameter of `max_connections` set to
80, or could [set the default time zone for the
instance](/how-to/setting-the-time-zone-for-a-cloud-databases-instance)
with the `default_time_zone` parameter.

### Installing python-troveclient

The `python-troveclient` package installs the `trove` command by using
the Python package manager tool [pip](https://pypi.python.org/pypi/pip).

Full installation instructions for the trove tool are in the [*Cloud
Databases Getting Started
Guide*](https://developer.rackspace.com/docs/cloud-databases/v1/developer-guide/#id5).

Further documentation for the trove tool is located on the
[`python-troveclient` project
site](https://pypi.python.org/pypi/python-troveclient).

To see a full list of commands after python-troveclient is installed,
run the following command:

    trove help

### Command options

Some options used by the commands in this article require further
explanation or have specific requirements.

#### value pairs option

The value pairs option represents one or more parameter name and value
pairs. The entry should be in JSON object format, enclosed in single
quotation marks with no spaces. In JSON object format, curly braces
enclose one or more key pairs that represent configuration values, and
the name of the parameter and any string or character value type are
enclosed in double quotation marks.

For example, one name and value pair would look as follows:

    '{"collation_server":"latin1_swedish_ci"}'

To list two or more pairs in the same option, separate them with a
comma:

    '{"collation_server":"latin1_swedish_ci","max_connections":5000}'

You might need to use the `configuration-parameter-show` command to get
the value type of a parameter to ensure that you set it correctly. If
you need to set the `key_buffer_size` parameter, for example, the value
type is an integer representing bytes. If you you want to set it to 100
megabytes, you would need to set its value to an integer representing
that many bytes (104857600).

#### datastore type option

The datastore type option refers to a valid datastore (database engine)
type that can be run on an instance. We recommend using the ID of the
datastore type as listed in the output of the `datastore-list` command,
although you can use the name of the datastore type.

    trove datastore-list

#### `datastore_version` option

The `datastore_version` option refers to a valid version of a datastore
that can be run on an instance. We recommend using the ID of the
datastore version as listed in the output of the
`datastore-version-list` command, although you can use the datastore
version.

    trove datastore-version-list

Configuration groups and parameters are associated with a datastore
version they can be applied to.

#### Configuration group ID option

The configuration group ID option refers to the ID of an existing
configuration group. You can see a list of configuration groups and
their IDs by using `configuration-list` command.

    trove configuration-list

#### Instance ID option

The `instance ID` option refers to the ID of an existing instance. You
can see a list of instances and their IDs by using the `list` command.

    trove list

#### flavor

The flavor option refers to the ID of an instance flavor, which
typically refers to the size of the instance determined by its
allocation memory (for example, the 1 GB flavor refers to an instance
with 1 GB of memory). You can see a list of flavors and their IDs by
using the `flavor-list` command.

    trove flavor-list

### Creating and deleting configuration groups

#### Create a new configuration group

Use the `configuration-create` command with the following options to
create a new configuration group.

    trove configuration-create <name> <value_pairs> [--datastore <datastore_type>] [--datastore_version <datastore_version>] [--description <description>]

For example, a configuration group named Stagingconfig could be created
with the following key value pairs:

| Key                | Value               |
|--------------------|---------------------|
| `collation_server` | `latin1_swedish_ci` |
| `max_connections`  | 80                  |

To create the configuration group, you would run the command:

    trove configuration-create Stagingconfig '{"collation_server":"latin1_swedish_ci","max_connections":80}' --description "Config for Staging datastore" --datastore MySQL --datastore_version 5.1

The output would display a list of the new configuration group's
properties as follows:

        +----------------------+-----------------------------------------------------------------------+
        |       Property       |                                 Value                                 |
        +----------------------+-----------------------------------------------------------------------+
        | datastore_version_id |                  4f83ff38-3ef3-4a27-8b4c-330dc59857ca                 |
        |     description      |                                  Config for Staging                   |
        |          id          |                  b52de6cc-5c4f-4deb-afbc-f7190ee7573b                 |
        |         name         |                             Stagingconfig                             |
        |        values        | {u'collation_server': u'latin1_swedish_ci', u'max_connections': 80}   |
        +----------------------+-----------------------------------------------------------------------+

For a detailed example of creating and applying a configuration group,
see [setting the time zone for a Cloud Databases
instance](/how-to/setting-the-time-zone-for-a-cloud-databases-instance).

#### Delete a configuration group

Use the `configuration-delete` command to delete a configuration group.

    trove configuration-delete <config_id>

### Applying configuration groups to instances

A configuration group can be assigned when an instance is created or it
can be assigned to an existing instance. If a configuration group is
applied to a running instance, the configuration parameters can affect
the datastore's behavior immediately, although some configuration
changes require that the datastore be restarted.

#### Apply a configuration group to an existing instance

Use the `configuration-attach` command to assign a configuration group
to an existing instance.

    trove configuration-attach <instance_id> <config_id>

You can confirm that the configuration group was applied by fetching
instance details with the `show` command.

    trove show <instance_id>

The `show` command returns the properties of the instance, including an
applied configuration group's ID (shown as the configuration property).

        +-------------------+------------------------------------------------------------------+
        |      Property     |                              Value                               |
        +-------------------+------------------------------------------------------------------+
        |   configuration   |               b52de6cc-5c4f-4deb-afbc-f7190ee7573b               |
        |      created      |                       2014-03-15T21:44:05                        |
        |     datastore     |                              MySQL                               |
        | datastore_version |                               5.1                                |
        |       flavor      |                                1                                 |
        |      hostname     | 6a169ada29c30d2338e0395d277a817a2f7a37e5.qa.rackspaceclouddb.com |
        |         id        |               aab79eba-9eba-4ac3-94fc-e4aaf46b4efb               |
        |        name       |                            CloudDBdev                            |
        |       status      |                              ACTIVE                              |
        |      updated      |                       2014-03-15T21:44:55                        |
        |       volume      |                                1                                 |
        +-------------------+------------------------------------------------------------------+

#### Create a new instance with a configuration group


Use the `create` command to create a new instance that uses a custom
configuration group.

    trove create <name> <flavor> [--size <size>] [--databases <databases> [<databases> ...]] [--users <users> [<users> ...]] [--backup <backup>] [--availability_zone <availability_zone>>] [--configuration <config_id>]

For example, to create an instance named CloudDB using the 1 GB instance
flavor (flavor ID 1), a 1 GB volume size, and a configuration group
named Devconfig with an ID of 26f6f753-3853-4bf5-9bfe-1765966ad2f6, you
would run the following command:

    trove create CloudDB 1 --size 1 --configuration 26f6f753-3853-4bf5-9bfe-1765966ad2f6

The output displays the properties of the new instance.

        +-------------------+------------------------------------------------------------------+
        |      Property     |                              Value                               |
        +-------------------+------------------------------------------------------------------+
        |   configuration   |               26f6f753-3853-4bf5-9bfe-1765966ad2f6               |
        |      created      |                       2014-03-15T21:37:32                        |
        |     datastore     |                              MySQL                               |
        | datastore_version |                               5.1                                |
        |       flavor      |                                1                                 |
        |      hostname     | 9bcc18abea9a8b97bc8889ff901a446f297a86ac.qa.rackspaceclouddb.com |
        |         id        |               a920662c-0074-4369-83d4-e2e159f2ed6c               |
        |        name       |                             CloudDB                              |
        |       status      |                              BUILD                               |
        |      updated      |                       2014-03-15T21:37:32                        |
        |       volume      |                                1                                 |
        +-------------------+------------------------------------------------------------------+

#### Remove the configuration group from an instance

The `configuration-detach` command clears the configuration assigned to
an instance and restores the instance to its datastore's default
configuration.

    trove configuration-detach <instance_id>

### Modifying configuration groups

When changing a configuration group's parameters, you can either change
only specific parameters without affecting others in the set or replace
the whole configuration set with new values.

**Note:** The configuration parameter local in-file is supported in
Cloud Databases. You can access it in the [Cloud Control
Panel](https://mycloud.rackspace.com/) by clicking on **Databases &gt;
MySQL Configurations** and then modifying an existing configuration or
creating a new one.

#### Change a subset of the parameters of a configuration group

Use the `configuration-patch` command to change only the specified
parameters for a configuration group.

    trove configuration-patch <config_id> <value_pairs>

For example, to update configuration parameter `max_connections` to 60
for the configuration group Stagingconfig, you could run the command for
the configuration group's ID:

    trove configuration-patch b52de6cc-5c4f-4deb-afbc-f7190ee7573b '{"max_connections":80}'

To verify that the configuration group was updated, use the
configuration\_show command:

    trove configuration-show <config_id>

The command returns the properties of the configuration group.

        +----------------------+---------------------------------------------------------------------+
        |       Property       |                                Value                                |
        +----------------------+---------------------------------------------------------------------+
        | datastore_version_id |                 4f83ff38-3ef3-4a27-8b4c-330dc59857ca                |
        |     description      |                                 None                                |
        |          id          |                 b52de6cc-5c4f-4deb-afbc-f7190ee7573b                |
        |         name         |                            Stagingconfig                            |
        |        values        | {u'collation_server': u'latin1_swedish_ci', u'max_connections': 80} |
        +----------------------+---------------------------------------------------------------------+

Note that the other parameter set on the group, `collation_server`, is
unaffected by the change.

#### Replace all parameters of a configuration group

Use the `configuration-update` command to replace all existing
parameters of a configuration group with the supplied values. Any
existing values that are not included in the command will be removed
from the group.

    trove configuration-update <config_id> <value_pairs> [--name <name>] [--description <description>]

For example, you might start with an existing group with two values set,
`character_set_server` and `max_connections`, as shown in the following
table.

| Key                    | Value  |
|------------------------|--------|
| `character_set_server` | `utf8` |

If you run the `configuration-update` command to set a new value for
just `character_set_server` (changing the value to latin1), the
`max_connections` parameter is removed.

    trove configuration-update b52de6cc-5c4f-4deb-afbc-f7190ee7573b '{"character_set_server":"latin1"}' --description UpdatedStagingConfig

After that command runs, the output shows that the only value pair set
is for `character_set_server`.

        +----------------------+--------------------------------------+
        |       Property       |                Value                 |
        +----------------------+--------------------------------------+
        | datastore_version_id | 4f83ff38-3ef3-4a27-8b4c-330dc59857ca |
        |     description      |         UpdatedStagingConfig         |
        |          id          | b52de6cc-5c4f-4deb-afbc-f7190ee7573b |
        |         name         |            Stagingconfig             |
        |        values        | {u'character_set_server': u'latin1'} |
        +----------------------+--------------------------------------+

### Listing configuration groups

#### View all defined and available configuration groups

Use the `configuration-list` command to list all configuration groups
currently defined and available.

    trove configuration-list

The output would look follows:

        +-------------------------------------+--------------------+---------------------------+---------------------------------------+
        |                  id                  |        name        |        description        |         datastore_version_id         |
        +--------------------------------------+--------------------+---------------------------+--------------------------------------+
        | 0e860b09-60fe-433b-8ead-b9e5371a370c | test_configuration | configuration description | 4f83ff38-3ef3-4a27-8b4c-330dc59857ca |
        | 26f6f753-3853-4bf5-9bfe-1765966ad2f6 |     Devconfig      |        Config for dev env | 4f83ff38-3ef3-4a27-8b4c-330dc59857ca |
        | 321934e8-693e-41ed-ace8-de56747c3275 |     devconfig      |     Config for dev env    | 4f83ff38-3ef3-4a27-8b4c-330dc59857ca |
        | b52de6cc-5c4f-4deb-afbc-f7190ee7573b |   Stagingconfig    |    UpdatedStagingConfig   | 4f83ff38-3ef3-4a27-8b4c-330dc59857ca |
        +--------------------------------------+--------------------+---------------------------+--------------------------------------+

#### View all instances associated with a configuration group

Use the `configuration-instances` command to list all of the instances
to which a configuration group is assigned.

    trove configuration-instances <config_id>

The output would look as follows:

        +--------------------------------------+----------------+
        |                  id                  |      name      |
        +--------------------------------------+----------------+
        | a920662c-0074-4369-83d4-e2e159f2ed6c |    CloudDB     |
        | c46a0bba-6c15-4db5-ad7b-832ee2c0b59d | CloudDBStaging |
        +--------------------------------------+----------------+

### Viewing configuration details

#### View details of a configuration group

Use the `configuration-show` command to view the details of a
configuration group, including its name, ID, the datastore version ID
that it is associated with, and any defined parameters.

    trove configuration-show <config_id>

The output would look as follows:

        +----------------------+-----------------------------------------------------------------------+
        |       Property       |                                 Value                                 |
        +----------------------+-----------------------------------------------------------------------+
        | datastore_version_id |                  4f83ff38-3ef3-4a27-8b4c-330dc59857ca                 |
        |     description      |                                  Config for Staging env               |
        |          id          |                  b52de6cc-5c4f-4deb-afbc-f7190ee7573b                 |
        |         name         |                             Stagingconfig                             |
        |        values        | {u'collation_server': u'latin1_swedish_ci', u'max_connections': 50} |
        +----------------------+-----------------------------------------------------------------------+

#### View properties for a single configuration parameter that can be configured for a datastore version

Use the `configuration-parameter-show` command to view the properties of
a configuration parameter for a datastore version.

    trove configuration-parameter-show <datastore_version> <parameter_name>

The output displays the parameter's value range, value type, and whether
a restart of the instance would be required for a parameter change to
take effect.

For example, the output for the `innodb_buffer_pool_size` parameter for
MySQL 5.1 would look as follows:

        +------------------+-------------------------+
        |     Property     |          Value          |
        +------------------+-------------------------+
        |       max        |       68719476736       |
        |       min        |            0            |
        |       name       | innodb_buffer_pool_size |
        | restart_required |           True          |
        |       type       |         integer         |
        +------------------+-------------------------+

#### View all configuration parameters that can be configured for a datastore version

Use the `configuration-parameter-list` command to view a list of all the
parameters that can be configured for a datastore version.

    trove configuration-parameter-list <datastore_version>

The output would look as follows:

        +--------------------------------+---------+---------+----------------------+------------------+
        |              name              |   type  |   min   |         max          | restart_required |
        +--------------------------------+---------+---------+----------------------+------------------+
        |    auto_increment_increment    | integer |    1    |        65535         |      False       |
        |     auto_increment_offset      | integer |    1    |        65535         |      False       |
        |           autocommit           | integer |    0    |          1           |      False       |
        |    bulk_insert_buffer_size     | integer |    0    | 18446744073709547520 |      False       |
        |      character_set_client      |  string |         |                      |      False       |
        |    character_set_connection    |  string |         |                      |      False       |
        |     character_set_database     |  string |         |                      |      False       |
        |    character_set_filesystem    |  string |         |                      |      False       |
        |     character_set_results      |  string |         |                      |      False       |
        |      character_set_server      |  string |         |                      |      False       |
        |      collation_connection      |  string |         |                      |      False       |
        |       collation_database       |  string |         |                      |      False       |
        |        collation_server        |  string |         |                      |      False       |
        |        connect_timeout         | integer |    1    |        65535         |      False       |
        |        expire_logs_days        | integer |    1    |        65535         |      False       |
        |    innodb_buffer_pool_size     | integer |    0    |     68719476736      |       True       |
        |     innodb_file_per_table      | integer |    0    |          1           |       True       |
        | innodb_flush_log_at_trx_commit | integer |    0    |          2           |      False       |
        |     innodb_log_buffer_size     | integer | 1048576 |      4294967296      |       True       |
        |       innodb_open_files        | integer |    10   |      4294967296      |       True       |
        |   innodb_thread_concurrency    | integer |    0    |         1000         |      False       |
        |      interactive_timeout       | integer |    1    |        65535         |      False       |
        |        join_buffer_size        | integer |    0    |      4294967296      |      False       |
        |        key_buffer_size         | integer |    0    |      4294967296      |      False       |
        |          local_infile          | integer |    0    |          1           |      False       |
        |       max_allowed_packet       | integer |   1024  |      1073741824      |      False       |
        |       max_connect_errors       | integer |    1    | 18446744073709547520 |      False       |
        |        max_connections         | integer |    1    |        65535         |      False       |
        |      max_user_connections      | integer |    1    |        100000        |      False       |
        |    myisam_sort_buffer_size     | integer |    4    | 18446744073709547520 |      False       |
        |           server_id            | integer |    1    |        100000        |       True       |
        |        sort_buffer_size        | integer |  32768  | 18446744073709547520 |      False       |
        |          sync_binlog           | integer |    0    | 18446744073709547520 |      False       |
        |          wait_timeout          | integer |    1    |       31536000       |      False       |
        +--------------------------------+---------+---------+----------------------+------------------+

#### View the default configuration settings for a specific instance

Use the `configuration-default` command to view the default
configuration settings for an instance.

    trove configuration-default <instance_id>

The output would look as follows:

        +---------------------------+-----------------------------+
        |          Property         |            Value            |
        +---------------------------+-----------------------------+
        |          basedir          |             /usr            |
        |      connect_timeout      |              15             |
        |          datadir          |        /var/lib/mysql       |
        |   default_storage_engine  |            innodb           |
        |   ignore-builtin-innodb   |              1              |
        |           innodb          |            FORCE            |
        |  innodb_buffer_pool_size  |             125M            |
        |   innodb_data_file_path   |    ibdata1:10M:autoextend   |
        |   innodb_file_per_table   |              1              |
        |   innodb_log_buffer_size  |              4M             |
        |    innodb_log_file_size   |             50M             |
        | innodb_log_files_in_group |              2              |
        |      join_buffer_size     |              1M             |
        |      key_buffer_size      |             40M             |
        |        local-infile       |              0              |
        |         log_error         |  /var/log/mysql/mysqld.log  |
        |     max_allowed_packet    |             16M             |
        |      max_connections      |              85             |
        |    max_heap_table_size    |             12M             |
        |    max_user_connections   |              75             |
        |       myisam-recover      |            BACKUP           |
        |      open_files_limit     |             3276            |
        |        plugin-load        |     ha_innodb_plugin.so     |
        |            port           |             3306            |
        |     query_cache_limit     |              1M             |
        |      query_cache_size     |              8M             |
        |      query_cache_type     |              1              |
        |      read_buffer_size     |             512K            |
        |    read_rnd_buffer_size   |             512K            |
        |   skip-external-locking   |              1              |
        |     skip_name_resolve     |              1              |
        |           socket          | /var/run/mysqld/mysqld.sock |
        |      sort_buffer_size     |              1M             |
        |   table_definition_cache  |             200             |
        |      table_open_cache     |             200             |
        |     thread_cache_size     |              4              |
        |        thread_stack       |             192K            |
        |       tmp_table_size      |             12M             |
        |           tmpdir          |           /var/tmp          |
        |            user           |            mysql            |
        |        wait_timeout       |             120             |
        +---------------------------+-----------------------------+
