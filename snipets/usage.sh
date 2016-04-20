#!/bin/sh -ue

# Define
readonly CMD_NAME=$(basename "${0}")
readonly USAGE="\
Usage: ${CMD_NAME} [-t] [-f FILE] ARG1 ARG2
Example:${CMD_NAME} hoge fuga"

# インデントのため複数行が書きにくい
usage_1() {
  echo "Usage: ${CMD_NAME} [-t] [-f FILE] ARG1 ARG2" 1>&2
}

usage_2() {
  echo "${USAGE}" 1>&2
}

echo case 1
usage_1

echo case 2
usage_2
