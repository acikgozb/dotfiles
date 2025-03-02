# tmux

`tmux` is a terminal multiplexer, which allows me to have multiple sessions via a single terminal instance, and multiple windows within them.

## Table of Contents

<!--toc:start-->

- [Installation](#installation)
- [Configuration](#configuration)
- [Plugin Manager](#plugin-manager)
- [Coloring](#coloring)
- [Theme](#theme)
- [Keymaps](#keymaps)
- [Mouse Movement](#mouse-movement)
- [Vim Motions](#vim-motions)
<!--toc:end-->

## <a id='installation'></a> Installation

The installation is done automatically by the `Ansible` playbook under the `setup` directory.
To see the exact place where Kitty is installed, you can check [acikgozb.tmux](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.tmux) Ansible role.

## <a id='configuration'></a> Configuration

The configuration for tmux is read from a file called `tmux.conf`. Tmux has a really extensive configuration options available, so I would really recommend to check the [official documentation](https://github.com/tmux/tmux/wiki/Getting-Started#configuring-tmux).

When the documentation gets too complex, you can search for the individual things you want to do (themes, vi-mode, sourcing, custom keys, etc.)

In the configuration file, we can group the settings like below:

- Plugin Manager
- Coloring
- Theme
- Keymaps
- Mouse Movement
- Vim Motions

### <a id='plugin-manager'></a> Plugin Manager

Like Neovim, there are a number of plugins available to use within `tmux`. Therefore, there is a need for a cental place to manage these plugins.

That's why, the most recommended plugin called `tpm` is set at the top of the configuration file. It is actually executed at the end of the file, as recommended.

To be fair, I only use this for installing my favorite theme. Nonetheless, having a plugin manager for future changes is convenient.

### <a id='coloring'></a> Coloring

Like the actual terminal or Neovim, `tmux` has support for coloring as well. And if the colors are not set the same with the terminal, the colors of `tmux` starts to differ, which affects the general user experience if we think about the local environment as a whole (terminal, tmux, Neovim).

Therefore, the `default-terminal` is set to `$TERM` to make the coloring sync across all my local environment.

### <a id='theme'></a> Theme

Like Neovim, I use `rose-pine` theme for `tmux`. I really dig its muted colors.

However, there is a small difference for `tmux`. Normally, `rose-pine` comes with a grey-like background. Since my Kitty theme enables a near pitch black background, I disabled the default background that comes with `rose-pine`, and set `tmux`'s background to transparent.

You can easily change the option if you prefer to not have transparency for `tmux`.

### <a id='keymaps'></a> Keymaps

In the configuration file, there are a couple of keymaps to help with developer experience:

1 - The `leader` key is set to `C-a` from `C-b`. `C-a` is just a lot easier to press for me.
2 - The vertical and horizontal split keys are changed from `%` and `"` to `|` and `-` respectively. Memorizing default keys are a bit hard and the pipe and dash keys nicely represent vertical and horizontal plane.
3 - A shortcut `r` is created to source the `tmux` config a little bit easier.

These settings mostly depend on personal taste. If you decide to install my dotfiles, feel free to set these to your liking.

### <a id='mouse-movement'></a> Mouse Movement

As most people know, a mouse is no longer needed if Vim Motions can be used.
However, as a fallback option it's nice to have mouse enabled just in case.

Therefore in the configuration file, mouse movements are enabled by default for `tmux` just in case.

### <a id='vim-motions'></a> Vim Motions

Any individual who gets used to Vim Motions usually want to use Vim Motions everywhere. They are _that_ good.

For me it is no different. I strive to use Vim Motions whereever I can, so in `tmux` they are enabled as well. I can visually select anything in a `tmux` session by pressing `v`, and yank the selections by pressing `y`, just like in Vim.

Also, I set the default movement keys in Vim to move between panes, so:

- `leader+h` moves me to the left pane,
- `leader+j` moves me to the bottom pane,
- `leader+k` moves me to the top pane,
- `leader+l` moves me to the right pane.

It's really convenient to use the same keymaps to navigate between panes in both Neovim and `tmux`.
