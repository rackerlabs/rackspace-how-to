---
permalink: use-a-custom-kernel-with-pv-grub/
audit_date:
title: Use a custom kernel with pv-grub
type: article
created_date: '2015-07-27'
created_by: Rackspace Support
last_modified_date: '2016-02-04'
last_modified_by: Stephanie Fillmon
---

**Note:** During 2015, all First Generation cloud servers will be migrated to Next Generation cloud servers on a rolling basis. Therefore, the instructions listed in this article might or might not work depending on whether your servers have been migrated. If you have questions about the server migration, see [First Generation to Next Generation Cloud Servers migration FAQ](/how-to/first-generation-to-next-generation-cloud-server-migration-faq). If you need assistance with using a custom kernel, contact Rackspace Support at 1 800 961 4454.

This article describes the steps required to modify an older First Generation server to boot from a kernel installed in the instance using `pv-grub`. First Generation servers load their kernel from the host machine by default unless modified to use `pv-grub`.

Next Generation servers and First Generation servers based on images created in 2011 or later should not need to perform these steps. They should already be loading the kernel from **/boot** within the instance.

### Disclaimers

-  `pv-grub` is an advanced feature. It should only be used by experienced Linux administrators with a demonstrated need to run their own kernels.
-  This process is necessary only for older First Generation servers that do not already include the kernel inside the instance. If you already have a kernel in **/boot**, it is likely your instance does not need to be modified to use `pv-grub`.
-  Not all kernels are supported. Your kernel must have pv-ops support for running in a Xen domU. Also, kernels compressed with bzip or LZMA will not work, and for some distributions like Arch compressed kernels might not work at all.
-  Follow the instructions as listed, in the order listed. Do not blindly copy and paste these commands, as some of them require editing.
-  Do not attempt these instructions on a production system. If they are applied incorrectly, your server might become unbootable. Practice on a clone of your server first.
-  This process is compatible only with the original version of GRUB, also referred to as GRUB Legacy. Our base images should include only GRUB Legacy, but a system update might install a newer version of GRUB (GRUB2) and need to be reverted to GRUB Legacy before this process will work.

### Grub configuration

Every instance booted with `pv-grub` requires a working grub configuration file in **/boot/grub/menu.lst**:

    default=0
    timeout=5

    title=DISTRO-NAME "KERNEL VERSION STRING"
        root (hd0)
        kernel /boot/KERNEL-VMLINUZ-FILENAME ro console=hvc0 root=/dev/xvda1
        initrd /boot/KERNEL-INITRD-FILENAME

### Distribution-specific adjustments

**Arch**

    pacman -Sy pacman
    pacman -Sy base-devel
    pacman -Syu
    sed -i 's/sda/xvda/' /etc/fstab
    pacman -Sy kernel26
    mkdir -p /boot/grub
    cp /usr/src/KERNEL-VERSION/vmlinux /boot/vmlinux26

**Note:** The stock arch kernel is bzipped and won't work with pv-grub. Use the uncompressed vmlinux instead.

Now add (or uncomment) the following line in **/etc/inittab** for console:

    h0:2345:respawn:/sbin/agetty -8 38400 hvc0 linux

**CentOS 5.x**

    yum -y upgrade
    mkdir -p /boot/grub
    echo "alias eth0 xennet" > /etc/modprobe.conf
    echo "alias eth1 xennet" >> /etc/modprobe.conf
    echo "alias scsi_hostadapter xenblk" >> /etc/modprobe.conf
    echo "xvc0" >> /etc/securetty
    sed -i 's/sda/xvda/' /etc/fstab
    yum -y install kernel-xen

Now add (or uncomment) the following line in **/etc/inittab** for console:

    8:2345:respawn:/sbin/mingetty xvc0

**Debian 5.x**

    apt-get update; apt-get -y upgrade
    mkdir /boot/grub
    sed -i 's/sda/xvda/' /etc/fstab
    apt-get -y install linux-image-xen-amd64

Now add (or uncomment) the following line in **/etc/inittab** for console:

    8:2345:respawn:/sbin/getty 38400 hvc0

**Fedora 13**

    mkdir -p /boot/grub
    echo "alias eth0 xennet" > /etc/modules
    echo "alias eth1 xennet" >> /etc/modules
    echo "alias scsi_hostadapter xenblk" >> /etc/modules
    sed -i 's/sda/xvda/' /etc/fstab
    echo "hvc0" >> /etc/securetty
    yum -y install kernel

**Gentoo**

    emerge --sync
    emerge --update portage
    emerge gentoo-sources genkernel #Update /usr/src/linux symlink if necessary
    sudo sed -i 's/sda/xvda/' /etc/fstab
    genkernel --menuconfig all

Enable the following in the kernel configuration:

    Processor Type and Features -> Paravirtualized guest support -> "Y"
    Hit enter, go to "Xen guest support" -> "Y"

Then exit the configuration, save, and build.

Now add (or uncomment) the following line in **/etc/inittab** for console:

    h0:12345:respawn:/sbin/agetty 38400 hvc0 linux

**RHEL 5.x**

    yum -y upgrade
    mkdir -p /boot/grub
    echo "alias eth0 xennet" > /etc/modprobe.conf
    echo "alias eth1 xennet" >> /etc/modprobe.conf
    echo "alias scsi_hostadapter xenblk" >> /etc/modprobe.conf
    echo "xvc0" >> /etc/securetty
    sed -i 's/sda/xvda/' /etc/fstab
    yum -y install kernel-xen

Now add (or uncomment) the following line in **/etc/inittab** for console:

    8:2345:respawn:/sbin/mingetty xvc0

**Ubuntu 9.10/10.04**

    mkdir /boot/grub
    cp /etc/init/tty1.conf /etc/init/hvc0.conf
    sed -i 's/tty1/hvc0/' /etc/init/hvc0.conf
    sed -i 's/sda/xvda/' /etc/fstab
    apt-get -y install linux-virtual

**Ubuntu 10.10**

    mkdir /boot/grub
    cp /etc/init/tty1.conf /etc/init/hvc0.conf
    sed -i 's/tty1/hvc0/' /etc/init/hvc0.conf
    apt-get -y install linux-virtual

### Kernel upgrade

Contact Rackspace Cloud support and request the pv-grub feature, informing them that you have completed these steps and want to use your own kernel. Your cloud server will be rebooted, and if successful, will start with your new kernel. You can verify this with `uname -a`.
