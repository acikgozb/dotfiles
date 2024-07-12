# acikgozb.git

This role is mainly responsible from configuring the Git workflow of the host instance by installing lazygit, gh, and git-delta.

## Requirements

Currently, this role only supports Debian based distributions and Darwin (MacOS) operating systems.

## Role Variables

There are a couple of variables used mainly for configuring the Git workflow on Linux machines:

- `lazygit_version`: The version of lazygit that will be installed.
- `delta_version`: The version of git-delta that will be installed.

The rest of the variables depend on `arch` variable, which can be either `arm64` or `amd64` for now:

- `lazygit.arm64.url`: The prebuilt binary url for arm64 hosts.
- `lazygit.amd64.url`: The prebuilt binary url for amd64 hosts.

## Dependencies

This role depends on host architecture, mainly `arm64` and `amd64`. If you can provide a variable called `arch` which resolves to those values, you can skip having any dependencies.

But for convenience, using this role with `acikgozb.arch` is highly recommended.

## Example Playbook

Here's how to call this role:

```yml
roles:
  - acikgozb.arch
  - acikgozb.git
```

## License

BSD
