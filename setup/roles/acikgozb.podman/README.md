# acikgozb.podman

This role is responsible from setting up Podman for the given host.

## Requirements

Currently, this role only supports Ubuntu 24.04 (Noble) and any MacOS with ARM64 architecture. Other Linux distributions will be supported in the future, based on the needs.

## Role Variables

Here's a list of variables that are used by this role:

| Variable                 | Example (if possible, default value) | Details                                  |
| ------------------------ | ------------------------------------ | ---------------------------------------- |
| `podman_version`         | `5.1.2`                              | The Podman version that is installed.    |
| `podman_macos_installer` | Podman ARM64 installer package       | The Podman package url for ARM64 Darwin. |

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
