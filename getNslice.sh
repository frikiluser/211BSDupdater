#!/bin/sh

PATCH=$1

if [ ! -r ./patches/$PATCH ]
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
    1|2|3)
        cat ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    100)
        sed -e '1,/another issue/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    184)
        sed -e '1,/====snip/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    448)
        sed -e '1,/pdp is alive.*/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        ;;
    *)
        sed -e '1,/.*[-|=].*[c|C]ut\ *here/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        grep -c '' /tmp/$PATCH.artifact > /dev/null
        if [ "$?" != "0" ]
        then
            sed -e '1,/^======/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        fi
        grep -c '' /tmp/$PATCH.artifact > /dev/null
        if [ "$?" != "0" ]
        then
            sed -e '1,/\*\*\*/ d' < ./patches/$PATCH > /tmp/$PATCH.artifact
        fi
        ;;
esac

## Clean
#rm ./patches/$PATCH
