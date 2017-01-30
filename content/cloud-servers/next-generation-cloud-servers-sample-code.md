---
permalink: next-generation-cloud-servers-sample-code/
audit_date:
title: 'Cloud Servers: Sample Code'
type: article
created_date: '2012-07-24'
created_by: Jerry Schwartz
last_modified_date: '2016-09-12'
last_modified_by: Kyle Laffoon
product: Cloud Servers
product_url: cloud-servers
---

### API Operations

-   Servers
    -   List Servers
    -   Create Server
    -   Get Server Details
    -   Update Server
    -   Delete Server
    -   Server Addresses
        -   List Addresses
        -   List Addresses by Network
        -   Server Actions
            -   Change Administrator Password
            -   Reboot Server
            -   Rebuild Server
            -   Resize Server
            -   Confirm Resized Server
            -   Revert Resized Server
            -   Create Image
            -   Volume Attachment Actions
                -   Attach Volume to Server
                -   List Volume Attachments
                -   Get Volume Attachment Details
                -   Delete Volume Attachment
            -   Flavors
                -   List Flavors
                -   Get Flavor Details
            -   Images
                -   List Images
                -   Get Image Details
                -   Delete Image
            -   Metadata
                -   List Metadata
                -   Set Metadata
                -   Update Metadata
                -   Get Metadata Item
                -   Set Metadata Item
                -   Delete Metadata Item

### cURL

#### Code Sample: Add User To Your Account Through API (cURL)

To add a user to your account through the API, you can do the following:

1.  Get a token.

    -   Through password-authentication:

            curl -X POST https://identity.api.rackspacecloud.com/v2.0/tokens -d '{"auth":{"passwordCredentials":{"username":"theUserName","password":"thePassword"}}}' -H "Content-type: application/json"

    -   Through API key authentication:

            curl -X POST https:// identity.api.rackspacecloud.com/v2.0/tokens -d '{ "auth":{ "RAX-KSKEY:apiKeyCredentials":{ "username":"theUserName", "apiKey":"00a00000a000a0000000a000a00aaa0a" } } }' -H "Content-type: application/json"

    The access.token.id in the response is the token.

2.  Create a new user.

    -   Specifying a password:

            curl -X POST https://identity.api.rackspacecloud.com/v2.0/users -d '{"user": {"username": "theUserName", "email": "john.smith@example.org", "enabled": true, "OS-KSADM:password":"thePassword"}}'  -H "Content-type: application/json" -H "X-Auth-Token: theToken"

    -   Not specifying a password (one will be generated and sent back
        in the response):

            curl -X POST https://identity.api.rackspacecloud.com/v2.0/users -d '{"user": {"username": "theUserName", "email": "john.smith@example.org", "enabled": true, "OS-KSADM:password":"thePassword"}}'  -H "Content-type: application/json" -H "X-Auth-Token: theToken"

Any newly-created user for your account will have the same access that
you have, except that they will not be able to create or update other
users.

You can also update or delete a user.

-   Update:

        curl -X POST https://identity.api.rackspacecloud.com/v2.0/users/{userID} -d '{"user": {"username": "theUserName", "email": "john.smith@example.org", "enabled": true, "OS-KSADM:password":"thePassword"}}'  -H "Content-type: application/json" -H "X-Auth-Token: theToken"

-   Delete:

        curl -X DELETE https://identity.api.rackspacecloud.com/v2.0/users/{userID} -H "X-Auth-Token: "XXXXXXX"

### XML

#### Code Sample: Create Server Request (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.openstack.org/compute/api/v1.1" imageRef="5f68715f-201f-4600-b5a1-0b97e2b1cb31" flavorRef="2" diskConfig="auto" name="new-server-test" min_count="1" max_count="1">
        <metadata>
            <meta key="My Server Name">Ubuntu 10.04 LTS</meta>
        </metadata>
        <personality>
            <file path="/etc/banner.txt">
    ICAgICAgDQoiQSBjbG91ZCBkb2VzIG5vdCBrbm93IHdoeSBp
    dCBtb3ZlcyBpbiBqdXN0IHN1Y2ggYSBkaXJlY3Rpb24gYW5k
    IGF0IHN1Y2ggYSBzcGVlZC4uLkl0IGZlZWxzIGFuIGltcHVs
    c2lvbi4uLnRoaXMgaXMgdGhlIHBsYWNlIHRvIGdvIG5vdy4g
    QnV0IHRoZSBza3kga25vd3MgdGhlIHJlYXNvbnMgYW5kIHRo
    ZSBwYXR0ZXJucyBiZWhpbmQgYWxsIGNsb3VkcywgYW5kIHlv
    dSB3aWxsIGtub3csIHRvbywgd2hlbiB5b3UgbGlmdCB5b3Vy
    c2VsZiBoaWdoIGVub3VnaCB0byBzZWUgYmV5b25kIGhvcml6
    b25zLiINCg0KLVJpY2hhcmQgQmFjaA==
    </file>
        </personality>
    </server>

