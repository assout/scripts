#!/bin/sh -ue

# TODOs
# * 引数だけでなく環境変数にも対応
# * 引数指定方法
# * FIXME: DRY to up sh

readonly CMD_NAME=$(basename "${0}")
readonly USAGE="\
Usage: ${CMD_NAME} SERVER USER PASSWORD SRC DEST FILE..."

# Check arguments
if [ ${#} -lt 6 ]; then
  echo "${USAGE}" 1>&2 ; exit 1
fi

SERVER="${1}"
USER="${2}"
PASS="${3}"
SRC="${4}"
DEST="${5}"
shift 5
FILES="${*}"

ftp -n <<END
open ${SERVER}
user ${USER} ${PASS}
lcd ${DEST}
cd ${SRC}
binary
prompt
mget ${FILES}
END

