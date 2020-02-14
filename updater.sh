#!/bin/sh

CURRENT=`grep "Current Patch Level:" /VERSION | head -1 | awk '{print $4}'`
echo Current 2.11 Patch Level: $CURRENT

PATCH=`echo $CURRENT+1|bc`
export PATCH

while (test -r ./updates/$PATCH)
do
    echo Updating to 2.11 Patch Level: $PATCH
    sh ./getNslice.sh $PATCH
    sh ./updates/$PATCH
    CURRENT=`grep "Current Patch Level:" /VERSION | head -1 | awk '{print $4}'`
    PATCH=`echo $CURRENT+1|bc`
done

sh ./updates/kernel.sh NOW-OR-NEVER
