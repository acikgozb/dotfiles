# acikgozb.git

This role is mainly responsible from configuring Git for a given host.

## Requirements

This role primarily does symlinking for XDG Base Directory support along with setting up an ed25519 SSH key/pair for remote Git access.
Therefore, there are no OS based tasks in this role.

I have tested this role with Arch Linux only. It should work in theory for all OS's, but YMMV.

## Role Variables

None.

## Dependencies

None.

## Example Playbook

Here's the recommended way to call this role:

```yml
- hosts: servers
  roles:
    - acikgozb.git
```

## License

BSD
