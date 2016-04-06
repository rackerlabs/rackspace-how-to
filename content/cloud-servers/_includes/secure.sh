#!/bin/bash

set -o errexit

# Disclaimer: This is not the most secure configuration possible. This script
# is only intended to be more secure than the default configuration. No
# promises are made about this script preventing your server from getting
# owned or your bike getting stolen. The bad guys are still out to get you.
# And running this script does not excuse you from writing secure application
# code!
#
# This script assumes you're running it initially as root and logged in using
# a key pair. If you didn't, you'll be locked out of your VM.

if [ -z "$1" ]; then
  echo "Usage: $0 NON_ROOT_USER"
  echo "Example: $0 foo"
  exit 1
fi

NON_ROOT_USER=$1

# Upgrade
apt-get update
apt-get -y upgrade

# Disable password login
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
service ssh restart

# Block all ports except ssh and http/s
ufw default deny
ufw allow ssh
ufw allow http
ufw allow https
ufw --force enable

# Defend against brute force login attempts
apt-get -y install fail2ban

# Set unattended security upgrades
apt-get -y install unattended-upgrades

echo 'APT::Periodic::Update-Package-Lists "1";' >> /etc/apt/apt.conf.d/20auto-upgrades
echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades

# Create a non-root user
adduser --shell /bin/bash --gecos "User" --home /home/$NON_ROOT_USER $NON_ROOT_USER
adduser $NON_ROOT_USER sudo

# Copy the public key to the non-root user
mkdir /home/$NON_ROOT_USER/.ssh
cp .ssh/authorized_keys /home/$NON_ROOT_USER/.ssh/
chown -R $NON_ROOT_USER:$NON_ROOT_USER /home/$NON_ROOT_USER/.ssh

echo "Bye bye. Please logout and login again as the non-root user."
