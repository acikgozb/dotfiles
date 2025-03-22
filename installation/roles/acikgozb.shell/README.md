# `acikgozb.shell`

This role configures `$SHELL` of a given host.
Here are the main features:

- [XDG Base Directory](https://wiki.archlinux.org/title/XDG_Base_Directory) specification is applied to the shell configuration. This means that the default values are explicitly defined for `XDG_CONFIG_HOME`, `XDG_STATE_HOME`, `XDG_DATA_HOME`, `XDG_CACHE_HOME` and also `XDG_BIN_HOME`, even though the last one is not officially mentioned in the specification.

- `starship` is used as the main shell prompt.

- Directories related with `XDG_*` are created under `$HOME`.

Last but not least, the shell configuration file contains some extra variables that are used to configure other tools. These are mainly added to be in sync with XDG Base Directory specification.
Here is a list of tools that are configured in here:

- Starship
- Ansible
- Inputrc
- Rust
- Go
- NVM
- AWS CLI

## Requirements

Currently, this role only supports Arch Linux hosts.
This role also expects `bash` to be installed on the host, which is case if Arch is installed following the main documentation.

## Role Variables

Here is a list of the variables that are defined for this role:

`xdg_dirs`

This variable is used to store the directories that are related with `$XDG_*` environment variables.
This is done to ensure that the directories that are configured in shell configuration file actually exists on the host.

`dirs_in_path`

This variable is used to store the custom directories that are included in `$PATH`.
Here are the details for the default values:

- `$XDG_BIN_HOME/custom`: This directory holds the binaries that are either created by the user or compiled directly from the source.

- `$XDG_BIN_HOME/prebuilt`: This directory contains the prebuilt binaries of programs.

- `$XDG_BIN_HOME/go-packages`: This directory contains the packages installed to the host via `go install`.

- `$XDG_BIN_HOME/npm-packages`: This directory contains the packages installed to the host via `npm install`.

- `$XDG_BIN_HOME/.net`: This directory contains files related with .NET.

Here is a list of variables below that need to be defined externally:

`dotfiles_user`

This variable is used set the ownership of the generated user specific configuration files accordingly.

`dotfiles_user_group`

This variable is used set the group ownership of the generated user specific configuration files accordingly.

`dotfiles_repo_path`

This variable is used to determine where to copy the configuration files after they are created from their respective templates.

This is the root path that is used to symlink the shell configurations under `$XDG_CONFIG_HOME`.

`xdg_config_home`

This variable is used to store the configuration file under the directory specified by `$XDG_CONFIG_HOME` environment variable.

Normally, instead of defining a variable for `$XDG_CONFIG_HOME`, the environment variable can be referenced directly.
However, this role is designed specifically for the `dotfiles` project, which expects users to have nothing but default configuration files for their shell. That is why, instead of expecting `$XDG_CONFIG_HOME`, it expects the value as an Ansible variable.

`xdg_state_home`

This variable is used to set the environment variable `$XDG_STATE_HOME`.

`xdg_data_home`

This variable is used to set the environment variable `$XDG_DATA_HOME`.

`xdg_bin_home`

This variable is used to set the environment variable `$XDG_BIN_HOME`.

`xdg_cache_home`

This variable is used to set the envrionment variable `$XDG_CACHE_HOME`.

## Dependencies

If the role is used as designed (in its `dotfiles` project) then there are no dependencies.

If the role is used as a standalone role or in a different place, then the external variables defined in the previous section need to exist before executing the role.

## Example Playbook

```yml
- hosts: localhost
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - xdg_config_home
    - xdg_state_home
    - xdg_data_home
    - xdg_bin_home
    - xdg_cache_home
    - dirs_in_path # users' can adjust this based on their needs.
  roles:
    - acikgozb.shell
```

## License

BSD
