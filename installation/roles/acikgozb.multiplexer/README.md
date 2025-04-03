# `acikgozb.multiplexer`

This role installs and configures the terminal multiplexer of a given host.
Currently, Zellij and tmux are supported by this role.

Here are the main features for `tmux`:

- `minimal-tmux-status` plugin is used for tmux status bar.
- `C-a` is set as the prefix key instead of the default `C-b`.
- Horizontal/vertical splits are defined as `|` and `-` respectfully.
- Mouse is enabled.
- `vi` mode keys are enabled.
- Pane navigation is set by using `C-a` + `h, j, k, l`.
- `C-s` is used to sync keypresses across all panes.

Here are the main features of `zellij`:

- Default Zellij mode is set to `locked`. The prefix key (`C-g`) is not changed.
- `zjstatus` is used as a custom status bar to replace the interface of the default Zellij bar with a minimal one.
- 2 simple layouts are added, `init` for session creation and `default` that only shows the custom status bar (key suggestions are hidden).
- Session manager plugin is removed.
- The keymaps are mainly kept as default.

## Requirements

Currently, this role only supports Arch Linux hosts.

## Role Variables

`zellij_version`

This variable is used to determine the version of Zellij to install.

`zellij_url.amd64`

This variable is used to download Zellij's binary on to the host.

`zjstatus_version`

This variable is used to determine the version of `zjstatus` to install.

`zjstatus_url`

This variable is used to download Zellij's binary on to the host.

Along with these, here is a list of variables that need to be defined externally:

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

`terminal_multiplexer`

This variable is used to determine which multiplexer to install.
Available values are `tmux` and `zellij`.

## Dependencies

`community.general` collection needs to be installed for this role.
Other than this, the variables explained in the previous section need to be defined before executing this role.

## Example Playbook

The example below executes `acikgozb.multiplexer` with its default variables, and with the required playbook variables that should be defined by the user under `vars`.

```yml
- hosts: localhost
  become: true
  gather_facts: true
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - xdg_config_home
    - terminal_multiplexer
  roles:
    - acikgozb.multiplexer
```

## License

BSD
