---
permalink: set-up-apache2-web-server-on-two-instances-with-shared-ip/
audit_date:
title: Set up Apache2 web server on two instances with shared ip
type: article
created_date: '2016-08-15'
created_by: Rackspace Support
last_modified_date: '2016-08-15'
last_modified_by: Kyle Laffoon
product: Cloud Networks
product_url: cloud-networks
---

This article describes how to run an Apache2 web server on a pair of cloud servers with a
shared public IPv4 IP address. The shared IP address ensures that users of services don't
need to change addresses when the second server seamlessly takes over from the first after
the first server goes down.

The use case in this article shows an Apache web server deployed on two
Ubuntu cloud servers with a shared IP address on PublicNet that is used
to reach the web servers. A heartbeat is used as the protocol to determine
which cloud server is currently the "owner" of the shared IP address and
will respond to a web request.

The following sections show you how to:

  -  Create two servers in the same publicIPZoneId

  -  Create a shared IP address and associate the shared IP address
     with both servers

  -  Configure apache2 and set up the heartbeat on the servers

  -  Test the configuration

### Before you begin

You should have an authentication token and the ability to use cURL in your environment.

### Create two servers in the same publicIPZoneId

Perform the following steps from your local computer.

1. Boot the master server. Save the server ID for future reference.

   *Request:*

      curl -s https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers
           -X POST -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"
           -d " {"server": {"name": "isol1", "imageRef": "adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3", "flavorRef": "2", "max_count": 1, "min_count": 1, "networks": [{"uuid": "00000000-0000-0000-0000-000000000000"}, {"uuid": "11111111-1111-1111-1111-111111111111"}, {"uuid": "7af32f1c-85de-44c5-be68-4b1465566683"}]}}"

   *Response:*

      {"server": {
            "OS-DCF:diskConfig": "AUTO",
            "id": "96bbd712-0f64-4146-bfb2-b2bd91f20319",
            "links": [
               {"href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319", "rel": "self"},
               {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319", "rel": "bookmark"}
            ],
            "adminPass": "P6dW6YLk4pLQ"
         }
      }

2. Get the details for the master server. Save the publicIPZoneId for future  
   reference.

   *Request:*

      curl -s https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319
           -X GET -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"

   *Response:*

      {"server": {
            "OS-DCF:diskConfig": "AUTO",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId": "8487ac8920752e042b0c70a4f9e064157ed2e051728fe2beb6bff09f",
            "accessIPv4": "10.23.233.113",
            "accessIPv6": "2001:4801:787f:205:a8bb:ccff:fe00:108",
            "addresses": {
               "private": [
                  {"addr": "10.183.232.104","version": 4}
               ],
               "public": [
                  {"addr": "10.23.233.113","version": 4},
                  {"addr": "2001:4801:787f:205:a8bb:ccff:fe00:108","version": 6}
               ]
            },
            "config_drive": "",
            "created": "2015-07-27T20:02:48Z",
            "flavor": {
               "id": "2",
               "links": [
                  {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/flavors/2","rel": "bookmark"}
               ]
            },
            "hostId": "e8eec5e7fca548316dc32ac57010fbb23e035088c4625e4e92804e52",
            "id": "96bbd712-0f64-4146-bfb2-b2bd91f20319",
            "image": {
               "id": "adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3",
               "links": [
                  {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/images/adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3","rel": "bookmark"}
               ]
            },
            "key_name": null,
            "links": [
               {"href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319","rel": "self"},
               {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319","rel": "bookmark"}
            ],
            "metadata": {},
            "name": "isol1",
            "progress": 100,
            "status": "ACTIVE",
            "tenant_id": "5831008",
            "updated": "2015-07-27T20:03:46Z",
            "user_id": "207638"
         }
      }

3. Boot the slave server in same publicIPZoneId as the master server by using
   a scheduler hint. Save the server ID for future reference.

   *Request:*

      curl -vv -s -k https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers
           -X POST -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"
           -d "{"server":{"name": "isol2","imageRef": "adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3","os:scheduler_hints": {"public_ip_zone:near": ["96bbd712-0f64-4146-bfb2-b2bd91f20319"]},"flavorRef": "2","max_count": 1,"min_count": 1,"networks": [{"uuid": "00000000-0000-0000-0000-000000000000"}, {"uuid": "11111111-1111-1111-1111-111111111111"}, {"uuid": "7af32f1c-85de-44c5-be68-4b1465566683"}]}}&rdquo;

   *Response:*

      {"server": {
            "OS-DCF:diskConfig": "AUTO",
            "id": "ffec9d55-2d54-4718-bc3a-0d47fb8c52c1",
            "links": [
               {"href": "https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1", "rel": "self"},
               {"href": "https://dfw.servers.api.rackspacecloud.com/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1", "rel": "bookmark"}
            ],
            "adminPass": "q5dmoSkbYLF6"
         }
      }

4. Get the details for the slave server and confirm that slave server is in
   the same publicIPZoneId as master server.

   *Request:*

      curl -s https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1
           -X GET -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"

   *Response:*

      {"server": {
            "OS-DCF:diskConfig": "AUTO",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "RAX-PUBLIC-IP-ZONE-ID:publicIPZoneId": "8487ac8920752e042b0c70a4f9e064157ed2e051728fe2beb6bff09f",
            "accessIPv4": "10.23.233.89",
            "accessIPv6": "2001:4801:787f:205:a8bb:ccff:fe00:e4",
            "addresses": {
               "private": [
                  {"addr": "10.183.232.82","version": 4}
               ],
               "public": [
                  {"addr": "2001:4801:787f:205:a8bb:ccff:fe00:e4","version": 6},
                  {"addr": "10.23.233.89","version": 4}
               ]
            },
            "config_drive": "",
            "created": "2015-07-27T20:03:36Z",
            "flavor": {
               "id": "2",
               "links": [
                  {"href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/flavors/2","rel": "bookmark"}
               ]
            },
            "hostId": "5f4b7f1f0870880a910c4028f53c642730be6fdfa0cf5f9b7f3d126e",
            "id": "ffec9d55-2d54-4718-bc3a-0d47fb8c52c1",
            "image": {
               "id": "adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3",
               "links": [
                  {"href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/images/adb78bf4-81ae-4dce-a417-8eb2b7f7f0c3","rel": "bookmark"}
               ]
            },
            "key_name": null,
            "links": [
               {"href": "https://qe-ord.servers.api.rackspacecloud.com/v2/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1","rel": "self"},
               {"href": "https://qe-ord.servers.api.rackspacecloud.com/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1","rel": "bookmark"}
            ],
            "metadata": {},
            "name": "isol2",
            "progress": 100,
            "status": "ACTIVE",
            "tenant_id": "5831008",
            "updated": "2015-07-27T20:04:39Z",
            "user_id": "207638"
         }
      }

### Create a shared IP address and associate it with both servers

Perform the following steps from your local computer.

1. Get port IDs for both servers. Filter the list ports operation by the
   PublicNet (network ID that is all zeroes). Find the sections of the response where the value of device_id matches the master server, and save the corresponding ID (which is the port ID) for future reference. Do the same thing for the slave server.

   *Request:*

      curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/ports?network_id=00000000-0000-0000-0000-000000000000
           -X GET
           -H "X-Auth-Token: $token" | python -m json.tool

   *Response:*

      {"ports": [
            {
               "admin_state_up": true,
               "device_id": "96bbd712-0f64-4146-bfb2-b2bd91f20319",
               "device_owner": "compute:None",
               "fixed_ips": [
                  {
                    "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:108",
                    "subnet_id": "e170e323-b232-4bd7-9d75-14d82546c5d6"
                  },
                  {
                     "ip_address": "10.23.233.113",
                     "subnet_id": "535ca638-a358-4d02-8271-1e6f795f8a0c"
                  }
               ],
               "id": "0b5a23ec-be78-4ea3-9251-b64444236c1d",
               "mac_address": "AA:BB:CC:00:01:08",
               "name": "",
               "network_id": "00000000-0000-0000-0000-000000000000",
               "security_groups": [],
               "status": "ACTIVE",
               "tenant_id": "5831008"
            },
            {
               "admin_state_up": true,
               "device_id": "ffec9d55-2d54-4718-bc3a-0d47fb8c52c1",
               "device_owner": "compute:None",
               "fixed_ips": [
                  {
                     "ip_address": "2001:4801:787f:205:a8bb:ccff:fe00:e4",
                     "subnet_id": "e170e323-b232-4bd7-9d75-14d82546c5d6"
                  },
                  {
                     "ip_address": "10.23.233.89",
                     "subnet_id": "535ca638-a358-4d02-8271-1e6f795f8a0c"
                  }
               ],
               "id": "a1bb7074-9ccc-4bc0-991e-7847de374af3",
               "mac_address": "AA:BB:CC:00:00:E4",
               "name": "",
               "network_id": "00000000-0000-0000-0000-000000000000",
               "security_groups": [],
               "status": "ACTIVE",
               "tenant_id": "5831008"
            }
         ],
         "ports_links": [
            {
               "href": "http://localhost:9696/v2.0/ports?network_id=00000000-0000-0000-0000-000000000000&marker=0b5a23ec-be78-4ea3-9251-b64444236c1d&page_reverse=True",
               "rel": "previous"
            }
         ]
      }

2. Provision the IP address on the PublicNet ports for the master and slave  
   servers. For future reference, note the IP address and the IP address ID in the response.

   *Request:*

      curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/ip_addresses
           -X POST -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"
           -d " {"ip_address":{"network_id": "00000000-0000-0000-0000-000000000000","port_ids": ["a1bb7074-9ccc-4bc0-991e-7847de374af3", "0b5a23ec-be78-4ea3-9251-b64444236c1d"],"tenant_id": "5831008","version": 4}}"

   *Response:*

      {"ip_address": {
            "subnet_id": "535ca638-a358-4d02-8271-1e6f795f8a0c",
            "version": 4,
            "address": "10.23.233.31",
            "network_id": "00000000-0000-0000-0000-000000000000",
            "tenant_id": "5831008",
            "port_ids": [
               "a1bb7074-9ccc-4bc0-991e-7847de374af3",
               "0b5a23ec-be78-4ea3-9251-b64444236c1d"
            ],
            "type": "shared",
            "id": "e201f500-6d57-4901-b7a0-3842a3a32207"
         }
      }

3. Confirm that both server ports share the IP address.

   *Request:*

      curl -s https://dfw.networks.api.rackspacecloud.com/v2.0/ip_addresses
           -X GET -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"

   *Response:*

      "ip_addresses": {[{
               "address": "2001:4801:787f:205:a8bb:ccff:fe00:108",
               "id": "068652fe-33e2-44b6-9ad3-c0362e5d7e18",
               "network_id": "00000000-0000-0000-0000-000000000000",
               "port_ids": [
                  "0b5a23ec-be78-4ea3-9251-b64444236c1d"
               ],
               "subnet_id": "e170e323-b232-4bd7-9d75-14d82546c5d6",
               "tenant_id": "5831008",
               "type": "fixed",
               "version": 6
            },
            {
               "address": "10.183.232.82",
               "id": "59202862-7b4c-4bad-bcef-6c33dcfc29d7",
               "network_id": "11111111-1111-1111-1111-111111111111",
               "port_ids": [
                  "3d1269a5-090b-4fe7-b839-4dafc8b42425"
               ],
               "subnet_id": "d1c63a31-1501-46f2-aebf-992cdb5bf372",
               "tenant_id": "5831008",
               "type": "fixed",
               "version": 4
            },
            {
               "address": "10.23.233.31",
               "id": "e201f500-6d57-4901-b7a0-3842a3a32207",
               "network_id": "00000000-0000-0000-0000-000000000000",
               "port_ids": [
                  "0b5a23ec-be78-4ea3-9251-b64444236c1d",
                  "a1bb7074-9ccc-4bc0-991e-7847de374af3"
               ],
               "subnet_id": "535ca638-a358-4d02-8271-1e6f795f8a0c",
               "tenant_id": "5831008",
               "type": "shared",
               "version": 4
            },
            {
               "address": "10.23.233.89",
               "id": "f2263b79-221d-46c0-9436-2b4bf98df227",
               "network_id": "00000000-0000-0000-0000-000000000000",
               "port_ids": [
                  "a1bb7074-9ccc-4bc0-991e-7847de374af3"
               ],
               "subnet_id": "535ca638-a358-4d02-8271-1e6f795f8a0c",
               "tenant_id": "5831008",
               "type": "fixed",
               "version": 4
            }
         ]
      }

4. Associate the shared IP address with the master server.

   *Request:*

      curl -vv -s -k https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/96bbd712-0f64-4146-bfb2-b2bd91f20319/ip_associations/e201f500-6d57-4901-b7a0-3842a3a32207
           -X PUT -H "Content-Type: application/json"
           -H "X-Auth-Token: $token"

   *Response:*

      {"ip_association": {
            "id": "e201f500-6d57-4901-b7a0-3842a3a32207",
            "address": "10.23.233.31"
         }
      }

5. Associate the shared IP address with the slave server.

   *Request:*

      curl -vv -s -k https://dfw.servers.api.rackspacecloud.com/v2/5831008/servers/ffec9d55-2d54-4718-bc3a-0d47fb8c52c1/ip_associations/e201f500-6d57-4901-b7a0-3842a3a32207
            -X PUT -H "Content-Type: application/json" <br>
            -H "X-Auth-Token: $token"

   *Response:*

      {"ip_association": {
            "id": "e201f500-6d57-4901-b7a0-3842a3a32207",
            "address": "10.23.233.31"
         }
      }

### Configure Apache2 and set up the heartbeat on the servers

Perform the following steps on the master and slave servers. Each step
indicates where to perform the step.

1. (Master) Install Apache on the master server by running the following
   commands:

    sudo apt-get update
    sudo apt-get install heartbeat
    sudo apt-get install apache2

2. (Master) Create the ***/etc/heartbeat/authkeys*** file on the master server
   and enter the following text. The contents are the same for the master server and the slave server. Substitute your own passphrase.

   *File contents:*

    auth 1
    1 sha1 YourSecretPassPhrase

3. (Master) Set the correct permissions on the ***/etc/heartbeat/authkeys***
   file:

    chmod 600 /etc/heartbeat/authkeys

4. (Master) Create the ***/etc/heartbeat/haresources*** file on the master
   server and enter the following contents (with your master server public IP address). The contents are the same for the master server and the slave server.

   *File contents:*

    master-instance-hostname 10.23.233.113/24

5. (Master) Create the ***/etc/heartbeat/ha.cf*** file on master server and
   enter the following text. The lines with comments are the ones that have to be modified.

   *File contents:*

      logfacility daemon
      keepalive 2
      deadtime 15
      warntime 5
      initdead 120
      udpport 694
      ucast eth0 10.23.233.89 # The IP address of the slave instance on public net
      auto_failback on
      node master-instance-hostname # master-instance-hostname is the name displayed by uname -n in the master instance
      node slave-instance-hostname # slave-instance-hostname is the name displayed by uname -n in the slave instance
      respawn hacluster /usr/lib/heartbeat/ipfail
      use_logd yes

6. (Slave) Install Apache on the slave server by running the following
   commands:

    sudo apt-get update
    sudo apt-get install heartbeat
    sudo apt-get install apache2

7. (Slave) Create the ***/etc/heartbeat/authkeys*** file on the slaver server
   and enter the following text. The contents are the same for the master server and the slave server. Substitute your own passphrase.

   *File contents:*

      auth 1
      1 sha1 YourSecretPassPhrase

8. (Slave) Set the correct permissions on the ***/etc/heartbeat/authkeys***
   file.

    chmod 600 /etc/heartbeat/authkeys

9. (Slave) Create the ***/etc/heartbeat/haresources*** file on the slave
   server and populate it with the shared IP address (with you master server public IP address). The contents are the same for the master server and the slave server.

   *File contents:*

      master-instance-hostname 10.23.233.113/24

10. (Slave) Create the ***/etc/heartbeat/ha.cf*** file on the slave server and
   enter the following text. The lines with comments are the ones that have to be modified.

   *File contents:*

      logfacility daemon
      keepalive 2
      deadtime 15
      warntime 5
      initdead 120
      udpport 694
      ucast eth0 10.23.233.89 # The ip address of the master instance on public net
      auto_failback on
      node master-instance-hostname# master-instance-hostname is the name displayed by uname -n in the master instance
      node slave-instance-hostname # slave-instance-hostname is the name displayed by uname -n in the slave instance
      respawn hacluster /usr/lib/heartbeat/ipfail use_logd yes

11. (Slave) Restart the heartbeat on the slave server by running the following
   command:

    sudo service heartbeat restart

12. (Master) Set up Apache to respond with the hostname on the master server
   by running the following command:

    echo `hostname` > /var/www/html/index.html

13. (Slave) Set up Apache to respond with the hostname on the slave server by
   running the following command:

    echo `hostname` > /var/www/html/index.html

14. (Master) Restart Apache on the master server by running the following
   command:

    sudo service apache2 restart

15. (Slave) Restart Apache on the slave server by running the following
   command:

    sudo service apache2 restart

### Test the configuration

Perform the following steps on the master and slave servers and your
local computer. Each step indicates where to perform the step.

1. (Master) Validate the eth0 interface configured with the shared IP address
   on the master server by running the following command:

    ifconfig

   *Response:*

      eth0 Link encap:Ethernet HWaddr aa:bb:cc:00:00:e4
      inet addr:10.23.233.89 Bcast:10.23.233.255 Mask:255.255.255.0
      inet6 addr: fe80::a8bb:ccff:fe00:e4/64 Scope:Link
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
      RX packets:23989 errors:0 dropped:0 overruns:0 frame:0
      TX packets:6016 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:1000
      RX bytes:27487494 (27.4 MB) TX bytes:805941 (805.9 KB)

      eth0:0 Link encap:Ethernet HWaddr aa:bb:cc:00:00:e4
      inet addr:10.23.233.31 Bcast:10.23.233.255 Mask:255.55.255.0
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1

      eth1 Link encap:Ethernet HWaddr aa:bb:cc:00:00:e5
      inet addr:10.183.232.82 Bcast:10.183.239.255 Mask:255.255.248.0
      inet6 addr: fe80::a8bb:ccff:fe00:e5/64 Scope:Link
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
      RX packets:739 errors:0 dropped:0 overruns:0 frame:0
      TX packets:615 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:1000
      RX bytes:52142 (52.1 KB) TX bytes:85084 (85.0 KB)

      lo Link encap:Local Loopback
      inet addr:127.0.0.1 Mask:255.0.0.0

      inet6 addr: ::1/128 Scope:Host
      UP LOOPBACK RUNNING MTU:65536 Metric:1
      RX packets:46268 errors:0 dropped:0 overruns:0 frame:0
      TX packets:46268 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:0
      RX bytes:15678190 (15.6 MB) TX bytes:15678190 (15.6 MB)

2. (Local computer) Browse to the shared IP address, which connects you to the
   master server, by using a web browser with the shared IP address in the address bar. The browser displays
   the master server's instance name.

3. (Local computer) Use SSH to connect to the master server by running the
   following command (substituting your username and your master server IP address):

    ssh username@master_server_ip_address

4. (Master) Find the gateway address by running the following command. Save
   the gateway address for future reference.

    route | grep default

5. (Master) Turn off the eth0 interface by running the following command:

    sudo ifconfig eth0 down

6. (Local computer) Use SSH to connect to the slave server by running the
   following command (substituting your username and your master server IP address):

    ssh username@slave_server_ip_address

7. (Local computer) After a few moments, browse to the shared IP address,
   which connects you to the slave server, by using a web browser with the shared IP address in the address bar. The browser displays the slave server's instance name.

8. (Slave) Validate the eth0 interface configured with shared IP address on
   the slave server by running the following command:

    sudo ifconfig

   *Response:*

      eth0 Link encap:Ethernet HWaddr aa:bb:cc:00:01:08
      inet addr:10.23.233.113 Bcast:10.23.233.255 Mask:255.255.255.0
      inet6 addr: fe80::a8bb:ccff:fe00:108/64 Scope:Link
      inet6 addr: 2001:4801:787f:205:a8bb:ccff:fe00:108/64 Scope:Global
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
      RX packets:24551 errors:0 dropped:0 overruns:0 frame:0
      TX packets:6662 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:1000
      RX bytes:27526381 (27.5 MB) TX bytes:848469 (848.4 KB)

      eth0:0 Link encap:Ethernet HWaddr aa:bb:cc:00:01:08
      inet addr:10.23.233.31 Bcast:10.23.233.255 Mask:255.255.255.0
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1

      eth1 Link encap:Ethernet HWaddr aa:bb:cc:00:01:09
      inet addr:10.183.232.104 Bcast:10.183.239.255 Mask:255.255.248.0
      inet6 addr: fe80::a8bb:ccff:fe00:109/64 Scope:Link
      UP BROADCAST RUNNING MULTICAST MTU:1500 Metric:1
      RX packets:0 errors:0 dropped:0 overruns:0 frame:0
      TX packets:16 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:1000
      RX bytes:0 (0.0 B) TX bytes:1296 (1.2 KB)

      lo Link encap:Local Loopback
      inet addr:127.0.0.1 Mask:255.0.0.0
      inet6 addr: ::1/128 Scope:Host
      UP LOOPBACK RUNNING MTU:65536 Metric:1
      RX packets:778 errors:0 dropped:0 overruns:0 frame:0
      TX packets:778 errors:0 dropped:0 overruns:0 carrier:0
      collisions:0 txqueuelen:0
      RX bytes:256853 (256.8 KB) TX bytes:256853 (256.8 KB)

9. (Master) Turn on the eth0 interface by running the following command:

    sudo ifconfig eth0 up

10. (Master) Restore the shared IP address to the master instance by running
   the following command (using the gateway address from step 4):

    route add default gw <gateway-address>
