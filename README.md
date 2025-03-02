# dotfiles

Dotfiles is a collection of configuration files that allows me to create my own local environment.
By storing my local environment configuration in a version control system, it allows me to track and maintain my configuration via code.

## Table of Contents

<!--toc:start-->

- [Description](#description)
- [Installation](#installation)
- [Usage](#usage)
- [Neovim](#neovim)
- [TODO](#todo)
<!--toc:end-->

## <a id="description"></a> Description

This repository holds my main configuration for the given host OS/arch combination below:

- Arch Linux / AMD64
- Fedora / AMD64
- Debian / AMD64
- Darwin (MacOS) / ARM64

Starting from the release `v0.3.0-alpha`, the development host and the installation method of dotfiles were changed drastically:

- The development is done on an Arch Linux host.
- The installation method is changed to symlinking from cloning dotfiles under `~/.config`.

For a more stable installation, you can clone the repository using the previous release, `v0.2.0`.

The upstream will be stabilized for other OS/arch combinations in time.

## <a id="installation"></a> Installation

The installation is done through an `Ansible` playbook. Please refer [here](https://github.com/acikgozb/dotfiles/blob/main/setup/README.md) to see the details of the installation.

## <a id="usage"></a> Usage

The usage of the tools are the same, regardless of the installation method. Please refer to each tool's documentation to see their usage.

## <a id="neovim"></a> Neovim

The most complex configuration in this repository belongs to Neovim. 
For detailed information about my Neovim plugins and how everything is set up, please refer to [here](https://github.com/acikgozb/dotfiles/blob/main/setup/roles/acikgozb.nvim/files/nvim/README.md).

## <a id="todo"></a> TODO

- (P0) Fix the installation for Debian, Fedora and Darwin so that every supported combination utilizes symlinking to install.
- (P1) Add missing tools to the installation (recurring).
- (P1) Separate storing `$SHELL` as a fact from `acikgozb.shell` role.
- (P1) Create an interface to verify and list the installed tools, a different playbook maybe?
- (P2) Remove redundant tools from the installation.
