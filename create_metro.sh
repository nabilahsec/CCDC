#!/bin/bash

# Create group & user
groupadd -g 999999 metro
useradd -u 999999 -g metro -m -s /bin/bash -c "METRO" metro

# Set password (you will be prompted)
passwd metro

# Add to sudo
usermod -aG sudo metro

# Fix PATH safely
echo 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' >> /home/metro/.profile
chown metro:metro /home/metro/.profile


