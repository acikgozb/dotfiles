# acikgozb.docker

This role is responsible from setting up Docker for the given host.

## Requirements

Currently, this role only supports Ubuntu 24.04 (Noble) and any MacOS with ARM64 architecture. Other Linux distributions will be supported in the future, based on the needs.

## Role Variables

Here's a list of variables that are used by this role:

| Variable                                | Example (if possible, default value)                      | Details                                                                                                                                                   |
| --------------------------------------- | --------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `docker_packages.Ubuntu`                | A list of `{name: string, url: string, bin_path: string}` | The metadata for Ubuntu installation.                                                                                                                     |
| `docker_packages.[Ubuntu, Darwin].name` | e.g `docker-compose`                                      | The name of the package that is being installed. For Linux distributions, multiple packages are required to install in order for Docker to work properly. |
| `docker_packages.[Ubuntu, Darwin].url`  | Binary url for Ubuntu AMD64 or Darwin ARM64               | Binary url for hosts. Check the Requirements section above to see the supported versions of operating systems.                                            |
| `docker_packages.Ubuntu.bin_path`       | `/path/to/bin/in/archive`                                 | The path that points to the actual binary after unarchiving the download. This does not have any effect on Darwin hosts.                                  |
| `docker_linux_bin_path`                 | `$HOME/bin`                                               | The user specific path that will contain the binaries installed with this role.                                                                           |

## Dependencies

This role can be used without any dependencies.
However, as explained above, this role installs Docker and it's dependencies under `$HOME/bin`. If you wish to install it elsewhere, you can do so by overwriting the variable `docker_linux_bin_path`.

If you wish to keep it as is, ensure that `$HOME/bin` exists on your host.

## Example Playbook

Here is a basic example of how to add this role:

```yml
- hosts: servers
  roles:
    - acikgozb.docker
```

## License

BSD
