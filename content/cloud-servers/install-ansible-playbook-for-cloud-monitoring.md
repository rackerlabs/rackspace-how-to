---
permalink: install-ansible-playbook-for-cloud-monitoring/
audit_date: '2019-01-22'
title: Install Ansible playbook for Cloud Monitoring
type: article
created_date: '2019-01-22'
created_by: Rackspace Community
last_modified_date: '2019-01-23'
last_modified_by: Kate Dougherty
product: Rackspace Monitoring
product_url: rackspace-monitoring
---

This article shows you how to install the Ansible&reg; playbook for Cloud
Monitoring on your cloud server by using the following steps:

1. [Connect to the cloud server](/how-to/connect-to-a-cloud-server/) on which
   you want to run Ansible locally.

2. Update the operating system (OS) and install Python plug-ins by running the
   following commands:

   - On Debian&reg; and Ubuntu&reg;:

         apt-get update && apt-get install python-apt python-pip build-essential python-dev git python-virtualenv -y

   - On Red Hat&reg; and CentOS&reg;:

         yum install python-pip git python-devel python-virtualenv gcc -y

3. Prepare the virtual environment by running the following commands:

        virtualenv /root/monitorenv

        . /root/monitorenv/bin/activate
        pip install paramiko PyYAML jinja2 httplib2 ansible

4. Download the playbook by running the following command:

        git clone https://github.com/stevekaten/cloud-monitoring-plugin-deploy

5. Move to the repository that holds the playbook that you just downloaded by
   running the following command:

        cd cloud-monitoring-plugin-deploy

6. Next, you need to use the following commands to configure the plug-ins:

   - The following command configures the `holland_mysqldump` plug-in on the
     local host:

         ansible-playbook -i hosts holland_mysqldump.yml

   - The following command configures the `mysql_slave` plug-in on the local
     host:

         ansible-playbook -i hosts mysql_slave.yml

   - The following command fails with an error message informing you that you
     need to set a port:

         ansible-playbook -i hosts port_check.yml

   - The following command configures the `port_check` plug-in on the localhost
     to check if port 8080 is open:

         ansible-playbook -i hosts port_check.yml -e port=8080

   - The following command configures the `port_check` plug-in to check
     rackspace.com:80:

         ansible-playbook -i hosts port_check.yml -e '{"host":"rackspace.com","port":"80"}'

   - The following command configures the `port_check plugin` to check the MySQL&reg;
     port 3306 on the ServiceNet address:

         ansible-playbook -i hosts port_check.yml -e '{"host":"10.X.X.X","port":"3306"}'

   - The following command configures the `lsyncd_check` plug-in:

         ansible-playbook -i hosts lsyncd_check.yml

After you follow the preceding steps, the Ansible playbook should start running and monitoring your cloud server
automatically.
