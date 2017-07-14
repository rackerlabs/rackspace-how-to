---
permalink: openstack-glossary-of-terms/
audit_date:
title: OpenStack Glossary of Terms
type: article
created_date: '2012-08-09'
created_by: Karin Levenstein
last_modified_date: '2012-08-15'
last_modified_by: Rae D. Cabello
---

#### Compute

OpenStack Compute is a compute service that provides server capacity in the cloud. Compute Servers come in different flavors of memory, disk space, and CPU, and can be provisioned in minutes. Interactions with Compute Servers can occur programmatically via the OpenStack Compute API or the Dashboard.

####Nova

Project name for the Compute service that provisions and manages large networks of virtual machines, creating a redundant and scalable cloud computing platform.

#### Glance

Project name for the Image Service software, which is the main image repository piece of OpenStack, it is the place where you will be uploading your images as well as the place from which they will be consumed by the rest of the OpenStack system.

#### Keystone

Project name for the Identity service software, which offers an integrated identity management system for OpenStack. Initially using token-based authentication, but eventually supporting plug-in modules for identity storage (LDAP, DB, file, PAM, Active Directory, etc...), protocols (SAML, OAUTH, OpenID, etc...)

#### Server

A server is a virtual machine instance in the compute system. Flavor and image are requisite elements when creating a server.

#### Flavor

Flavor is an available hardware configuration for a server. Each flavor has a unique combination of disk space, memory capacity and priority for CPU time.

#### Image

Images are your templates for creating new VMs. The project under OpenStack that stores the available images is called Glance.

#### Rabbit MQ

Provides robust messaging for applications. It is completely open source and based on open standard protocols.

#### MySQL

Datastore that stores build-time and run-time state for a cloud infrastructure.

#### Keypairs

These are simple ssh keys and are your credentials for accessing any running instances. Keypairs are added and managed using the Keypairs section of the user dashboard.

#### Security Groups

Security groups at this time exist mostly as tags for the servers and can be consumed via the meta-data API via a simple curl command. Security groups can be specified as part of the "personality" of an instance.

#### Floating IP address

A floating IP address is an IP address (typically public) that can be dynamically assigned to an instance. This address enables network address translation (NAT) and allows an instance to be accessed from outside the nova fixed network.
