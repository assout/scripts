#!/bin/sh

set -ueC

# Define
readonly CMD_NAME=$(basename "${0}")
readonly USAGE="\
Usage: ${CMD_NAME} [-t] [-f FILE] ARG1 ARG2"

usage() {
  echo "${USAGE}" 1>&2
}

# Check options
topt=FALSE
file=""
while getopts tf: option; do
  case ${option} in
  t) topt=TRUE ;;
  f) file=${OPTARG} ;;
  *) usage; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

# Check arguments
if [ $# -ne 2 ]; then
  usage
  exit 1
fi
arg1="${1}"
arg2="${2}"

# Main
echo "arg1=[${arg1}], arg2=[${arg2}], topt=[${topt}], file=[${file}]"
exit 0

