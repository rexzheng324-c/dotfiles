#!/bin/bash

# https://github.com/Tencent/rapidjson

set -euo pipefail
set -x

#####################
# Install rapidjson #
#####################

readonly VERSION="1.1.0"
readonly TARFILE="v$VERSION.tar.gz"
readonly DIR="rapidjson-$VERSION"

if ! dpkg -s cmake make wget 1>/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y \
        wget \
        cmake \
        make
fi

readonly TMPDIR="$(mktemp -d /tmp/install_rapidjson.XXXX)"
pushd "$TMPDIR" >/dev/null
wget -c https://github.com/Tencent/rapidjson/archive/$TARFILE
tar -xf $TARFILE
pushd $DIR >/dev/null
mkdir build
pushd build >/dev/null

export CC=/usr/bin/gcc-5
export CXX=/usr/bin/g++-5

cmake ..
make -j "$(nproc)"
sudo make install

popd >/dev/null
popd >/dev/null
popd >/dev/null
