#!/usr/bin/env bash

$CWD=$"(pwd)"

# verify curl is installed
! [[ -f $(command -v curl) ]] && echo "curl not installed, prompting to install" && sudo apt install curl

# install atuin to standard location (~/.local/share/atuin)
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/atuinsh/atuin/releases/latest/download/atuin-installer.sh | sh

# import history before reloading bash and making atuin active
atuin import auto

# reload bash with atuin in place
exec bash

# return to original directory
cd $CWD

