#!/bin/sh -ue

echo case 1
here=$(cd "$(dirname "$0")" || exit 1; pwd)
echo "${here}"

echo case 2
here=$(cd "$(dirname "${BASH_SOURCE:-$0}")"; pwd)
echo "${here}"

