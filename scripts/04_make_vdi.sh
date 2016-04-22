#!/bin/sh
#!/bin/sh
SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
ROOT_DIR="`( cd .. && pwd )`"

. $ME/functions.sh


vboxmanage convertfromraw --format VDI $SYS_DISK_RAW_IMAGE $SYS_VDI_IMAGE
chown yurkis $SYS_VDI_IMAGE