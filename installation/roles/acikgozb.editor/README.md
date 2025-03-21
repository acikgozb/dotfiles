# `acikgozb.editor`

This role installs and configures the $EDITOR of a given host, along with other utilities that are used during development.
Here are the main features:

## Editor

This role only supports installing and configuring **Neovim**, other text editors or IDE's are intentionally not supported.
To read about its configuration, you can check it's [documentation](./files/nvim/README.md).

Most of the functionality comes from the plugins that are defined via Neovim's own configuration system (e.g. via a plugin manager).
Therefore, in order to fully install Neovim, users need to start `nvim` and wait for all the plugins to be fetched and installed automatically.

## Languages

Along with the editor, the following languages are installed on the host:

- Rust
- Golang
- .NET
- JavaScript (Node.js)

The important thing is that the binaries for these languages are scoped to the user that executes the `dotfiles` playbook by installing them under `$HOME` instead of system owned directories (e.g. `/usr/bin`).
Whilst this increases the complexity of the role, it decreases the maintenance cost and increases the overall visibility of the installation.

## Programs

Along with the editor and the languages, this role also installs some utility programs that can be used both as a standalone, or inside the editor.
The programs are split by the way they are installed:

- (1) Some of them are installed via `go install`.
- (2) Some of them are installed via `npm install`.
- (3) Some of them are installed by directly getting the prebuilt binary from the Internet.

Here is a list of the programs that are installed (the numbers indicate the installation way):

- `yamlfmt` (1)
- `dlv` (1)
- `eslint_d` (2)
- `typescript` (2)
- `jq` (3)
- `shellcheck` (3)
- `golangci-lint` (3)
- `fzf` (3)
- `rg` (3)
- `fd` (3)

## Requirements

Currently, this role supports Arch Linux hosts.

Whilst some of the parts of the role can be used for all Linux distributions, they are intentionally scoped to Arch Linux to keep the design in sync for now.

## Role Variables

The default variables defined for this role can be seen in [here](./defaults/main.yml).
For the details, please read below.

`neovim.linux.url`

This variable is used to store the `nvim` binary link. It points to the _nightly_ version.

`neovim_unarchive_path`

This variable is used to define where to unarchive the downloaded Nightly release archive.

NOTE: `lib_path` is defined externally to allow users to specify a common path to store other packages as well.

`gcc_packages`

This variable is used to define the required gcc packages for Neovim.
These packages are installed globally to the system.

`go_version`

This variable is used to define the Golang version that is installed on the host.

`go.linux.amd64`

This variable is used to store the download link for Golang.

`dotnet_sdk_version`

This variable is used to define the .NET SDK version that is installed on the host.

`nvm_version`

This variable is used to define the NVM version that is installed on the host.

`node_version`

This variable is used to define the Node version that is installed via NVM.

`programs.go_install`

This variable is used to define the programs that are installed via `go install`.

`programs.npm_install`

This variable is used to define the programs that are installed via `npm install`.

`programs.prebuilt`

This variable is used to define the programs that will be installed by downloading the corresponding prebuilt binary from the Internet.

`programs.prebuilt[item].name`

This variable is used to define the name of the prebuilt binary.
It is used to find the binary after unarchiving the downloaded release file.

`programs.prebuilt[item].url.amd64`

This variable is used to store the prebuilt binary link that is used to download the file.

`programs.prebuilt[item].extract`

This variable is used to tell the role about whether the downloaded file needs to be unarchived or not.

`programs.prebuilt[item].strip`

This variable is used to define whether the top level directory needs to be stripped or not during unarchiving.

Along with these, here is a list of variables that need to be defined externally:

`dotfiles_user`

This variable is used set the ownership of the generated user specific configuration files and downloaded binaries accordingly.

`dotfiles_user_group`

This variable is used set the group ownership of the generated user specific configuration files and downloaded binaries accordingly.

`dotfiles_repo_path`

This variable is used to determine where to copy the configuration files.

This is the root path that is used to symlink the shell configurations under `$XDG_CONFIG_HOME`.

`go_lang_path`

This variable is used to define the installation path for Golang.

`rust_lang_path`

This variable is used to define the installation path for Rust.

`dotnet_lang_path`

This variable is used to define the installation path for .NET.

`js_lang_path`

This variable is used to define the installation path for NVM.

`go_pkg_path`

This variable is used to define the installation path for packages that are installed via `go install`.

`npm_pkg_path`

This variable is used to define the installation path for packages that are installed via `npm install`.

`prebuilt_pkg_path`

This variable is used to define the installation path for packages that are installed via their prebuilt binaries.

`custom_pkg_path`

This variable is used to define the installation path for packages that are either written by the user or compiled from the source.

`xdg_config_home`

This variable is used to store the configuration file under the directory specified by `$XDG_CONFIG_HOME` environment variable.

Normally, instead of defining a variable for `$XDG_CONFIG_HOME`, the environment variable can be referenced directly.
However, this role is designed specifically for the `dotfiles` project, which expects users to have nothing but default configuration files for their shell. That is why, instead of expecting `$XDG_CONFIG_HOME`, it expects the value as an Ansible variable.

`lib_path`

This variable is used to define where to store the source files of a downloaded program, if it is necessary (e.g. for `nvim`).
By default, it is set as `$HOME/.local/lib`.

`ansible_distribution`

This variable is used to select the target Linux distribution, since some parts of the role need to know exactly which distribution is used on the host (.e.g. installing gcc packages).

It can be set by enabling `gather_facts` on the playbook level.

`dotfiles_shell`

This variable is used to define the configured shell on the host.
Due to the nature of how Ansible works, some parts of the role require sourcing the shell configuration file in order to function properly (e.g. installing npm packages).

Missing this variable, along with `dotfiles_shell_executable_path`, would result in an error during the execution.

`dotfiles_shell_executable_path`

This variable is used to define the full path of the configured shell on the host.
This is used mainly during `ansible.builtin.shell` tasks to apply the sourced shell configuration files.

## Dependencies

This role depends on `community.general.npm` module only.

## Example Playbook

```yml
- hosts: localhost
  gather_facts: true
  vars:
    - dotfiles_user
    - dotfiles_user_group
    - dotfiles_repo_path
    - dotfiles_shell
    - dotfiles_shell_executable_path
    - lib_path
    - go_lang_path
    - rust_lang_path
    - dotnet_lang_path
    - js_lang_path
    - go_pkg_path
    - npm_pkg_path
    - prebuilt_pkg_path
    - custom_pkg_path
    - xdg_config_home
  roles:
    - acikgozb.editor
```

## License

BSD
