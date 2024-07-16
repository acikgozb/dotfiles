# acikgozb.aws

This role is responsible from installing `AWS CLI` to the host.

The main difference between a normal installation and this role is the fact that this role installs the CLI **locally** by default.
The binaries are located under `$HOME/bin`, and the main files are located under `$HOME/lib`.

This decision is by design.
Therefore if you do not wish to have the CLI under your `$HOME`, please check out the **Role Variables** section to customize your installation paths.

## Role Variables

The variables and their brief explanations can be seen under `./defaults/main.yml`. Here is a detailed explanation:

- `aws_install_dir` : This variable points to a path that will contain the main files which come with the installation. It is recommended to set this `/usr/lib` or `/usr/local/lib` if you want to install the CLI globally. By default, this path points to `$HOME/lib/aws-cli`.
- `aws_bin_dir`: This variable points to the path which will contain the main symlink for the CLI binary itself. By default, it points to `$HOME/bin`. If you want to change it, ensure that the path is added to $PATH variable to reference the binary everywhere within the shell.
- `aws_archive_url`: This variable holds the download links for the CLI. The url's are grouped under `arch`, which comes from `acikgozb.arch` by default and can be either `arm64` or `amd64`.

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
    - acikgozb.zsh
    - acikgozb.aws
```

If you are comfortable with setting up `$PATH` and navigating your shell configuration files, `acikgozb.zsh` becomes optional.

## License

BSD
