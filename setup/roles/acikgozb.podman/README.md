# acikgozb.podman

This role is responsible from setting up Podman for the given host.

## Requirements

This role supports the distributions below:

- Arch
- Fedora
- Debian
- Darwin

Versions of the distributions don't matter.

ARM64 binary is installed for Darwin hosts. 
For Linux hosts, since the role uses `ansible.common.package` under the hood, the role installs the compatible binary with the host architecture.

There is no distro specific installation in this role, so all Linux distributions should work in theory.
However, I have only tested the ones above, so YMMV.

## Role Variables

Here's a list of variables that are used by this role:

| Variable                 | Example (if possible, default value) | Details                                                |
| ------------------------ | ------------------------------------ | ------------------------------------------------------ |
| `podman_version`         | `5.1.2`                              | The Podman version that is installed (Darwin only).    |
| `podman_macos_installer` | Podman ARM64 installer package       | The Podman package url for ARM64 Darwin.               |

## Dependencies

This role can be used without any dependencies.

## Example Playbook

Here is a basic example of how to add this role:

```yml
- hosts: servers
  roles:
    - acikgozb.podman
```

This role installs Podman globally (e.g under `/opt` for Darwin).

## License

BSD
