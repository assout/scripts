#!/bin/bash -eu

# 基本パターン
basic() {
  trap 'read -p "$BASH_COMMAND"' DEBUG

  echo 1
  echo 2
  echo 3
}

# 行番号出力
lineno() {
  trap 'read -p "($LINENO) $BASH_COMMAND"' DEBUG

  echo 1
  echo 2
}

# function内もステップ実行
# Refs: http://stackoverflow.com/questions/13223279/how-can-a-sourced-file-inherit-trap-debug
target() {
  echo 1
  echo 2
}

functrace() {
  trap 'read -p "($LINENO) $BASH_COMMAND"' DEBUG
  echo 1st
  target
  set -o functrace
  echo 2nd
  target
}

# オプションで指定
parseOptions() {
  while [ "$#" -gt 0 ] ; do
    arg="${1}" ; shift
    case "${arg}" in
      --debug) trap 'read -p "$BASH_COMMAND"' DEBUG;;
      --) break;;
      --*) ;;
      -*)
      OPTIND=1
      while getopts "nvE" OPT "${arg}"; do
        case $OPT in
          n) OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} -n" ;;
          \?) return 1 ;;
        esac
      done
    esac
  done
}

