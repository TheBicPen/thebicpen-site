#!/usr/bin/env bash

# Installation script for the website. Installs all prerequisites on a Ubuntu
# 24.04 machine

set -x

# Install build tools on the host - no point in putting this in a container
sudo apt install -y just podman podman-compose git
