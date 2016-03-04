#!/bin/bash

# TODOs
# * 引数チェック
# * 引数だけでなく環境変数にも対応
# * 引数指定方法
# * FIXME: DRY to up sh

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
lcd ${SRC}
cd ${DEST}
binary
prompt
mget ${FILES}
END

