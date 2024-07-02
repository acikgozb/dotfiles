export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH # For Darwin

export TERM=xterm-256color

# Set default config directory.
export XDG_CONFIG_HOME="$HOME/.config"

# Set neovim as default editor.
export EDITOR="nvim"

# Bootstrap Starship.
type starship_zle-keymap-select >/dev/null || \
{
    eval "$(starship init zsh)"
}

# Enable zsh autosuggestions.
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable vim mode inside shell.
source $HOME/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Enable secret variables, added in here in case the host is used as a work PC.
[ -e $XDG_CONFIG_HOME/zsh/secrets/env.sh ] && source $XDG_CONFIG_HOME/zsh/secrets/env.sh

# Add aliases.
alias fzfw="$XDG_CONFIG_HOME/zsh/plugins/fzf/tmux-window.sh"
alias ls="ls -lA --color=auto"
