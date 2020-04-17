#!/bin/zsh

# Start new named session
session="fastai2"
tmux new-session -d -s $session

# Open first window, navigate to website dir and launch Atom
tmux rename-window -t 0 'Shell'
tmux send-keys -t 'Shell' 'cd $HOME/work/course-v4' C-m 'activate fastai2' C-m 

# Open a second window and launch NVIDIA-SMI 
tmux new-window -t $session:1 -n 'NVIDIA-SMI'
tmux send-keys -t 'NVIDIA-SMI' 'watch -n 1 nvidia-smi' C-m 

# Open a third window and launch Jupyter server
tmux new-window -t $session:2 -n 'Jupyter'
tmux send-keys -t 'Jupyter' 'cd $HOME/work/course-v4' C-m 'activate fastai2' C-m 'jupyter notebook' C-m

# Attach session on the NVIDIA-SMI window
tmux attach-session -t $session:1
