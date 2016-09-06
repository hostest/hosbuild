SPWD="`pwd`"
ME="`dirname \"$0\"`"              # relative
ME="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
ROOT_DIR="`( cd .. && pwd )`"

WORK_DIR="${ROOT_DIR}/work"
FREEBSD_SRC="${ROOT_DIR}/src/freebsd"
FREEBSD_SRC_GIT="https://github.com/trueos/freebsd"
FILES_DIR="${ROOT_DIR}/files"
DIST_FILES_DIR="${FILES_DIR}/dist"
BIN_DIR="${ROOT_DIR}/bin"

RELEASE_DIR="${WORK_DIR}/R"

FRESH_DISTRIBUTION="${BIN_DIR}/fresh.tar.bz2"

SYS_DIR="${WORK_DIR}/SYS"

SYS_ARCHIVE_NAME="sys.tar.bz2"
SYS_ARCHIVED="${BIN_DIR}/${SYS_ARCHIVE_NAME}"

SYS_DISK_RAW_IMAGE="${BIN_DIR}/hos.raw"
SYS_VDI_IMAGE="${BIN_DIR}/hos01.vdi"


compress_curr_dir()
{
  rm $1
  tar -cvjSf $1 *
}