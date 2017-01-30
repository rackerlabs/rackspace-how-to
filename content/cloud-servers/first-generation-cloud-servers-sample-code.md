---
permalink: first-generation-cloud-servers-sample-code/
audit_date:
title: 'First Generation Cloud Servers: Sample Code'
type: article
created_date: '2012-07-24'
created_by: Jerry Schwartz
last_modified_date: '2015-12-11'
last_modified_by: Nate Archer
product: Cloud Servers
product_url: cloud-servers
---

### API Operations

-   Servers
    -   List Servers
    -   Create Server
    -   Get Server Details
    -   Update Server Name / Administrative Password
    -   Delete Server
    -   Server Addresses
        -   List Addresses
        -   List Public Addresses
        -   List Private Addresses
        -   Share an IP Address
        -   Unshare an IP Address
        -   Server Actions
            -   Reboot Server
            -   Rebuild Server
            -   Resize Server
            -   Confirm Resized Server
            -   Revert Resized Server
        -   Flavors
            -   List Flavors
            -   Get Flavor Details
        -   Images
            -   List Images
            -   Create Image
            -   Get Image Details
            -   Delete Image
        -   Backup Schedules
            -   List Backup Schedules
            -   Create / Update Backup Schedule
            -   Disable Backup Schedule
        -   Shared IP Groups
            -   List Shared IP Groups
            -   Create Shared IP Group
            -   Get Shared IP Group Details
            -   Delete Shared IP Group

### XML code samples

#### Code Sample: Create Server Request (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.rackspacecloud.com/servers/api/v1.0" name="new-server-test" imageId="1" flavorId="1">
        <metadata>
            <meta key="My Server Name">Apache1</meta>
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

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <server xmlns="http://docs.rackspacecloud.com/servers/api/v1.0" status="BUILD" progress="0" hostId="312452f3d7a72d3def18a06e09ec01b7" flavorId="2" imageId="119" adminPass="Whul7KK67api-test-server-xml" id="21034280" name="api-test-server-xml">
        <metadata>
            <meta key="My Server Name">API Test Server XML</meta>
        </metadata>
        <addresses>
            <public>
                <ip addr="198.101.228.62"/>
            </public>
            <private>
                <ip addr="10.178.54.13"/>
            </private>
        </addresses>
    </server>

#### Code Sample:  Get Server Details Response (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <server xmlns="http://docs.rackspacecloud.com/servers/api/v1.0" id="1234" name="sample-server" imageId="1" flavorId="1" status="BUILD" progress="60" hostId="e4d909c290d0fb1ca068ffaddf22cbd0">
        <metadata>
            <meta key="Server Label">Web Head 1</meta>
            <meta key="Image Version">2.1</meta>
        </metadata>
        <addresses>
            <public>
                <ip addr="67.23.10.132"/>
                <ip addr="67.23.10.131"/>
            </public>
            <private>
                <ip addr="10.176.42.16"/>
            </private>
        </addresses>
    </server>

#### Code Sample:  Reboot Server Request (XML)

    <?xml version="1.0" encoding="UTF-8"?>
    <reboot xmlns="http://docs.rackspacecloud.com/servers/api/v1.0" type="HARD"/>

### JSON code samples

#### Code Sample:  Create Server Request (JSON)

    {
        "server": {
            "name": "new-server-test",
            "imageId": 1,
            "flavorId": 1,
            "metadata": {
                "My Server Name": "Apache1"
            },
            "personality": [{
                "path": "/etc/banner.txt",
                "contents": "ICAgICAgDQoiQSBjbG91ZCBkb2VzIG5vdCBrbm93IHdoeSBp dCBtb3ZlcyBpbiBqdXN0IHN1Y2ggYSBkaXJlY3Rpb24gYW5k IGF0IHN1Y2ggYSBzcGVlZC4uLkl0IGZlZWxzIGFuIGltcHVs c2lvbi4uLnRoaXMgaXMgdGhlIHBsYWNlIHRvIGdvIG5vdy4g QnV0IHRoZSBza3kga25vd3MgdGhlIHJlYXNvbnMgYW5kIHRo ZSBwYXR0ZXJucyBiZWhpbmQgYWxsIGNsb3VkcywgYW5kIHlv dSB3aWxsIGtub3csIHRvbywgd2hlbiB5b3UgbGlmdCB5b3Vy c2VsZiBoaWdoIGVub3VnaCB0byBzZWUgYmV5b25kIGhvcml6 b25zLiINCg0KLVJpY2hhcmQgQmFjaA=="
            }]
        }
    }

#### Code Sample: Create Server Response (JSON)

    {
        "server": {
            "id": 1235,
            "name": "new-server-test",
            "imageId": 1,
            "flavorId": 1,
            "hostId": "e4d909c290d0fb1ca068ffaddf22cbd0",
            "progress": 0,
            "status": "BUILD",
            "adminPass": "GFf1j9aP",
            "metadata": {
                "My Server Name": "Apache1"
            },
            "addresses": {
                "public": ["67.23.10.138"],
                "private": ["10.176.42.19"]
            }
        }
    }

#### Code Sample:  Get Server Details Response (JSON)

    {
        "server": {
            "id": 1234,
            "name": "sample-server",
            "imageId": 1,
            "flavorId": 1,
            "hostId": "e4d909c290d0fb1ca068ffaddf22cbd0",
            "status": "BUILD",
            "progress": 60,
            "addresses": {
                "public": ["67.23.10.132", "67.23.10.131"],
                "private": ["10.176.42.16"]
            },
            "metadata": {
                "Server Label": "Web Head 1",
                "Image Version": "2.1"
            }
        }
    }

#### Code Sample:  Reboot Server Request (JSON)

    {
        "reboot": {
            "type": "HARD"
        }
    }

### Legal Disclaimer

This information is intended for software developers who want to develop
applications by using the first generation Rackspace Cloud Servers
application programming interface (API). The information is for
informational purposes only and is provided "as is".

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
fitness for a particular purpose, and non-infringement.
