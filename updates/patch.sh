#!/bin/sh

ARTIFACT_NAME=$1

cd / ; patch -p0 < /tmp/$ARTIFACT_NAME ; rm /tmp/$ARTIFACT_NAME
