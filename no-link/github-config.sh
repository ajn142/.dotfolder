# Install gh cli
# taken from https://github.com/cli/cli/blob/trunk/docs/install_linux.md
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y


# set up an ssh key locally with no passphrase (will extend later)
ssh-keygen -t ed25519 -C "GitHub key for $(whoami)@$(hostname)" -N "" -f $HOME/.ssh/github_$(hostname)_ed25519


# log into github with PAT
gh auth login --with-token < ~/.dotfolder/no-link/github_pat.txt

# upload key to github for both signing and authentication using cli
gh ssh-key add ~/.ssh/github_$(hostname)_ed25519.pub --title "$(whoami)@$(hostname)" --type signing
gh ssh-key add ~/.ssh/github_$(hostname)_ed25519.pub --title "$(whoami)@$(hostname)" --type authentication

# convert remote ref on .dotfolder repo to use git
cd ~/.dotfolder
git remote set-url origin git@github.com:ajn142/.dotfolder.git

# logout of gh cli and remove PAT
gh auth logout
rm ~/.dotfolder/no-link/github_pat.txt

# start ssh-agent and add the key
eval $(ssh-agent -s)
ssh-add ~/.ssh/github_$(hostname)_ed25519
