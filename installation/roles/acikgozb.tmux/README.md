# `acikgozb.tmux`

This role installs and configures `tmux` of a given host.
Here are the main features:

- `minimal-tmux-status` plugin is used for tmux status bar.
- `C-a` is set as the prefix key instead of the default `C-b`.
- Horizontal/vertical splits are defined as `|` and `-` respectfully.
- Mouse is enabled.
- `vi` mode keys are enabled.
- Pane navigation is set by using `C-a` + `h, j, k, l`.
- `C-s` is used to sync keypresses across all panes.

## Requirements

Currently, this role only supports Arch Linux hosts.

## Role Variables

The variables required by this role need to be defined externally:

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

## Dependencies

`community.general` collection needs to be installed for this role.
Other than this, the variables explained in the previous section need to be defined before executing this role.

## Example Playbook

```yml
- hosts: localhost
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - xdg_config_home
  roles:
    - acikgozb.tmux
```

## License

BSD
