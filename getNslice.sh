#!/bin/sh

PATCH=$1

if [ ! -e ./patches/$PATCH ]
then
    ## Setup
    touch /.netrc
    mv /.netrc /.netrc-BKP
    cat <<\EOF > /.netrc
machine ftp.update.uu.se
login anonymous
password 211BSDupdater
EOF
    
    ## Download
    cd ./patches/
    echo recv pub/pdp11/2.11BSD/patches/$PATCH | ftp ftp.update.uu.se
    cd ..
    mv /.netrc-BKP /.netrc
fi

## Slice

case "$PATCH" in
    432)
        sed -e '1,/.====cut here===.*/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    448)
        sed -e '1,/pdp is alive.*/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    default)
        sed -e '1,/.*---.*cut here---.*/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
esac

## Clean
#rm ./patches/$PATCH
