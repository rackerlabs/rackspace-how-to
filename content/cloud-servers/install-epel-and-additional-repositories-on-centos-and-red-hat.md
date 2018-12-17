---
permalink: install-epel-and-additional-repositories-on-centos-and-red-hat/
audit_date: '2017-10-24'
title: Install EPEL and IUS repositories on CentOS and Red Hat
type: article
created_date: '2012-01-11'
created_by: Rackspace Support
last_modified_date: '2017-10-24'
last_modified_by: Carl George
product: Cloud Servers
product_url: cloud-servers
---

This article describes how to configure a CentOS or Red Hat Enterprise
Linux system to use the [Fedora Extra Packages for Enterprise Linux (EPEL) repository](https://fedoraproject.org/wiki/EPEL). The EPEL
repository provides useful software packages that are not included in
the official CentOS or Red Hat repositories.

Instructions are also included for installing the [IUS Community Project](https://ius.io/). Whereas EPEL provides
only software that is *not* in the official CentOS and Red Hat repositories, IUS provides newer versions of software (like MySQL and PHP) that exist in the official repositories.

**Note:** Exercise caution when using any third-party repository. If you
have a managed support agreement, contact your provider before following
the instructions in this article to ensure that you don't create an
unsupported server configuration.

### Install the EPEL repository

You install the EPEL repository by downloading the appropriate RPM
package for your system and installing it. The following instructions use the 64-bit packages that work with Rackspace Cloud Servers instances.

#### CentOS

The CentOS Extras repository includes a package to install EPEL, and is
enabled by default. To install the EPEL release package, run the following
command:

    sudo yum install epel-release

#### Red Hat Enterprise Linux

To install the EPEL release package, run the following command:

    sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E '%{rhel}').noarch.rpm

Some EPEL packages depend on packages from the "optional" and "extras" channels, so ensure that those are enabled as well.

### Install the IUS repository

The IUS repository provides newer versions of some software in the
official CentOS and Red Hat repositories. The IUS repository depends on
the EPEL repository.

The package names in the IUS repository are *different from* the package
names used in the official repositories. The difference helps to avoid
unintentional conflicts or software version updates.

**Note:** Because IUS uses package names that are different from the
package names in the official repositories, we recommend IUS
for Rackspace customers with managed support levels that include server
software. Managed servers automatically update nightly by default, which
can cause unplanned upgrades if package names are the same in more than
one enabled repository.

To install the IUS release package, run the following command:

    sudo yum install https://$(rpm -E '%{?centos:centos}%{!?centos:rhel}%{rhel}').iuscommunity.org/ius-release.rpm

### Upgrade installed packages to IUS versions

If you already have a software package installed that you want to
upgrade to a newer version in the IUS repository, install the IUS yum
plug-in for package replacement to simplify the upgrade process.

    sudo yum install yum-plugin-replace

The plug-in provides a `yum replace` command that replaces a specified
package and installs any required dependencies at the same time.  For
example, to replace the installed PHP package with the PHP 5.6 package
from the IUS repository, run the following command:

    sudo yum replace php --replace-with php56u

For more information, see the [IUS Usage Guide](https://ius.io/Usage/).

### Check for available repositories

You can see if the repositories that you need are installed and enabled
by running the following command:

    yum repolist

Some repositories are disabled by default. To list disabled
repositories, run the following command:

    yum repolist disabled
