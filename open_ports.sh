#!/usr/bin/env bash

# Open ports locally. See
# https://blogs.oracle.com/developers/post/enabling-network-traffic-to-ubuntu-images-in-oracle-cloud-infrastructure
# Don't forget to open the ports in the clous console under subnet/**/rules or
# something.

set -x

sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
