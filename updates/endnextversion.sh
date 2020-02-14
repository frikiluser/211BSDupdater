#!/bin/sh

PATCH=$1

REAL=head -1 /tmp/faked.version

mv /VERSION /VERSION.old && \
    cat /VERSION.old | \
    sed 's@Current Patch Level: '`echo $PATCH-1|bc`'@Current Patch Level: '$REAL'@' \
    > /VERSION

