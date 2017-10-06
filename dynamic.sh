#!/bin/sh

# Install required packages
apt install apticron figlet lsb-release python-apt python-utmp bc

# Removing /etc/motd and any files in /etc/update-motd.d/ directory
rm -rf /etc/motd
rm -rf /etc/update-motd.d/*

# Create/Download new files
wget https://raw.github.com/asimzeeshan/DebianMOTD/master/files/00-header -O /etc/update-motd.d/00-header
wget https://raw.github.com/asimzeeshan/DebianMOTD/master/files/10-sysinfo -O /etc/update-motd.d/10-sysinfo
wget https://raw.github.com/asimzeeshan/DebianMOTD/master/files/20-updates -O /etc/update-motd.d/20-updates
wget https://raw.github.com/asimzeeshan/DebianMOTD/master/files/30-footer -O /etc/update-motd.d/30-footer

# Switch execution bits on on the new files:
chmod +x /etc/update-motd.d/*

# Create a symlink as follows
cd /var/run
rm -rf motd.dynamic
ln -s motd.dynamic.new motd.dynamic

# Logout and then log back in to the system. You will see a new MOTD on every ssh login.
