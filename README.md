# dotfiles

A collection of configuration files that forms a unique development environment.

<image src="https://github.com/user-attachments/assets/830aad82-ae7f-48dd-8afe-b69adb8dc4f9"></image>

## Table of Contents

<!--toc:start-->

- [Showcase](#showcase)
  - [Window Manager](#window-manager)
  - [Terminal](#terminal)
  - [Terminal Multiplexer](#terminal-multiplexer)
  - [Editor](#editor)
- [Description](#description)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [TODO](#todo)
<!--toc:end-->

## <a id='showcase'></a> Showcase

Here are some visuals and details to see how this project configures a given host.

### <a id='window-manager'></a> Window Manager

`dotfiles` installs and configures `hyprland` as the main window manager.
`dotfiles` does not touch existing window managers during the installation and configuration of `hyprland`.

**Status Bar**

There are no status bars (e.g. `waybar`) in this configuration.

**Workspace 1: `btop`**

This workspace is mainly designed to monitor the system with `btop`.

<details>
    <summary>btop</summary>
    <image src="https://github.com/user-attachments/assets/27d5a0d0-729b-4bd2-bf0d-7988bc22e683"></image>
</details>

**Workspace 2: main terminal**

This workspace is designed to hold the main terminal instance of the user.
`fastfetch` is **only executed during the initial boot** to show the system information.

<details>
    <summary>Main terminal</summary>
    <image src="https://github.com/user-attachments/assets/830aad82-ae7f-48dd-8afe-b69adb8dc4f9"></image>
</details>

**Workspace 3: `librewolf`**

This workspace is designed to hold the main browser instance.
`librewolf` is used as the browser.

Note: User specific configurations for `librewolf` (e.g. extensions, themes, font, keymaps) should be done explicitly by the user.

<details>
    <summary>librewolf</summary>
    <image src="https://github.com/user-attachments/assets/46671f08-bb36-4a6d-9421-ef84628dab11"></image>
</details>

**Empty workspaces & `hyprpaper`**

`dotfiles` installs `hyprpaper` to configure wallpapers on a given host.

Here is how an empty workspace looks like:

<details>
    <summary>Empty workspace</summary>
    <image src="https://github.com/user-attachments/assets/665404b6-ffed-49ac-82b5-742353d76527"></image>
</details>

**Special Workspaces aka scratchpads**

There is one non-persistent special workspace called `terminal` which triggers `alacritty` on a floating (tiled) window to execute less frequent commands.

### <a id='terminal'></a> Terminal

`dotfiles` installs and configures `alacritty` as the terminal on a given host.
It also installs and configures `starship` as the shell prompt.

Here is how `alacritty` looks by default:

<details>
    <summary>Alacritty</summary>
    <image src="https://github.com/user-attachments/assets/2bd8c3a7-d59d-4e90-8d72-63a1ca97aa71"></image>
</details>

### <a id='terminal-multiplexer'></a> Terminal Multiplexer

`dotfiles` installs and configures either `tmux` or `zellij` to be used as the main terminal multiplexer.

A minimal status bar is used for `tmux`, like below:

<details>
    <summary>tmux</summary>
    <image src="https://github.com/user-attachments/assets/f7ef2fff-b5cf-4317-876c-1d2338cb6f0e"></image>
</details>

For `zellij`, a minimal UI is used similar to `tmux`:

<details>
    <summary>zellij</summary>
    <image src="https://github.com/user-attachments/assets/b2951be2-282d-41c6-a85f-826543e36d84"></image>
</details>

### <a id='editor'></a> Editor

`dotfiles` installs and configures Neovim as the editor on a given host.

Here is how `nvim` looks like upon launching it in a directory:

<details>
    <summary>Neovim (Netrw)</summary>
    <image src="https://github.com/user-attachments/assets/25d7a4ba-8568-4646-974c-8ef91427f999"></image>
</details>

A monochromatic theme is used for Neovim, with its primary color set to `rose-pine`'s `rose` color, as shown below:

<details>
    <summary>Neovim (Buffer)</summary>
    <image src="https://github.com/user-attachments/assets/c256ed80-a0ff-4c43-ab35-717547562f4d"></image>
</details>

## <a id="description"></a> Description

`dotfiles` is a configuration management project that allow users to easily replicate their local environment configuration.

For the architecture, please refer to [ARCHITECTURE.md](./ARCHITECTURE.md).

## <a id='requirements'></a> Requirements

As of version `0.3.0`, `dotfiles` is designed to support x86_64 Arch Linux hosts only.
Due to time constraints, unfortunately I can only maintain the project for the main OS I use.

However, most of the installation steps can be applied to other Linux distributions easily thanks to Ansible.

## <a id="installation"></a> Installation

The installation is done through an `Ansible` playbook. Please refer [here](https://github.com/acikgozb/dotfiles/blob/main/installation/README.md) to see the tools and installation steps.

## <a id="usage"></a> Usage

The usage of the tools are the same, regardless of the installation method.
Please refer to each tool's documentation to see their usage.

## <a id="todo"></a> TODO

- (P1) Add missing tools to the installation (recurring).
- (P1) Create an interface to verify and list the installed tools, a different playbook maybe?
