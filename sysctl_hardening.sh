#!/bin/bash

# Backup original file
sudo cp /etc/sysctl.conf /etc/sysctl.conf.bak_$(date +%F_%T)

# Apply Ubuntu network hardening
sudo bash -c 'cat >> /etc/sysctl.conf <<EOF

# --- CCDC Network Hardening ---
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.icmp_ignore_bogus_error_responses = 1
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
# --- END Hardening ---
EOF'

# Reload sysctl
sudo sysctl --system
