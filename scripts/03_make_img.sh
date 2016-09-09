#!/bin/sh
#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
ROOT_DIR="`( cd .. && pwd )`"

. $ME/functions.sh

MD_NUM=5

truncate -s 3G $SYS_DISK_RAW_IMAGE

mdconfig -a -t vnode -f $SYS_DISK_RAW_IMAGE -u $MD_NUM

MD_DEV="md${MD_NUM}"

sed "s/%DISK%/${MD_DEV}/g" $FILES_DIR/pc-sysinstall.cfg > $WORK_DIR/pc-sysinstall.act
sed -i '' "s=%ARCH_PATH%=${BIN_DIR}=g"  $WORK_DIR/pc-sysinstall.act 
sed -i '' "s/%SYS_ARCHIVE%/${SYS_ARCHIVE_NAME}/g" $WORK_DIR/pc-sysinstall.act 

#> $WORK_DIR/pc-sysinstall.act

pc-sysinstall -c $WORK_DIR/pc-sysinstall.act



cd $PWD

