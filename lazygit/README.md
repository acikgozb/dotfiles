# Lazygit

Lazygit is a Terminal GUI for Git.

## Table of Contents

<!--toc:start-->

- [Installation](#installation)
- [Configuration](#configuration)
<!--toc:end-->

## <a id='installation'></a> Installation

The installation is done automatically by the `Ansible` playbook under the `setup` directory.
To see the exact place where Lazygit is installed, you can check [acikgozb.git](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.git).

## <a id='configuration'></a> Configuration

The configuration is done through a yaml file called `config.yml`.
Since the `XDG_CONFIG_HOME` variable is set to `~/.config` via my zsh setup, Lazygit expects to read the config file from `~/.config/lazygit/config.yml`.

By changing `XDG_CONFIG_HOME`, you can move `config.yml` to another place on your host.

There are many different options to work with when it comes to Lazygit. For more details, you can check the [official documentation](https://github.com/jesseduffield/lazygit/blob/master/docs/Config.md).

In my configuration file, I just have the `colorArg` option. This was set to `always` to experiment with a custom pager (delta) within Lazygit.

I might play around with pagers later again, that is why I did not remove my `config.yml` completely. Right now, it's safe to say that I'm using the default configuration for Lazygit.
