---
permalink: about-the-alert-logic-agent/
title: About the Alert Logic agent
type: article
audit_date: '2020-02-03'
created_date: '2020-02-03'
created_by: RMS Network Defense
last_modified_date: '2020-02-03'
last_modified_by: Stephanie Fillmon
product: Alert Logic Security Solutions
product_url: rms-alert-logic
---

If you're using Alert Logic&reg; in the Cloud, Log Manager, Essentials or Professional, Rackspace has deployed the Alert Logic Agent.  Read on to gain a greater understanding of what the Alert Logic Agent is used for and why it is so important.

### Agent education

Alert Logic solution utilizes agents within the network intrusion detection system (IDS) and log management services as the means of collecting host information from customers and clients. The agents copy only the necessary information and send it back to Alert Logic for analysis. In the simplest terms, agents are the means that the network IDS and log management services use to collect data and logs about activity taking place within your protected environments.

In cloud environments, the network IDS aspect of the agent binds to the network interface of the machine on which the agent has been installed and collecting copies of the network traffic sent to and from the host. The copy of the network traffic is then sent to designated Threat Manager appliance within the environment for inspection of the traffic. While the capability exists within on-premises  environments, it is not supported as inspection of the traffic is performed directly by the Threat Manager appliance through the utilization of a SPAN or tap.

The log management aspect of the agent collects logs from host machines where the agent is installed. 

It is integral to the usefulness of both services that agents are installed  on your host machines. Agents are required for the network IDS and log management services to work properly in a cloud environment. In cloud environments, without agents,  Alert Logic's view of the environment is limited. In on-premises environments, agents are only required for the log management service if gathering of server logs is required.

**Note**: Agents stop caching data after they have been offline for over 90 days.

**Tip**: The network IDS and log management services are, by default, set to auto-update. Make sure that your environments allow for auto-updates! If you do not have automatic updates enabled, then you will need to manually apply updates. Otherwise, agents will not run the latest software. At some point, lack of new updates may cause performance issues. Updates need to be applied to get the full value and effect of new features and functionality.

### Agent installation

The Rackspace Network Defense team deploys the Alert Logic agents on your behalf.

### Performance impact

Agents have little impact and overhead on customer systems. Because they run as a service, the entire system will not need to be reloaded if there is an issue with the agent. In that case, only the agent service would need to be restarted. Agents use almost no hard drive space.

### Platform support

Amazon Linux&reg; is supported by the Alert Logic Agent. Amazon Linux instances are highly based on CentOS/Red Hat Linux, which we do currently support and will work to maintain support with the latest available releases. Alert Logic has a number of customers running the agent on Amazon Linux instances.

The following operating systems support Alert logic agent deployment:

**Windows&reg;**

- Windows Server&reg; 2016
- Windows Server 2012
- Windows 10
- Windows Server 2008
- Windows Server 2003; SP 1
- Windows (8, 7, Vista)
- Windows XP; SP 1

**Debian&reg;**

- 8.x (Jessie)
- 7.x (Wheezy)
- 6.x (Squeeze)
- 5.x (Lenny)

**CentOS&reg;**

- 7.x
- 6.x
- 5.x

**Red Hat&reg; Enterprise Linux&reg;**

- 7.x
- 6.x
- 5.x

**Ubuntu&reg; operating system**

- 16.x
- 14.x
- 12.x
- 10.x

**SUSE&reg; Linux Enterprise**

- 15.1
- 12.1
- 11.4
- 11.3
