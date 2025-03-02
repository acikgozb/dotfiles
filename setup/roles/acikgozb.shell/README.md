# acikgozb.shell

This role is responsible from configuring `$SHELL` for a given host. 

The role installs and configures `zsh` for the OS/distributions below:

- Fedora
- Debian
- Darwin

For other OS/distributions listed below, the role configures `bash` instead.

- Arch

I am currently experimenting using `bash` as my primary shell instead of `zsh`, that is why both shells are supported in a partial way.

The steps in this role are strict and this is by design.
The main goal of this role is to version control the shell configuration files and also notify the user about the places where the shell configuration is managed by Ansible.

## Role Variables

This role is intended to use in a strict way. 
That is why there are no variables that can be overridden.

## Requirements

This role supports the OS/distributions below:

- Arch
- Fedora
- Debian
- Darwin

Versions of the OS/distributions don't matter.

## Dependencies

None.

## Example Playbook

Here's how to call this role:

```yml
- hosts: servers
  roles:
    - acikgozb.shell
```

## License

BSD
