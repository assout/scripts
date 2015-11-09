#!/bin/bash

# TODOs
# * 引数チェック

SERVER="${1}"
USER="${2}"
PASS="${3}"
shift 3
FILES="${@}"

ftp -n <<END
open ${SERVER}
user ${USER} ${PASS}
mput ${FILES}
END

