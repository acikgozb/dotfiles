export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:/usr/local/netcoredbg:/usr/local/iODBC/bin:$HOME/.dotnet/tools:/opt/homebrew/bin:$PATH

export TERM=xterm-256color

# Set default config directory.
export XDG_CONFIG_HOME="$HOME/.config"
# Set neovim as default editor.
export EDITOR="nvim"

# Bootstrap Starship.
eval "$(starship init zsh)"

# Enable auto suggestions (brew install zsh-autosuggestions).
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# Enable vi keybindings (brew install zsh-vi-mode).
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
# Enable secret variables, normally used for org specific needs or things like DB connections for nvim plugins and such.
source $XDG_CONFIG_HOME/zsh/secrets/env.sh
# Enable placeholder helper.
source $XDG_CONFIG_HOME/zsh/plugins/placeholder/placeholder.sh