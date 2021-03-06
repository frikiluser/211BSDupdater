#!/bin/sh

# FIXME: YMMV
SYSTEM=PIDP11

cd /sys/$SYSTEM
make
# optionally save the old kernel and networking
mv /unix /ounix
mv /netnix /onetnix
install -c -o root -g wheel -m 744 unix /unix
install -c -o root -g wheel -m 744 netnix /netnix
make clean

# optional
cd /sys/GENERIC
make
install -c -o root -g wheel -m 744 unix /genunix
make clean

# reboot
