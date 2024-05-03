# acikgozb.git

This role is mainly responsible from configuring the Git workflow of the host instance by installing lazygit, gh, and git-delta.

## Requirements

Currently, this role only supports Debian based distributions and Darwin (MacOS) operating systems.

## Role Variables

There are a couple of variables used mainly for configuring the Git workflow on Linux machines:

- `lazygit_version`: The version of lazygit that will be installed.
- `lazygit_linux_arm64_binary_url`: The URL of lazygit binary, taken from the release page on Github.
- `delta_version`: The version of git-delta that will be installed.
- `delta_linux_arm64_binary_url`: The URL of git-delta binary, taken from the release page on GitHub.

Currently, only arm64 operating systems are supported. In the future, based on the different architectures or different Linux distributions, additional variables may be added in here.

## Dependencies

None.

## Example Playbook

Here's how to call this role:

```yml
roles:
  - acikgozb.git
```

## License

BSD
