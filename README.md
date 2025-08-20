# dotfiles

A collection of configuration files that forms a unique development environment.

UI wise, `dotfiles` is as minimal as one can go:

- No status bar.
- No notifications.
- No wallpaper.

## Table of Contents

<!--toc:start-->

- [Description](#description)
- [Showcase](#showcase)
  - [Window Manager](#window-manager)
  - [Terminal](#terminal)
  - [Terminal Multiplexer](#terminal-multiplexer)
  - [Editor](#editor)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [TODO](#todo)
<!--toc:end-->

## <a id="description"></a> Description

`dotfiles` is a configuration management project that allow users to easily replicate their local environment configuration.

For the architecture, please refer to [ARCHITECTURE.md](./ARCHITECTURE.md).

## <a id='showcase'></a> Showcase

| Workspace 1 (btop) | Workspace 2 (alacritty) |
| -------------------|------------------------ |
| ![image](https://github.com/user-attachments/assets/ac69e807-af09-413f-9d1f-c4abf0a7cc44) | ![image](https://github.com/user-attachments/assets/0b1e79fa-177e-4680-bdef-2ccdd07b2b28) |

| Workspace 3 (librewolf) | Special workspace (alacritty) |
| ------------------------|------------------------------ |
| ![image](https://github.com/user-attachments/assets/cd9534c9-555a-4b84-ae9b-0cb9b324303b) | ![image](https://github.com/user-attachments/assets/99a539b1-26dd-47fc-97a8-52301df2af81) |

| `helix` | `nvim` |
| --------|------- |
| ![image](https://github.com/user-attachments/assets/8a29a3b6-259f-4035-a5f0-ffe188e2b811) | ![image](https://github.com/user-attachments/assets/63ae400e-02d7-4292-a3ee-950946a42b50) |

| `zellij` | `tmux` |
| ---------|------- |
| ![image](https://github.com/user-attachments/assets/1017ec29-4fe5-4a7b-986f-6637df73883f) | ![image](https://github.com/user-attachments/assets/c3fb5325-2d97-464e-81fa-cf8c973a93b8) |

Here is a list of explanation about the main programs that are used in this development environment.

### <a id='window-manager'></a> Window Manager

`dotfiles` installs and configures `hyprland` as the main window manager.
`dotfiles` does not touch existing window managers during the installation and configuration of `hyprland`.

**Status Bar**

There are no status bars (e.g. `waybar`) in this configuration.

During the initial boot, `hyprland` is configured to open three programs in three seperate workspaces:

- `btop` (1)
- `alacritty` (2)
- `librewolf` (3)

Note: User specific configurations for `librewolf` (e.g. extensions, themes, font, keymaps) should be done explicitly by the user.

`hyprland`'s special workspace (scratchpad) is also configured to open `alacritty`.
This workspace can be used to execute less frequent commands (e.g connecting to wifi or a bluetooth device).

### <a id='terminal'></a> Terminal

`dotfiles` installs and configures `alacritty` as the terminal on a given host.
It also installs and configures `starship` as the shell prompt.

### <a id='terminal-multiplexer'></a> Terminal Multiplexer

`dotfiles` installs and configures either `tmux` or `zellij` to be used as the main terminal multiplexer.

### <a id='editor'></a> Editor

`dotfiles` installs and configures either Neovim or Helix as the editor on a given host.


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
