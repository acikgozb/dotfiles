# acikgozb.zsh

This role is responsible from installing `zsh` to the host and configuring it as the main shell of the host, instead of `bash`.

Contrary to other roles in the main playbook, this role installs `zsh` globally. However, the configuration is done for the given user of the host.

The main things that are done in here are:

- Configure `zsh` so that the config files are read from `$HOME/.config/zsh/`, instead of `$HOME`.
- Install Starship (custom prompt)
- Install `zsh` plugins that are used within `.zshrc`. Also creates `$HOME/.zsh` path to contain the source codes of these plugins.
- Adds a new path `$HOME/bin/prebuilt` to `$PATH`, which is the main place to store prebuilt 3rd party binaries.

The steps in this role are strict and this is by design.
The main goal of this role is to enable the version controlled `.zshrc` and other configuration files. Therefore, it is intended to not make the role generic by incorporating variables.

## Role Variables

This role is intended to use in a strict way. That is why there are no variables that can be overridden.

## Requirements

Currently, this role only supports Debian based distributions and Darwin (MacOS) operating systems.

In the future, missing Linux platforms will be supported.

## Dependencies

None.

## Example Playbook

Here's how to call this role:

```yml
- hosts: servers
  roles:
    - acikgozb.zsh
```

## License

BSD
