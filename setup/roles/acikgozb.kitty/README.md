# acikgozb.kitty

This role installs and configures Kitty for a given host.

## Requirements

This role supports the OS/distributions below:

- Arch
- Fedora
- Debian
- Darwin

The OS/distribution versions do not matter.

## Role Variables

Currently there are no variables defined, but this may lead to a corrupted installation in the future, mainly due to GLIBC version differences between the host instance and the latest Kitty binary.

This issue will be addressed in the future.

## Dependencies

None.

## Example Playbook

Here's the basic usage of this role:

```yml
- hosts: servers
  roles:
    - acikgozb.kitty
```

## License

BSD
