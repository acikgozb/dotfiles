# acikgozb.nvim

This role is mainly responsible from installing Neovim to the host.
Along with it, it also installs the languages used within Neovim and enables the tools used inside Neovim for the shell as well.

The languages and the tools are installed locally for each user.

As commonly known, `$HOME/bin` and `$HOME/lib` are two local paths that are accepted as a convention for user specific binaries.
This role is based on this fact and takes it to extreme, by grouping tools and languages inside the path:

- Binaries are installed under `$HOME/bin`, with the exception of having groups. For example, for tools which are installed via `Golang`, there is a path called `go-packages`. This is the same for `Javascript` (`NPM`) and prebuilt 3rd party binaries.
- Languages are installed under `$HOME/bin/[language]`.
- With any installed tool, their directory is added to `$PATH` automatically and the idempotency is delegated to Ansible as usual. In `.zshrc`, these parts are identified with markers such as `ANSIBLE MANAGED BLOCK`.

There are a couple of reasons why this decision was made:

- It's way easy to see how everything works together. The binaries are inside a specific path, and that path is registered to `$PATH`. No longer some tools work randomly and some does not simply because they are not discoverable by `$PATH` lookup.
- It's easy to remove everything if something goes wrong. Just delete `$HOME/bin`, and it's done. The role can be restarted or the versions can be updated without any major issue.
- If there is a possibility to use a host with more than one user, having installations local to each user prevents leaking one over the other and helps with maintenance.
- It's an extra challenge which adds fun and experience in the mix.

## Requirements

This role only supports either `ARM64` Darwin or `AMD64` Linux hosts. Due to the fact that Neovim does not support `ARM64` Linux, it limits the overall supported platforms.

Also, due to the fact that user shell `zsh` configuration file is updated in this role, a `.zshrc` file under `$HOME/.config/zsh` is required.

## Role Variables

Most of the variables of this role follows a quite simple mindset, which is grouping by architecture.
As mentioned with the other roles, either `arm64` or `arm64` is set by `acikgozb.arch` which makes the installations much simpler.

Here is a list of variables and their explanations:

| Variable                         | Example (if possible, default value)                                                | Details                                                                                                                                                     |
| -------------------------------- | ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `neovim.linux.url`               | `amd64` Neovim Linux binary url                                                     | Points to Neovim binary location for Linux distributions.                                                                                                   |
| `neovim.darwin.url`              | `arm64` Neovim Darwin binary url                                                    | Points to Neovim binary location for Darwin distributions.                                                                                                  |
| `go_version`                     | `1.22.4`                                                                            | The Golang version that will be installed.                                                                                                                  |
| `go.linux.arm64`                 | `arm64` Golang Linux binary url                                                     | Points to Golang binary location for `arm64` Linux distributions.                                                                                           |
| `go.linux.amd64`                 | `amd64` Golang Linux binary url                                                     | Points to Golang binary location for `amd64` Linux distributions.                                                                                           |
| `dotnet_sdk_version`             | `8.0`                                                                               | The .NET SDK version that will be installed.                                                                                                                |
| `nvm_version`                    | `0.39.7`                                                                            | The NVM version that will be installed.                                                                                                                     |
| `node_version`                   | `20`                                                                                | The Node version that will be installed by NVM.                                                                                                             |
| `tools.go_install`               | Contains a list of binary urls consisting `yamlfmt` and `dlv`                       | A list of binary urls which can be installed with `go install`.                                                                                             |
| `tools.npm_install`              | Contains a list of package names consisting of `prettier`, `eslint_d`, `typescript` | A list of NPM package names that can be install with `npm install`. Each list item contains a property called `name`, which points to the NPM package name. |
| `tools.prebuilt`                 | Contains a list of objects which corresponds to prebuilt binaries.                  | This variable holds metadata for 3rd party prebuilt binaries, which is used by the role to install the tools manually, instead of using a package manager.  |
| `tools.prebuilt[0..2].name`      | `jq, shellcheck, golangci-lint`                                                     | This attribute holds the name of the prebuilt binary.                                                                                                       |
| `tools.prebuilt[0..2].url.arm64` | The `ARM64` Darwin binary url                                                       | This url points to an `arm64` Darwin prebuilt binary url.                                                                                                   |
| `tools.prebuilt[0..2].url.amd64` | The `AMD64` Linux binary url                                                        | This url points to an `amd64` Linux prebuilt binary url.                                                                                                    |
| `tools.prebuilt[0..2].extract`   | `"true"` or `"false"`                                                               | A flag which tells the role whether the downloaded file is needed to be unarchived or not.                                                                  |

These variables are all customizable from the main playbook.

## Dependencies

Since the installations mostly depend on the `arch` fact, it is recommended to add `acikgozb.arch`.

Also if you are using this role, it is recommended to use `acikgozb.zsh` role as well.
If not, you should install and configure `zsh` manually under $HOME/.config and have a `.zshrc` under `$HOME/.config/zsh`.

## Example Playbook

Here is the recommended way of adding this role:

```yml
- hosts: servers
  roles:
    - acikgozb.arch
    - acikgozb.zsh
    - acikgozb.nvim
```

## License

BSD
