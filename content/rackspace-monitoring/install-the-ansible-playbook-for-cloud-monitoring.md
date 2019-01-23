---
permalink: install-the-ansible-playbook-for-cloud-monitoring
audit_date:
title: Install the Ansible Playbook for Cloud Monitoring
created_date: '2019-01-23'
created_by: Rackspace Community
last_modified_date: 
last_modified_by: 
product: Rackspace Monitoring
product_url: rackspace-monitoring
--- 

Connect to the Cloud Server.  You will be running Ansible locally on the Cloud Server where you wish to install the plugin.
 
Debian/Ubuntu:
 
apt-get update && apt-get install python-apt python-pip build-essential python-dev git python-virtualenv -y
 
RedHat/CentOS:
 
yum install python-pip git python-devel python-virtualenv gcc -y
 
Prepare the virtual environment:
 
virtualenv /root/monitorenv

. /root/monitorenv/bin/activate
pip install paramiko PyYAML jinja2 httplib2 ansible
 
Download the playbook:
 
git clone https://github.com/stevekaten/cloud-monitoring-plugin-deploy
cd cloud-monitoring-plugin-deploy
 
Now you can run the playbook from the server, see the examples below.
 
ansible-playbook -i hosts holland_mysqldump.yml

* This will configure the holland_mysqldump plugin on the localhost.

ansible-playbook -i hosts mysql_slave.yml

* This will configure the mysql_slave plugin on the localhost.

ansible-playbook -i hosts port_check.yml

* This will fail with an error message informing you that you need to set a port.

ansible-playbook -i hosts port_check.yml -e port=8080

* This will configure the port_check plugin on the localhost checking if port 8080 is open.

ansible-playbook -i hosts port_check.yml -e '{"host":"rackspace.com","port":"80"}'

* This will configure the port_check plugin to check rackspace.com:80.

ansible-playbook -i hosts port_check.yml -e '{"host":"10.X.X.X","port":"3306"}'

* This will configure the port_check plugin to check mysql's port 3306 on the ServiceNet address.

ansible-playbook -i hosts lsyncd_check.yml

* This will configure the lsyncd_check plugin.
 
So what's happening?
 
The Ansible playbook is configuring and installing the Cloud Monitoring plugin.  In the past you would go through the steps manually, now you can skip most of them.  You still need to configure the plugin correctly and put it on the correct Cloud Server.  If you don't you should begin troubleshooting your failure to configure the plugin correctly or your failure to put it on the correct Cloud Server. 
