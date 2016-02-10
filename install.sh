#!/bin/bash

# TODO: チェック処理リファクタ
if [ "${OSTYPE}" = msys ] ; then echo "install.sh: It doesn't meet the prerequisites" >&2 && exit 1 ; fi

cd ~/Development

git clone git@github.com:assout/memolist.git
ln -sf ~/Development/script/ ~/

