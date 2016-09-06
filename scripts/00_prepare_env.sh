#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
HOME="`( cd .. && pwd )`"


. $ME/functions.sh

mkdir $WORK_DIR

echo "Clonning FreeBSD sources"

git clone $FREEBSD_SRC_GIT $FREEBSD_SRC

cd "$HOME"/work
