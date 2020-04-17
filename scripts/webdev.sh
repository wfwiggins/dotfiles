#!/bin/zsh

# Start new named session
session="webdev"
tmux new-session -d -s $session

# Open first window, navigate to website dir and launch Atom
tmux rename-window -t 0 'Shell'
tmux send-keys -t 'Shell' 'cd $HOME/work/wfwiggins.github.io' C-m 'atom .' C-m

# Open a second window and launch test server
tmux new-window -t $session:1 -n 'Jekyll server'
tmux send-keys -t 'Jekyll server' 'cd $HOME/work/wfwiggins.github.io' C-m 'be jekyll serve' C-m
sleep 2
tmux send-keys -t 'Shell' 'firefox http://localhost:4000' C-m

# Attach session on the Shell window
tmux attach-session -t $session:0
