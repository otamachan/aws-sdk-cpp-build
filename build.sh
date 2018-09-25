#!/bin/sh
set -xe
VERSION=${VERSION:=1.6.17}
BUILD=${BUILD:=0}
echo VERSION=${VERSION}
SUDO=
if [ "$(id -u)" != "0" ]; then
    SUDO=sudo
fi
make VERSION=${VERSION}
ARCH=amd64
$SUDO checkinstall \
    -y \
    --install=no \
    --maintainer=otamachan@gmail.com \
    --arch=${ARCH} \
    --pkgname=aws-sdk-cpp \
    --pkgversion=$VERSION-${BUILD} \
    --pkglicense=Apache2 \
    --requires="" \
    --deldesc=yes \
    --backup=no make install VERSION=${VERSION}
rm -rf description* doc-pak
dpkg -c *.deb
if [ -n "${OUTPUT}" ]; then
    cp *.deb ${OUTPUT}
fi
ls ${OUTPUT}