#### Code Sample: Create Server Response (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns:OS-DCF="http://docs.openstack.org/compute/ext/disk_config/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" xmlns="http://docs.openstack.org/compute/api/v1.1" id="827bf583-0b54-4526-b58b-8c3dca04ab28" adminPass="123456789abc" OS-DCF:diskConfig="AUTO">
        <metadata/>
        <atom:link href="https://dfw.servers.api.rackspacecloud.com/v2/123456/servers/827bf583-0b54-4526-b58b-8c3dca04ab28" rel="self"/>
        <atom:link href="https://dfw.servers.api.rackspacecloud.com/123456/servers/827bf583-0b54-4526-b58b-8c3dca04ab28" rel="bookmark"/>
    </server>

#### Code Sample:  Get Server Details Response (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns:RAX-SERVER="http://docs.rackspace.com/servers/api/ext/server_bandwidth/" xmlns="http://docs.openstack.org/compute/api/v1.1" xmlns:atom="http://www.w3.org/2005/Atom" id="52415800-8b69-11e0-9b19-734f000004d2" tenant_id="1234" user_id="5678" name="sample-server" status="BUILD" updated="2010-10-10T12:00:00Z" created="2010-08-10T12:00:00Z" progress="60" hostId="e4d909c290d0fb1ca068ffaddf22cbd0" accessIPv4="67.23.10.132" accessIPv6="::babe:67.23.10.132">
        <image id="52415800-8b69-11e0-9b19-734f6f006e54">
            <atom:link rel="self" href="http://servers.api.rackspacecloud.com/v2/1234/images/  52415800-8b69-11e0-9b19-734f6f006e54"/>
            <atom:link rel="bookmark" href="http://servers.api.rackspacecloud.com/1234/images/  52415800-8b69-11e0-9b19-734f6f006e54"/>
        </image>
        <flavor id="52415800-8b69-11e0-9b19-734f216543fd">
            <atom:link rel="self" href="http://servers.api.rackspacecloud.com/v2/1234/flavors/  52415800-8b69-11e0-9b19-734f216543fd"/>
            <atom:link rel="bookmark" href="http://servers.api.rackspacecloud.com/1234/flavors/  52415800-8b69-11e0-9b19-734f216543fd"/>
        </flavor>
        <metadata>
            <meta key="Server Label">Web Head 1</meta>
            <meta key="Image Version">2.1</meta>
        </metadata>
        <addresses>
            <network id="public">
                <ip version="4" addr="67.23.10.132"/>
                <ip version="6" addr="::babe:67.23.10.132"/>
                <ip version="4" addr="67.23.10.131"/>
                <ip version="6" addr="::babe:4317:0A83"/>
            </network>
            <network id="private">
                <ip version="4" addr="10.176.42.16"/>
                <ip version="6" addr="::babe:10.176.42.16"/>
            </network>
        </addresses>
        <atom:link rel="self" href="http://servers.api.rackspacecloud.com/v2/1234/servers/  52415800-8b69-11e0-9b19-734f000004d2"/>
        <atom:link rel="bookmark" href="http://servers.api.rackspacecloud.com/1234/servers/  52415800-8b69-11e0-9b19-734f000004d2"/>
        <RAX-SERVER:bandwidth>
            <RAX-SERVER:interface audit_period_end="2012-05-07T14:35:13Z" audit_period_start="2012-05-01T00:00:00Z" bandwidth_inbound="972430" bandwidth_outbound="384" interface="public"/>
        </RAX-SERVER:bandwidth>
    </server>

#### Code Sample:  Reboot Server Request (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <reboot xmlns="http://docs.openstack.org/compute/api/v1.1" type="HARD"/>

### JSON

