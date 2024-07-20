# zsh

`zsh` is a shell designed for interactive use, similar to `sh` or `bash`.

## Table of Contents

<!--toc:start-->

- [Installation](#installation)
- [Configuration](#configuration)
- [`.zshrc`](#zshrc)
- [`.zshenv`](#zshenv)
<!--toc:end-->

## <a id='installation'></a> Installation

The installation is done automatically by the `Ansible` playbook under the `setup` directory.
To see the exact place where Kitty is installed, you can check [acikgozb.zsh](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.zsh) Ansible role.

## <a id='configuration'></a> Configuration

As you probably know, the configuration files for `zsh` are just plain shell scripts. So you can pretty configure anything based on your preferences.

Normally, there are more files which `zsh` reads before it starts an interactive shell.
For my usage, it was alright to gather all configuration under `.zshrc`, so I ended up with just 2 files and a simple directory:

- [.zshrc](https://github.com/acikgozb/dotfiles/blob/main/zsh/.zshrc)
- [.zshenv](https://github.com/acikgozb/dotfiles/blob/main/zsh/.zshenv)
- [plugins](https://github.com/acikgozb/dotfiles/tree/main/zsh/plugins)

### <a id='zshrc'></a> `.zshrc`

This file holds the main configuration of my shell.

It's actually pretty minimal and does the job for now:

- It sets the `PATH`, `XDG_CONFIG_HOME` and `EDITOR` variables,
- It enables `starship` (custom prompt) if it's not enabled already,
- It sources my 3rd party zsh plugins (located under `~/.zsh`, not in this repository).
- It defines a set of aliases for my own taste.

However, even if I correctly configure everything in `.zshrc`, the shell has no idea where to look for this file.
To fix this issue, I needed another file called `.zshenv`.

### <a id='zshenv'></a> `.zshenv`

When an interactive shell is opened, one of the first things that shell does is to try to locate it's configuration files under `ZDOTDIR` directory, which is `$HOME` by default.

Under home directory, it tries to locate:

- `.zprofile`
- `.zshenv`
- `.zshrc`
- `.zlogin`

Out of all these 4 files, `.zshenv` is always sourced and by convention, it is the file which should contain the environment variables.

So, in order to successfully move the files from `$HOME` to `~/.config/zsh`, I set `ZDOTDIR` in `.zshenv` to redirect the shell to read under `~/.config/zsh`.

Unfortunately, with the current solution, I have to have `.zshenv` under `$HOME`, which is an acceptable compromise.
So in order to version control my `.zshenv`, I created a symlink under `$HOME`.
