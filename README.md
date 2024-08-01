Use these files and overwrite their paths, starting from $HOME.
As in, `.tmux.conf` should replace `~/.tmux.conf` and `.config/nvim/` should replace `~/.config/nvim/`.
However, `.config/` should NOT replace `~/.config/`

I wrote a script to copy all dotfile data from this repo (i.e., not the README, the script in question, or .git) into the dir-tree starting at $HOME (~). This script should only be run from within the directory that this repo was cloned into.
