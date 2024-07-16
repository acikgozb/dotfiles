# acikgozb.kitty

This role installs and configures Kitty for both Debian and Darwin based instances.

## Requirements

The target instance must be either Debian based, or Darwin based. For now, the other distributions are not supported.

## Role Variables

Currently there are no variables defined, but this may lead to a corrupted installation in the future, mainly due to GLIBC version differences between the host instance and the latest Kitty binary.

This techincal debt will be addressed in the future.

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
