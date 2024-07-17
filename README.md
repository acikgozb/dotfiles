# dotfiles

Dotfiles is a collection of configuration files that allows me to create my own local environment.
By storing my local environment configuration in a version control system, it allows me to track and maintain my configuration via code.

## Motivation

In all of my projects, my initial thought process is more or less the same:

- First, I learn the basics of a tool,
- Then, I try to define a real life problem I have,
- Finally, I try to come up with a project which allows me to solve the problem whilst gaining experience with the tool (and having fun along the way!).

In this context, `dotfiles` ticks all steps beautifully:

- tool: I had learnt the basics of Ansible, and wanted to gain experience with it. I like the tool but unfortunately cannot practice it in my day to day job.
- problem: My local environment (before this project) was a good example of a "snowflake" host. The configurations and installed packages were all over the place, and there were a mental and physical overhead whenever I tried to switch hosts.
- project: What if there was a way to keep all the configuration in one place, store it in version control, and manage the configuration via Ansible for every host I have?

As a result of the analysis above, this project was born.

## For Whom Is This Repository For?

I'll be blunt in here, I would highly encourage anyone reading this to just jump right in and create their own dotfiles.
These configurations are what work for me and my own taste. You need to find your unique local environment configuration, and then create your dotfiles from that environment.

You can reference this repository while thinking about it, I believe this repository can be a good starting point, especially the installation parts with Ansible.

This does not mean that everything here is absolutely perfect, as I said before this was just a problem for me to gain experience in Ansible and have fun while doing so.
In case you see something that's not right or something that you have issues with, I would LOVE to hear your feedback!

With all the disclaimers out of the way, let us continue with the contents of the actual configurations.

## What Does This Repository Have?

When it comes to tools, I think it's safe to group them based on their functionalities:

- Terminal emulator: [Kitty](https://sw.kovidgoyal.net/kitty/)
- Terminal multiplexer: [tmux](https://github.com/tmux/tmux/wiki)
- Shell: [zsh](https://zsh.sourceforge.io/)
- Editor: [Neovim](https://neovim.io/)
- Gitflow:
  - [Lazygit](https://github.com/jesseduffield/lazygit),
  - [Github CLI](https://cli.github.com/)
  - [git-delta](https://github.com/dandavison/delta)
- Languages:
  - [Golang](https://go.dev/),
  - [.NET](https://dotnet.microsoft.com/en-us/)
  - [JavaScript](https://nodejs.org/en)
- Language package managers: [NPM](https://www.npmjs.com/), [NVM](https://github.com/nvm-sh/nvm)
- Formatters, transpilers, helper tools:
  - [jq](https://github.com/jqlang/jq),
  - [shellcheck](https://github.com/koalaman/shellcheck),
  - [golangci-lint](https://github.com/golangci/golangci-lint),
  - [prettier](https://github.com/prettier/prettier),
  - [eslint_d](https://github.com/mantoni/eslint_d.js),
  - [typescript](https://www.typescriptlang.org/)
  - [yamlfmt](https://github.com/google/yamlfmt)
  - [dlv](https://github.com/go-delve/delve)
- Containerization: [Docker](https://www.docker.com/)
- Virtualization: [Vagrant](https://www.vagrantup.com/)
- Cloud provider: [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html)
- Infrastructure as Code: [AWS CDK](https://aws.amazon.com/cdk/), [Terraform](https://www.terraform.io/)

There are also tools which are used solely during development. These tools are installed with `Neovim`. The detailed explanation for Neovim configuration will be added later on with all it's details.

## Installation

The installation is done through an `Ansible` playbook. Please refer [here](https://github.com/acikgozb/dotfiles/blob/main/setup/README.md) to see the details of the installation.

## Usage

The usage of the tools are the same, regardless of the installation method. Please refer to each tool's documentation to see their usage.

## TODO

- When the main limitations with the installation are resolved, I will explain the Neovim configuration in detail since it is the most complex and unique configuration in this repository.
