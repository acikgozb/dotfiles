# acikgozb.kitty

=========

This role adds the font used in `kitty.conf` and then installs Kitty to the target machine, for both Debian and Darwin based instances.

## Requirements

The target instance must be either Debian based, or Darwin based. For now, the other distributions are not supported.

## Role Variables

Currently there are no variables defined, but this may lead to a corrupted installation in the future, mainly due to GLIBC version differences between the host instance and the latest Kitty binary.

## Dependencies

None.

## Example Playbook

Here's how to call this role:

```yml
roles:
  - acikgozb.kitty
```

## License

BSD
