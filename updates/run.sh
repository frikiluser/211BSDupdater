#!/bin/sh

ARTIFACT_NAME=$1

cd / ; sh < /tmp/$ARTIFACT_NAME ; rm /tmp/$ARTIFACT_NAME
