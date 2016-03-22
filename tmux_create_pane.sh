#!/bin/bash

# TODO Refine
# TODO Window name
# TODO Generalization
# TODO Args check
# TODO Usage
# TODO Args variable num

name=""
while getopts n: OPT ; do
  case ${OPT} in
    n) name=${OPTARG} ;;
   \?) exit 1 ;;
  esac
done

if [ -z "${name}" ] ; then
  tmux new-window
else
  tmux new-window -n "${name}"
fi

tmux split-window -h -t '{end}.{top-left}'
tmux split-window -v -t '{end}.{top-left}'
tmux split-window -v -t '{end}.{top-right}'

tmux send-keys -t '{end}.{top-left}'     "${1}" C-m
tmux send-keys -t '{end}.{top-right}'    "${2}" C-m
tmux send-keys -t '{end}.{bottom-left}'  "${3}" C-m
tmux send-keys -t '{end}.{bottom-right}' "${4}" C-m

tmux select-pane -t '{end}.{top-left}'