#### Code Sample:  Create Server Request (JSON)

    {
        "server": {
            "name": "new-server-test",
            "min_count": 1,
            "max_count": 1,
            "imageRef": "5f68715f-201f-4600-b5a1-0b97e2b1cb31",
            "flavorRef": "2",
            "diskConfig": "auto",
            "metadata": {
                "My Server Name": "Ubuntu 10.04 LTS"
            },
            "personality": [{
                "path": "/etc/banner.txt",
                "contents": "ICAgICAgDQoiQSBjbG91ZCBkb2VzIG5vdCBrbm93IHdoeSBp
    dCBtb3ZlcyBpbiBqdXN0IHN1Y2ggYSBkaXJlY3Rpb24gYW5k
    IGF0IHN1Y2ggYSBzcGVlZC4uLkl0IGZlZWxzIGFuIGltcHVs
    c2lvbi4uLnRoaXMgaXMgdGhlIHBsYWNlIHRvIGdvIG5vdy4g
    QnV0IHRoZSBza3kga25vd3MgdGhlIHJlYXNvbnMgYW5kIHRo
    ZSBwYXR0ZXJucyBiZWhpbmQgYWxsIGNsb3VkcywgYW5kIHlv
    dSB3aWxsIGtub3csIHRvbywgd2hlbiB5b3UgbGlmdCB5b3Vy
    c2VsZiBoaWdoIGVub3VnaCB0byBzZWUgYmV5b25kIGhvcml6
    b25zLiINCg0KLVJpY2hhcmQgQmFjaA=="
            }]
        }
    }

#### Code Sample: Create Server Response (JSON)

    {
        "server": {
            "OS-DCF:diskConfig": "AUTO",
            "adminPass": "123456789abc",
            "id": "edd91280-3438-4663-9137-26d8f62665ce",
            "links": [{
                "href": "https://dfw.servers.api.rackspacecloud.com/v2/123456/servers/edd91280-3438-4663-9137-26d8f62665ce",
                "rel": "self"
            }, {
                "href": "https://dfw.servers.api.rackspacecloud.com/123456/servers/edd91280-3438-4663-9137-26d8f62665ce",
                "rel": "bookmark"
            }]
        }
    }

#### Code Sample:  Get Server Details Response (JSON)

    {
        "server": {
            "OS-DCF:diskConfig": "AUTO",
            "RAX-SERVER:bandwidth": [{
                "audit_period_end": "2012-05-09 15:58:22",
                "audit_period_start": "2012-05-09 06:00:00",
                "bandwidth_inbound": 5316481,
                "bandwidth_outbound": 0,
                "interface": "public"
            }],
            "accessIPv4": "",
            "accessIPv6": "",
            "addresses": {
                "private": [{
                    "addr": "10.180.4.157",
                    "version": 4
                }],
                "public": [{
                    "addr": "50.56.175.68",
                    "version": 4
                }, {
                    "addr": "2001:4800:780e:0510:d87b:9cbc:ff04:37ec",
                    "version": 6
                }]
            },
            "config_drive": "",
            "created": "2012-04-06T18:44:18Z",
            "flavor": {
                "id": "1",
                "links": [{
                    "href": "https://dfw.servers.api.rackspacecloud.com/
    5678/flavors/1",
                    "rel": "bookmark"
                }]
            },
            "hostId": "6447b7cb298c44dd1337be6e82d98dc7121918d3426725b31c6683d3",
            "id": "bbb0ad33-e4c7-4ab7-997f-e57b00d03176",
            "image": {
                "id": "3afe97b2-26dc-49c5-a2cc-a2fc8d80c001",
                "links": [{
                    "href": "https://dfw.servers.api.rackspacecloud.com/
    5678/images/3afe97b2-26dc-49c5-a2cc-a2fc8d80c001",
                    "rel": "bookmark"
                }]
            },
            "key_name": "",
            "links": [{
                "href": "https://dfw.servers.api.rackspacecloud.com/v2/
    5678/servers/bbb0ad33-e4c7-4ab7-997f-e57b00d03176",
                "rel": "self"
            }, {
                "href": "https://dfw.servers.api.rackspacecloud.com/5678/
    servers/bbb0ad33-e4c7-4ab7-997f-e57b00d03176",
                "rel": "bookmark"
            }],
            "metadata": {},
            "name": "testinstance",
            "progress": 100,
            "status": "ACTIVE",
            "tenant_id": "5678",
            "updated": "2012-04-06T18:51:55Z",
            "user_id": "1234"
        }
    }

#### Code Sample:  Reboot Server Request (JSON)

    {
        "reboot": {
            "type": "HARD"
        }
    }

**Legal Disclaimer**

This information is intended for software developers who want to develop
applications by using the Rackspace Cloud Servers powered by OpenStack application programming interface (API). The information is for informational purposes only and is provided "as is."

Rackspace makes no representations or warranties of any kind, express or
implied, as to the accuracy or completeness of the contents of this
information and reserves the right to make changes to specifications and
product/services description at any time without notice. Rackspace
services offerings are subject to change without notice. Users must take
full responsibility for application of any services mentioned herein.
Except as set forth in Rackspace general terms and conditions and/or
cloud terms of service, Rackspace assumes no liability whatsoever, and
disclaims any express or implied warranty, relating to its services
including, but not limited to, the implied warranty of merchantability,
fitness for a particular purpose, and noninfringement.
