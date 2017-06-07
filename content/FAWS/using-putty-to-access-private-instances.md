---
permalink: using-putty-to-access-private-instances
audit_date: 'yyyy-mm-dd'
title: Using Putty to access a private instance
type: article
created_date: '2017-03-07'
created_by: Gustavo Panizzo
last_modified_date: '2017-03-07'
last_modified_by: Nate Archer
product: Fanatical Support for AWS
product_url: fanatical-support-for-aws
---

You use Putty and a bastion server to access a private EC2, RDS or Elasticache instance from a workstation without [Passport](https://manage.rackspace.com/docs/product-guide/passport.html) or site-to-site VPN. 

### Prerequisites

   - SSH access to a Linux instance that has a public IP (Bastion server)
   - Network access from the bastion server to the EC2, RDS, or Elasticache instance. Security groups and network access control credentials must allow access to the resource from the Bastion Server
   - A Windows oberation system with Putty installed

### Procedure

1. Connect to the bastion server, perform any validation needed, proxy, etc.  
2. Second click on the window title, a menu will open.  
3. On the menu select "Change Settings"  
4. On the left side tree select Connection -> SSH -> Tunnels  
5. On Source port configure a port that is not used on your local machine 
   Example, don't use 3306 if you run MySQL on your workstation, don't use 1433 if you use MSSQL on your workstation, don't use 80 & 443 if you use IIS on your workstation, don't use 3389, etc.  
6. On Destination write down the DNS Name of the RDS/ElastiCache/EC2 instance and the port you want to to connect to, For example for RDS MySQL rb1ppr6elwqc49x.cksdepeaehqd.ap-southeast-1.rds.amazonaws.com:3306  
7. Click on Add  
8. Click on Apply  
9. Go to Windows Firewall and Open the port you choose in the step 5  
10. Configure your tool to connect to 127.0.0.1 on the port you specify on the step 5  

### Troubleshooting

If you cannot connect, verify that the Security Groups on the resource and the Bastion Server allow to connect from the Bastion Server to the Private Resource  


If you still can't connect, the Source Port may be in use  

On Putty

1. Second click on the window title, a menu will open.  
2. On the menu select "Change Settings"  
3. On the left side tree select Connection -> SSH -> Tunnels  
4. Select the Forwarded port and click on Remove.  
5. Create the Forwarded port again using a different Source Port  


