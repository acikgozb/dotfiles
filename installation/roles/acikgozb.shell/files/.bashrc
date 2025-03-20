# This file is managed by `dotfiles`.
# Any change that is done to this file won't effect the template that was used to create this file.
# Therefore, if you change this file, make sure to update the installation in `dotfiles` as well.

set +x
# Base XDG_* environment variables to keep $HOME
# as clean as possible.
export XDG_CONFIG_HOME="/home/acikgozb/.config"
export XDG_STATE_HOME="/home/acikgozb/.local/state"
export XDG_DATA_HOME="/home/acikgozb/.local/share"
export XDG_BIN_HOME="/home/acikgozb/.local/bin"
export XDG_CACHE_HOME="/home/acikgozb/.cache"

# .bash_history
export HISTFILE="$XDG_STATE_HOME/bash/history"

# $PATH.
if ! grep -q "$XDG_BIN_HOME/custom" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/prebuilt" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME/prebuilt:$PATH"
fi
if ! grep -q "$XDG_BIN_HOME/npm-packages" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME/npm-packages:$PATH"
fi
if ! grep -q "$XDG_BIN_HOME:" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME:$PATH"
fi
if ! grep -q "$XDG_BIN_HOME/go-packages" <<< "$PATH"; then
    export GOPATH="$XDG_BIN_HOME/go-packages"
    export PATH="$XDG_BIN_HOME/go/bin:$XDG_BIN_HOME/go-packages/bin:$PATH"
fi
if ! grep -q "$XDG_BIN_HOME/.net" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME/.net:$PATH"
fi

# inputrc.
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Ansible.
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"

export EDITOR="nvim"

# Starship.
eval "$(starship init bash)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# Rust.
export CARGO_HOME="$XDG_BIN_HOME/cargo"
export RUSTUP_HOME="$XDG_BIN_HOME/rustup"

# NVM.
export NVM_DIR="$XDG_BIN_HOME"/nvm
[ -s "$NVM_DIR"/nvm.sh ] && source "$NVM_DIR"/nvm.sh

# AWS CLI.
export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

# Aliases.
alias ls='ls --color=auto -lA'
alias grep='grep --color=auto'
alias clip='wl-copy'
alias src='. $XDG_CONFIG_HOME/bash/.bashrc'
alias ftsys='fastfetch'
