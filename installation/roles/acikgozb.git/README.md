# `acikgozb.git`

This role configures Git by using `$XDG_CONFIG_HOME/git/config`. Notable features include:

- A custom Git log format is used instead of the default.
- A specific ed25519 SSH key/pair is created for Git. This key/pair is configured to be used via Git.

## Requirements

In order to fully benefit from the role, the requirements below need to be satisfied:

- This role requires `git` to be installed on the host. Since the role is stored on GitHub, this requirement is made in order to prevent "chicken and egg" issue.

- Git access is done through an ed25519 SSH key/pair. Therefore, `openssh` needs to be installed on the host as well.

There are also additional requirements regarding the role variables.
For these, please check out the section below.

## Role Variables

Here are the variables that this role needs in order to function properly:

`git_config_user_name`

This variable is used to configure the `user.name` of Git config.
There is a placeholder value that is set in this role's defaults, but it's recommended for the users to override this value with a proper name instead.

`git_config_user_email`

This variable is used to configure the `user.email` field of Git config.
There is a placeholder value that is set in this role's defaults, but it's recommended for the users to override this value with a proper email instead.

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

## Dependencies

To generate an ed25519 SSH key/pair, an external module called `community.crypto.openssh_keypair` is used.

This collection needs to be added to the environment that this role is executed on (e.g via a `requirements.yml`)

## Example Playbook

```yml
- hosts: localhost
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - xdg_config_home
    - git_config_user_name
    - git_config_user_email
  roles:
    - acikgozb.git
```

## License

BSD
