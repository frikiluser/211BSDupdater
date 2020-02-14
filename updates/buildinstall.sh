#!/bin/sh

BPATH=$1

cd $BPATH
make
make install
make clean
