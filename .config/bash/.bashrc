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

# .bash_history loc.
export HISTFILE="$XDG_STATE_HOME/bash/history"

# Aurora lib path (AUR).
export AURORA_LIB_PATH="/home/acikgozb/.local/lib"

# $PATH.
if ! grep -q "$XDG_BIN_HOME:" <<< "$PATH"; then
    export PATH="$XDG_BIN_HOME:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/custom" <<< "$PATH"; then
    export PATH="/home/acikgozb/.local/bin/custom:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/prebuilt" <<< "$PATH"; then
    export PATH="/home/acikgozb/.local/bin/prebuilt:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/npm-packages" <<< "$PATH"; then
    export PATH="/home/acikgozb/.local/bin/npm-packages:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/go-packages" <<< "$PATH"; then
    export GOPATH="/home/acikgozb/.local/bin/go-packages"
    export PATH="/home/acikgozb/.local/bin/go/bin:/home/acikgozb/.local/bin/go-packages/bin:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/.net" <<< "$PATH"; then
    export PATH="/home/acikgozb/.local/bin/.net:$PATH"
fi
if ! grep -q "/home/acikgozb/.local/bin/cargo/bin" <<< "$PATH"; then
    export PATH="/home/acikgozb/.local/bin/cargo/bin:$PATH"
fi

# inputrc.
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"

# Ansible.
export ANSIBLE_HOME="${XDG_CONFIG_HOME}/ansible"
export ANSIBLE_CONFIG="${XDG_CONFIG_HOME}/ansible/ansible.cfg"
export ANSIBLE_GALAXY_CACHE_DIR="${XDG_CACHE_HOME}/ansible/galaxy_cache"

export EDITOR="helix"

# Starship.
eval "$(starship init bash)"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/config.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship"

# Rust.
export CARGO_HOME="/home/acikgozb/.local/bin/cargo"
export RUSTUP_HOME="$XDG_BIN_HOME/rustup"

# NVM.
export NVM_DIR="/home/acikgozb/.local/bin/nvm"
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
alias tee='gtee'
alias hx='helix'
