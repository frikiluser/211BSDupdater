#!/bin/sh

PATCH=$1
ARTIFACT_LINES=$2

wc -l /tmp/$PATCH.artifact | \
    grep -c "\ $ARTIFACT_LINES\ /tmp/" || \
    exit 1
