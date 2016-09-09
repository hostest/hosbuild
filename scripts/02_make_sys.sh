#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
ROOT_DIR="`( cd .. && pwd )`"

. $ME/functions.sh
. $FILES_DIR/pkg-versions.conf

echo ">>>=== Creating fresh image ===================="
mkdir $SYS_DIR
rm -rf $SYS_DIR/*
tar -vxjf $FRESH_DISTRIBUTION -C $SYS_DIR

#cp -a $RELEASE_DIR/ $SYS_DIR/

echo ">>>=== Copying dist files ===================="
cp $DIST_FILES_DIR/resolv.conf $SYS_DIR/etc/

mkdir -p $SYS_DIR/usr/local/etc/
cp -R $DIST_FILES_DIR/pkg $SYS_DIR/usr/local/etc/
chown -R root $DESTDIR/usr/local/etc/pkg

echo ">>>=== Bootstaping dist files ===================="
chroot $SYS_DIR env ASSUME_ALWAYS_YES=yes pkg update
#env ASSUME_ALWAYS_YES=yes pkg -c $DESTDIR update

for PKG in `cat $FILES_DIR/sys-pkgs.conf` 
do
  PKG="`eval echo $PKG`"  
  
  echo ">>>=== Installing $PKG ===================="
  env ASSUME_ALWAYS_YES=yes pkg -c $SYS_DIR install $PKG
  
done

echo ">>>=== Cache cleanup ===================="
rm -rf $SYS_DIR/var/cache/pkg

echo ">>>=== Pack sys ========================="
cd $SYS_DIR
compress_curr_dir $SYS_ARCHIVED


cd $PWD