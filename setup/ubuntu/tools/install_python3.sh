#!/bin/bash

# https://launchpad.net/~deadsnakes/+archive/ubuntu/ppa

[ -r /etc/lsb-release ] && source /etc/lsb-release
if [ "$DISTRIB_CODENAME" != 'xenial' ]; then
    echo 'Only support ubuntu 16.04'
    exit 1
fi

set -euo pipefail
set -x

#####################
# Install python3.7 #
#####################

if ! dpkg -s software-properties-common &>/dev/null; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
fi

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install -y \
    python3.7-dev \
    python3-pip

sudo ln -sf \
    /usr/lib/python3/dist-packages/apt_pkg.cpython-35m-x86_64-linux-gnu.so \
    /usr/lib/python3/dist-packages/apt_pkg.so
sudo ln -sf /usr/bin/python3.7 /usr/bin/python3
