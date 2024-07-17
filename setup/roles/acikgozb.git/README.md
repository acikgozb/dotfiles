# acikgozb.git

This role is mainly responsible from configuring the Git workflow of the host instance by installing `lazygit`, `gh`, and `git-delta`.

## Requirements

Currently, this role only supports Debian based distributions and Darwin (MacOS) operating systems.

## Role Variables

Here's a list of variables that are used by this role:

| Variable                    | Example (if possible, default value)                   | Details                                                                                                   |
| --------------------------- | ------------------------------------------------------ | --------------------------------------------------------------------------------------------------------- |
| `lazygit_version`           | `0.41.0`                                               | The version of Lazygit that will be installed.                                                            |
| `delta_version`             | `0.17.0`                                               | The version of git-delta that will be installed.                                                          |
| `gh_version`                | `2.52.0`                                               | The version of Github CLI that will be installed.                                                         |
| `lazygit_url[arm64, amd64]` | The binary url's for AMD64 Linux or ARM64 Darwin hosts | The binary url of Lazygit that is used to download the binary archive, based on the host architecture.    |
| `gh_url[arm64, amd64]`      | The binary url's for AMD64 Linux or ARM64 Darwin hosts | The binary url of Github CLI that is used to download the binary archive, based on the host architecture. |
| `delta_url.arm64.Darwin`    | The binary url for ARM64 Darwin hosts                  | The url which contains git-delta prebuilt binary url for ARM64 Darwin hosts.                              |
| `delta_url.amd64.Debian`    | The binary url for AMD64 Debian hosts                  | The url which contains git-delta prebuilt binary url for AMD64 Debian hosts.                              |

## Dependencies

This role is designed to go along with `acikgozb.arch` and `acikgozb.zsh`. It did not designed in a "generic" way simply because there is no need for now.

- `acikgozb.arch` is needed simply because this role depends on `arch` fact that is set by `acikgozb.arch`. If this variable is provided via rest of the roles (`arm64` for Darwin, `amd64` for Linux), then using `acikgozb.arch` becomes optional.
- `acikgozb.zsh` is needed because the binaries are installed specific to the `$USER` of the host. The binaries are located in `$HOME/bin/prebuilt`, which is registered to `$PATH` by `acikgozb.zsh`. If `$PATH` is prefilled by another role, then using `acikgozb.zsh` becomes optional as well.

## Example Playbook

Here's the recommended way to call this role:

```yml
- hosts: servers
  roles:
    - acikgozb.arch
    - acikgozb.zsh
    - acikgozb.git
```

## License

BSD
