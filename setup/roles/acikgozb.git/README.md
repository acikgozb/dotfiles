# acikgozb.git

This role is mainly responsible from configuring the Git workflow of the host instance by installing lazygit, gh, and git-delta.

## Requirements

Currently, this role only supports Debian based distributions and Darwin (MacOS) operating systems.

## Role Variables

There are a couple of variables used mainly for configuring the Git workflow on Linux machines:

- `lazygit_version`: The version of lazygit that will be installed.
- `delta_version`: The version of git-delta that will be installed.

The rest of the variables depend on `arch` variable, which can be either `arm64` or `amd64` for now:

- `lazygit_url.arm64`: Lazygit prebuilt binary url for arm64 hosts.
- `lazygit_url.amd64`: Lazygit prebuilt binary url for amd64 hosts.
- `gh_url.arm64`: GH prebuilt binary url for arm64 hosts.
- `gh_url.amd64`: GH prebuilt binary url for amd64 hosts.
- `delta_url.arm64.Darwin`: Delta prebuilt binary url for arm64 Darwin hosts.
- `delta_url.amd64.Debian`: Delta prebuilt binary url for amd64 Debian hosts.

## Dependencies

This role is designed to go along with `acikgozb.arch` and `acikgozb.zsh`. It did not designed in a "generic" way simply because there is no need for now.

- `acikgozb.arch` is needed simply because this role depends on `arch` fact that is set by `acikgozb.arch`. If this variable is provided via rest of the roles (`arm64` for Darwin, `amd64` for Linux), then using `acikgozb.arch` becomes optional.
- `acikgozb.zsh` is needed because the binaries are installed specific to the `$USER` of the host. The binaries are located in `$HOME/bin/prebuilt`, which is registered to `$PATH` by `acikgozb.zsh`. If `$PATH` is prefilled by another role, then using `acikgozb.zsh` becomes optional as well.

## Example Playbook

Here's how to call this role:

```yml
roles:
  - acikgozb.arch
  - acikgozb.zsh
  - acikgozb.git
```

## License

BSD
