#!/bin/bash

# TODO Refine

tmux new-window -a -n "Splits"

## pane 1
tmux send-keys "echo 1" C-m

## pane 2
tmux split-window -h
tmux send-keys "echo 2" C-m

## pane 3
tmux select-pane -t 0
tmux split-window -v
tmux send-keys "echo 3" C-m

## pane 4
tmux select-pane -t 2
tmux split-window -v
tmux send-keys "echo 4" C-m

tmux select-pane -t 0

