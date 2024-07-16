# acikgozb.docker

This role is responsible from setting up Docker for the given host.

## Requirements

Currently, this role only supports Ubuntu 24.04 (Noble) and any MacOS with ARM64 architecture. Other Linux distributions will be supported in the future, based on the needs.

## Role Variables

Here is an explanation of the main structure of the main variable `docker_packages`.

```yml
docker_packages:
  [Linux Distros]:
    name: # The name of the binary.
    url: # The url of the binary.
    bin_path: # The path to binary after unarchiving the download.
  [Darwin]:
    name: # The name of the binary.
    url: # The url of the binary.
```

When it comes to Linux distributions, there are many different tools that needs to be installed alongside the actual Docker CLI.
For Darwin distributions, installing Docker Desktop is enough. That is why there is only one url under `Darwin`, but a lot more under `Ubuntu`.

There is another variable called `docker_linux_bin_path`, which is the path that will contain the binaries installed with this role.
By default, this path is defined under `$HOME/bin`.

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
