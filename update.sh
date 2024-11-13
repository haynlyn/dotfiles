#!/bin/bash
# Copies all files except this script, the repo's README, and its relevant .git dir, as well as HOME, into HOME.
# This isn't clean, and this script should only be run from the directory that the repo was cloned into.
echo 'Updating dotfiles. Moving files from repo to appropriate directories.'

rsync -av . ~ -f'- update.sh' -f'- README.md' -f'- .git' -f'- ~'
