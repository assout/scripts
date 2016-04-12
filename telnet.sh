#!/bin/bash

# About.
# 泥臭くtelnetコマンドを実行

# TODOs
# * Usage
# * 引数チェック
# * command指定方法
# * 引数だけでなく環境変数にも対応


SERVER="$1"
USER="$2"
# PASS="$3"
shift 3
# COMMANDS=$*

# (
# sleep 1; echo ${USER};
# sleep 1; echo ${PASS};
# ) | telnet ${SERVER}

telnet "${SERVER}" -l "${USER}" </dev/tty

