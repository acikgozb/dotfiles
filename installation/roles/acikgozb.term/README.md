# `acikgozb.term`

This role installs and configures Alacritty for a given host.
Here are the main features:

- Alacritty is built from the source as recommended by the authors.
- The configuration file is almost kept as default, except for the visual adjustments (window, font, etc.)
- Rose Pine theme is used as the main theme.

## Requirements

Currently, this role only supports Arch Linux hosts.
It also expects having `git` installed on the host, since the role clones Alacritty's repository.

## Role Variables

Here is a list of variables that are defined for this role:

`alacritty_git_repo`

This variable is used to store the repository link of Alacritty.

`alacritty_deps.Archlinux`

This variable is used to define the dependencies of Alacritty.
The list is gathered from the main installation guide of Alacritty.

Here is a list of variables below that need to be defined externally:

`dotfiles_user`

This variable is used set the ownership of the generated user specific configuration files accordingly.

`dotfiles_user_group`

This variable is used set the group ownership of the generated user specific configuration files accordingly.

`dotfiles_repo_path`

This variable is used to determine where to copy the configuration files after they are created from their respective templates.

This is the root path that is used to symlink the shell configurations under `$XDG_CONFIG_HOME`.

`dotfiles_shell`

This variable is used to define the configured shell on the host.
Due to the nature of how Ansible works, some parts of the role require sourcing the shell configuration file in order to function properly (e.g. compiling Alacritty via `cargo`).

Missing this variable, along with `dotfiles_shell_executable_path`, would result in an error during the execution.

`dotfiles_shell_executable_path`

This variable is used to define the full path of the configured shell on the host.
This is used mainly during `ansible.builtin.shell` tasks to apply the sourced shell configuration files.

`xdg_config_home`

This variable is used to store the configuration file under the directory specified by `$XDG_CONFIG_HOME` environment variable.

Normally, instead of defining a variable for `$XDG_CONFIG_HOME`, the environment variable can be referenced directly.
However, this role is designed specifically for the `dotfiles` project, which expects users to have nothing but default configuration files for their shell. That is why, instead of expecting `$XDG_CONFIG_HOME`, it expects the value as an Ansible variable.

`lib_path`

This variable is used to define where to store the source files of Alacritty.
By default, it is set as `$HOME/.local/lib` and the same value is used to be in sync with source files' of other packages that are put by `dotfiles`.

`custom_pkg_path`

This variable is used to define the symlink path of Alacritty binary after it is built from the source.
The role creates a soft link under `custom_pkg_path/alacritty`.

If this role is used as a standalone role, it is advised to put `custom_pkg_path` under `$PATH` to execute `alacritty` without specifying its full path.

## Dependencies

Since this role is designed for Arch Linux, the dependencies required by `alacritty` is installed with `pacman`.
Therefore, this role depends on `community.general` collection.

## Example Playbook

```yml
- hosts: localhost
  gather_facts: true
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - dotfiles_shell
    - dotfiles_shell_executable_path
    - lib_path
    - custom_pkg_path
    - xdg_config_home
  roles:
    - acikgozb.term
```

## License

BSD
