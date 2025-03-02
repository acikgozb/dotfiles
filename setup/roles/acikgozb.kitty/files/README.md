# Kitty

Kitty is a GPU based, highly customizable terminal emulator.

## Table of Contents

<!--toc:start-->

- [Installation](#installation)
- [Configuration](#configuration)
- [Features](#features)
- [Font](#font)
- [Cursor](#cursor)
- [Theme](#theme)
- [Background](#background)
- [Automatic Updates](#automatic-updates)
- [Shell and Editor](#shell-and-editor)
- [Window](#window)
<!--toc:end-->

## <a id='installation'></a> Installation

The installation is done automatically by the `Ansible` playbook under the `setup` directory.
To see the exact place where Kitty is installed, you can check [acikgozb.kitty](https://github.com/acikgozb/dotfiles/tree/main/setup/roles/acikgozb.kitty) Ansible role.

## <a id='configuration'></a> Configuration

Kitty can be configured through a configuration file called `kitty.conf`.

The [configuration file](https://github.com/acikgozb/dotfiles/blob/main/kitty/kitty.conf) contains minimal changes and largely uses the default settings.

Please refer to the [main documentation](https://sw.kovidgoyal.net/kitty/conf/) for more details.

## <a id='features'></a> Features

Here is a set of features that comes with the current configuration file:

- Font
- Cursor
- Theme
- Background
- Automatic Updates
- Shell and Editor
- Window

### <a id='font'></a> Font

In the configuration file, the font is set to `UbuntuMono Nerd Font`. This font is downloaded and installed automatically by `acikgozb.kitty` Ansible role.

If you want to change with another font, I highly suggest using a nerd font, which contains ligatures specifically designed for programmers.

You can check and download the nerd fonts from [here](https://github.com/ryanoasis/nerd-fonts).

### <a id='cursor'></a> Cursor

In the configuration file, the cursor is set to a block cursor, which is what I got used to.

This goes well with the VI mode plugin that gets installed with my `zsh` settings. In insert mode the cursor turns into a line, in normal mode the cursor switches to a block one.

Please refer to Kitty documentation if you want to change it.

### <a id='theme'></a> Theme

When it comes to themes, Kitty applies themes by including a separate theme file, which contains all the color mappings.
In here, the selected theme is one of Github's dark themes, named [Github Dark Tritanopia](https://github.com/projekt0n/github-nvim-theme).

In order to make it easier to have a couple of themes, a directory called `themes` is created.

Any theme that is downloaded should be put under that directory, and the current active theme should be copied to a file called `current-theme.conf`.

In the configuration file, `current-theme.conf` is included so that the selected theme gets applied.

### <a id='background'></a> Background

In the configuration file, there are two properties that plays around with the background:

- `background_opacity`
- `backgroun_blur`

I like to have a small transparency while working in Terminal, as a result I applied a small transparency via `background_opacity`.
In order to not get distracted by the things behind the Terminal, I set a small blur via `background_blur`.

Feel free to play with these values to see their effect.

### <a id='automatic-updates'></a> Automatic Updates

By default, Kitty tried to check any updates regularly and installs them if there is any.

I prefer to control the package updates manually to have more control over the packages. Unless it's absolutely needed, I avoid installing any updates.

Therefore the field `update_check_interval` is set to `0` to disable automatic update checking.

### <a id='shell-and-editor'></a> Shell and Editor

In the configuration file, in order to be in sync with the shell and editor settings, the fields below are set to `$SHELL` and `$EDITOR` respectively:

- `shell`
- `editor`

This allows me to have `zsh` and `Neovim` automatically seen by Kitty, prevents inconsistency with the rest of my local environment.

### <a id='window'></a> Window

It is possible to play around with the window settings to customize it to your liking.

In the configuration file, there are 3 fields which corresponds to these customizations:

- `hide_window_decorations`
- `window_padding_width`
- `draw_minimal_borders`

Please check out official Kitty documentation to see a full list of options.

I prefer to have a minimal terminal window, so that is why `hide_window_decorations` field is set to `titlebar-only`. This removes the top bar from the terminal window.

When `titlebar-only` is set, it removes the text space between the sides of the window. Therefore I applied a little padding via `window_padding_width` field.

`draw_minimal_borders` allows Kitty to only draw the minimum required borders (mostly borders between different panes). However, since `window_padding_width` exists, Kitty automatically sets this to `no`. I explicitly added the field to make it apparent.
