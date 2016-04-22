#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
ROOT_DIR="`( cd .. && pwd )`"

. $ME/functions.sh

cd $FREEBSD_SRC

SRCCONF="${FILES_DIR}/src.conf"
DESTDIR="${RELEASE_DIR}"

make -j4 buildkernel SRCCONF=${SRCCONF} 2>${ROOT_DIR}/log_bkerr.txt | grep -e '----' -e '===' -e '>>>' -e 'stopped in ' 
make -j4 buildworld SRCCONF=${SRCCONF} 2>${ROOT_DIR}/log_bwerr.txt | grep -e '----' -e '===' -e '>>>' -e 'stopped in ' 
make installkernel SRCCONF=${SRCCONF} DESTDIR=${DESTDIR} 2>${ROOT_DIR}/log_ikerr.txt | grep -e '---' -e '===' -e '>>>' 
make installworld SRCCONF=${SRCCONF} DESTDIR=${DESTDIR} 2>${ROOT_DIR}/log_iwrr.txt | grep -e '---' -e '===' -e '>>>' 
make distribution SRCCONF=${SRCCONF} DESTDIR=${DESTDIR} 2>${ROOT_DIR}/log_iwrr.txt | grep -e '---' -e '===' -e '>>>' 

echo "Compressing..."

cd $DESTDIR

compress_curr_dir $FRESH_DISTRIBUTION

cd $PWD