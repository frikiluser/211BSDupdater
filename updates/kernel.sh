#!/bin/sh

if [ "$1" = "" ]
then
    touch /tmp/updater.hook.kernel
    exit 0
fi

if [ ! -r /tmp/updater.hook.kernel ]
then
    exit 0
fi

rm -f /tmp/updater.hook.kernel

# FIXME: YMMV
SYSTEM=GENERIC

cd /sys/$SYSTEM
make
# optionally save the old kernel and networking
mv /unix /ounix
mv /netnix /onetnix
install -c -o root -g wheel -m 744 unix /unix
install -c -o root -g wheel -m 744 netnix /netnix
make clean

# optional
if [ "$SYSTEM" != "GENERIC" ]
then
    cd /sys/GENERIC
    make
    install -c -o root -g wheel -m 744 unix /genunix
    make clean
fi

# reboot
