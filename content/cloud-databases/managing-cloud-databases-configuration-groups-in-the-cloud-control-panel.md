---
permalink: managing-cloud-databases-configuration-groups-in-the-cloud-control-panel/
audit_date:
title: Manage Cloud Databases configuration groups in the Cloud Control Panel
type: article
created_date: '2014-11-13'
created_by: Rose Contreras
last_modified_date: '2018-01-11'
last_modified_by: DaPriest Watson
product: Cloud Databases
product_url: cloud-databases
---

A configuration group is a collection of settings that you can save and apply to one or 
more Cloud Databases instances. A configuration group consists of one or more configuration 
parameters, which represent options for a database instance.

For example, you can set the `max_connections` parameter in a configuration 
group to 80, which means that the instance to which the configuration group is applied can 
have a maximum of 80 clients connected simultaneously. You can also set the default time 
zone for an instance by defining the `default_time_zone` parameter in a 
configuration group.

This article describes how to manage configurations using the Cloud Control Panel.

For details about configuration parameters, see the MySQL documentation 
[5.1.4 Server System Variables](http://dev.mysql.com/doc/refman/5.6/en/server-system-variables.html).

### Create a new configuration group and apply it to an instance

Use the following steps to create a configuration group and apply it to a database instance.

**Note:** You can only apply a configuration group to instances in the same region as the 
configuration group. This means you cannot apply a configuration group created for LON 
region and apply it to instance in DFW.

#### Create a new configuration group

1. Log in to the [Cloud Control Panel](https://mycloud.rackspace.com).

2. At the top of the panel, select **Databases**.

3. In the **Databases** menu, select **MySQL Configurations** under **MANAGE EXTRAS**.

4. On the Configurations page, click **Create Configuration**.

5. In the Identity section, provide a name and description for the configuration, and 
   specify the region in which you want to use the configuration.

6. In the Settings section, select the datastore of the database instance or instances to 
   which the configuration parameters will apply. For example, if you choose MySQL 5.6, the 
   configuration group can be applied only to database instances that use MySQL 5.6

7. In the Configuration Parameters section, enter values for the parameters that you want 
   to customize for this configuration group. For details about configuration parameters, 
   see documentation here. The following image shows values specified for some MySQL 5.6 
   parameters.

    **NOTE:** The parameters shown in orange text are non-dynamic parameters. If the value 
    of any of these parameters is changed, all instances attached to the configuration group 
    will require an instance restart.

    The configuration group is displayed on the Configuration Parameters page showing the database 
    type it can be applied to and last updated timestamp.

8. Click **Create Configuration**.

    The configuration group is displayed in the Configurations page is available to use for 
    your database instances.

    **Note:** The most frequently used parameters are displayed at the top of the list and 
    the remaining parameters will be listed underneath.

#### Apply a configuration to an existing instance or create a new instance

You can apply a configuration to one or more existing instances from the Configurations 
page, or you can apply a configuration to a single new database instance that was created 
with the default configuration.

#### Apply a configuration from the Configurations page

1. Log in to the Cloud Control Panel and select **Databases > Configurations**.

2. On the Configurations page, click the gear icon next to the database configuration that 
you want to apply to an instance.

3. Click **Apply to Existing Instances**.

	The database instances in the same region that use the datastore specified in the 
	configuration group are displayed in a popup dialog box.

4. Select all the instances to which you want to apply the configuration, and then click 
   **Apply Configuration**.

5. In case non-dynamic parameters are changed in the configuration group, all the instances 
   attached to the configuration group will require an instance restart. To restart the 
   affected instances:

	A. Go to the Database Instances page.

	B. The instances that require restart are displayed in orange. Click the gear icon next 
	   to the instance to which you just applied the configuration group, and select **Restart Instance**.

#### Apply a configuration to an instance with the default configuration from the Instance Details page

1. On the Database Instances page, click the newly created instance to which you want to 
   apply a configuration.

2. Under Instance Details, click **Choose Configuration**.

3. Select the configuration that you want to apply to the instance and click Use Selected.

4. Restart the database instance so that the changes will take effect.

### Create a new instance with a configuration group

1. Log in to the Cloud Control Panel and select **Databases > Configurations**.

2. On the Configurations page, click the gear icon next to the configuration that you want 
   to use to create an instance. Select **Create Instance**.

3. In the popup dialog box, provide a name for the instance and specify the RAM and disk 
   size for the instance.

    The region and datastore type are defined by the configuration group and cannot be changed.

4. Click **Create Instance**.

### Modify configuration parameters for a configuration group

You can modify configuration groups by updating the values of existing parameters, adding 
new parameters, and removing parameters. When you update a configuration group, you must 
restart all the instances that use the configuration for the changes to take effect on 
those instances.

#### Change the values of configuration parameters in a configuration group

1. On the Configurations page in the control panel, click the configuration group for which 
   you want to modify the parameters.

2. On the Configuration Details page, click the gear icon for the parameter that you want 
   to delete and click **Edit Parameter**.

3. Modify the value.

    **NOTE:** Some configuration parameters cannot be deleted and require at least a 
    minimum value. For example, max_connections must be set to a minimum value of 1.

4. Click **Apply Changes**.

#### Add new configuration parameters to a configuration group

1. On the Configurations page in the control panel, click the configuration group for which 
   you want to add parameters.

2. On the Configuration Details page, click **Add Parameters**. Only the parameters that 
   are undefined appear in the list.

3. In the popup dialog box, provide values for the parameters that you want to add.

4. Click **Add Parameters**.

#### Remove configuration parameters from a configuration group

1. On the Configurations page in the control panel, click the configuration group for 
   which you want to modify parameters.

2. On the Configuration Details page, click the gear icon for the parameter that you want 
   to delete and click **Edit Parameter**.

3. Change the value to 0.

    **Note:** Some configuration parameters cannot be deleted and require at least a minimum 
    value. For example, max_connections must be set to a minimum value of 1.

4. Click **Apply Changes**.

### Remove a configuration from an instance

1. In the control panel, select **Databases > Database Instances**.

2. Click the name of the instance from which you want to modify the configuration.

3. Under Instance Details, next to the **Configuration** field, click **Revert to Default**.

### Delete a configuration group

#### Delete a configuration group using the Configurations page.

1. In the control panel, select **Databases > Configurations**.

2. On the Configurations page, click the gear icon next to the database configuration that 
   you want to delete.

3. From the menu, select **Delete Configuration**.

#### Delete a configuration group using the Instance Details page

1. In the control panel, select **Databases > Database Instances**.

2. Click the name of the configuration that you want to delete.

3. On the Instance Details page, click the Action menu.

4. Select **Delete Instance**.

### Special cases - Rebuilding FULLTEXT indexes

If you modify the value of any of the configuration parameters listed below, you would be 
required to rebuild indexes on all tables with FULLTEXT indexes. After you have rebuild 
the index, only then will the modified value be reflected in your database. Use 
<code>REPAIR TABLE tbl_name QUICK;</code>:

<table border="0">
<tbody>
<tr>
	<td>innodb_ft_max_token_size</td>
	<td>innodb_ft_min_token_size</td>
	<td>innodb_ft_num_word_optimize</td>
</tr>
<tr>
	<td>innodb_ft_enable_stopword</td>
	<td>innodb_ft_server_stopword_table</td>
	<td>innodb_ft_user_stopword_table</td>
</tr>
<tr>
	<td>ft_min_word_len</td>
	<td>ft_max_word_len</td>
	<td>innodb_ft_cache_size</td>
</tr>
<tr>
	<td>innodb_ft_enable_stopword</td>
	<td>innodb_ft_max_token_size</td>
	<td>innodb_ft_min_token_size</td>
</tr>
<tr>
	<td>innodb_ft_num_word_optimize</td>
	<td>innodb_ft_result_cache_limit</td>
	<td>innodb_ft_server_stopword_table</td>
</tr>
<tr>
	<td>innodb_ft_sort_pll_degree</td>
	<td>innodb_ft_total_cache_size</td>
	<td>innodb_ft_sort_pll_degree</td>
</tr>
<tr>
	<td>innodb_ft_total_cache_size</td>
</tr>
</tbody>
</table>
