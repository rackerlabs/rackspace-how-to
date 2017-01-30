---
permalink: brocade-vyatta-vrouter-supported-actions-through-the-cloud-control-panel/
audit_date:
title: 'Brocade Vyatta vRouter: Supported actions through the Cloud Control Panel'
type: article
created_date: '2013-05-24'
created_by: Sameer Satyam
last_modified_date: '2016-01-20'
last_modified_by: Kelly Holcomb
product: Cloud Networks
product_url: cloud-networks
---

You can use the Cloud Control Panel to provision an instance of Brocade Vyatta vRouter appliance. After you provision the appliance, you can perform a limited set of actions on it from the control panel. Some of the actions available for Brocade Vyatta vRouter can lead to unexpected results and should be avoided. This article describes which actions are functional and which actions to avoid.

**Note:** Currently, configuration of the Brocade Vyatta vRouter in the Cloud Control Panel is not supported. You must use the command line to configure Brocade Vyatta vRouter.

### Access available actions for Brocade Vyatta vRouter

You can access available actions for Brocade Vyatta vRouter in the following ways:

- In the Cloud Servers list in the control panel, click the name of the appliance. You can perform some actions on the server details page, or click the **Actions** menu in the upper-right corner of that page.

- In the Cloud Servers list, click the gear icon to the left of the appliance name to see a list of the available actions, as shown in the following image

  <img src="{% asset_path cloud-networks/brocade-vyatta-vrouter-supported-actions-through-the-cloud-control-panel/1555-3480-1.png %}" width="217" height="364" border="1" alt=""  />

The following table describes you which actions you can perform and which actions you should avoid.

<table border="1" cellpadding="2">
	<thead>
		<tr>
			<th>Action</th>
			<th>Cloud Control Panel</th>
			<th>Notes</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>
			<strong>Add Network or Disconnect Network</strong></p>
			</td>
			<td>Does not work</td>
			<td>Do not try to attach or detach networks from a Vyatta appliance or the networking will break.</td>
		</tr>
		<tr>
			<td><strong>Tag Server (Add Tag)</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Create Image</strong></td>
			<td>Works</td>
			<td>Delete the interface configuration from <strong>/config/config.boot</strong> to have the correct interface numbering and configuration in servers that are built using this image.</td>
		</tr>
		<tr>
			<td><strong>Create Check (monitoring)</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Rebuild from Image</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Enter Rescue Mode</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Connect Via Terminal (Console)</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
		<tr>
			<td><strong>Reboot Server</strong></td>
			<td>Does not work</td>
			<td>Both soft and hard reboot fail and the server remains active. You can use <strong>reboot</strong> and <strong>poweroff</strong> within Vyatta using the CLI.</td>
		</tr>
		<tr>
			<td><strong>Resize Server</strong></td>
			<td>Partially works</td>
			<td>Works only when moving to a larger size instance. Selecting a smaller size puts the VM into an error state but it continues to function. This action is not available for General Purpose cloud servers.</td>
		</tr>
		<tr>
			<td><strong>Change Password</strong></td>
			<td>Works</td>
			<td>This action changes the password for the <strong>vyatta</strong> user and not for the <strong>root</strong> user.</td>
		</tr>
		<tr>
			<td><strong>Delete Server</strong></td>
			<td>Works</td>
			<td>None</td>
		</tr>
	</tbody>
</table>
