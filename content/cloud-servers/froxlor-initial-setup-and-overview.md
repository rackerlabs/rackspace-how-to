---
permalink: froxlor-initial-setup-and-overview/
audit_date: '2020-07-22'
title: 'Froxlor initial setup and overview'
type: article
created_date: '2020-07-22'
created_by: Rackspace Support
last_modified_date: '2020-07-30'
last_modified_by: Rose Morales
product: Cloud Servers
product_url: cloud-servers
---

This guide describes how to set up of Froxlor after installation.

### Prerequisites

- A server running a Linux&reg; distribution
- A user with SSH administrator privileges

### Settings

1. Select the message **Click here to go to configurations** at the top of the panel.

2. Click on **System -> Settings** in the left panel.

3. Click on each sub-settings menu and look at every option before configuring services.

### Services

1. After the system settings are ready, click on **System -> Configuration**. 

2. Copy the PHP script at the bottom of the page and paste it into your server’s terminal. 

    **Note**: If you are not logged in as root, put `sudo` before the command.
    
    After you run the script, a series of questions display about the server you are running and the services you want to use.

3. Enter your operating system.

4. Select the web, DNS, SMTP, mail, and FTP servers you want to run. Unless you have a preference, select the default values.

5. Next, answer each prompt as required. After you select all you need, enter an empty value.

6. The system generates a new script to install and configure all the services. Enter **y** to run the script and press **Enter**.

7. Provide **Administrator** permissions when prompted. After the installation finishes, the message 
   **“All services have been configured”** displays.

### Create a Customer

1. Now, you can create your first customer user. Click on **Resources -> Customers**.

2. Click **Create Customer**.

3. Input the account details.

4. Input contact information.

5. Input quota and access details and click **Save**.
