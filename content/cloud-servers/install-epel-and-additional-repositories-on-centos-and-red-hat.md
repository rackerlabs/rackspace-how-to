---
permalink: install-epel-and-additional-repositories-on-centos-and-red-hat/
audit_date: '2016-06-09'
title: Install EPEL, IUS, and Remi repositories on CentOS and Red Hat
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

Instructions are also included for installing the [IUS Community Project](https://ius.io/) and the [Remi RPM Repository](http://rpms.famillecollet.com/). Whereas EPEL provides
only software that is *not* in the official CentOS and Red Hat official repositories, IUS and Remi provide newer versions of software (like MySQL and PHP) that exists in the official repositories.

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

Some EPEL packages depend on packages from the "optional" and "extras" channels, so ensure those are enabled as well. 

### Install the IUS repository

The IUS repository provides newer versions of some software in the
official CentOS and Red Hat repositories. The IUS repository depends on
the EPEL repository.

The package names in the IUS repository are *different from* the package
names used in the official repositories.  The difference helps to avoid
unintentional conflicts or software version updates.

**Note:** Because IUS uses package names that are different from the
package names in the official repositories, we recommend IUS over Remi
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

### Install the Remi repository

The Remi repository provides newer versions of the software in the core
CentOS and Red Hat Enterprise Linux repositories. The Remi repository
depends on the EPEL repository.

Package names in the Remi repository are the same as the package names
used in the official repositories. This similarity can result in
inadvertent package upgrades when you run an update with yum, so use the
Remi repository with care.

**Note:** Because Remi uses package names that are the same as the
package names in the official repositories, we do not recommend Remi for
Rackspace customers with a managed level of support. Managed servers
automatically update nightly by default, which can cause unplanned
upgrades if the Remi repository is enabled. If you require the Remi
repository or another repository with package name conflicts, contact
Rackspace Support before applying any upgrades to ensure continued
support for your server.

You install the Remi repository by downloading the appropriate RPM
package for your system and installing it. The following instructions
use the 64-bit packages that work with Cloud Servers instances.

-  CentOS and Red Hat Enterprise Linux 6.*x*

       wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
       sudo rpm -Uvh remi-release-6*.rpm

-  CentOS and Red Hat Enterprise Linux 7.*x*

       wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
       sudo rpm -Uvh remi-release-7*.rpm

If you get a `File Not Found` error message when trying to download the
package, the version number might have changed. You can access the
latest version of the RPM installer from the [Remi Repository Configuration](http://blog.remirepo.net/pages/Config-en) page. The
configuration page also includes additional instructions for Red Hat
Network subscribers who are installing the Remi repository.

### Enable the Remi repository

The Remi repository is disabled by default.

To use the Remi repository only when you know you need it, use the
`--enablerepo=remi` option when installing a package. For example:

    sudo yum --enablerepo=remi install php-tcpdf

If you want to permanently enable the Remi repository, you need to edit
the yum configuration file for Remi.

Open the repository configuration file by using a text editor of your
choice. This example uses nano.

    sudo nano /etc/yum.repos.d/remi.repo

Edit the [remi] portion of the file to set the enabled option to 1. This action enables the Remi repository by default.

    name=Les RPM de remi pour Enterprise Linux $releasever - $basearch
    #baseurl=http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/
    mirrorlist=http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror
    enabled=1
    gpgcheck=1
    gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
    failovermethod=priority

### Check for available repositories

You can see if the repositories that you need are installed and enabled
by running the following command:

    yum repolist

Some repositories, like Remi, are disabled by default. To list disabled
repositories, run the following command:

    yum repolist disabled
