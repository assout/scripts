#!/bin/bash

# TODO Refine
# TODO Window name

tmux new-window -a -n splits
tmux select-window -t splits

## pane 1
tmux send-keys -t splits "echo 1" C-m

## pane 2
tmux split-window -h -t splits
tmux send-keys -t splits "echo 2" C-m

## pane 3
tmux select-pane -l -t splits
tmux split-window -v -t splits
tmux send-keys -t splits "echo 3" C-m

## pane 4
tmux select-pane -R -t splits
tmux split-window -v -t splits
tmux send-keys -t splits "echo 4" C-m

## select first pane
tmux select-pane -L -t splits
tmux select-pane -U -t splits

