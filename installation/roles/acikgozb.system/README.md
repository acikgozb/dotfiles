# `acikgozb.system`

This role installs and configures necessary programs that are used on top of a bare bones Arch Linux installation.

The concepts are defined as below:

- WM
- Display Manager
- Audio
- Misc

## WM

Hyprland is installed as the window manager on a given host.
If a given host already has a window manager, it is not removed, therefore they can continue using their existing window managers if desired.

The created `hyprland.conf` for a given host can be seen in [here](./files/hyprland.conf).

Keep in mind that the programs used by Hyprland are intentionally not installed during Hyprland installation since the programs can be used outside of Hyprland as well.
Therefore, only executing the WM tasks in this role may result in an incomplete Hyprland installation.

## Display Manager

Ly is installed and enabled as the main display manager on a given host.
Its configuration file is mainly kept as default except:

- Vi mode is enabled.
- `matrix` is used as the animation.

The configuration file is kept as static and stored in `/etc/ly/config.ini`.
Therefore, if users wish to customize Ly, they can do so after the initial installation completed by this role.

## Audio

To utilize the audio driver, the following packages are installed:

- pavucontrol
- alsa-utils
- pipewire
- wireplumber
- sof-firmware

No custom configurations are done for the audio.

## Misc

This group contains all the other packages that are used to provide additional functionality on top of a bare bones Arch Linux installation.
It is called "misc" because the package choices in this group are basically personal preference.

Here are the provided functionalities:

### Remapping Caps Lock to ESC

`caps2esc` package is installed and configured to remap Caps Lock key:

- If Caps Lock is pressed without any key, it is registered as Escape.
- If Caps Lock is pressed in combination with another key, then it is registered as Control.

### GUI Support for Elevated Privileges

`hyprpolkitagent` is installed to provide GUI support to applications that require elevated privileges.

### Bluetooth

`bluez-utils` package is installed to provide an interface for Bluetooth functionality (mainly `bluetoothctl`).

### Font Awesome

`ttf-font-awesome` is installed to utilize Font Awesome on the host.

### Developer Experience & Productivity

`devx-scripts` repository is cloned to enhance developer experience and productivity.
Along with these concepts, the repository contains opinionated scripts that replaces several desktop environment functionality, such as _power, wifi, bluetooth control_ and also contains an experimental AUR helper called `aurora`.

Since this is an experimental repository, users who prefer fully fledged and stable utitilies should remove this step from the installation.

### Rofi

In order to provide a window switcher and a `dmenu` functionality on Wayland, `rofi-wayland` is installed and configured on a given host.

The configuration is kept as default, and a simple minimal dark theme is added.

### System Monitoring

`btop` is used to provide a monitor for system resources.

The configuration is kept as default, and `rose-pine` is used as the theme.

### Shell Prompt Input Mapping

By default, `readline` is used to provide in-line editing and history capabilities to users' `$SHELL`.
In `dotfiles`, `readline` is configured to:

- Use `C-e` to edit the command in `$EDITOR`, instead of `C-x-e`.
- Complete the common path during tab completion and also show the possible values with a single TAB press, instead of pressing double TAB.

## Requirements

Currently, this role only supports Arch Linux hosts.

Before executing the role, read the next section to understand which variables are used and if the default values need adjustments for your needs.

## Role Variables

Here is a list of variables that are defined for this role.
All of them can be overridden by user defined playbook variables:

### WM

`wm_main_monitor_name`

This variable defines the main monitor that is used by the host.
By default, the role assumes that there is only one monitor (e.g. laptop screen, or a single desktop monitor).

It is used inside `hyprland.conf` to define the scaling.

`wm_vars_terminal`

This variable defines the terminal program that Hyprland should use.
By default, Hyprland uses `kitty`, but since `alacritty` is installed via `dotfiles`, Hyprland is configured to use `alacritty` as well.

It is used either by the user (manually, via bind rules) or by Hyprland upon boot to initialize the workspaces accordingly.

The value can be equal to the binary name if the terminal is installed globally.
If the terminal is installed under `$HOME`, the value should be the absolute path of the binary instead.

`wm_vars_browser`

This variable defines the browser program that Hyprland should use.
By default, `librewolf` is used in the configuration.

Since it is recommended to install `librewolf` globally, this value only contains the binary name by default.

`wm_vars_power`

