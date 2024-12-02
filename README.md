# dotfiles

Dotfiles is a collection of configuration files that allows me to create my own local environment.
By storing my local environment configuration in a version control system, it allows me to track and maintain my configuration via code.

## Table of Contents

<!--toc:start-->

- [What Does This Repository Have?](#what-does-this-repository-have)
- [Installation](#installation)
- [Usage](#usage)
- [Neovim](#neovim)
- [TODO](#todo)
<!--toc:end-->

## <a id="what-does-this-repository-have"></a> What Does This Repository Have?

When it comes to tools, I think it's safe to group them based on their functionalities:

- Terminal emulator: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Terminal multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Shell: [zsh](https://zsh.sourceforge.io/)
- Editor: [Neovim](https://neovim.io/)
- Gitflow:
  - [Lazygit](https://github.com/jesseduffield/lazygit)
  - [Github CLI](https://cli.github.com/)
  - [git-delta](https://github.com/dandavison/delta)
- Languages:
  - [Golang](https://go.dev/)
  - [.NET](https://dotnet.microsoft.com/en-us/)
  - [JavaScript](https://nodejs.org/en)
  - [Bash]()
- Language package managers:
  - [NPM](https://www.npmjs.com/)
  - [NVM](https://github.com/nvm-sh/nvm)
- Formatters, transpilers, helper tools:
  - [jq](https://github.com/jqlang/jq),
  - [shellcheck](https://github.com/koalaman/shellcheck),
  - [golangci-lint](https://github.com/golangci/golangci-lint),
  - [prettier](https://github.com/prettier/prettier),
  - [eslint_d](https://github.com/mantoni/eslint_d.js),
  - [typescript](https://www.typescriptlang.org/)
  - [yamlfmt](https://github.com/google/yamlfmt)
  - [dlv](https://github.com/go-delve/delve)
- Configuration Management: [Packer](https://www.packer.io/)
- Containerization: [Podman](https://podman.io/)
- Virtualization: [Vagrant](https://www.vagrantup.com/)
- Cloud provider: [AWS](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
- Infrastructure as Code: [AWS Cloud Development Kit](https://aws.amazon.com/cdk/), [Terraform](https://www.terraform.io/)

There are also tools which are used solely during development. These tools are installed with `Neovim`. The detailed explanation for Neovim configuration will be added later on with all it's details.

## <a id="installation"></a> Installation

The installation is done through an `Ansible` playbook. Please refer [here](https://github.com/acikgozb/dotfiles/blob/main/setup/README.md) to see the details of the installation.

## <a id="usage"></a> Usage

The usage of the tools are the same, regardless of the installation method. Please refer to each tool's documentation to see their usage.

## <a id="neovim"></a> Neovim

The most complex configuration in this repository belongs to Neovim. For detailed information about my Neovim plugins and how everything is set up, please refer to [here](https://github.com/acikgozb/dotfiles/blob/main/nvim/README.md).

## <a id="todo"></a> TODO

- Add Fedora to the supported list of distrubitions.
