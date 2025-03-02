# acikgozb.aws

This role is responsible from installing `AWS CLI` to the host.

The main difference between a normal installation and this role is the fact that this role installs the CLI **locally** by default.
The binaries are located under `$HOME/bin`, and the main files are located under `$HOME/lib`.

This decision is by design.
Therefore if you do not wish to have the CLI under your `$HOME`, please check out the **Role Variables** section to customize your installation paths.

## Role Variables

Here is a list of variables that are used by this role:

| Variable                | Example (if possible, default value) | Details                                                                                                                                                                                                                                                   |
| ----------------------- | ------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `aws_install_dir`       | `/path/to/install/aws-cli`           | The path which holds the main files of the CLI (aka `lib`).                                                                                                                                                                                               |
| `aws_bin_dir`           | `/path/to/symlink`                   | The path which contains the symlink for the CLI binary itself. By default, it points to `$HOME/bin`. If you want to change it, ensure that the path is added to `$PATH` variable to reference the binary within the shell without the full path provided. |
| `aws_archive_url.amd64` | AWS CLI binary url for AMD64         | The binary download url for AMD64 Linux hosts.                                                                                                                                                                                                            |
| `aws_archive_url.arm64` | AWS CLI binary url for ARM64         | The binary download url for ARM64 Darwin hosts.                                                                                                                                                                                                           |

Please refer to `acikgozb.arch` documentation to see how the architecture is set up.

## Dependencies

As explained before, `acikgozb.arch` is the main dependency of this role. If you wish to not use `acikgozb.arch`, ensure that you are passing correct architecture values to this role.

This role also indirectly depends on `acikgozb.zsh` since the default lib and bin paths are set up based on that role. `acikgozb.zsh` correctly sets the `$PATH` variable, so that in here there is no need to do additional configuration to enable the binaries inside the shell.

## Example Playbook

The bare-minimum example can be seen below:

```yml
- hosts: servers
  roles:
    - acikgozb.arch
    - acikgozb.aws
```

If you wish to install it locally like intended, the example below is more complete:

```yml
- hosts: servers
  roles:
    - acikgozb.arch
    - acikgozb.shell
    - acikgozb.aws
```

If you are comfortable with setting up `$PATH` and navigating your shell configuration files, `acikgozb.shell` becomes optional.

## License

BSD
