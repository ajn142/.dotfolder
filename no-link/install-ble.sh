#!/usr/bin/env bash

$CWD=$(pwd)

# Evaluate whether dependencies for ble.sh are present in some form.
echo "Checking for gawk, git, and make."
! [[ -f $(command -v gawk) ]] && ! [[ -f $(command -v git) ]] && ! [[ -f $(command -v make) ]] || echo "One or more missing,  prompting for password to install" && sudo apt install gawk git make

# Move to home
cd ~/

# clone the repo
git clone --recursive https://github.com/akinomyoga/ble.sh.git

# move to repo
cd ble.sh

# make ble.sh
make

# install ble.sh to standard location (~/.local/share/blesh)
make install

# reload bash with ble.sh in place
exec bash

# return to original directory
cd $CWD

