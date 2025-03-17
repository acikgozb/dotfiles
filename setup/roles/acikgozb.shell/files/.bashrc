set +x
# Base XDG_* environment variables to keep the $HOME
# uncluttered.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.state"
export XDG_CACHE_HOME="$HOME/.cache"

# WARN: Add the custom script path under $PATH via dotfiles.
export PATH="$HOME/bin/custom:$PATH"
# WARN: Add the .inputrc file and it's necessary XDG Base Directory specification below via dotfiles.
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Ansible.
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"

export EDITOR="nvim"

# Aliases.
alias ls='ls --color=auto -lA'
alias grep='grep --color=auto'
alias clip='wl-copy'
alias src='. $XDG_CONFIG_HOME/bash/.bashrc'

# The rest of the configuration is managed by Ansible.
# I'd recommend to not change the managed blocks below.

# Bootstrap Starship - ANSIBLE MANAGED BLOCK
eval "$(starship init bash)"
# END ANSIBLE MANAGED BLOCK

# Starship XDG Base Directory - ANSIBLE MANAGED BLOCK
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"
# END ANSIBLE MANAGED BLOCK

# Prebuilt binaries - ANSIBLE MANAGED BLOCK
if ! grep -q "/bin/prebuilt" <<< "$PATH"; then
    export PATH=$HOME/bin/prebuilt:$PATH
fi
# END ANSIBLE MANAGED BLOCK

# Go binary - ANSIBLE MANAGED BLOCK
if ! grep -q "go-packages" <<< "$PATH"; then
    export GOPATH=$HOME/bin/go-packages
    export PATH=$HOME/bin/go/bin:$HOME/bin/go-packages/bin:$PATH
fi
# END ANSIBLE MANAGED BLOCK

# .NET binary - ANSIBLE MANAGED BLOCK
if ! grep -q ".net" <<< "$PATH"; then
    export PATH=$HOME/bin/.net:$PATH
fi
# END ANSIBLE MANAGED BLOCK

# NVM binary lookup - ANSIBLE MANAGED BLOCK
export NVM_DIR="$HOME"/bin/nvm
[ -s "$NVM_DIR"/nvm.sh ] && source "$NVM_DIR"/nvm.sh
# END ANSIBLE MANAGED BLOCK

# Rust tooling - ANSIBLE MANAGED BLOCK
export CARGO_HOME="$HOME/bin/cargo"
export RUSTUP_HOME="$HOME/bin/rustup"
# END ANSIBLE MANAGED BLOCK

# JS binaries - ANSIBLE MANAGED BLOCK
if ! grep -q "npm-packages" <<< "$PATH"; then
    export PATH=$HOME/bin/npm-packages/bin:$PATH
fi
# END ANSIBLE MANAGED BLOCK

# AWS CLI XDG Base Directory - ANSIBLE MANAGED BLOCK
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config
# END ANSIBLE MANAGED BLOCK

# AWS CLI lookup - ANSIBLE MANAGED BLOCK
if ! grep -q "/home/acikgozb/bin:" <<< "$PATH"; then
    export PATH="/home/acikgozb/bin:$PATH"
fi
# END ANSIBLE MANAGED BLOCK
