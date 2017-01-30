---
permalink: installing-fwbuilder/
audit_date:
title: Install fwbuilder
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-01-19'
last_modified_by: Rose Contreras
product: Cloud Servers
product_url: cloud-servers
---

**Note:** The commands and utilities in this article have been tested on
a Debian Cloud Server. They are not guaranteed to function correctly on
other distributions. However, the [General Package Installation Guidelines](/how-to/general-package-installation-guidelines) article may assist in "porting" this article to another distro.

### Prerequisites

[VNC Install](/how-to/vnc-install "VNC Install")

Fwbuilder is an advanced graphical firewall configuration tool. It is
used to set up complex firewall policies in situations where
command-line scripting tools would simply be too slow or clunky.

### Installation

Fwbuilder may either be downloaded from
[Sourceforge](http://sourceforge.net/project/showfiles.php?group_id=5314&package_id=125359)
or installed via your Cloud Server's built-in package manager:

    aptitude install fwbuilder

That's it! Connect to your Cloud Server using the instructions in the
VNC or X over SSH articles above, then simply type

    fwbuilder

to launch the application.

### Additional resources

[Firewall Builder 5 User's Guide](http://www.fwbuilder.org/4.0/docs/users_guide5/ "http://www.fwbuilder.org/4.0/docs/users_guide5/")
