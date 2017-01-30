---
permalink: general-package-installation-guidelines/
audit_date:
title: General Package Installation Guidelines
type: article
created_date: '2011-03-16'
created_by: Rackspace Support
last_modified_date: '2016-06-23'
last_modified_by: Stephanie Fillmon
product: Cloud Servers
product_url: cloud-servers
---

Throughout Rackspace How-To, we present many articles detailing how
to install and configure various Linux software packages and utilities.
By taking a closer look at the articles across multiple Linux
distributions, you might notice something interesting -- the procedure
for installing a package is very similar even between different distros.
For this reason, we will not always provide separate instructions for
each distribution. The purpose of this article is to aid you in making
the adaptations needed to apply a given set of instructions to your
Cloud Server.

### Package managers and repositories

Package management is an important concept for a novice Linux user to
understand. Unlike Windows-based operating systems, in which software
packages come with their own installers, most Linux distributions
include a centralized **package manager**. This means that nearly every
package on the system can be installed using the same tools!

In addition to a centralized method of installing packages on a given
system, Linux package management also features centralized software
sources known as **repositories**. Typically, when a command such as
`yum install iptables` is run, the package manager (in this case, `Yum`)
will download the relevant packages (in this case, `iptables`) from its
repositories and install them on the system.

Every distribution offered by Cloud Servers comes with its own package
manager. We've included basic summaries of each of these; however, Linux
novices would do well to become familiar with the details by reading the
relevant documentation.

#### APT/Dpkg (Debian, Ubuntu)

-   Install package:

        aptitude install PACKAGENAME

-   Reinstall package:

        aptitude reinstall PACKAGENAME

-   Remove package (keep config files):

        aptitude remove PACKAGENAME

-   Remove package and purge config files:

        aptitude remove --purge PACKAGENAME

-   Update package list:

        aptitude update

-   Upgrade system (security/bug fixes):

        aptitude upgrade

-   Upgrade system to newest release (**dangerous!**):

        aptitude dist-upgrade

-   Show info on an installed package:

        aptitude show PACKAGENAME

-   Search package repositories:

        aptitude search SEARCHSTRING

For more information on APT-based package management, please see the
[Debian GNU/Linux FAQ](http://www.debian.org/doc/FAQ/ch-pkgtools.en.html "http://www.debian.org/doc/FAQ/ch-pkgtools.en.html")
and the [APT HOWTO](http://www.debian.org/doc/manuals/apt-howto/ "http://www.debian.org/doc/manuals/apt-howto/").

#### Yum/RPM (CentOS, Fedora, Red Hat)

-   Install package:

        yum install PACKAGENAME

-   Remove package:

        yum remove PACKAGENAME

-   Update package:

        yum update PACKAGENAME

-   List available updates:

        yum list updates

-   Update system:

        yum update

-   Upgrade system to newest release (**dangerous!**):

        yum upgrade

-   Show package:

        yum list PACKAGENAME

-   Search package repositories:

        yum search SEARCHSTRING

-   List package groups:

        yum grouplist

-   Install package group:

        yum groupinstall 'GROUP NAME'

-   Update package group:

        yum groupupdate 'GROUP NAME'

-   Remove package group:

        yum groupremove 'GROUP NAME'

For more information on RPM-based package management, please see the
[Linux Home Server HOWTO](http://www.brennan.id.au/07-Package_Management.html "http://www.brennan.id.au/07-Package_Management.html")
and [Maximum RPM](http://www.rpm.org/max-rpm/ "http://www.rpm.org/max-rpm/").

#### Pacman (Arch)

-   Install package:

        pacman -S PACKAGENAME

-   Remove package:

        pacman -R PACKAGENAME

-   Remove package, config files, and unneeded dependencies:

        pacman -Rsn PACKAGENAME

-   Update package list:

        pacman -Sy

-   Update system (**dangerous!**):

        pacman -Syu

-   Show info on an installed package:

        pacman -Qi PACKAGENAME

-   Show info on a repository package:

        pacman -Si PACKAGENAME

-   Search package repositories:

        pacman -Ss SEARCHSTRING

For more information on Pacman, please see the
[ArchWiki](http://wiki.archlinux.org/index.php/Pacman "http://wiki.archlinux.org/index.php/Pacman").

#### Emerge/Portage (Gentoo)

-   Install package:

        emerge PACKAGENAME

-   Remove package:

        emerge --unmerge PACKAGENAME

-   Update package list:

        emerge --sync

-   Update explicitly installed packages:

        emerge --update world

-   Update all packages (**dangerous!**):

        emerge --update --deep world

-   Search package repositories (names):

        emerge --search SEARCHSTRING

-   Search package repositories (names and descriptions):

        emerge --searchdesc SEARCHSTRING

For more information on Portage and ebuilds, please see the [Gentoo Linux Documentation](http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=2&chap=1).

### But what if the software I'm looking for isn't in the repositories?

There may come occasions when the software you're looking for simply
isn't in your package manager's main repositories. There may be many
reasons for this; usually, the software isn't considered well-known
enough to be included. The best way to locate a single package like this
is to search the Internet! The package's website is a good place to
start. [Rpmfind](http://rpmfind.net "http://rpmfind.net") is another
good source for RPM packages. Once you've located and downloaded the
package, you can still use your distro's package manager to install it.

### Installing from source

In some situations, you may have no choice but to compile and install a
package manually. Maybe you need special customizations that weren't
enabled by default, or maybe the software you want to install simply
doesn't have a pre-compiled version. Either way, it is impossible to
provide step-by-step instructions for all of these scenarios -- your
best bet in this case is to go directly to the software documentation.
However, you will almost certainly need a C/C++ compiler and make
utility. These can be installed by running the following commands:

-  On Debian:

    apt-get install build-essential

-  On CentOS:

    yum groupinstall "Development Tools"

This will install the utilities you would need to install most common
packages directly from source. Once this is done, you will be able to
follow the package's instructions and tailor the compilation to your
needs. Good luck!