This variable defines the program that contains the power options (shutdown, reboot, log off, suspend, etc.).
By default, `power` script is used from [this repository](https://github.com/acikgozb/devx-scripts).

`wm_vars_wifi`

This variable defines the program that allows users to manage their WiFi configurations.
By default, `wifi` script is used from [this repository](https://github.com/acikgozb/devx-scripts).

`wm_vars_bluetooth`

This variable defines the program that allows users to manage their Bluetooth configurations.
By default, `bluetooth` script is used from [this repository](https://github.com/acikgozb/devx-scripts).

`wm_vars_file_explorer`

This variable defines the program that allows users to manage their files.
By default, `nautilus` is used.

`wm_wallpaper`

This variable defines the main wallpaper program that is executed by Hyprland upon boot.
By default `hyprpaper` is used.

`wm_main_terminal_cmd`

This variable defines the command that should be executed on the main terminal (workspace 1) upon boot.
By default, `btop` is used.

`wm_browser_args`

This variable defines the arguments that can be passed to the browser, which is executed by Hyprland upon boot.
Since this should be a user defined variable, the default value just opens `https://duckduckgo.com` in a new tab.

`audio_packages`

This variable defines a list of packages that will be installed to utilize the audio driver of a given host.

The provided packages are installed without additional configurations.

`screen_utilities`

This variable defines a list of packages that will be installed to provide certain screen functionalities such as screen capturing, recording, notification, and brightness control.

`devx_clone_path`

This variable defines the target path to clone `devx-scripts`.
The provided path should contain the whole path of the repository (e.g. `/path/to/repo.git`), the repository name is not appended to the given path.

`rofi_font_family`

This variable defines the font that will be used in `rofi-wayland`.
By default, it is aimed to be in sync with the `main_font_family` provided by the user and the `Propo` variant is used.

Example: By default, `UbuntuMono Nerd Font` is used as `main_font_family`, and `rofi_font_family` is set to `UbuntuMono Nerd Font Propo`.

If a provided `main_font_family` does not contain a `Propo` variant, then users' need to specify a value for `rofi_font_family` as well.

`rofi_font_size`

This variable defines the font size of the font that is used by `rofi-wayland`.

By default, it is set to 16.

`rofi_prompt_placeholder`

This variable defines the placeholder text that is used on the user prompt of `rofi-wayland`.

By default, it is set to `Search...`.

`btop_version`

This variable defines the version of `btop` that should be installed on a given host.

By default, the version is set to `1.4.0`.

Here is a list of variables below that need to be defined externally:

`dotfiles_user`

This variable is used set the ownership of the created files and directories.

`dotfiles_user_group`

This variable is used set the group ownership of the created files and directories.

`custom_pkg_path`

This variable is used to define the symlink path of installed binaries for `devx-scripts`.

The role creates a soft link for each script in `devx-scripts` under `custom_pkg_path/<script-name>`.

If this role is used as a standalone role, it is advised to put `custom_pkg_path` under `$PATH` to execute scripts in `devx-scripts` without specifying their full path.

`dotfiles_repo_path`

This variable is used to determine where to copy the configuration files after they are created from their respective templates.

This is the root path that is used to symlink the shell configurations under `$XDG_CONFIG_HOME`.

`xdg_config_home`

This variable is used to store the configuration file under the directory specified by `$XDG_CONFIG_HOME` environment variable.

Normally, instead of defining a variable for `$XDG_CONFIG_HOME`, the environment variable can be referenced directly.
However, this role is designed specifically for the `dotfiles` project, which expects users to have nothing but default configuration files for their shell.
That is why, instead of expecting `$XDG_CONFIG_HOME`, it expects the value as an Ansible variable.

`lib_path`

This variable is used to define where to store the installation files of `btop`.
By default, it is set as `$HOME/.local/lib` and the same value is used to be in sync with source files' of other packages that are put by `dotfiles`.

`git_projects_path`

This variable is used to define the path for `devx-scripts`.
It is desired for `devx-scripts` to be in the same path with other Git projects of the user.
That is why, a separate variable is used by default instead of putting `devx-scripts` under `lib_path` like with other packages.

By default, it is put under `$HOME/personal`.

## Dependencies

Since this role is designed for Arch Linux, the necessary dependencies are checked via `community.general.pacman` module.
Therefore, if this role is used as a standalone role, `community.general` collection needs to be installed.

## Example Playbook

```yml
- hosts: localhost
  become: true
  gather_facts: true
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - xdg_config_home
    - lib_path
    - custom_pkg_path
    - git_projects_path
    -
  roles:
    - acikgozb.cloud
```

## License

BSD
