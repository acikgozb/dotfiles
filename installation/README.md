# Dotfiles Installation

<!--toc:start-->

## Table of Contents

- [Disclaimer](#disclaimer)
- [Required Tools](#required-tools)
- [Clone the Repository](#clone-the-repository)
- [`installation` Directory](#installation-directory)
- [User Specific Variables](#user-specific-variables)
- [`make install`](#make-install)
  - [List of the Tools and Their Corresponding Ansible Roles](#list-of-the-tools-and-their-corresponding-ansible-roles)
- [Post Installation](#post-installation)
- [Customizing the Installation](#customizing-the-installation)
<!--toc:end-->

This document explains how to install and configure the tools used in `dotfiles`.

## <a id="disclaimer"></a> Disclaimer

The configuration for my dotfiles is written in a way that most of the tools are installed locally under `$HOME`. While the setup of this approach is more complex compared to dumping everything to e.g. `/usr/local/bin`, it makes the host configuration a lot more maintainable and easier to understand.

However, there are some tools which needs to be installed globally, such as `bash` and `tmux`.

Before continuing with the installation, let me say that the intended usage of this repository is on a host without any pre-existing configurations.
And since a local development environment varies from person to person, I would encourage you to automate your own local environment and consider this repository as a reference, instead of installing `dotfiles` directly.

If you still want to try it out, do not forget to create a backup of your old configuration in case of conflicts.

## <a id="required-tools"></a> Required Tools

The installation scripts of `dotfiles` are written in `Ansible`.
Therefore, you absolutely need to [install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) before starting.

## <a id="clone-the-repository"></a> Clone the Repository

With the tools installed and ready to go, it's time to clone the repository.
Since the installation is done through symlinking, you can clone the repository wherever you want.

```bash
git clone git@github.com:acikgozb/dotfiles.git /path/to/dotfiles
```

## <a id="installation-directory"></a> `installation` Directory

The main installation and configuration of your host happens under `<repo-root-path>/installation` directory. This is the main place where our Ansible playbook lives, along with anything it needs.

If you have had an experience working with Ansible, this directory will feel familiar to you.

## <a id="user-specific-variables"></a> User Specific Variables

Before proceeding to the installation, users' need to provide some variables that will be used by `dotfiles`.
This is required simply because some configuration files need user specific values (e.g. git email).

`dotfiles` provides a `user_vars.sample.yml` file which you can use as a reference.
Simply make a copy of that file and change the default variables as you see fit:

```bash
# Assume that the repository lives under ~/dotfiles.
cp ~/dotfiles/installation/vars/user_vars.sample.yml ~/dotfiles/installation/vars/user_vars.yml
```

## `make install`

To start the installation, simply cd into `installation` run `make install`:

```bash
# Assume that the repository lives under ~/dotfiles.
cd ~/dotfiles/installation
make install
```

Some tasks need to be run via elevated privileges, therefore Ansible will ask the password of the `$USER`.
Enter your password to start the installation.

### <a id="list-of-the-tools-and-their-corresponding-ansible-roles"></a> List of the Tools and Their Corresponding Ansible Roles

Here is the list of the tools that are installed via `dotfiles`.
Please refer to linked configuration files and Ansible roles to see what is installed on a given host:

<hr>

Role: [acikgozb.net](./roles/acikgozb.net/README.md)

Packages:

- `traceroute`
- `lsof`
- `nmap`
- `dnsmasq`
- `inetutils`
- `iwd`

Configurations:

- [NetworkManager DNS configuration](./roles/acikgozb.net/files/dns.conf)
- [NetworkManager WiFi configuration](./roles/acikgozb.net/files/wifi_backend.conf)
- [systemd-resolved DNS server configuration](./roles/acikgozb.net/files/dns_servers.conf)

Templates:

- [NetworkManager DNS configuration](./roles/acikgozb.net/templates/nm.dns.conf.j2)
- [NetworkManager WiFi configuration](./roles/acikgozb.net/templates/nm.wifi_backend.conf.j2)
- [systemd-resolved DNS server configuration](./roles/acikgozb.net/templates/systemd-resolved.dns_servers.conf.j2)

<hr>

Role: [acikgozb.git](./roles/acikgozb.git/README.md)

Packages: none

Configurations:

- [Git config file](./roles/acikgozb.git/files/config)

Templates:

- [Git config file](./roles/acikgozb.git/templates/config.j2)

<hr>

Role: [acikgozb.shell](./roles/acikgozb.shell/README.md)

Packages:

- `starship`

Configurations:

- [Bash profile](./roles/acikgozb.shell/files/.bash_profile)
- [Bash configuration file](./roles/acikgozb.shell/files/.bashrc)
- [Starship configuration file](./roles/acikgozb.shell/files/starship.toml)

Templates:

- [Bash profile](./roles/acikgozb.shell/templates/.bash_profile.j2)
- [Bash configuration file](./roles/acikgozb.shell/templates/.bashrc.j2)
- [Starship configuration file](./roles/acikgozb.shell/templates/starship.toml.j2)

<hr>

Role: [acikgozb.multiplexer](./roles/acikgozb.multiplexer/README.md)

Packages:

- `tmux`
- `zellij`

Configurations:

- [`tmux` configuration file](./roles/acikgozb.multiplexer/files/tmux.conf)
- [`zellij` configuration file](./roles/acikgozb.multiplexer/files/zellij.config.kdl)
- [`zellij` initial layout file](./roles/acikgozb.multiplexer/files/zellij.init.kdl)
- [`zellij` default layout file](./roles/acikgozb.multiplexer/files/zellij.default.kdl)
- [`zellij` theme](./roles/acikgozb.multiplexer/files/zellij.rose_pine.kdl)

Templates:

- [`tmux` configuration file](./roles/acikgozb.multiplexer/templates/tmux.conf.j2)
- [`zellij` configuration file](./roles/acikgozb.multiplexer/templates/zellij.config.kdl.j2)
- [`zellij` initial layout file](./roles/acikgozb.multiplexer/templates/zellij.init.kdl.j2)
- [`zellij` default layout file](./roles/acikgozb.multiplexer/templates/zellij.default.kdl.j2)
- [`zellij` theme](./roles/acikgozb.multiplexer/templates/zellij.rose_pine.kdl.j2)

<hr>

Role: [acikgozb.editor](./roles/acikgozb.editor/README.md)

Packages:

<!--  TODO: Add LSPs to the list. -->

- `nvim`
- `helix`
- `go`
- `dotnet`
- `rustc`, `cargo`
- `nvm`, `npm`, `node`
- `yamlfmt`
- `dlv`
- `eslint_d`
- `typescript`
- `jq`
- `shellcheck`
- `golangci-lint`
- `fzf`
- `rg`
- `fd`

Configurations:

- [Neovim configuration files](./roles/acikgozb.editor/files/nvim)
- [`yamlfmt` configuration files](./roles/acikgozb.editor/files/yamlfmt/.yamlfmt.yml)
- [Helix configuration file](./roles/acikgozb.editor/files/helix.config.toml)
- [Helix LSP configuration file](./roles/acikgozb.editor/files/helix.languages.toml)
- [Helix theme](./roles/acikgozb.editor/files/helix.rose_pine.toml)

Templates:

There are no templates for `nvim` simply because there are lot of configuration files and none of them contain user specific values.

- [Helix configuration file](./roles/acikgozb.editor/templates/helix.config.toml.j2)
- [Helix LSP configuration file](./roles/acikgozb.editor/templates/helix.languages.toml.j2)
- [Helix theme](./roles/acikgozb.editor/templates/helix.rose_pine.toml.j2)

<hr>

Role: [acikgozb.term](./roles/acikgozb.term/README.md)

Packages:

- `alacritty`

Configurations:

- [Alacritty configuration file](./roles/acikgozb.term/files/alacritty.toml)
- [Alacritty theme](./roles/acikgozb.term/files/rose-pine.toml)

Templates:

- [Alacritty configuration file](./roles/acikgozb.term/templates/alacritty.toml.j2)
- [Alacritty theme](./roles/acikgozb.term/templates/rose-pine.toml.j2)

<hr>

Role: [acikgozb.cloud](./roles/acikgozb.cloud/README.md)

Packages:

- `aws`
- `terraform`
- `podman`

Configurations:

There are no configurations specified for the packages above.

Templates:

There are no template files specified for the packages above.

<hr>

Role: [acikgozb.system](./roles/acikgozb.system/README.md)

Packages:

- `hyprland`
- `hyprpaper`
- `rofi-wayland`
- `btop`
- `xdg-desktop-portal-hyprland`
- `ly`
- `caps2esc`
- `bluez-utils`
- `hyprpolkitagent`
- `ttf-font-awesome`
- `pavucontrol`
- `alsa-utils`
- `pipewire`
- `wireplumber`
- `sof-firmware`
- `grim`
- `slurp`
- `wl-clipboard`
- `libnotify`
- `wf-recorder`
- `brightnessctl`
- `wl`

Along with these packages, scripts from [devx-scripts](https://github.com/acikgozb/devx-scripts) are installed.

Configurations:

- [Hyprland configuration file](./roles/acikgozb.system/files/hyprland.conf)
- [Hyprpaper configuration file](./roles/acikgozb.system/files/hyprpaper.conf)
- [Rofi configuration file](./roles/acikgozb.system/files/config.rasi)
- [Rofi theme](./roles/acikgozb.system/files/minimal-dark.rasi)
- [Readline configuration file](./roles/acikgozb.system/files/inputrc)
- [Ly configuration file](./roles/acikgozb.system/files/ly.config.ini)
- [caps2esc configuration file](./roles/acikgozb.system/files/udevmon.yaml)
- [btop configuration file](./roles/acikgozb.system/files/btop.config.conf)
- [btop theme](./roles/acikgozb.system/files/btop.rose-pine.theme)

Templates:

- [Hyprland configuration file](./roles/acikgozb.system/templates/hyprland.conf.j2)
- [Hyprpaper configuration file](./roles/acikgozb.system/templates/hyprpaper.conf.j2)
- [Rofi configuration file](./roles/acikgozb.system/templates/rofi.config.rasi.j2)
- [Rofi theme](./roles/acikgozb.system/templates/rofi.minimal-dark.rasi.j2)
- [Readline configuration file](./roles/acikgozb.system/templates/inputrc.j2)
- [Ly configuration file](./roles/acikgozb.system/templates/ly.config.ini.j2)
- [btop configuration file](./roles/acikgozb.system/templates/btop.config.conf.j2)
- [btop theme](./roles/acikgozb.system/templates/btop.rose-pine.theme.j2)

## <a id="post-installation"></a> Post Installation

After the installation completes, it's strongly recommended to reboot the host to fully apply the changes.
Some parts of the installation enables `systemd` services, which need a reboot to take effect.

## <a id="customizing-the-installation"></a> Customizing the Installation

In order to customize the installation of a certain tool, please refer to the role that installs the tool and see which variables are exposed for customization.
