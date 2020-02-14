#!/bin/sh

PATCH=$1

mv /VERSION /VERSION.old && \
    cat /VERSION.old | \
    sed 's@Current Patch Level: '`echo $PATCH-1|bc`'@Current Patch Level: '$PATCH'@' \
    > /VERSION

echo $PATCH >> /tmp/faked.version
